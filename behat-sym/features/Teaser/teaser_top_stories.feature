Feature: Show top stories
  In order to be informed about most important events
  As a visitor
  I should see top stories

  Scenario: Show top stories
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /top_stories       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                          |
      | title             | Tophistorier                                                   |
      | source            | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit             | 8                                                              |
      | template          | xsmall                                                         |
      | listId            | 1                                                              |
      | image_position    | wide                                                           |
      | number_of_columns | 4                                                              |
      | border_position   | bottom                                                         |
    And blocks are added to page
    And articles exist in list:
      | title                                                              | article_url     | main_image      | type | supertitle           | summary  | date_created |
      | Some short title                                                   | /article/title1 | 160x160.jpg     | news | supertitle article 1 | summary1 | 2016-01-01   |
      | Some title that is not that short                                  | /article/title2 | 160x160.jpg     | news | supertitle article 2 | summary2 | 2016-01-01   |
      | Some title that is really really long - really long I say. Thanks. | /article/title3 | hat_750x421.jpg | news | supertitle article 3 | summary3 | 2016-01-02   |
      | title4                                                             | /article/title4 | hat_750x421.jpg | news | supertitle article 4 | summary4 | 2016-01-03   |
      | title5                                                             | /article/title5 | 160x160.jpg     | news | supertitle article 5 | summary5 | 2016-01-04   |
      | title6                                                             | /article/title6 | 160x160.jpg     | news | supertitle article 6 | summary6 | 2016-01-04   |
      | title7                                                             | /article/title7 | hat_750x421.jpg | news | supertitle article 7 | summary7 | 2016-01-04   |
      | title8                                                             | /article/title8 | 160x160.jpg     | news | supertitle article 8 | summary8 | 2016-01-04   |
      | title9                                                             | /article/title9 | 160x160.jpg     | news | supertitle article 9 | summary9 | 2015-01-04   |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Artikel > Rundt teaser billede |
      | name      | www.b.dk > Artikel > Rundt teaser billede |
    And article "title4" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "title5" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/top_stories"
    Then I should see "TOPHISTORIER" in the ".list__title" element
    And I should see an ".flex-row" element
    And I should see an ".col-xs-6.col-sm-6.col-md-3.col-lg-3.col-xl-3" element
    And I should see the list of elements:
      | Some short title                                                   |
      | Some title that is not that short                                  |
      | Some title that is really really long - really long I say. Thanks. |
      | title4                                                             |
      | title5                                                             |
      | title6                                                             |
      | title7                                                             |
      | title8                                                             |
    And I should not see "title9"
    And I should see images with filters:
      | name        | filter        | load_type |
      | 160x160.jpg | image_750x421 | lazy      |

  @javascript
  Scenario: Load more stories
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /top_stories_load_more |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                          |
      | title             | Tophistorier                                                   |
      | source            | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit             | 8                                                              |
      | template          | xsmall                                                         |
      | listId            | 1                                                              |
      | image_position    | wide                                                           |
      | number_of_columns | 4                                                              |
      | load_more_limit   | 4                                                              |
    And blocks are added to page
    And articles exist in list:
      | title                                                              | article_url      | main_image  | type | supertitle            | summary  | date_created |
      | Some short title                                                   | /article/title1  | 160x160.jpg | news | supertitle article 1  | summary1 | 2016-01-01   |
      | Some title that is not that short                                  | /article/title2  | 160x160.jpg | news | supertitle article 2  | summary2 | 2016-01-01   |
      | Some title that is really really long - really long I say. Thanks. | /article/title3  | 160x160.jpg | news | supertitle article 3  | summary3 | 2016-01-02   |
      | title4                                                             | /article/title4  | 160x160.jpg | news | supertitle article 4  | summary4 | 2016-01-03   |
      | title5                                                             | /article/title5  | 160x160.jpg | news | supertitle article 5  | summary5 | 2016-01-04   |
      | title6                                                             | /article/title6  | 160x160.jpg | news | supertitle article 6  | summary6 | 2016-01-04   |
      | title7                                                             | /article/title7  | 160x160.jpg | news | supertitle article 7  | summary7 | 2016-01-04   |
      | title8                                                             | /article/title8  | 160x160.jpg | news | supertitle article 8  | summary8 | 2016-01-04   |
      | title9                                                             | /article/title9  | 160x160.jpg | news | supertitle article 9  | summary9 | 2015-01-04   |
      | title10                                                            | /article/title10 | 160x160.jpg | news | supertitle article 10 | summary9 | 2015-01-04   |
      | title11                                                            | /article/title11 | 160x160.jpg | news | supertitle article 11 | summary9 | 2015-01-04   |
      | title12                                                            | /article/title12 | 160x160.jpg | news | supertitle article 12 | summary9 | 2015-01-04   |
    When I go to "/top_stories_load_more"
    And I wait for page to be loaded
    And I click on "button.loadMore"
    And I should see the list of elements:
      | Some short title                                                   |
      | Some title that is not that short                                  |
      | Some title that is really really long - really long I say. Thanks. |
      | title4                                                             |
      | title5                                                             |
      | title6                                                             |
      | title7                                                             |
      | title8                                                             |
      | title9                                                             |
      | title10                                                            |
      | title11                                                            |
      | title12                                                            |
    And I should not see an "Load more" element
    And an element ".list__button--load-more" should not be visible

  Scenario: Show top stories on news page
    Given "news" article page exists
    And article exist:
      | option      | value            |
      | title       | Some short title |
      | article_url | /article/title1  |
      | body        | article body     |
      | type        | news             |
    And articles exist in list with nodeId "210" and name "topstories":
      | title  | article_url     | type | main_image  |
      | title2 | /article/title2 | news | 160x160.jpg |
      | title3 | /article/title3 | news | 160x160.jpg |
      | title4 | /article/title4 | news | 160x160.jpg |
      | title5 | /article/title5 | news | 160x160.jpg |
      | title6 | /article/title6 | news | 160x160.jpg |
      | title7 | /article/title7 | news | 160x160.jpg |
    When I go to "/article/title1"
    Then I should see "TOPHISTORIER" in the ".list__title" element
    And I should see an ".row .flex-row" element
    And I should see an ".col-xs-6.col-sm-6.col-md-3.col-lg-3.col-xl-3" element
    And I should see an ".teaser--border-top" element
    And I should see the list of elements:
      | Some short title |
      | title2           |
      | title3           |
      | title4           |
      | title5           |
      | title6           |
      | title7           |
    And I should see images with filters:
      | name        | filter        | load_type |
      | 160x160.jpg |  image_750x421 | lazy      |

  Scenario: Show top stories on longRead page
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | title       | Some short title               |
      | article_url | /article/title1                |
      | body        | article body                   |
      | main_image  | game-of-thrones-main-image.jpg |
      | type        | longread                       |
    And articles exist in list with nodeId "210" and name "topstories":
      | title  | article_url     | type | main_image  |
      | title2 | /article/title2 | news | 160x160.jpg |
      | title3 | /article/title3 | news | 160x160.jpg |
      | title4 | /article/title4 | news | 160x160.jpg |
      | title5 | /article/title5 | news | 160x160.jpg |
      | title6 | /article/title6 | news | 160x160.jpg |
      | title7 | /article/title7 | news | 160x160.jpg |
    When I go to "/article/title1"
    Then I should see "TOPHISTORIER" in the ".list__title" element
    And I should see an ".row .flex-row" element
    And I should see an ".col-xs-6.col-sm-6.col-md-3.col-lg-3.col-xl-3" element
    And I should see the list of elements:
      | Some short title |
      | title2           |
      | title3           |
      | title4           |
      | title5           |
      | title6           |
      | title7           |
    And I should see images with filters:
      | name        | filter        | load_type |
      | 160x160.jpg | image_750x421 | lazy      |
