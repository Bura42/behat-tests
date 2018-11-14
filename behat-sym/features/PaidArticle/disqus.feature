Feature: Disqus
  In order to express opinion about article
  As a visitor
  I want to see disqus widget

  Background:
    Given snippet "paywall_hard" exist
    And snippet "paywall_soft" exist

  @javascript
  Scenario: Don't show disqus module and comments counter on news article plus page when logged out
    Given "newsPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title1            |
      | article_url | /disqus/title1    |
      | body        | this is free body |
      | body_paid   | this is paid body |
      | disqus      | 1                 |
    And I am on "/disqus/title1"
    And I wait for ".javascriptCacheBlock" element
    Then an element ".article-header__comments a" should not be visible
    And I should not see an ".article-bottom-share a.article-bottom-share__item--comments" element

  @javascript
  Scenario: Show disqus module and comments counter on news article plus page when logged in with subscription
    Given "newsPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title2            |
      | article_url | /disqus/title2    |
      | body        | this is free body |
      | body_paid   | this is paid body |
      | disqus      | 1                 |
    When I am on "/disqus/title2" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then an element ".article-header__comments a" should be visible
    And an element ".article-bottom-share a.article-bottom-share__item--comments" should be visible

  @javascript
  Scenario: Don't show disqus module and comments counter on long read article plus page when logged out
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | longread_plus     |
      | title       | title3            |
      | article_url | /disqus/title3    |
      | body        | this is free body |
      | body_paid   | this is paid body |
      | disqus      | 1                 |
    And I am on "/disqus/title3"
    And I wait for ".javascriptCacheBlock" element
    Then an element ".article-header__comments a" should not be visible
    And I should not see an ".article-bottom-share a.article-bottom-share__item--comments" element

  @javascript
  Scenario: Show disqus module and comments counter on news long read article plus page when logged in with subscription
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | longread_plus     |
      | title       | title4            |
      | article_url | /disqus/title4    |
      | body        | this is free body |
      | body_paid   | this is paid body |
      | disqus      | 1                 |
    When I am on "/disqus/title4" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then an element ".article-header__comments a" should be visible
    And an element ".article-bottom-share a.article-bottom-share__item--comments" should be visible
