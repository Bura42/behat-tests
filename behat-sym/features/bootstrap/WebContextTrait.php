<?php

use Behat\Behat\Hook\Scope\BeforeScenarioScope;

trait WebContextTrait
{
    /**
     * @var WebContext
     */
    private $webContext;

    /**
     * @BeforeScenario
     */
    public function gatherWebContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        $this->webContext = $environment->getContext(WebContext::class);
    }
}
