<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;

class SocialMediaContext implements Context, SnippetAcceptingContext
{
    use MinkContextTrait;

    /**
     * @Then I should see an :element element with Facebook share action
     */
    public function iShouldSeeAnElementWithFacebookShareAction(string $element)
    {
        $baseUrl = 'https://www.facebook.com/sharer/sharer.php';
        $this->validateParams($element, 'data-facebook-url', $baseUrl, []);
    }

    /**
     * @Then I should see an :element element with Twiter share action with description :description and link :link
     */
    public function iShouldSeeAnElementWithTwiterShareActionWithDescriptionAndLink(
        string $element,
        string $description,
        string $link
    ) {
        $baseUrl = 'https://twitter.com/intent/tweet';
        $params = [
            'source' => '/^webclient$/',
            'text' => '/^'.$description.' '. preg_quote('https://', '/').'(.*)'.preg_quote($link, '/').'$/',
        ];

        $this->validateParams($element, 'data-twitter-url', $baseUrl, $params);
    }

    /**
     * @Then I should see an :element element with Linkedin share action with title :title, description :description and link :link
     */
    public function iShouldSeeAnElementWithLinkedinShareActionWithTitleDescriptionAndLink(
        string $element,
        string $title,
        string $description,
        string $link
    ) {
        $baseUrl = 'https://www.linkedin.com/shareArticle';
        $params = [
            'mini' => '/^true$/',
            'url' => '/^'.preg_quote('https://', '/').'(.*)'.preg_quote($link, '/').'$/',
            'title' => '/^'.$title.'$/',
            'summary' => '/^'.$description.'$/',
        ];

        $this->validateParams($element, 'data-linkedin-url', $baseUrl, $params);
    }

    private function validateParams(string $element, string $attribute, string $baseUrl, array $params)
    {
        $element = $this->minkContext->assertSession()->elementExists('css', $element);
        $link = $element->getAttribute($attribute);

        PHPUnit_Framework_Assert::assertRegExp('/^'.preg_quote($baseUrl, '/').'/', $link);

        $query = parse_url($link, PHP_URL_QUERY);

        if (!$query) {
            $query = '';
        }

        parse_str($query, $queryParams);

        PHPUnit_Framework_Assert::assertArraySubset(array_keys($params), array_keys($queryParams));

        foreach ($params as $param => $valuePattern) {
            PHPUnit_Framework_Assert::assertRegExp($valuePattern, $queryParams[$param]);
        }
    }
}
