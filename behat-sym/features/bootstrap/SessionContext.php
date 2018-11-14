<?php

use Behat\Behat\Context\Context;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use Symfony\Component\HttpKernel\KernelInterface;


class SessionContext implements Context, KernelAwareContext
{
    const USER_WITHOUT_SUBSCRIPTION = [
        'ssoId' => 2867682,
        'login-email' => 'bdk_no_sub@gmail.com.invalid',
        'login-password' => 'xyzzz'
    ];

    const USER_WITH_SUBSCRIPTION = [
        'ssoId' => 2867683,
        'login-email' => 'bdk_with_sub@gmail.com.invalid',
        'login-password' => 'xyzzz'
    ];

    const USER_WITH_BAD_CREDENTIALS = [
        'ssoId' => null,
        'login-email' => 'bruceWayne@gotham.city',
        'login-password' => 'iLoveBats123'
    ];

    use SymfonyDoctrineContextTrait,
        MinkContextTrait,
        WebContextTrait;

    /**
     * @var KernelInterface
     */
    protected $kernel = null;

    public function setKernel(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }

    /**
     * @When I login in login page as user without subscription
     */
    public function iLoginAsUserWithoutSubscription()
    {
        $this->loginUser(self::USER_WITHOUT_SUBSCRIPTION, '/');
        $this->webContext->iWaitForElement('.user-menu-container');
    }

    /**
     * @When I login in login page as user with subscription
     */
    public function iLoginAsUserWithSubscription()
    {
        $this->loginUser(self::USER_WITH_SUBSCRIPTION, '/');
        $this->webContext->iWaitForElement('.user-menu-container');
    }

    public function loginUser(array $userData, string $path = '/_error/404')
    {
        $loginInput = sprintf('<input name="name" value="%s">', $userData['login-email']);
        $passwordInput = sprintf('<input name="pass" value="%s">', $userData['login-password']);

        $returnTo = $path;
        $returnTo = urlencode(base64_encode($returnTo));

        $returnToInput = sprintf(
            '<input type="hidden" name="return_to" value="http://behat.bdk.dev:8080/redirect?returnUri=%s">'
            , $returnTo
        );

        $this->minkContext->visitPath($path);
        $this->webContext->iWaitForElement('.toggle-login');
        $this->minkContext->getSession()->executeScript(
            sprintf(
                '$(\'<form style="display: none;" action="/sso/server/login" method="post">%s %s %s</form>\')'.
                '.appendTo(\'body\').submit();',
                $loginInput,
                $passwordInput,
                $returnToInput
            )
        );
    }

    /**
     * @Given I am authenticated as user without subscription
     */
    public function iAmAuthenticatedAsUserWithoutSubscription()
    {
        $this->loginUser(self::USER_WITHOUT_SUBSCRIPTION);
        $this->webContext->iWaitForElement('.user-menu-container');
    }

    /**
     * @Given I am authenticated as user with subscription
     */
    public function iAmAuthenticatedAsUserWithSubscription()
    {
        $this->loginUser(self::USER_WITH_SUBSCRIPTION);
        $this->webContext->iWaitForElement('.user-menu-container');
    }

    /**
     * @Given I try to login with bad credentials
     */
    public function iTryToLoginWithBadCredentials()
    {
        $this->loginUser(self::USER_WITH_BAD_CREDENTIALS);
        $this->webContext->iWaitForElement('.site-login.in #user-login');
    }
}
