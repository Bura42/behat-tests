Feature: Show teaser with small image
  In order to have quick understanding of article
  As a visitor
  I should see small teaser

  Scenario: Show small teaser with lazy loaded image on the left
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_left |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_left"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |

  Scenario: Show small teaser with lazy loaded image on the left, no cropping
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_left |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    When I go to "/small_teaser_left"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_320x180-noCrop | lazy      |

  Scenario: Show small teaser with eager loaded image on the left
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_left |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | Small teaser                                             |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | small                                                    |
      | image_position    | left                                                     |
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
    When I go to "/small_teaser_left"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | eager     |

  Scenario: Show small teaser with image on the right
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /small_teaser_right |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | right                                                    |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_right"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |

  Scenario: Show small teaser with wide image
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_wide |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_wide"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |

  Scenario: Show small teaser with wide image, no cropping
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_wide |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    When I go to "/small_teaser_wide"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_910x511-noCrop | lazy      |

  Scenario: Show small teaser with wide image and giant presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /small_teaser_wide_giant |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | title           | Small teaser                                             |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 1                                                        |
      | template        | small                                                    |
      | image_position  | wide                                                     |
      | show_summary    | 0                                                        |
      | numberOfColumns | 6                                                        |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type      | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news_plus | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news      | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news      | supertitle article 3 | summary3 | 2015-01-02   |
    And author exist:
      | option       | value                   |
      | author_name  | William Shakespeare     |
      | author_email | william@shakespeare.com |
    And "William Shakespeare" is author of "title1" article
    And tags exist:
      | name                                   | full_name                              | type         |
      | www.b.dk > Forside > Giant             | www.b.dk > Forside > Giant             | presentation |
      | www.b.dk > Teaser > Vis byline         | www.b.dk > Teaser > Vis byline         | presentation |
      | www.b.dk > Forside > Badges > Breaking | www.b.dk > Forside > Badges > Breaking | presentation |
    And article "title1" has tag "www.b.dk > Forside > Giant"
    And article "title1" has tag "www.b.dk > Teaser > Vis byline"
    And article "title1" has tag "www.b.dk > Forside > Badges > Breaking"
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I go to "/small_teaser_wide_giant"
    Then I should see "title1"
    And I should not see "summary1"
    And I should see an ".teaser-small.teaser-theme-giant.teaser-img-wide" element
    And I should see "For abonnenter" in the ".subscriber-notice" element
    And I should see "Breaking" in the ".article-header__event-header--yellow" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
    And I should not see "title2"
    And I should not see "title3"

  Scenario: Show gallery article small teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | image_gallery                  |
      | title       | Gallery article title          |
      | article_url | /article/title2                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser"
    And I should see an "figure.teaser-icon-gallery" element

  Scenario: Show video article small teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
    When I go to "/small_teaser"
    And I should see an "figure.teaser-icon-video" element

  Scenario: Show small teaser with lazy loaded external image on the left
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser_left |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                                                |
      | type        | news                                                 |
      | title       | title1                                               |
      | summary     | Article summary                                      |
      | article_url | /article/title1                                      |
      | main_image  | http://behat.bdk.dev:8080/images/demo/image_1240.jpg |
    When I go to "/small_teaser_left"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                                                 | filter               | load_type |
      | http://behat.bdk.dev:8080/images/demo/image_1240.jpg | remote_image_320x180 | lazy      |
