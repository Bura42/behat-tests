@javascript
Feature: Longread clean plus article
  In order to see paid articles in new layout
  As a visitor
  I should see longread clean plus article

  Background:
    Given snippet "site_footer" exist
    Given snippet "paywall_hard" exist

  Scenario: Show longRead clean plus article with paywall hard
    Given "longReadCleanPlus" article page exists
    And article exist:
      | option      | value                                                                             |
      | title       | title1                                                                            |
      | type        | longread_clean_plus                                                               |
      | article_url | /article/lrc/title1                                                               |
      | body        | test {embedded type="node/custom_code_html" id="1"} test free body <br> <br> <br> |
      | body_paid   | this is paid body                                                                 |
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
    When I go to "/article/lrc/title1"
    And I wait for ".javascriptCacheBlock" element
    Then I should not see an ".longread-head" element
    And I should not see an ".longread-head__title" element
    And I should not see an ".longread-head__summary" element
    And I should see the list of elements:
      | TV             |
      | Equipment code |
    And I should see the list of elements:
      | test free body             |
      | Velkommen                  |
      | Få den første måned gratis |
      | Allerede abonnent          |
      | Klik her                   |
    And I should not see the list of elements:
      | this is paid body |

  Scenario: Do not show paywall hard in plus longread clean article when user is logged in with subscription
    Given "longReadCleanPlus" article page exists
    And article exist:
      | option      | value                                                                             |
      | title       | title1                                                                            |
      | type        | longread_clean_plus                                                               |
      | article_url | /article/lrcp/title1                                                              |
      | body        | test {embedded type="node/custom_code_html" id="1"} test free body <br> <br> <br> |
      | body_paid   | this is paid body                                                                 |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "title1" has embedded equipment "Equipment title"
    When I am on "/article/lrcp/title1" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | test free body       |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
