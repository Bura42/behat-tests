Feature: Show lists additional classes
  In order to see list in different styling
  As a visitor
  I should see styled list

  Scenario: Show additional default list classes
    Given "custom_page" site manager page exists:
      | option      | value                      |
      | url         | /default_list_with_classes |
      | title       | Custom page title          |
      | description | Custom description         |
    And "bm_basic_data.list.various_sources" building block exists:
      | option       | value                                                    |
      | title        | List title                                               |
      | list_style   | none                                                     |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 5                                                        |
      | list_classes | list-additional-class                                    |
    And blocks are added to page
    And articles exist:
      | title  | type |
      | title1 | news |
      | title2 | news |
      | title3 | news |
      | title4 | news |
      | title5 | news |
    When I go to "/default_list_with_classes"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
    And I should see an "section.list-additional-class" element

  Scenario: Show additional blog list classes
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /blog_list_with_classes |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.list.various_sources" building block exists:
      | option    | value                                                          |
      | template  | blog                                                           |
      | title     | List title                                                     |
      | source    | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId    | 1                                                              |
      | limit     | 5                                                              |
      | showImage | 1                                                              |
      | list_classes | list-blog-additional-class                                  |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | author_name | author_image                             | type | author_email        |
      | title1 | /article/title1 | John        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title2 | /article/title2 | Adam        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title3 | /article/title3 | Luke        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title4 | /article/title4 | Tom         | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title5 | /article/title5 | Stark       | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
    When I go to "/blog_list_with_classes"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
    And I should see an "section.list-blog-additional-class" element

  Scenario: Show additional advertorial list classes
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /list_advertorial_with_classes |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.list.various_sources" building block exists:
      | option       | value                                                          |
      | template     | advertorial                                                    |
      | list_style   | numeric                                                        |
      | title        | List title                                                     |
      | source       | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId       | 1                                                              |
      | limit        | 5                                                              |
      | showImage    | 1                                                              |
      | list_classes | list-advertorial-additional-class                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type          |
      | title1 | /article/title1 | news          |
      | title2 | /article/title2 | image_gallery |
      | title3 | /article/title3 | video         |
      | title4 | /article/title4 | news          |
      | title5 | /article/title5 | news          |
    When I go to "/list_advertorial_with_classes"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
    And I should see an "section.list-advertorial-additional-class" element
    And I should see "Sponsoreret indhold" in the ".list-sponsored" element
