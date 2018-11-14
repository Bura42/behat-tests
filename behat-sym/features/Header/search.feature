Feature: Search
  In order to find proper data
  As a visitor
  I should be able to search through all articles

  @javascript
  Scenario: Search for articles
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article        |
      | body             | article body    |
      | author_free_text | some free text  |
    When I go to "/article"
    And I click on ".site-header-front-desktop .btn-topmenu-search"
    And I wait for "body.show-search .site-search" element
    And I fill in element "input[name='query']" with content "search_testing" using jquery
    And I click on ".site-search .btn-search"
    Then I should be on "http://behat.bdk.dev:8080/search/search_testing"
