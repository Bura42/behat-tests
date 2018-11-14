<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Exception\ElementNotFoundException;
use Behat\Mink\Exception\ExpectationException;
use Symfony\Component\PropertyAccess\PropertyAccess;
use Symfony\Component\PropertyAccess\Exception\NoSuchPropertyException;

class TrackingContext implements Context, SnippetAcceptingContext
{
    use MinkContextTrait;

    /**
     * @Then google data layer tracking params should be set to:
     */
    public function googleDataLayerTrackingParamsShouldBeSetTo(TableNode $table)
    {
        preg_match(
            '/var googleTrackingParameters = (\{.*\});/',
            $this->minkContext->getSession()->getPage()->getHtml(),
            $params
        );

        if (empty($params)) {
            throw new ElementNotFoundException(
                $this->minkContext->getSession()->getDriver(),
                'googleTrackingParameters'
            );
        }

        if (empty($params[1])) {
            throw new ExpectationException(
                'googleTrackingParameters are empty',
                $this->minkContext->getSession()->getDriver()
            );
        }

        $params = json_decode($params[1]);

        $propertyAccessor = PropertyAccess::createPropertyAccessor();

        foreach ($table->getHash() as $param) {
            try {
                $value = $propertyAccessor->getValue($params, $param['parameter']);
            } catch (NoSuchPropertyException $e) {
                throw new ExpectationException(
                    sprintf("googleTrackingParameters do not contain %s parameter", $param['parameter']),
                    $this->minkContext->getSession()->getDriver()
                );
            }

            $param['value'] = $this->convertBools($param['value']);

            \PHPUnit_Framework_Assert::assertEquals(
                $param['value'],
                $value,
                sprintf(
                    "Google tracking parameter [%s] should be set to '%s' and is set to '%s'",
                    $param['parameter'],
                    $param['value'],
                    $value
                )
            );
        }
    }

    /**
     * @Then google data layer tracking required parts are:
     */
    public function googleDataLayerTrackingRequiredPartsAre(TableNode $trackingRequiredParts)
    {
        preg_match(
            '/var googleTrackingRequiredDataLayerParts = (\[.*\])/',
            $this->minkContext->getSession()->getPage()->getHtml(),
            $parts
        );

        if (empty($parts)) {
            throw new ElementNotFoundException(
                $this->minkContext->getSession()->getDriver(),
                'googleTrackingRequiredDataLayerParts'
            );
        }

        if (empty($parts[1])) {
            throw new ExpectationException(
                'googleTrackingParameters are empty',
                $this->minkContext->getSession()->getDriver()
            );
        }

        $parts = json_decode($parts[1]);

        foreach ($trackingRequiredParts->getHash() as $row) {
            \PHPUnit_Framework_Assert::assertContains($row['part'], $parts);
        }
    }

    /**
     * @Then gallup tracking params should be set to:
     */
    public function gallupTrackingParamsShouldBeSetTo(TableNode $table)
    {
        preg_match(
            '/springq\.push\((.*)\);/Us',
            $this->minkContext->getSession()->getPage()->getHtml(),
            $params
        );


        if (empty($params)) {
            throw new ElementNotFoundException(
                $this->minkContext->getSession()->getDriver(),
                'Gallup tracking parameters - springq'
            );
        }
        if (empty($params[1])) {
            throw new ExpectationException(
                'Gallup tracking parameters are empty',
                $this->minkContext->getSession()->getDriver()
            );
        }

        $params = json_decode(str_replace('document.location.href', '"document.location.href"', $params[1]), true);

        foreach ($table->getHash() as $param) {
            if (!isset ($params[$param['parameter']])) {
                throw new ExpectationException(
                    sprintf("Gallup tracking parameters do not contain %s parameter", $param['parameter']),
                    $this->minkContext->getSession()->getDriver()
                );
            }

            \PHPUnit_Framework_Assert::assertEquals(
                $param['value'],
                $params[$param['parameter']],
                sprintf("Gallup tracking parameter [%s] should be set to '%s' and is set to '%s'",
                    $param['parameter'],
                    $param['value'],
                    $params[$param['parameter']]
                )
            );
        }
    }

    private function convertBools(string $value)
    {
        if ($value === 'true') {
            return true;
        } else if ($value === 'false') {
            return false;
        }

        return $value;
    }
}
