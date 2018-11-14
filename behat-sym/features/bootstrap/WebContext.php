<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Exception\ElementNotFoundException;
use Behat\Mink\Exception\ResponseTextException;

class WebContext implements Context, SnippetAcceptingContext
{
    use MinkContextTrait, SessionContextTrait;

    /**
     * @When I go to non-existent page
     */
    public function iGoToNonExistentPage()
    {
        $this->minkContext->visit('/_error/404');
    }

    /**
     * @When I go to page is gone
     */
    public function iGoToPageIsGone()
    {
        $this->minkContext->visit('/_error/410');
    }

    /**
     * @Then /^I should see the list of elements:$/
     */
    public function iShouldSeeTheListOfElements(TableNode $table)
    {
        foreach ($table->getRows() as $row) {
            $this->minkContext->assertPageContainsText($row[0]);
        }
    }

    /**
     * @Then I should see images with filters:
     */
    public function iShouldSeeImagesWithFilters(TableNode $table)
    {
        $loadTypeSourceMap = [
            'lazy' => 'data-original',
            'eager' => 'src',
        ];

        foreach ($table->getHash() as $row) {
            $loadType = $loadTypeSourceMap['lazy'];
            if (isset($row['load_type']) && isset($loadTypeSourceMap[$row['load_type']])) {
                $loadType = $loadTypeSourceMap[$row['load_type']];
            }

            $pattern = sprintf(
                '<\<img\s+%s="http://[^"]*%s[^"]*%s"[a-zA-Z\"\:]*>',
                $loadType,
                $row['filter'],
                $row['name']
            );

            $this->assertPageMatchesHtml($pattern);
        }
    }

    /**
     * @Then I should see images in background with filters:
     */
    public function iShouldSeeImagesInBackgroundWithFilters(TableNode $table)
    {
        foreach ($table->getHash() as $row) {
            $pattern = sprintf(
                '<div\s+class="%s"\s+style="background-image:\s+url\(\'http(.*)%s(.*)%s\'\s*\)+>',
                $row['className'],
                $row['filter'],
                $row['name']
            );

            $this->assertPageMatchesHtml($pattern);
        }
    }

    /**
     * @Then /^(?:|I )should see html matching (?P<pattern>"(?:[^"]|\\")*")$/
     */
    public function assertPageMatchesHtml(string $pattern)
    {
        $session = $this->minkContext->getSession();
        $html = $session->getPage()->getHtml();

        $message = sprintf('The pattern %s was not found in the html of the current page.', $pattern);
        if (!preg_match($pattern, $html)) {
            throw new ResponseTextException($message, $session->getDriver());
        }
    }

    /**
     * @Then /^(?:|I )should not see html matching (?P<pattern>"(?:[^"]|\\")*")$/
     */
    public function assertPageNotMatchesHtml(string $pattern)
    {
        $session = $this->minkContext->getSession();
        $html = $session->getPage()->getHtml();

        $message = sprintf('The pattern %s was found in the html of the current page but it shouldn\'t.', $pattern);
        if (preg_match($pattern, $html)) {
            throw new ResponseTextException($message, $session->getDriver());
        }
    }

    /**
     * @Then /^I should not see the list of elements:$/
     */
    public function iShouldNotSeeTheListOfElements(TableNode $table)
    {
        foreach ($table->getRows() as $row) {
            $this->minkContext->assertPageNotContainsText($row[0]);
        }
    }

    /**
     * @When /^I click on the element with xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->minkContext->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        );

        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        $element->click();
    }

    /**
     * @Then /^I click on "([^"]*)"$/
     */
    public function iClickOn($element)
    {
        $page = $this->minkContext->getSession()->getPage();
        $findName = $page->find('css', $element);
        if (!$findName) {
            throw new ElementNotFoundException($this->minkContext->getSession()->getDriver());
        } else {
            $findName->click();
        }
    }

    /**
     * @Then /^I click on parent "([^"]*)"$/
     */
    public function iClickOnParent($element)
    {
        $page = $this->minkContext->getSession()->getPage();
        $findName = $page->find('css', $element)->getParent();
        if (!$findName) {
            throw new ElementNotFoundException($this->minkContext->getSession()->getDriver());
        } else {
            $findName->click();
        }
    }

    /**
     * @Then I should see the numeric list of elements:
     */
    public function iShouldSeeTheNumericListOfElements(TableNode $table)
    {
        foreach ($table->getHash() as $row) {
            $this->minkContext->assertPageContainsText($row['position']);
            $this->minkContext->assertPageContainsText($row['article_title']);
        }
    }

    /**
     * @Then I should see the timestamp list of elements:
     */
    public function iShouldSeeTheTimestampListOfElements(TableNode $table)
    {
        foreach ($table->getHash() as $row) {
            $this->minkContext->assertPageContainsText($row['time']);
            $this->minkContext->assertPageContainsText($row['article_title']);
        }
    }

