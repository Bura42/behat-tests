Feature: Show cartoon teaser
  In order to be able to see teasers in funny way
  As a visitor
  I should see cartoon teasers

  Scenario: Show cartoon teaser, image lazy loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /cartoon_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | cartoon teaser                                           |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | cartoon                                                  |
      | number_of_columns | 3                                                        |
      | button_label      | Læs hele striben                                         |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/cartoon_teaser"
    Then I should see "title1"
    And I should see "Læs hele striben"
    And I should see an ".teaser-theme-cartoon.item-teaser.teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |

  Scenario: Show cartoon teaser, image lazy loaded, no cropping
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /cartoon_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | cartoon teaser                                           |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | cartoon                                                  |
      | number_of_columns | 3                                                        |
      | button_label      | Læs hele striben                                         |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    When I go to "/cartoon_teaser"
    Then I should see "title1"
    And I should see "Læs hele striben"
    And I should see an ".teaser-theme-cartoon.item-teaser.teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_910x511-noCrop | lazy      |

  Scenario: Show cartoon teaser, image eager loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /cartoon_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | cartoon teaser                                           |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | cartoon                                                  |
      | number_of_columns | 3                                                        |
      | button_label      | Læs hele striben                                         |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/cartoon_teaser"
    Then I should see "title1"
    And I should see "Læs hele striben"
    And I should see an ".teaser-theme-cartoon.item-teaser.teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | eager     |

  Scenario: Show cartoon teaser from node queue
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /cartoon_teaser_node |
      | title       | Custom page title    |
      | description | Custom description   |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                          |
      | title             | cartoon teaser node                                            |
      | source            | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit             | 1                                                              |
      | listId            | 1                                                              |
      | template          | cartoon                                                        |
      | number_of_columns | 3                                                              |
      | button_label      | Read more!                                                     |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type | main_image                     | summary         |
      | title1 | /article/title1 | news | game-of-thrones-main-image.jpg | Article summary |
    When I go to "/cartoon_teaser_node"
    Then I should see "title1"
    And I should see "Read more!"
    And I should see an ".teaser-theme-cartoon.item-teaser.teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
