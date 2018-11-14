Feature: Show subscription
  In order to know that article is paid content
  As a visitor
  I should see subscription message

  Scenario: Show news article plus
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /news_plus_list    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value              |
      | type        | news_plus          |
      | title       | news article title |
      | article_url | /article/title2    |
    When I go to "/news_plus_list"
    And I should see "For abonnenter" in the ".list-items__item__notice" element

  Scenario: Show external article plus
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /external_plus_list |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 1                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                     |
      | type         | external_plus             |
      | title        | external article title    |
      | external_url | http://www.aok.dk/example |
    When I go to "/external_plus_list"
    Then I should see an "ul.list-items li a" element with attribute "href" set to "http://www.aok.dk/example"
    And I should see "For abonnenter" in the ".list-items__item__notice" element

  Scenario: Show longRead article plus
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /longread_plus_list |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                  |
      | type        | longread_plus          |
      | title       | longread article title |
      | article_url | /article/title2        |
    When I go to "/longread_plus_list"
    Then I should see "For abonnenter" in the ".list-items__item__notice" element

  Scenario: Show large article plus
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_plus_list   |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value               |
      | type        | large_plus          |
      | title       | large article title |
      | article_url | /article/title2     |
    When I go to "/large_plus_list"
    Then I should see "For abonnenter" in the ".list-items__item__notice" element

  Scenario: Show video article plus
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /video_plus_list   |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 1                                                        |
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
    When I go to "/video_plus_list"
    And I should see "For abonnenter" in the ".list-items__item__notice" element
