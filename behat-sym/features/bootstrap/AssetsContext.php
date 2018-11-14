<?php

use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use Symfony\Component\HttpKernel\KernelInterface;
use Symfony\Component\Filesystem\Filesystem;

class AssetsContext implements KernelAwareContext
{
    private $kernel = null;

    /**
     * @BeforeScenario
     */
    public function removeAssets(BeforeScenarioScope $event)
    {
        $assetsDir = $this->kernel->getContainer()->getParameter('default.assets.dir');

        $filesystem = new Filesystem();
        $filesystem->remove($assetsDir);
    }

    public function setKernel(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }
}
