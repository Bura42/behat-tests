Feature: Show advertorial list
  In order to read and access advertorial/sponsored articles
  As a visitor
  I should see advertorial list

  Scenario: Show advertorial list
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /list_advertorial_1 |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                          |
      | template   | advertorial                                                    |
      | list_style | numeric                                                        |
      | title      | List title                                                     |
      | source     | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId     | 1                                                              |
      | limit      | 5                                                              |
      | showImage  | 1                                                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type          |
      | title1 | /article/title1 | news          |
      | title2 | /article/title2 | image_gallery |
      | title3 | /article/title3 | video         |
      | title4 | /article/title4 | news          |
      | title5 | /article/title5 | news          |
    When I go to "/list_advertorial_1"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
    And I should see "Sponsoreret indhold" in the ".list-sponsored" element

  Scenario: Show lazy loaded thumbnails on advertorial list
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /list_advertorial_2 |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | template   | advertorial                                              |
      | list_style | timestamp                                                |
      | show_image | 1                                                        |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title  | main_image   | type |
      | title1 | 160x160.jpg  | news |
      | title2 | khaleesi.jpg | news |
    When I go to "/list_advertorial_2"
    Then I should see images with filters:
      | name         | filter      | load_type |
      | 160x160.jpg  | image_80x80 | lazy      |
      | khaleesi.jpg | image_80x80 | lazy      |
    And I should see "Sponsoreret indhold" in the ".list-sponsored" element

  Scenario: Show eager loaded thumbnails on advertorial list
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /list_advertorial_2 |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.list.various_sources" building block exists:
      | option            | value                                                    |
      | title             | List title                                               |
      | template          | advertorial                                              |
      | list_style        | timestamp                                                |
      | show_image        | 1                                                        |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 5                                                        |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And articles exist:
      | title  | main_image   | type |
      | title1 | 160x160.jpg  | news |
      | title2 | khaleesi.jpg | news |
    When I go to "/list_advertorial_2"
    Then I should see images with filters:
      | name         | filter      | load_type |
      | 160x160.jpg  | image_80x80 | eager     |
      | khaleesi.jpg | image_80x80 | eager     |
    And I should see "Sponsoreret indhold" in the ".list-sponsored" element

  Scenario: API response test
    When I request "bm_basic_data.list.various_sources" building block
    Then I should get valid configuration for "bm_basic_data.list.various_sources":
      | optionName |
      | name       |
      | template   |
      | source     |
    And I should get valid common block configuration
