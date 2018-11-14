<?php

use \Behat\Behat\Hook\Scope\BeforeScenarioScope;

trait SessionContextTrait
{
    /**
     * @var SessionContextTrait
     */
    private $sessionContext;

    /**
     * @BeforeScenario
     */
    public function gatherSessionContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        $this->sessionContext = $environment->getContext(SessionContext::class);
    }
}
