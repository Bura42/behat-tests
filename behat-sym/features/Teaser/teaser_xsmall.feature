Feature: Show teaser with xsmall image
  In order to have quick understanding of article
  As a visitor
  I should see xsmall teaser

  Scenario: Show xsmall teaser with lazy loaded image on the left
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /xsmall_teaser_left |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser_left"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | lazy      |

  Scenario: Show xsmall teaser with eager loaded image on the left
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /xsmall_teaser_left |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | Xsmall teaser                                            |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | xsmall                                                   |
      | image_position    | left                                                     |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser_left"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | eager     |

  Scenario: Show xsmall teaser with image on the right
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /xsmall_teaser_right |
      | title       | Custom page title    |
      | description | Custom description   |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser_right"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | lazy      |

  Scenario: Show xsmall teaser with wide image
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /xsmall_teaser_wide |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser_wide"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_750x421 | lazy      |

  Scenario: Show xsmall teaser with wide image, no cropping
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /xsmall_teaser_wide |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | wide                                                     |
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
    When I go to "/xsmall_teaser_wide"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_750x421-noCrop | lazy      |

  Scenario: Show xsmall teaser with wide image and giant presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /xsmall_teaser_wide_giant |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | wide                                                     |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type      | supertitle           | summary  |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news      | supertitle article 1 | summary1 |
      | title2 | /article/title2 | khaleesi.jpg                   | news      | supertitle article 2 | summary2 |
      | title3 | /article/title3 | 160x160.jpg                    | news      | supertitle article 3 | summary3 |
    And author exist:
      | option       | value                   |
      | author_name  | William Shakespeare     |
      | author_email | william@shakespeare.com |
    And "William Shakespeare" is author of "title1" article
    And tags exist:
      | name                                    | full_name                               | type         |
      | www.b.dk > Forside > Giant              | www.b.dk > Forside > Giant              | presentation |
      | www.b.dk > Teaser > Vis byline          | www.b.dk > Teaser > Vis byline          | presentation |
      | www.b.dk > Forside > Badges > Breaking  | www.b.dk > Forside > Badges > Breaking  | presentation |
    And article "title1" has tag "www.b.dk > Forside > Giant"
    And article "title1" has tag "www.b.dk > Teaser > Vis byline"
    And article "title1" has tag "www.b.dk > Forside > Badges > Breaking"
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I go to "/xsmall_teaser_wide_giant"
    Then I should see "title1"
    And I should not see "summary1"
    And I should see an ".teaser-xsmall.teaser-theme-giant.teaser-img-wide" element
    And I should see "Breaking" in the ".article-header__event-header--yellow" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_750x421 | lazy      |
    And I should not see "title2"
    And I should not see "title3"

  Scenario: Show gallery article xsmall teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xsmall_teaser     |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | image_gallery                  |
      | title       | Gallery article title          |
      | article_url | /article/title2                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser"
    And I should see an "figure.teaser-icon-gallery" element

  Scenario: Show video article xsmall teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xsmall_teaser     |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | video article title                       |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | game-of-thrones-main-image.jpg            |
    When I go to "/xsmall_teaser"
    And I should see an "figure.teaser-icon-video" element
