Feature: Show teaser with large image
  In order to have quick understanding of article
  As a visitor
  I should see large teaser

  Scenario: Show large featured teaser, image lazy loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/large_teaser"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".item-teaser.teaser-large.teaser-img-wide.teaser-theme-feature" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_300x300 | lazy      |

  Scenario: Show large teaser, image lazy loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/large_teaser"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".item-teaser.teaser-large.teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |

  Scenario: Show large teaser, image lazy loaded, no cropping
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/large_teaser"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".item-teaser.teaser-large.teaser-img-wide.teaser-theme-feature" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_300x300-noCrop | lazy      |

  Scenario: Show large teaser, image eager loaded
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | Large teaser                                             |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | large                                                    |
      | show_summary      | 1                                                        |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/large_teaser"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".item-teaser.teaser-large.teaser-img-wide.teaser-theme-feature" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_300x300 | eager     |

  Scenario: Show large teaser from node queue
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser_node |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                          |
      | title        | Large teaser                                                   |
      | source       | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit        | 1                                                              |
      | listId       | 1                                                              |
      | template     | large                                                          |
      | show_summary | 1                                                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type | main_image                     | summary         |
      | title1 | /article/title1 | news | game-of-thrones-main-image.jpg | Article summary |
    When I go to "/large_teaser_node"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-large" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |

  Scenario: Show gallery article large teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | image_gallery                  |
      | title       | Gallery article title          |
      | article_url | /article/title2                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/large_teaser"
    And I should see an "figure.teaser-icon-gallery" element

  Scenario: Show video article large teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
    When I go to "/large_teaser"
    And I should see an "figure.teaser-icon-video" element
