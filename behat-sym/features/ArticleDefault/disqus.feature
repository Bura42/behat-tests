Feature: Disqus
  In order to express opinion about article
  As a visitor
  I want to see disqus widget

  Scenario: Show disqus module on news article page
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | disqus      | 1               |
    When I go to "/article/title1"
    Then I should see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should see an ".article-header__comments > a" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "/article/title1"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "https://"
    And I should see an ".article-bottom-share__item--comments" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should see an "div#disqus_thread" element

  Scenario: Show disqus module on longRead article page
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
      | disqus      | 1               |
    When I go to "/article/title1"
    Then I should see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should see an ".article-header__comments > a" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "/article/title1"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "https://"
    And I should see an ".article-bottom-share__item--comments" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should see an "div#disqus_thread" element

  Scenario: Show disqus module on longRead article page
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
      | disqus      | 1               |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "title1" has tag "Longread > Black background"
    When I go to "/article/title1"
    Then I should see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should see an ".article-header__comments > a" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "/article/title1"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "https://"
    And I should see an ".article-bottom-share__item--comments" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should see an "div#disqus_thread" element

  Scenario: Show disqus module on large article page
    Given "large" article page exists
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | title1          |
      | article_url | /article/title1 |
      | disqus      | 1               |
    When I go to "/article/title1"
    Then I should see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should see an ".article-header__comments > a" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "/article/title1"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "https://"
    And I should see an ".article-bottom-share__item--comments" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should see an "div#disqus_thread" element

  Scenario: Show disqus module on video article page
    Given "video" article page exists
    And article exist:
      | option      | value           |
      | type        | video           |
      | title       | title1          |
      | article_url | /article/title1 |
      | disqus      | 1               |
    When I go to "/article/title1"
    Then I should see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should see an ".article-header__comments > a" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "/article/title1"
    And I should see an ".article-header__comments .disqus-comment-count" element with attribute "data-disqus-url" set to "https://"
    And I should see an ".article-bottom-share__item--comments" element with attribute "title" set to "Se kommentarer"
    And I should see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should see an "div#disqus_thread" element

  Scenario: Don't show disqus module on news article page when it is disabled for article
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should not see an ".article-header__comments > a" element
    And I should not see an ".article-header__comments .disqus-comment-count" element
    And I should not see an ".article-bottom-share__item--comments" element
    And I should not see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should not see an "div#disqus_thread" element

  Scenario: Don't show disqus module on longRead article page when it is disabled for article
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should not see an ".article-header__comments > a" element
    And I should not see an ".article-header__comments .disqus-comment-count" element
    And I should not see an ".article-bottom-share__item--comments" element
    And I should not see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should not see an "div#disqus_thread" element

  Scenario: Don't show disqus module on large article page when it is disabled for article
    Given "large" article page exists
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should not see an ".article-header__comments > a" element
    And I should not see an ".article-header__comments .disqus-comment-count" element
    And I should not see an ".article-bottom-share__item--comments" element
    And I should not see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should not see an "div#disqus_thread" element

  Scenario: Don't show disqus module on video article page when it is disabled for article
    Given "video" article page exists
    And article exist:
      | option      | value           |
      | type        | video           |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__comments .bicon-comment-inv-alt2" element
    And I should not see an ".article-header__comments > a" element
    And I should not see an ".article-header__comments .disqus-comment-count" element
    And I should not see an ".article-bottom-share__item--comments" element
    And I should not see an ".article-bottom-share__item--comments .bicon-comment-inv-alt2" element
    And I should not see an "div#disqus_thread" element

  Scenario: API response test
    When I request "bm_disqus.disqus_block" building block
    Then I should get valid configuration for "bm_disqus.disqus_block":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration
