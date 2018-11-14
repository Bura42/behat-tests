Feature: Show subscription
  In order to have quick understanding of article
  As a visitor
  I should see subscription

  Scenario: Show news article plus large teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /news_plus_teaser  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value              |
      | type        | news_plus          |
      | title       | news article title |
      | article_url | /article/title2    |
    When I go to "/news_plus_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show longRead article plus large teaser
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /longread_plus_teaser |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                  |
      | type        | longread_plus          |
      | title       | longread article title |
      | article_url | /article/title2        |
    When I go to "/longread_plus_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show large article plus large teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_plus_teaser |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value               |
      | type        | large_plus          |
      | title       | large article title |
      | article_url | /article/title2     |
    When I go to "/large_plus_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show video article plus large teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_plus_teaser |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video_plus                                |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | game-of-thrones-main-image.jpg            |
    When I go to "/large_plus_teaser"
    And I should see an "figure.teaser-icon-video" element
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show news article plus small teaser
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /news_plus_small_teaser |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value              |
      | type        | news_plus          |
      | title       | news article title |
      | article_url | /article/title2    |
    When I go to "/news_plus_small_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show longRead article plus small teaser
    Given "custom_page" site manager page exists:
      | option      | value                       |
      | url         | /longread_plus_small_teaser |
      | title       | Custom page title           |
      | description | Custom description          |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                  |
      | type        | longread_plus          |
      | title       | longread article title |
      | article_url | /article/title2        |
    When I go to "/longread_plus_small_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show large article plus small teaser
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /large_plus_small_teaser |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value               |
      | type        | large_plus          |
      | title       | large article title |
      | article_url | /article/title2     |
    When I go to "/large_plus_small_teaser"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show video article plus small teaser
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /large_plus_small_teaser |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video_plus                                |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | game-of-thrones-main-image.jpg            |
    When I go to "/large_plus_small_teaser"
    And I should see an "figure.teaser-icon-video" element
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show video article plus xsmall teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser            |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video_plus                                |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | game-of-thrones-main-image.jpg            |
    When I go to "/teaser"
    And I should see an "figure.teaser-icon-video" element
    And I should see "For abonnenter" in the ".subscriber-notice" element
