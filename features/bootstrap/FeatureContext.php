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
     * @Given I am on wikipedia
     */
    public function iAmOnWikipedia()
    {
        $this->visitPath("/");
    }

    /**
     * @When I search for :seachString
     */
    public function iSearchFor($seachString)
    {
        $this->getSession()->getPage()->fillField('searchInput', $seachString);
        $this->getSession()->getPage()->find('css','.searchButton')->click();
    }

    /**
     * @Then the first heading should be :heading
     */
    public function theFirstHeadingShouldBe($heading)
    {
        $pageHeading = $this->getSession()->getPage()->find('css','.firstHeading');

        expect($pageHeading->getText())->toBe($heading);
    }
}
