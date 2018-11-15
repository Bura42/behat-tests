<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

use Behat\MinkExtension\Context\RawMinkContext;
/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext implements Context
{

    /**
     * @Given I am on :sitename
     */
    public function iAmOn($sitename)
    {
        $this->visitPath($sitename);
    }

    /**
     * @Then I accept cookie
     */
    public function iAcceptCookie()
    {
        $this->getSession()->getPage()->find('css','.sccm-d-button')->click();
    }

    /**
     * @Then I should see :text in the :selector element
     */
    public function iShouldSeeInTheElement($text, $selector)
    {
        $pageHeading = $this->getSession()->getPage()->find('css', $selector);

        expect($pageHeading->getText())->toBe($text);
    }

}
