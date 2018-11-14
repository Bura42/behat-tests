Feature: Show teaser title on teasers
  In order to see proper title on teasers
  As a visitor
  I should see override title

  Scenario: Show override title for teaser large
    Given "custom_page" site manager page exists:
      | option      | value                        |
      | url         | /large_teaser_override_title |
      | title       | Custom page title            |
      | description | Custom description           |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | news                           |
      | title        | Regular title                  |
      | summary      | Article summary                |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | teaser_title | Override title                 |
    When I go to "/large_teaser_override_title"
    Then I should not see "Regular title"
    And I should see "Override title"

  Scenario: Don't show override title on article page
    Given "news" article page exists
    And article exist:
      | option       | value                  |
      | type         | news                   |
      | title        | Regular title          |
      | article_url  | /article/regular_title |
      | summary      | summary1               |
      | date_created | 2016-05-31 12:00       |
      | teaser_title | Override title         |
    When I go to "/article/regular_title"
    Then I should see "Regular title"
    And I should not see "Override title"

  Scenario: Show override title for teaser cartoon
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /cartoon_teaser_override_title |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | cartoon teaser                                           |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | cartoon                                                  |
      | number_of_columns | 3                                                        |
      | button_label      | Læs hele striben                                         |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | news                           |
      | title        | Regular title                  |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | teaser_title | Override title                 |
    When I go to "/cartoon_teaser_override_title"
    Then I should not see "Regular title"
    And I should see "Override title"

  Scenario: Show override title for consumer sales
    Given "custom_page" site manager page exists:
      | option      | value                                 |
      | url         | /consumer_sales_teaser_override_title |
      | title       | Custom page title                     |
      | description | Custom description                    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Consumer sales teaser                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | consumer_sales                                           |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | news                           |
      | title        | Regular title                  |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | supertitle   | Only 2000E per week!           |
      | teaser_title | Override title                 |
    When I go to "/consumer_sales_teaser_override_title"
    Then I should not see "Regular title"
    And I should see "Override title"

  Scenario: Show override title for teaser pack 1
    Given "custom_page" site manager page exists:
      | option      | value                         |
      | url         | /teaser_pack_1_override_title |
      | title       | Custom page title             |
      | description | Custom description            |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And articles exist:
      | title                 | article_url     | main_image                     | type | supertitle           | summary  | date_created | teaser_title           |
      | title1                | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   | other_title            |
      | Regular title related | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   | Override title related |
    And article "title1" has related article "Regular title related"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 1        | www.b.dk > Forside > Pakke 1        | presentation |
      | www.b.dk > Forside > Relaterede > 3 | www.b.dk > Forside > Relaterede > 3 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    When I go to "/teaser_pack_1_override_title"
    Then I should not see "title1"
    And I should see "other_title"
    And I should not see "Regular title related"
    And I should see "Override title related"

  Scenario: Show override title for default list
    Given "custom_page" site manager page exists:
      | option      | value                        |
      | url         | /list_default_override_title |
      | title       | Custom page title            |
      | description | Custom description           |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title       | type | teaser_title    |
      | real_title1 | news | override_title1 |
      | real_title2 | news | override_title2 |
      | real_title3 | news | override_title3 |
      | real_title4 | news | override_title4 |
      | real_title5 | news | override_title5 |
    When I go to "/list_default_override_title"
    Then I should not see the list of elements:
      | real_title1 |
      | real_title2 |
      | real_title3 |
      | real_title4 |
      | real_title5 |
    And I should see the list of elements:
      | override_title1 |
      | override_title2 |
      | override_title3 |
      | override_title4 |
      | override_title5 |
