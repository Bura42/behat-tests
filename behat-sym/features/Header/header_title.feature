Feature: Header title
  In order to understand page purpose
  As a visitor
  I want to see header title

  Scenario: Show header title on static page
    Given "custom_page" site manager page exists:
      | option       | value                   |
      | url          | /header_title_1         |
      | title        | Custom page title       |
      | description  | Custom description      |
      | header_title | Custom title for header |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to "/header_title_1"
    Then the "a.page-title" element should contain "Custom title for header"

  Scenario: Don't show header title on static page
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /header_title_2    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to "/header_title_2"
    Then I should not see an "a.page-title" element

  Scenario: Show header title on article page with existing routing
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And tag exist:
      | option    | value          |
      | type      | category       |
      | full_name | www.b.dk       |
      | name      | www.b.dk       |
      | tag_url   | /main-category |
    And tag exist:
      | option    | value                           |
      | type      | category                        |
      | full_name | www.b.dk > Custom category name |
      | name      | Custom category name            |
      | tag_url   | /subCategory123                 |
    And tag exist:
      | option    | value                                  |
      | type      | category                               |
      | full_name | www.b.dk > Custom category name > name |
      | name      | name                                   |
      | tag_url   | /sub-category1                         |
    And "www.b.dk" tag is parent of "www.b.dk > Custom category name" tag
    And "www.b.dk > Custom category name" tag is parent of "www.b.dk > Custom category name > name" tag
    And article "Article title" has tag "name"
    When I go to "/article/title1"
    Then the "a.page-title" element should contain "Custom category name"

  Scenario: Show header title on article with three level category on page without existing routing
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title2 |
      | body        | article body    |
    And tag exist:
      | option    | value          |
      | type      | category       |
      | full_name | www.b.dk       |
      | name      | www.b.dk       |
      | tag_url   | /main_category |
    And tag exist:
      | option    | value                           |
      | type      | category                        |
      | full_name | www.b.dk > Custom category name |
      | name      | Custom category name            |
    And tag exist:
      | option    | value                                    |
      | type      | category                                 |
      | full_name | www.b.dk > Custom category name > myname |
      | name      | myname                                   |
      | tag_url   | /sub_category1                           |
    And "www.b.dk" tag is parent of "www.b.dk > Custom category name" tag
    And "www.b.dk > Custom category name" tag is parent of "www.b.dk > Custom category name > myname" tag
    And article "Article title" has tag "myname"
    When I go to "/article/title2"
    Then the "a.page-title" element should contain "Custom category name"
    And the response should contain "custom-category-name"

  Scenario: Show header title on article with two level category on page without existing routing
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title3 |
      | body        | article body    |
    And tag exist:
      | option    | value          |
      | type      | category       |
      | full_name | www.b.dk       |
      | name      | www.b.dk       |
      | tag_url   | /main_category |
    And tag exist:
      | option    | value                           |
      | type      | category                        |
      | full_name | www.b.dk > Custom category name |
      | name      | Custom category name            |
    And "www.b.dk" tag is parent of "www.b.dk > Custom category name" tag
    And article "Article title" has tag "Custom category name"
    When I go to "/article/title3"
    Then the "a.page-title" element should contain "Custom category name"
    And the response should contain "custom-category-name"

  Scenario: Show header title on article with two level category wit page from SM
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title4 |
      | body        | article body    |
    And tag exist:
      | option    | value          |
      | type      | category       |
      | full_name | www.b.dk       |
      | name      | www.b.dk       |
      | tag_url   | /main_category |
    And tag exist:
      | option    | value                            |
      | type      | category                         |
      | full_name | www.b.dk > Custom category name1 |
      | name      | Custom category name1            |
    And "www.b.dk" tag is parent of "www.b.dk > Custom category name1" tag
    And article "Article title" has tag "Custom category name1"
    And routing exists:
      | option          | value                  |
      | type            | alias                  |
      | source_uri      | /custom-category-name1 |
      | destination_uri | /custom_page/1         |
    When I go to "/article/title4"
    Then the "a.page-title" element should contain "Custom category name1"
    And the response should contain "custom-category-name1"
