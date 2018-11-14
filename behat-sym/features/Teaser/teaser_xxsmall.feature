Feature: Show xxsmall teasers
  In order to be interested in article with extra small
  As a visitor
  I should see xxsmall teaser

  Scenario: Show xxsmall teaser, lazy load images
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xxsmall_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | xxsmall                                                  |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_160x106 | lazy      |
    And I should see "Kate Doe"
    And I should not see "some free text"

  Scenario: Show xxsmall teaser, lazy load images, no cropping
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xxsmall_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | xxsmall                                                  |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title1" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see images with filters:
      | name                           | filter               | load_type |
      | game-of-thrones-main-image.jpg | image_160x106-noCrop | lazy      |
    And I should see "Kate Doe"
    And I should not see "some free text"

  Scenario: Show xxsmall teaser, eager load images
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xxsmall_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | xxsmall                                                  |
      | show_byline       | 1                                                        |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_160x106 | eager     |
    And I should see "Kate Doe"
    And I should not see "some free text"

  Scenario: Show xxsmall teaser with video article
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /xxsmall_teaser_video |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | xxsmall                                                  |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | video                          |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser_video"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_160x106 | lazy      |
    And I should see an "figure.teaser-icon-video" element

  Scenario: Show xxsmall teaser with image gallery article
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /xxsmall_teaser_gallery |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | xxsmall                                                  |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | image_gallery                  |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser_gallery"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see an "figure.teaser-icon-gallery" element

  Scenario: Show xxsmall teaser from node queue
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /xxsmall_teaser_node |
      | title       | Custom page title    |
      | description | Custom description   |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                          |
      | source      | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit       | 1                                                              |
      | listId      | 1                                                              |
      | template    | xxsmall                                                        |
      | show_byline | 1                                                              |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type      | main_image                     | summary         | author_free_text | supertitle      |
      | title1 | /article/title1 | news_plus | game-of-thrones-main-image.jpg | Article summary | some free text   | Some supertitle |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "title1" article
    When I go to "/xxsmall_teaser_node"
    Then I should see "title1"
    And I should not see "Article summary"
    And I should see an ".teaser-img-left.item-teaser.teaser-xxsmall.teaser-img-left-md" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_160x106 | lazy      |
    And I should see "Af Kate Doe og some free text"
    And I should see "For abonnenter" in the ".subscriber-notice" element
