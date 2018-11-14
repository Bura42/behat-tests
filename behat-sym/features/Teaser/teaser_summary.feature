Feature: Teaser summary
  In order to know teasers summary
  As a visitor
  I want to see article summary

  Scenario: Don't show summary by default
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_no_summary |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 0                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
      | summary     | Article summary |
    When I go to "/teaser_no_summary"
    Then I should not see "Article summary"
    And I should not see "Article summary"

  Scenario: Show summary for large teaser
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_summary_large |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
      | summary     | Article summary |
    When I go to "/teaser_summary_large"
    Then I should see "Article summary"

  Scenario: Show summary for large teaser based on presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /teaser_summary_by_tag |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 0                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
      | summary     | Article summary |
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Teaser > Vis underrubrik | www.b.dk > Teaser > Vis underrubrik | presentation |
    And article "Article title" has tag "www.b.dk > Teaser > Vis underrubrik"
    When I go to "/teaser_summary_by_tag"
    Then I should see "Article summary"

  Scenario: Show summary for small teaser
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_summary_small |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | show_summary   | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
      | summary     | Article summary |
    When I go to "/teaser_summary_small"
    Then I should see "Article summary"

  Scenario: Show summary for xlarge teaser (based on presentation tag)
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /teaser_summary_xlarge |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | xlarge                                                   |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | Article title                  |
      | article_url | /article/title1                |
      | body        | article body                   |
      | main_image  | game-of-thrones-main-image.jpg |
      | summary     | Article summary                |
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Teaser > Vis underrubrik | www.b.dk > Teaser > Vis underrubrik | presentation |
    And article "Article title" has tag "www.b.dk > Teaser > Vis underrubrik"
    When I go to "/teaser_summary_xlarge"
    Then I should see "Article summary"
