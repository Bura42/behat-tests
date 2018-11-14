Feature: Longread clean article
  In order to see articles in new layout
  As a visitor
  I should see longread clean article

  Background:
    Given snippet "site_footer" exist

  Scenario: Show longRead clean article
    Given "longReadClean" article page exists
    And article exist:
      | option      | value                                          |
      | title       | title1                                         |
      | type        | longread_clean                                 |
      | article_url | /article/title1                                |
      | body        | {embedded type="node/custom_code_html" id="1"} |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "title1" has embedded equipment "Equipment title"
    And tag exist:
      | option    | value         |
      | type      | category      |
      | full_name | category > TV |
      | name      | category > TV |
    And article "title1" has tag "category > TV"
    When I go to "/article/title1"
    Then I should not see an ".longread-head" element
    And I should not see an ".longread-head__title" element
    And I should not see an ".longread-head__summary" element
    And I should see the list of elements:
      | TV             |
      | Equipment code |
