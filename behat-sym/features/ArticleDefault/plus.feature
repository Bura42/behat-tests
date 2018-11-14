Feature: Plus
  In order to express plus section
  As a visitor
  I want to be redirected to plus section

  Scenario: Show article without "www.b.dk > Artikel > Plus" tag
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should see "title1"

  @javascript
  Scenario: Show article with "www.b.dk > Artikel > Plus" tag
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
    And tag exist:
      | option    | value                     |
      | type      | presentation              |
      | full_name | www.b.dk > Artikel > Plus |
      | name      | Plus                      |
    And article "title2" has tag "Plus"
    When I go to "/article/title2"
    And I wait "1"
    Then I should be on "/plus"
