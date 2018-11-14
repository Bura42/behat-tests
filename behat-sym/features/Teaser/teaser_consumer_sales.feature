Feature: Show consumer sales teaser
  In order to be able to see consumer sales items
  As a visitor
  I should see consumer sales articles

  Scenario: Show consumer sales teaser, image lazy loaded
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /consumer_sales_teaser |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Consumer sales teaser                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | consumer_sales                                           |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Only 2000E per week!           |
    When I go to "/consumer_sales_teaser"
    Then I should see "title1"
    Then I should see "Only 2000E per week!"
    And I should see an ".teaser-consumersales.item-taser" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_538x538 | lazy      |

  Scenario: Show consumer sales teaser, image lazy loaded, no cropping
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /consumer_sales_teaser |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Consumer sales teaser                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | consumer_sales                                           |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Only 2000E per week!           |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    When I go to "/consumer_sales_teaser"
    Then I should see "title1"
    Then I should see "Only 2000E per week!"
    And I should see an ".teaser-consumersales.item-taser" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_538x538-noCrop | lazy      |

  Scenario: Show consumer sales teaser, image eager loaded
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /consumer_sales_teaser |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | Consumer sales teaser                                    |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | consumer_sales                                           |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Only 2000E per week!           |
    When I go to "/consumer_sales_teaser"
    Then I should see "title1"
    Then I should see "Only 2000E per week!"
    And I should see an ".teaser-consumersales.item-taser" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_538x538 | eager     |

  Scenario: Show consumer sales teaser from node queue
    Given "custom_page" site manager page exists:
      | option      | value                       |
      | url         | /consumer_sales_teaser_node |
      | title       | Custom page title           |
      | description | Custom description          |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                          |
      | title    | Consumer sales teaser node                                     |
      | source   | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit    | 1                                                              |
      | listId   | 1                                                              |
      | template | consumer_sales                                                 |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type | main_image                     | summary         | supertitle           |
      | title1 | /article/title1 | news | game-of-thrones-main-image.jpg | Article summary | Only 2000E per week! |
    When I go to "/consumer_sales_teaser_node"
    Then I should see "title1"
    Then I should see "Only 2000E per week!"
    And I should see an ".teaser-consumersales.item-taser" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_538x538 | lazy      |