    /**
     * @Then I wait for more items to be loaded
     */
    public function iWaitForMoreItemsToBeLoaded()
    {
        $this->minkContext->getSession()->wait(
            5000,
            "$('.list-items li').length > 6"
        );
    }

    /**
     * @Then I should see social meta tags:
     */
    public function iShouldSeeSocialMetaTags(TableNode $ogTags)
    {
        $this->checkMetaTags($ogTags, 'property');
    }

    /**
     * @Then I should see meta tags:
     */
    public function iShouldSeeMetaTags(TableNode $metaTags)
    {
        $this->checkMetaTags($metaTags, 'name');
    }

    private function checkMetaTags(Traversable $tags, string $attributeName)
    {
        foreach ($tags as $tag) {
            $this->checkElementAttribute(
                'head > meta[' . $attributeName . '="' . $tag['tag'] . '"]',
                'content',
                $tag['value']
            );
        }
    }

    /**
     * @Then I should be able to download :arg1
     */
    public function iShouldBeAbleToDownload($name)
    {
        $element = $this->minkContext->getSession()->getPage()->findLink($name);
        $url = $element->getAttribute('href');

        $client = new \Guzzle\Http\Client();
        $request = $client->get($url);
        $response = $request->send();

        if ($response->getStatusCode() != 200) {
            throw new \GuzzleHttp\Exception\BadResponseException("Couldn't download $name");
        }
    }

    private function checkElementAttribute(string $element, string $attributeName, string $attributeValue)
    {
        $this->minkContext->assertSession()->elementAttributeContains(
            'css',
            $element,
            $attributeName,
            $attributeValue
        );
    }

    /**
     * @Then I canonical link should be set to :link
     */
    public function iCanonicalLinkShouldBeSetTo(string $link)
    {
        $this->checkElementAttribute(
            'head > link[rel="canonical"]',
            'href',
            $link
        );
    }

    /**
     * @Then I should see an :element element with attribute :name set to :value
     */
    public function iShouldSeeAnElementWithAttributeSetTo(string $element, string $name, string $value)
    {
        $this->checkElementAttribute($element, $name, $value);
    }

    /**
     * @Then I should see :divId div with :slotId slotId
     */
    public function iShouldSeeBanner(string $divId, string $slotId)
    {
        $banner = $this->minkContext->getSession()->getPage()->find('css', $divId);

        if ($banner == null) {
            throw new \LogicException("Could not find banner [$divId].");
        }

        if ($banner->getAttribute('data-dfp-slot') !== $slotId) {
            throw new \LogicException("Dfp slot id shouls be set to: $slotId.");
        }
    }

    /**
     * @When I wait for page to be loaded
     */
    public function iWaitForPageToBeLoaded()
    {
        $pageLoaded = $this->minkContext->getSession()->wait(
            10000,
            'document.readyState == "complete"'
        );

        if (!$pageLoaded) {
            throw new \Exception('Page has not been loaded');
        }
    }

    /**
     * @Then I wait for :element element
     */
    public function iWaitForElement($element)
    {
        $elementFound = $this->minkContext->getSession()->wait(
            20000,
            '$("' . $element . '").length'
        );

        if (!$elementFound) {
            throw new ElementNotFoundException($this->minkContext->getSession()->getDriver());
        }
    }

    /**
     * @Then I wait for :element element to disappear
     */
    public function iWaitForElementToDisappear($element)
    {
        $elementNotFound = $this->minkContext->getSession()->wait(
            10000,
            '$("' . $element . '").length == 0'
        );

        if (!$elementNotFound) {
            throw new \Exception('Element found on page');
        }
    }

    /**
     * @Then I wait for :element element to be hidden
     */
    public function iWaitForElementToBeHidden($element)
    {
        $elementNotFound = $this->minkContext->getSession()->wait(
            10000,
            '$("' . $element . '").is(":hidden")'
        );

        if (!$elementNotFound) {
            throw new \Exception('Element found on page');
        }
    }

    /**
     * @Then I wait for :element element to be shown
     */
    public function iWaitForElementToBeShown($element)
    {
        $elementNotFound = $this->minkContext->getSession()->wait(
            10000,
            '$("' . $element . '").is(":visible")'
        );

        if (!$elementNotFound) {
            throw new \Exception('Element found on page');
        }
    }

    /**
     * @Then I should see in xml response
     */
    public function iShouldSeeInXmlResponse(TableNode $table)
    {
        $xml = simplexml_load_string($this->minkContext->getSession()->getPage()->getContent());

        foreach ($table->getHash() as $row) {
            $index = intval($row['item_index']);
            \PHPUnit_Framework_Assert::assertContains($row['title'], (string) $xml->channel->item[$index]->title);
            \PHPUnit_Framework_Assert::assertContains($row['description'], (string) $xml->channel->item[$index]->description);

            if (!empty($row['img'])) {
                \PHPUnit_Framework_Assert::assertContains($row['img'], (string) $xml->channel->item[$index]->description);
            }
        }
    }

