Feature: Show blog list
  In order to read and access blog articles
  As a visitor
  I should see blog list

  Scenario: Show blog list with images being lazy loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_blog_1       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option    | value                                                          |
      | template  | blog                                                           |
      | title     | List title                                                     |
      | source    | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId    | 1                                                              |
      | limit     | 5                                                              |
      | showImage | 1                                                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | author_name | author_image                             | type | author_email        |
      | title1 | /article/title1 | John        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title2 | /article/title2 | Adam        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title3 | /article/title3 | Luke        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title4 | /article/title4 | Tom         | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
      | title5 | /article/title5 | Stark       | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
    When I go to "/list_blog_1"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | title2     |
      | title3     |
      | title4     |
      | title5     |
      | John       |
      | Adam       |
      | Luke       |
      | Tom        |
      | Stark      |
    And I should see images with filters:
      | name           | filter | load_type |
      | user-61-96.png |        | lazy      |

  Scenario: Show blog list with images being eager loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_blog_1       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option            | value                                                          |
      | template          | blog                                                           |
      | title             | List title                                                     |
      | source            | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId            | 1                                                              |
      | limit             | 5                                                              |
      | showImage         | 1                                                              |
      | disable_lazy_load | 1                                                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | author_name | author_image                             | type | author_email        |
      | title1 | /article/title1 | John        | http://blogs.bt.dk/avatar/user-61-96.png | news | test@berlingske.com |
    When I go to "/list_blog_1"
    Then I should see the list of elements:
      | List title |
      | title1     |
      | John       |
    And I should see images with filters:
      | name           | filter | load_type |
      | user-61-96.png |        | eager     |

  Scenario: Redirect to blog post page
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_blog_2       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option             | value                                                          |
      | template           | blog                                                           |
      | title              | List title                                                     |
      | source             | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | listId             | 1                                                              |
      | limit              | 5                                                              |
      | showImage          | true                                                           |
      | showCommentCounter | false                                                          |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | author_name | author_image   | type | author_email        |
      | title1 | /article/title1 | John        | img1_80x80.png | news | test@berlingske.com |
    When I go to "/list_blog_2"
    And I click on ".list-items__item a"
    Then I should be on "/article/title1"
