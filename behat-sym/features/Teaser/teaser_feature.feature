Feature: Show featured teaser
  In order to see featured articles
  As a visitor
  I should see small teaser

  Scenario: Show small featured teaser
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /small_teaser_featured |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Artikel > Rundt teaser billede |
      | name      | www.b.dk > Artikel > Rundt teaser billede |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/small_teaser_featured"
    And I should see an ".teaser-theme-feature.teaser-small" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_300x300 | lazy      |

  Scenario: Don't show small teaser as featured without featured presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                      |
      | url         | /small_teaser_not_featured |
      | title       | Custom page title          |
      | description | Custom description         |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | large                                                    |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_not_featured"
    And I should not see an ".teaser-theme-feature.teaser-large" element
