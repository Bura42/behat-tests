Feature: Linkpulse article body tracking
  In order to measure how far users read articles
  As a owner
  I want to include linkpulse start and end tags

  Scenario: Linkpulse article body tracking for news type
    Given "news" article page exists
    And article exist:
      | option      | value                   |
      | type        | news                    |
      | title       | title1                  |
      | article_url | /article/title1_lp_news |
      | body        | article body            |
    When I go to "/article/title1_lp_news"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for news plus type
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                        |
      | type        | news_plus                    |
      | title       | title1                       |
      | article_url | /article/title1_lp_news_plus |
      | body        | article body                 |
    When I go to "/article/title1_lp_news_plus"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for longread type
    Given "longRead" article page exists
    And article exist:
      | option      | value                       |
      | type        | longread                    |
      | title       | title1                      |
      | article_url | /article/title1_lp_longread |
      | body        | article body                |
    When I go to "/article/title1_lp_longread"
    Then I should see an "span.lp_is_start + h1.longread-head__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for longread type with image
    Given "longRead" article page exists
    And article exist:
      | option      | value                                  |
      | type        | longread                               |
      | title       | title1                                 |
      | article_url | /article/title1_lp_longread_with_image |
      | body        | article body                           |
      | main_image  | 160x160.jpg                            |
    When I go to "/article/title1_lp_longread_with_image"
    Then I should see an "span.lp_is_start + h1.longread-head__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for longread plus
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value                            |
      | type        | longread_plus                    |
      | title       | title1                           |
      | article_url | /article/title1_lp_longread_plus |
      | body        | article body                     |
    When I go to "/article/title1_lp_longread_plus"
    Then I should see an "span.lp_is_start + h1.longread-head__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for large
    Given "large" article page exists
    And article exist:
      | option      | value                    |
      | type        | large                    |
      | title       | title1                   |
      | article_url | /article/title1_lp_large |
      | body        | article body             |
    When I go to "/article/title1_lp_large"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for large plus
    Given "largePlus" article page exists
    And article exist:
      | option      | value                         |
      | type        | large_plus                    |
      | title       | title1                        |
      | article_url | /article/title1_lp_large_plus |
      | body        | article body                  |
    When I go to "/article/title1_lp_large_plus"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for video
    Given "video" article page exists
    And article exist:
      | option      | value                    |
      | type        | video                    |
      | title       | title1                   |
      | article_url | /article/title1_lp_video |
      | body        | article body             |
    When I go to "/article/title1_lp_video"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for video plus
    Given "videoPlus" article page exists
    And article exist:
      | option      | value                         |
      | type        | video_plus                    |
      | title       | title1                        |
      | article_url | /article/title1_lp_video_plus |
      | body        | article body                  |
    When I go to "/article/title1_lp_video_plus"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element

  Scenario: Linkpulse article body tracking for advertorial
    Given "advertorial" article page exists
    And article exist:
      | option      | value                          |
      | type        | advertorial                    |
      | title       | title1                         |
      | article_url | /article/title1_lp_advertorial |
      | body        | article body                   |
    When I go to "/article/title1_lp_advertorial"
    Then I should see an "span.lp_is_start + h1.article-header__title" element
    And I should see an "div.article-body + span.lp_is_end" element
