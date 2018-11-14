Feature: Show off canvas menu in site header
  In order to understand off canvas menu subject
  As a visitor
  I should see off canvas menu

  @javascript
  Scenario: Displaying off canvas menu in article page
    Given "news" article page exists
    And off canvas menu exists
    And menu exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article        |
      | body             | article body    |
      | author_free_text | some free text  |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/article"
    And I click on "span.toggle-offcanvas"
    Then I wait for "body.show-offcanvas" element
