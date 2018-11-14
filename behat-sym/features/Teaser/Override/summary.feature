Feature: Show teaser summary on teasers
  In order to see proper summary on teasers
  As a visitor
  I should see override summary

  Scenario: Show override summary for teaser large
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /large_teaser_override_summary |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Teaser                                                   |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option         | value                          |
      | type           | news                           |
      | title          | Regular title                  |
      | summary        | Article summary                |
      | teaser_summary | Override summary               |
      | article_url    | /article/title1                |
      | main_image     | game-of-thrones-main-image.jpg |
    When I go to "/large_teaser_override_summary"
    Then I should not see "Article summary"
    And I should see "Override summary"

  Scenario: Don't show override summary on article page
    Given "news" article page exists
    And article exist:
      | option         | value                    |
      | type           | news                     |
      | title          | Regular title            |
      | article_url    | /article/regular_summary |
      | summary        | summary1                 |
      | date_created   | 2016-05-31 12:00         |
      | teaser_summary | Override summary         |
    When I go to "/article/regular_summary"
    Then I should see "summary1"
    And I should not see "Override summary"

  Scenario: Show override summary for teaser small
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /small_teaser_override_summary |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Teaser                                                   |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | show_summary   | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option         | value                          |
      | type           | news                           |
      | title          | Regular title                  |
      | summary        | Article summary                |
      | teaser_summary | Override summary               |
      | article_url    | /article/title1                |
      | main_image     | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_override_summary"
    Then I should not see "Article summary"
    And I should see "Override summary"

  Scenario: Show override summary for teaser xlarge
    Given "custom_page" site manager page exists:
      | option      | value                           |
      | url         | /xlarge_teaser_override_summary |
      | title       | Custom page title               |
      | description | Custom description              |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Teaser                                                   |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xlarge                                                   |
      | show_summary   | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option         | value                          |
      | type           | news                           |
      | title          | Regular title                  |
      | summary        | Article summary                |
      | teaser_summary | Override summary               |
      | article_url    | /article/title1                |
      | main_image     | game-of-thrones-main-image.jpg |
    When I go to "/xlarge_teaser_override_summary"
    Then I should not see "Article summary"
    And I should see "Override summary"

  Scenario: Show override summary for teaser pack 1
    Given "custom_page" site manager page exists:
      | option      | value                           |
      | url         | /teaser_pack_1_override_summary |
      | title       | Custom page title               |
      | description | Custom description              |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Teaser                                                   |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And articles exist:
      | title                 | article_url     | main_image                     | type | supertitle           | summary  | date_created | teaser_summary   |
      | title1                | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   | other_summary    |
      | Regular title related | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   | Override summary |
    And article "title1" has related article "Regular title related"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 1        | www.b.dk > Forside > Pakke 1        | presentation |
      | www.b.dk > Forside > Relaterede > 3 | www.b.dk > Forside > Relaterede > 3 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    When I go to "/teaser_pack_1_override_summary"
    Then I should not see "summary1"
    And I should see "other_summary"
    And I should not see "summary2"
    And I should see "Override summary"
