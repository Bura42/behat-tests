Feature: Show sub menu in site header
  In order to understand sub menu subject
  As a visitor
  I should see sub menu

  Background:
    Given snippet "site_footer" exist

  Scenario: Displaying sub menu at custom page
    Given menu exists
    And "custom_page" site manager page exists:
      | option      | value              |
      | url         | /custom_page       |
      | title       | Custom page title  |
      | description | Custom description |
      | menu        | bdk                |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to "/custom_page"
    Then I should see "Anmeldelser"
    Then I should see "Satiren"

  @javascript
  Scenario: Displaying sub menu at custom page on mobile
    Given menu exists
    And window size is phone
    And "custom_page" site manager page exists:
      | option       | value              |
      | url          | /custom_page       |
      | title        | Custom page title  |
      | description  | Custom description |
      | menu         | bdk                |
      | header_title | headerTitle        |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to "/custom_page"
    Then I should see "headerTitle"

  Scenario: Not displaying sub menu at custom page
    Given menu exists
    And "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /custom_page_without_menu |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to "/custom_page_without_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  @javascript
  Scenario: Not displaying sub menu at custom page on mobile
    Given menu exists
    And window size is phone
    And "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /custom_page_without_menu |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to "/custom_page_without_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  Scenario: Displaying sub menu at news article page
    Given menu exists
    And "news" article page exists
    And article exist:
      | option      | value                   |
      | type        | news                    |
      | title       | Article title           |
      | article_url | /news_article_with_menu |
      | body        | article body            |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/news_article_with_menu"
    Then I should see "Anmeldelser"
    And I should see "Satiren"

  @javascript
  Scenario: Displaying sub menu at news article page
    Given menu exists
    And window size is phone
    And "news" article page exists
    And article exist:
      | option      | value                   |
      | type        | news                    |
      | title       | Article title           |
      | article_url | /news_article_with_menu |
      | body        | article body            |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/news_article_with_menu"
    And I click on ".toggle-submenu"
    Then I should see "title"
    And I should see "Gå til title"
    And I should see "Anmeldelser"
    And I should see "Satiren"

  Scenario: Displaying sub menu at large article page
    Given menu exists
    And "large" article page exists
    And article exist:
      | option      | value                    |
      | type        | large                    |
      | title       | Article title            |
      | article_url | /large_article_with_menu |
      | body        | article body             |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/large_article_with_menu"
    Then I should see "Anmeldelser"
    Then I should see "Satiren"

  Scenario: Not displaying sub menu at news article page
    Given "news" article page exists
    And article exist:
      | option      | value                   |
      | type        | news                    |
      | title       | Article title           |
      | article_url | /news_article_with_menu |
      | body        | article body            |
    When I go to "/news_article_with_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  @javascript
  Scenario: Not displaying sub menu at news article page on mobile
    Given "news" article page exists
    And window size is phone
    And article exist:
      | option      | value                   |
      | type        | news                    |
      | title       | Article title           |
      | article_url | /news_article_with_menu |
      | body        | article body            |
    When I go to "/news_article_with_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  Scenario: Not displaying sub menu at longRead article page
    Given menu exists
    And "longRead" article page exists
    And article exist:
      | option      | value                   |
      | type        | longread                |
      | title       | Article title           |
      | article_url | /news_article_with_menu |
      | body        | article body            |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/news_article_with_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  @javascript
  Scenario: Not displaying sub menu at longread article page on mobile
    Given menu exists
    And window size is phone
    And "longRead" article page exists
    And article exist:
      | option      | value                       |
      | type        | longread                    |
      | title       | Article title               |
      | article_url | /longread_article_with_menu |
      | body        | article body                |
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
    And article "Article title" has tag "category > title"
    When I go to "/longread_article_with_menu"
    Then I should not see "Anmeldelser"
    Then I should not see "Satiren"

  Scenario: Displaying sub menu at category page
    Given menu exists
    And "section_page" site manager page exists:
      | option | value |
      | menu   | bdk   |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | category > title |
      | tag_url   | /category        |
    When I go to "/category"
    Then I should see "Anmeldelser"
    Then I should see "Satiren"

  @javascript
  Scenario: Displaying sub menu at category page on mobile
    Given menu exists
    And window size is phone
    And "section_page" site manager page exists:
      | option | value |
      | menu   | bdk   |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    And tag exist:
      | option    | value            |
      | type      | category         |
      | full_name | category > title |
      | name      | title            |
      | tag_url   | /category        |
    When I go to "/category"
    And I click on ".toggle-submenu"
    Then I should see "title"
    And I should see "Gå til title"
    And I should see "Anmeldelser"
    And I should see "Satiren"

  @javascript
  Scenario: Displaying menu for test frontpage
    Given menu exists
    And window size is phone
    And test front page exists
    When I go to "/frontpage"
    And I wait "1"
    Then I should see "Test frontpage"

  @javascript
  Scenario: Cleanup at the end of the feature and setup proper window size
    Given menu exists
    And window size is desktop
    And test front page exists
    When I go to "/frontpage"
    Then I should see "Test frontpage"
