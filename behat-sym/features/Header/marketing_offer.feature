Feature: Show marketing offer in site header
  In order to buy subscription
  As a visitor
  I should see marketing offer

  Scenario: Displaying marketing offer at main page
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to homepage
    Then I should see an ".header-marketing" element

  Scenario: Displaying marketing offer at news article
    Given "news" article page exists
    And articles exist:
      | title  | article_url     | body         | type |
      | title1 | /article/title1 | article body | news |
    When I go to "/article/title1"
    Then I should see an ".header-marketing" element

  Scenario: Not showing marketing offer at longRead article
    Given "longRead" article page exists
    And articles exist:
      | title  | article_url     | body         | type     |
      | title1 | /article/title1 | article body | longread |
    When I go to "/article/title1"
    Then I should not see an ".header-marketing" element
