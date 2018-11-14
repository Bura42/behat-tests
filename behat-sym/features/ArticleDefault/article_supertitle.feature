Feature: Article supertitle
  In order to understand article subject
  As a visitor
  I want to see supertitle above article title

  Scenario: Show article supertitle on article page
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | supertitle  | Supertitle      |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should see an ".article-header__trumpet" element
    And I should see "Supertitle" in the ".article-header__trumpet" element

  Scenario: Doesn't show article supertitle on article page
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | supertitle  |                 |
      | title       | title2          |
      | article_url | /article/title2 |
    When I go to "/article/title2"
    Then I should not see an ".article-header__trumpet" element

  Scenario: Show article supertitle on longRead page
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | supertitle  | Supertitle                     |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/article/title1"
    Then I should see an ".longread-head__trumpet" element
    And I should see "Supertitle" in the ".longread-head__trumpet" element

  Scenario: Doesn't show article supertitle on longRead page
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | supertitle  |                 |
      | title       | title2          |
      | article_url | /article/title2 |
    When I go to "/article/title2"
    Then I should not see an ".longread-head__trumpet" element

  Scenario:
    When I request "bm_app.article.header" building block
    Then I should get valid configuration for "bm_app.article.header":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration
