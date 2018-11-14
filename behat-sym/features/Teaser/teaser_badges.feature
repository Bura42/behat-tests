Feature: Teaser badges
  In order to see specific article subject
  As a visitor
  I want to see header badge on teaser

  Scenario: Show large teaser with "Breaking news" badge
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /large_teaser_badge |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And article "title1" has tag "www.b.dk > Forside > Badges > Breaking"
    When I go to "/large_teaser_badge"
    Then I should see "title1"
    And I should see an ".teaser-large" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
    And I should see an ".article-header__event-header--yellow" element
    And I should see "Breaking" in the ".article-header__event-header--yellow" element
    And I should not see "Breaking news" in the ".article-header__event-header--yellow" element

  Scenario: Show small teaser with "Opdateres" badge
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /small_teaser_badge |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | wide                                                     |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                   |
      | type      | presentation                            |
      | full_name | www.b.dk > Forside > Badges > Opdateres |
      | name      | www.b.dk > Forside > Badges > Opdateres |
    And article "title1" has tag "www.b.dk > Forside > Badges > Opdateres"
    When I go to "/small_teaser_badge"
    Then I should see "title1"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
    And I should see an ".article-header__event-header--red" element
    And I should see "Opdateres" in the ".article-header__event-header--red" element

  Scenario: Show xsmall teaser with "Lige nu" badge
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /xsmall_teaser_badge |
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
      | type        | large                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                 |
      | type      | presentation                          |
      | full_name | www.b.dk > Forside > Badges > Lige nu |
      | name      | www.b.dk > Forside > Badges > Lige nu |
    And article "title1" has tag "www.b.dk > Forside > Badges > Lige nu"
    When I go to "/xsmall_teaser_badge"
    Then I should see "title1"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | lazy      |
    And I should see an ".article-header__event-header--red" element
    And I should see "Lige nu" in the ".article-header__event-header--red" element

  Scenario: Show xsmall teaser with "Live" badge
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /xsmall_teaser_badge_1 |
      | title       | Custom page title      |
      | description | Custom description     |
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
      | type        | video                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Forside > Badges > Live |
      | name      | www.b.dk > Forside > Badges > Live |
    And article "title1" has tag "www.b.dk > Forside > Badges > Live"
    When I go to "/xsmall_teaser_badge_1"
    Then I should see "title1"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | lazy      |
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element

  Scenario: Show small teaser with "Tophistorie" badge
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /small_teaser_badge_1 |
      | title       | Custom page title     |
      | description | Custom description    |
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
      | type        | large                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Forside > Badges > Tophistorie |
      | name      | www.b.dk > Forside > Badges > Tophistorie |
    And article "title1" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/small_teaser_badge_1"
    Then I should see "title1"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element

  Scenario: Show large teaser with "Nyhed på vej" badge
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /large_teaser_badge_1 |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                          |
      | title    | Large teaser                                                   |
      | source   | bm_basic_data.data_provider.content_from_ordered_list_provider |
      | limit    | 1                                                              |
      | listId   | 1                                                              |
      | template | large                                                          |
    And blocks are added to page
    And articles exist in list:
      | title  | article_url     | type | main_image                     |
      | title1 | /article/title1 | news | game-of-thrones-main-image.jpg |
    And tag exist:
      | option    | value                                      |
      | type      | presentation                               |
      | full_name | www.b.dk > Forside > Badges > Nyhed på vej |
      | name      | www.b.dk > Forside > Badges > Nyhed på vej |
    And article "title1" has tag "www.b.dk > Forside > Badges > Nyhed på vej"
    When I go to "/large_teaser_badge_1"
    Then I should see "title1"
    And I should see an ".teaser-large" element
    And I should see an ".teaser-img-wide" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
    And I should see an ".article-header__event-header--red" element
    And I should see "Nyhed på vej" in the ".article-header__event-header--red" element

  Scenario: Show small teaser without any badges
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /small_teaser_no_badge |
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
      | type        | large                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser_no_badge"
    Then I should see "title1"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |
    And I should not see an ".article-header__event-header--red" element
    And I should not see an ".article-header__event-header--yellow" element
    And I should not see an ".article-header__event-header--blue" element
    And I should not see an ".article-header__event-header--live" element

  Scenario: Show small teaser with "Tophistorie" badge and 'www.b.dk > Benyt forrider i badge' presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /small_teaser_badge_2 |
      | title       | Custom page title     |
      | description | Custom description    |
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
      | type        | large                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | SuuuuuperTitle!                |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Forside > Badges > Tophistorie |
      | name      | www.b.dk > Forside > Badges > Tophistorie |
    And tag exist:
      | option    | value                             |
      | type      | presentation                      |
      | full_name | www.b.dk > Benyt forrider i badge |
      | name      | www.b.dk > Benyt forrider i badge |
    And article "title1" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title1" has tag "www.b.dk > Benyt forrider i badge"
    When I go to "/small_teaser_badge_2"
    Then I should see "title1"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-right" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |
    And I should see an ".article-header__event-header--blue" element
    And I should not see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "SuuuuuperTitle!" in the ".article-header__event-header--blue" element
    And I should not see an "span.teaser-trumpet" element

  Scenario: Show xsmall teaser with "Live" badge and 'www.b.dk > Benyt forrider i badge' presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /xsmall_teaser_badge_2 |
      | title       | Custom page title      |
      | description | Custom description     |
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
      | type        | video                          |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | SuuuuuperTitle!                |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Forside > Badges > Live |
      | name      | www.b.dk > Forside > Badges > Live |
    And tag exist:
      | option    | value                             |
      | type      | presentation                      |
      | full_name | www.b.dk > Benyt forrider i badge |
      | name      | www.b.dk > Benyt forrider i badge |
    And article "title1" has tag "www.b.dk > Forside > Badges > Live"
    And article "title1" has tag "www.b.dk > Benyt forrider i badge"
    When I go to "/xsmall_teaser_badge_2"
    Then I should see "title1"
    And I should see an ".teaser-xsmall" element
    And I should see an ".teaser-img-left" element
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_100x100 | lazy      |
    And I should see an ".article-header__event-header--live" element
    And I should see "SuuuuuperTitle!" in the ".article-header__event-header--live" element
    And I should not see "Live" in the ".article-header__event-header--live" element
    And I should not see an "span.teaser-trumpet" element

  Scenario: Show large teaser with "Breaking news" badge and without image
    Given "custom_page" site manager page exists:
      | option      | value                        |
      | url         | /large_teaser_badge_no_image |
      | title       | Custom page title            |
      | description | Custom description           |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | main_image  |                 |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And article "title1" has tag "www.b.dk > Forside > Badges > Breaking"
    When I go to "/large_teaser_badge_no_image"
    Then I should see "title1"
    And I should see an ".teaser-large" element
    And I should see an ".teaser-img-wide" element
    And I should not see "img" in the ".teaser-img" element
    And I should see an ".article-header__event-header--yellow" element
    And I should see "Breaking" in the ".article-header__event-header--yellow" element
