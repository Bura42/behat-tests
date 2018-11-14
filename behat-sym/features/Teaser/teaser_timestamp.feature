Feature: Show timestamp for teaser
  In order to know if article is up to date
  As a visitor
  I should see teaser date

  Scenario: Don't show date in teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_no_timestamp  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | title           | Small teaser                                             |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 1                                                        |
      | template        | small                                                    |
      | image_position  | right                                                    |
      | date_visibility | 0                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | news                           |
      | title        | title1                         |
      | summary      | Article summary                |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | date_created | 2016-01-10                     |
    When I go to "/teaser_no_timestamp"
    And I should not see an ".teaser-body .teaser-date" element
    And I should not see "10. january 2016"

  Scenario: Show date for article older than 1 day
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_timestamp  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | title           | Small teaser                                             |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 1                                                        |
      | template        | small                                                    |
      | image_position  | right                                                    |
      | date_visibility | 1                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | news                           |
      | title        | title1                         |
      | summary      | Article summary                |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | date_created | 2016-02-10                     |
    When I go to "/teaser_timestamp"
    And I should see an ".teaser-body .teaser-date" element
    And I should see "10. februar 2016"
