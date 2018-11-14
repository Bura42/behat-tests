<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\TableNode;

class SiteManagerApiContext implements Context
{
    use MinkContextTrait;

    /**
     * @When I request :blockName building block
     */
    public function iRequestBuildingBlock(string $blockName)
    {
        $this->minkContext->visit('/api/v1/buildingblocks/' . $blockName);
    }

    /**
     * @Then I should get valid configuration for :blockName:
     */
    public function iShouldGetValidConfigurationFor(string $blockName, TableNode $options)
    {
        foreach ($options->getHash() as $option) {
            $this->iShouldGetValidConfigurationForBlock(
                $option['optionName'],
                $blockName
            );
        }
    }

    /**
     * @Then I should get valid :optionName configuration for :blockName block
     */
    public function iShouldGetValidConfigurationForBlock(string $optionName, string $blockName)
    {
        $decodedContent = $this->getJsonDecodedContent();
        $expectedContent = $this->getExpectedContent($blockName);

        \PHPUnit_Framework_Assert::assertSame(
            $decodedContent[$optionName],
            $expectedContent[$optionName],
            $optionName
        );
    }

    /**
     * @Then I should get valid common block configuration
     */
    public function iShouldGetValidCommonBlockConfiguration()
    {
        $commonFields = [];

        $decodedContent = $this->getJsonDecodedContent();

        $expectedContent = $this->getExpectedContent('common');

        foreach ($commonFields as $commonField) {
            \PHPUnit_Framework_Assert::assertSame(
                $decodedContent[$commonField],
                $expectedContent[$commonField],
                $commonField
            );
        }
    }

    private function getJsonDecodedContent(): array
    {
        $content = $this->minkContext->getSession()->getPage()->getContent();

        return json_decode($content, true);
    }

    private function getExpectedContent(string $blockName): array
    {
        $expectedContent = json_decode(
            file_get_contents(dirname(__DIR__) . sprintf('/fixtures/blocks/%s.json', $blockName)),
            true
        );

        return $expectedContent;
    }
}
