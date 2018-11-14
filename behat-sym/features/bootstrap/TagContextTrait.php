<?php

use \Behat\Behat\Hook\Scope\BeforeScenarioScope;

trait TagContextTrait
{
    /**
     * @var TagContext
     */
    private $tagContext;

    /**
     * @BeforeScenario
     */
    public function gatherTagContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();

        $this->tagContext = $environment->getContext(TagContext::class);
    }
}
