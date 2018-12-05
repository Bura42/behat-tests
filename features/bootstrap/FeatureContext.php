<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Driver\Selenium2Driver;

use Behat\MinkExtension\Context\RawMinkContext;
/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext implements Context
{

    /**
     * @BeforeScenario
     *
     * @param BeforeScenarioScope $scope
     *
     */
    public function setUpTestEnvironment($scope)
    {
        $this->currentScenario = $scope->getScenario();
    }

    /**
     * @AfterStep
     *
     * @param AfterStepScope $scope
     */
    public function afterStep($scope)
    {
        //if test has failed, and is not an api test, get screenshot
        if(!$scope->getTestResult()->isPassed())
        {
            //create filename string

            $featureFolder = preg_replace('/\W/', '', $scope->getFeature()->getTitle());

            $scenarioName = $this->currentScenario->getTitle();
            $fileName = preg_replace('/\W/', '', $scenarioName) . '.png';

            //create screenshots directory if it doesn't exist
            if (!file_exists('results/html/assets/screenshots/' . $featureFolder)) {
                mkdir('results/html/assets/screenshots/' . $featureFolder);
            }

            //take screenshot and save as the previously defined filename
            $this->driver->takeScreenshot('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName);
            // For Selenium2 Driver you can use:
            // file_put_contents('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName, $this->getSession()->getDriver()->getScreenshot());
        }
    }

    /**
     * @Then the current URL should be :url
     */
    public function theCurrentUrlShouldBe($url)
    {
        $this->visitPath($url);
    }


    /**
     * @Then I accept cookie
     */
    public function iAcceptCookie()
    {
        $this->getSession()->getPage()->find('css','#sccm-opt-out-c1')->click();
    }

    /** @Given I restart the browser */
    public function iRestartTheBrowser()
    {
        /** @var Selenium2Driver $driver */
        $driver = $this->getSession()->getDriver();
        /** @var \WebDriver\Session $session */
        $seleniumSession = $driver->getWebDriverSession();
        $cookies = $seleniumSession->getAllCookies();

        $minkSession = $this->getSession();
        $minkSession->restart();

        //The following is necessary - as the cookies can only be set after
        //you're already on the domain - this can be any page, even an error page
        $minkSession->visit($this->getMinkParameter('base_url'));

        $seleniumSession = $driver->getWebDriverSession();
        foreach ($cookies as $cookie) {
            if (isset($cookie['expiry'])) {
                $seleniumSession->setCookie($cookie);
            }
        }
    }

    /**
     * Waits a while, for debugging.
     *
     * @param int $seconds
     *   How long to wait.
     *
     * @When I wait :seconds second(s)
     */
    public function wait($seconds) {
        sleep($seconds);
    }

    /**
     * @Then I switch to iframe :id
     */
    public function iSwitchToIframe($id)
    {
        $this->getSession()->wait(5000);
        $this->getSession()->switchToIFrame($id);
    }

}
