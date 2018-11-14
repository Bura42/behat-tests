Feature: Show default list
  In order to have a possibility to see default list block
  As a visitor
  I should see default list block

  Scenario: Show default list
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_default_1    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title  | type |
      | title1 | news |
      | title2 | news |
      | title3 | news |
      | title4 | news |
      | title5 | news |
    When I go to "/list_default_1"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |

  Scenario: Redirect to article page
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_default_2    |
      | title       | Custom page title  |
      | description | Custom description |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    When I go to "/list_default_2"
    And I click on ".list-items__item a"
    Then I should be on "/article/title1"

  Scenario: Redirect to external article page
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_default_3    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                  |
      | type         | external               |
      | title        | External article title |
      | external_url | /some_external_address |
    When I go to "/list_default_3"
    And I click on ".list-items__item a"
    Then I should be on "/some_external_address"

  Scenario: Show default list with no title
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_default_4    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      |                                                          |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title  | type |
      | title1 | news |
      | title2 | news |
      | title3 | news |
      | title4 | news |
      | title5 | news |
    When I go to "/list_default_4"
    Then I should not see an ".list__title" element
    And I should see the list of elements:
      | title1 |
      | title2 |
      | title3 |
      | title4 |
      | title5 |

  Scenario: API response test
    When I request "bm_basic_data.list.various_sources" building block
    Then I should get valid configuration for "bm_basic_data.list.various_sources":
      | optionName |
      | name       |
      | template   |
      | source     |
    And I should get valid common block configuration

  Scenario: Show default list with gallery article
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list              |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | show_image | 1                                                        |
      | limit      | 5                                                        |
    And blocks are added to page
    And article exist:
      | option     | value         |
      | title      | title_gallery |
      | type       | image_gallery |
      | main_image | khaleesi.jpg  |
    When I go to "/list"
    Then I should see the list of elements:
      | List title    |
      | title_gallery |
    And I should see an "i.bicon-camera" element

  Scenario: Show default list with video articles
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list              |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | show_image | 1                                                        |
      | limit      | 5                                                        |
    And blocks are added to page
    And article exist:
      | option     | value         |
      | title      | title_gallery |
      | type       | video         |
      | main_image | khaleesi.jpg  |
    When I go to "/list"
    Then I should see the list of elements:
      | List title    |
      | title_gallery |
    And I should see an "i.bicon-play-circled" element

  Scenario: Show default list with video plus articles
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list              |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | show_image | 1                                                        |
      | limit      | 5                                                        |
    And blocks are added to page
    And article exist:
      | option     | value         |
      | title      | title_gallery |
      | type       | video_plus    |
      | main_image | khaleesi.jpg  |
    When I go to "/list"
    Then I should see the list of elements:
      | List title    |
      | title_gallery |
    And I should see an "i.bicon-play-circled" element
