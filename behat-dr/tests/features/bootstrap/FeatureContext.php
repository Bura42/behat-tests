<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\MinkExtension\Context\RawMinkContext;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Behat\Hook\Scope\AfterScenarioScope;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawMinkContext implements SnippetAcceptingContext {
  /**
   * Parameters array.
   *
   * @var array
   */
  protected $parameters;

  /**
   * Environment array.
   *
   * @var array
   */
  protected $environment;

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   *
   * @param array $parameters
   *   Parameters from the behat.yml.
   */
  public function __construct($parameters) {
    $this->parameters = $parameters;
  }

  /**
   * Set before each scenario the base URL, if needed override it.
   *
   * @see iChangeTheBaseUrlToFrontend
   *
   * @BeforeScenario
   */
  public function beforeScenario(BeforeScenarioScope $scope) {
    // Load and save the environment for each scenario.
    $this->environment = $scope->getEnvironment();
    // Set the base URL. Can be overridden check @see.
    $base_url = $this->parameters['base_url'];
    $this->setBaseUrl($base_url);
  }

  /** @AfterScenario */
  public function afterScenario(AfterScenarioScope $scope) {
  }

  /**
   * Function to change the base URL to frontend, needed for all frontend tests.
   *
   * @Given I change the base url to frontend
   */
  public function iChangeTheBaseUrlToFrontend() {
    $base_url = $this->parameters['base_url'];
    $base_url = str_replace('https://pim.', '', $base_url);
    $url = 'https://' . $base_url;
    $this->setBaseUrl($url);
  }

  /**
   * Sets the base URL for all environments.
   *
   * @param string $url
   *   The url to set.
   *
   * @see: https://github.com/Behat/MinkExtension/issues/155#issuecomment-77041296
   */
  private function setBaseUrl($url) {
    foreach ($this->environment->getContexts() as $context) {
      if ($context instanceof \Behat\MinkExtension\Context\RawMinkContext) {
        $context->setMinkParameter('base_url', $url);
      }
    }
  }

}
