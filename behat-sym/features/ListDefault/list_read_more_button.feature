Feature: Read more button
  In order to have a possibility read more articles from list
  As a visitor
  I should see read more button

  Scenario: Show footer link button
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /list_read_more_button_1 |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.list.various_sources" building block exists:
      | option         | value                                                    |
      | title          | List title                                               |
      | list_style     | none                                                     |
      | read_more_text | Read more                                                |
      | read_more_link | http://b.dk/readmore                                     |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 5                                                        |
    And blocks are added to page
    And article exist:
      | option | value  |
      | type   | news   |
      | title  | title1 |
    When I go to "/list_read_more_button_1"
    Then I should see the list of elements:
      | title1     |
      | List title |
      | Read more  |

  Scenario: Don't show link button
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /list_read_more_button_2 |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.list.various_sources" building block exists:
      | option         | value                                                    |
      | title          | List title                                               |
      | list_style     | none                                                     |
      | read_more_text | Read more                                                |
      | read_more_link |                                                          |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 5                                                        |
    And blocks are added to page
    And article exist:
      | option | value  |
      | type   | news   |
      | title  | title1 |
    When I go to "/list_read_more_button_2"
    Then I should see the list of elements:
      | title1     |
      | List title |
    And I should not see "Read more"

  Scenario: Redirect to footer link
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /list_read_more_button_3 |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.list.various_sources" building block exists:
      | option         | value                                                    |
      | title          | List title                                               |
      | list_style     | none                                                     |
      | read_more_text | Read more                                                |
      | read_more_link | /some_link                                               |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 5                                                        |
    And blocks are added to page
    And article exist:
      | option | value  |
      | type   | news   |
      | title  | title1 |
    When I go to "/list_read_more_button_3"
    And I click on parent ".list__button--read-more"
    Then I should be on "/some_link"
