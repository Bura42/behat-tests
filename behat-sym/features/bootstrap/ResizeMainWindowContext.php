<?php

use Behat\Behat\Context\Context;

class ResizeMainWindowContext implements Context
{
    use MinkContextTrait;

    /**
     * @Given /^window size is phone$/
     */
    public function windowPhoneSize()
    {
        $this->minkContext->getSession()->getDriver()->resizeWindow(375, 667);
    }

    /**
     * @Given /^window sizeis tablet$/
     */
    public function windowTabletSize()
    {
        $this->minkContext->getSession()->getDriver()->resizeWindow(1024, 768);
    }

    /**
     * @Given /^window size is desktop$/
     */
    public function windowDesktopSize()
    {
        $this->minkContext->getSession()->getDriver()->resizeWindow(1920, 1080);
    }
}