    /**
     * @Then I should see in sitemap.xml response
     */
    public function iShouldSeeInSitemapXmlResponse(TableNode $table)
    {
        $xml = simplexml_load_string($this->minkContext->getSession()->getPage()->getContent());

        foreach ($table->getHash() as $row) {
            $index = intval($row['sitemap_index']);
            \PHPUnit_Framework_Assert::assertContains($row['loc'], (string) $xml->sitemap[$index]->loc);
        }
    }

    /**
     * @Then an element :element should be visible
     */
    public function anElementShouldBeVisible(string $element)
    {
        $node = $this->minkContext->getSession()->getPage()->find('css', $element);

        if (!$node) {
            throw new ElementNotFoundException($this->minkContext->getSession()->getDriver());
        }

        \PHPUnit_Framework_Assert::assertTrue($node->isVisible());
    }

    /**
     * @Then an element :element should not be visible
     */
    public function anElementShouldNotBeVisible(string $element)
    {
        $node = $this->minkContext->getSession()->getPage()->find('css', $element);

        if (!$node) {
            throw new ElementNotFoundException($this->minkContext->getSession()->getDriver());
        }

        \PHPUnit_Framework_Assert::assertFalse($node->isVisible());
    }

    /**
     * @When /^I restart the browser$/
     */
    public function iRestartTheBrowser()
    {
        $cookie = $this->minkContext->getSession()->getCookie('stay_logged_in');
        $this->minkContext->getSession()->restart();
        $this->minkContext->iAmOnHomepage();
        $this->minkContext->getSession()->setCookie('stay_logged_in', $cookie);
    }

    /**
     * @When I switch to new tab
     */
    public function iSwitchToNewTab()
    {
        $windowNames = $this->minkContext->getSession()->getWindowNames();

        if (count($windowNames) > 1) {
            $this->minkContext->getSession()->switchToWindow(end($windowNames));
        } else {
            throw new Exception("There is not a tab to switch to");
        }
    }

    /**
     * @Given /^I wait "([^"]*)"$/
     */
    public function iWait($seconds)
    {
        $this->minkContext->getSession()->wait((int)$seconds * 1000);
    }

    /**
     * @Then I should see an element :parentElement with child :childElement on position :childPosition containing :childElementChildren
     */
    public function iShouldSeeAnElementWithChildOnPositionContaining(
        string $parentElement,
        string $childElement,
        string $childPosition,
        string $childElementChildren
    ) {
        $parentNode = $this->minkContext->getSession()->getPage()->find('css', $parentElement);

        \PHPUnit_Framework_Assert::assertNotNull($parentNode);

        $childNode = $parentNode->find('xpath', sprintf('//%s[%s]', $childElement, $childPosition));

        \PHPUnit_Framework_Assert::assertNotNull($childNode);

        foreach (explode(' ', $childElementChildren) as $child) {
            \PHPUnit_Framework_Assert::assertNotNull($childNode->find('css', $child));
        }
    }

    /**
     * @Given request headers are set to:
     */
    public function requestHeadersAreSetTo(TableNode $table)
    {
        foreach ($table->getHash() as $row) {
            $this->minkContext->getSession()->setRequestHeader($row['header'], $row['value']);
        }
    }

    /**
     * @When :type adblock is displayed
     */
    public function adblockIsDisplayed($type)
    {
        if (!in_array($type, ['soft', 'hard']))
        {
            throw new \InvalidArgumentException('AdBlock available types are: soft, hard');
        }

        $this->minkContext->getSession()->executeScript(
            "app.config.antiBlocker.enabled = true;
            app.config.antiBlocker.delay = 0;
            app.config.antiBlocker.type = '$type';
            app.antiBlocker.show()"
        );
    }

    /**
     * @When I already accepted usage of cookies
     */
    public function iAlreadyAcceptedCookies()
    {
        $this->minkContext->visitPath('/thisIsAHack');
        $this->minkContext->getSession()->setCookie('cookiesAccepted', 1);
    }

    /**
     * @When I should see an empty response
     */
    public function iShouldSeeAnEmptyResponse()
    {
        \PHPUnit_Framework_Assert::assertEquals('', $this->minkContext->getSession()->getPage()->getContent());
    }

    /**
     * @When I fill in element :element with content :content using jquery
     */
    public function iFillInElementWithContentUsingJquery(string $element,string $content)
    {
        $this->minkContext->getSession()->executeScript(sprintf('$("%s").val(\'%s\')', $element, $content));
    }

    /**
     * @Given I am on :path as authenticated user with subscription
     */
    public function iAmOnAsAuthenticatedUserWithSubscription($path)
    {
        $this->sessionContext->loginUser(SessionContext::USER_WITH_SUBSCRIPTION, $path);
    }

    /**
     * @Given I am on :path as authenticated user without subscription
     */
    public function iAmOnAsAuthenticatedUserWithoutSubscription($path)
    {
        $this->sessionContext->loginUser(SessionContext::USER_WITHOUT_SUBSCRIPTION, $path);
    }
}
