<?php

use \Behat\Behat\Hook\Scope\BeforeScenarioScope;

trait SymfonyDoctrineContextTrait
{
    /**
     * @var SymfonyDoctrineContext
     */
    private $doctrineContext;

    /**
     * @BeforeScenario
     */
    public function gatherSymfonyContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        $this->doctrineContext = $environment->getContext(SymfonyDoctrineContext::class);
    }
}
