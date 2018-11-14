Feature: Load more items
  In order to have a possibility to load more items to list
  As a visitor
  I should see load more button

  Scenario: Show load more button
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_load_more_1  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option          | value                                                    |
      | title           | List title                                               |
      | list_style      | none                                                     |
      | load_more_limit | 5                                                        |
      | load_more_text  | Load more                                                |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title   | date_created | type |
      | title1  | 2016-05-10   | news |
      | title2  | 2016-05-09   | news |
      | title3  | 2016-05-08   | news |
      | title4  | 2016-05-07   | news |
      | title5  | 2016-05-06   | news |
      | title6  | 2016-05-05   | news |
      | title7  | 2016-05-04   | news |
      | title8  | 2016-05-03   | news |
      | title9  | 2016-05-02   | news |
      | title10 | 2016-05-01   | news |
    When I go to "/list_load_more_1"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
      | Load more  |
    And I should not see the list of elements:
      | title6  |
      | title7  |
      | title8  |
      | title9  |
      | title10 |

  Scenario: Do not show load more button
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_load_more_2  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option          | value                                                    |
      | title           | List title                                               |
      | list_style      | none                                                     |
      | load_more_limit | 0                                                        |
      | load_more_text  | Load more                                                |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title   | date_created | type |
      | title1  | 2016-05-10   | news |
      | title2  | 2016-05-09   | news |
      | title3  | 2016-05-08   | news |
      | title4  | 2016-05-07   | news |
      | title5  | 2016-05-06   | news |
      | title6  | 2016-05-05   | news |
      | title7  | 2016-05-04   | news |
      | title8  | 2016-05-03   | news |
      | title9  | 2016-05-02   | news |
      | title10 | 2016-05-01   | news |
    When I go to "/list_load_more_2"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
    And I should not see the list of elements:
      | Load more |
      | title6    |
      | title7    |
      | title8    |
      | title9    |
      | title10   |

  @javascript
  Scenario: Load more items
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_load_more_3  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option                | value                                                    |
      | title                 | List title                                               |
      | list_style            | none                                                     |
      | load_more_limit       | 5                                                        |
      | load_more_text        | Load more                                                |
      | source                | bm_basic_data.data_provider.content_by_criteria_provider |
      | show_comments_counter | 1                                                        |
      | limit                 | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title   | date_created | type |
      | title1  | 2016-05-10   | news |
      | title2  | 2016-05-09   | news |
      | title3  | 2016-05-08   | news |
      | title4  | 2016-05-07   | news |
      | title5  | 2016-05-06   | news |
      | title6  | 2016-05-05   | news |
      | title7  | 2016-05-04   | news |
      | title8  | 2016-05-03   | news |
      | title9  | 2016-05-02   | news |
      | title10 | 2016-05-01   | news |
      | title11 | 2016-04-01   | news |
    When I go to "/list_load_more_3"
    And I wait for page to be loaded
    And I click on "button.loadMore"
    Then I wait for more items to be loaded
    And I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
      | title6     |
      | title7     |
      | title8     |
      | title9     |
      | title10    |
      | Load more  |
    And I should not see an "title11" element
    And I click on "button.loadMore"
    Then I wait for more items to be loaded
    And I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
      | title6     |
      | title7     |
      | title8     |
      | title9     |
      | title10    |
      | title11    |
    And I should not see an "Load more" element
    And an element ".list__button--load-more" should not be visible

