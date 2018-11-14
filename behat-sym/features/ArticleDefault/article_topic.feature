Feature: Topics
  In order to understand article subject
  As a visitor
  I want to see article topics

  Scenario: Show topics on news article page
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
    And tag exist:
      | option    | value       |
      | type      | topic       |
      | full_name | Topic title |
      | name      | Topic title |
    And article "Article title" has tag "Topic title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Topic title |
      | EMNER       |

  Scenario: Redirect to topic page
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
    And tag exist:
      | option    | value       |
      | type      | topic       |
      | full_name | Topic title |
      | name      | Topic title |
    And article "Article title" has tag "Topic title"
    When I go to "/article/title1"
    And I click on ".article-bottom-related-title-left__item--topic a"
    Then I should be on "/tag/item/1"

  Scenario: Show topics on longRead article page
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | Article title   |
      | article_url | /article/title1 |
    And tags exist:
      | name         | full_name    | type  |
      | Topic title1 | Topic title1 | topic |
      | Topic title2 | Topic title2 | topic |
      | Topic title3 | Topic title3 | topic |
      | Topic title4 | Topic title4 | topic |
      | Topic title5 | Topic title5 | topic |
      | Topic title6 | Topic title6 | topic |
      | Topic title7 | Topic title7 | topic |
    And article "Article title" has tag "Topic title1"
    And article "Article title" has tag "Topic title2"
    And article "Article title" has tag "Topic title3"
    And article "Article title" has tag "Topic title4"
    And article "Article title" has tag "Topic title5"
    And article "Article title" has tag "Topic title6"
    And article "Article title" has tag "Topic title7"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Topic title1 |
      | Topic title2 |
      | Topic title3 |
      | Topic title4 |
      | Topic title5 |
      | Topic title6 |
      | Topic title7 |
      | EMNER        |

  Scenario: Show topics on large article page
    Given "large" article page exists
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | Article title   |
      | article_url | /article/title1 |
    And tags exist:
      | name         | full_name    | type  |
      | Topic title1 | Topic title1 | topic |
      | Topic title2 | Topic title2 | topic |
      | Topic title3 | Topic title3 | topic |
    And article "Article title" has tag "Topic title1"
    And article "Article title" has tag "Topic title2"
    And article "Article title" has tag "Topic title3"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Topic title1 |
      | Topic title2 |
      | Topic title3 |
      | EMNER        |
