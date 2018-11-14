Feature: Article rating
  In order to check article popularity
  As a visitor
  I want to see article rating above title visualised by stars

  Scenario: Article rating is not showing
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__rating" element

  Scenario: Article rating is showing 4 blue stars
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title2 |
      | rating      | 4               |
    When I go to "/article/title2"
    Then I should see an ".article-header__rating" element
    And I should see 4 ".bicon-star--full" elements
    And I should see 6 ".bicon-star" elements

  Scenario: Article rating is showing 6 blue stars
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title3 |
      | rating      | 6               |
    When I go to "/article/title3"
    Then I should see an ".article-header__rating" element
    And I should see 6 ".bicon-star--full" elements
    And I should see 6 ".bicon-star" elements

  Scenario: Article rating is not showing blue stars
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title2 |
      | rating      | 0               |
    When I go to "/article/title2"
    Then I should see an ".article-header__rating" element
    And I should not see an ".bicon-star--full" element
    And I should see 6 ".bicon-star" elements
    And I should see text matching "0 stjerner"

  Scenario:
    When I request "bm_app.article.header" building block
    Then I should get valid configuration for "bm_app.article.header":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration

  Scenario: LongRead article rating is not showing
    Given longRead article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".article-header__rating" element

  Scenario: LongRead article rating is showing 4 blue stars
    Given longRead article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
      | rating      | 4               |
    When I go to "/article/title1"
    Then I should see an ".article-header__rating" element
    And I should see 4 ".bicon-star--full" elements
    And I should see 6 ".bicon-star" elements
