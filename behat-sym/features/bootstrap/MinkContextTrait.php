<?php

use \Behat\Behat\Hook\Scope\BeforeScenarioScope;
use \Behat\MinkExtension\Context\MinkContext;

trait MinkContextTrait
{
    /**
     * @var MinkContext
     */
    private $minkContext;

    /**
     * @BeforeScenario
     */
    public function gatherMinkContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        $this->minkContext = $environment->getContext(MinkContext::class);
    }
}
