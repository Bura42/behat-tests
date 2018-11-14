Feature: Show toplist
  In order to have a possibility to see toplist block
  As a visitor
  I should see toplist block

  Scenario: Show toplist
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_toplist_1    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | numeric                                                  |
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
    When I go to "/list_toplist_1"
    Then I should see the list of elements:
      | title1 |
      | title2 |
      | title3 |
      | title4 |
      | title5 |
