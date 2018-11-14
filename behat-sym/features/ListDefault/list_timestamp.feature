Feature: Show timestamps on default list
  In order to have a possibility to see timestamps on default list block
  As a visitor
  I should see timestamps on default list block

  Scenario: Show timestamp on default list
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_timestamp_1  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | timestamp                                                |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title          | date_created        | type |
      | past_one       | 2016-01-24T22:30:05 | news |
      | future_one     | 07:12:55 +1 day     | news |
      | future_one_24h | 18:55:55 +1 day     | news |
    When I go to "/list_timestamp_1"
    Then I should see the timestamp list of elements:
      | time  | article_title  |
      | 18:55 | future_one_24h |
      | 7:12  | future_one     |
      | 24/1  | past_one       |
