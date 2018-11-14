Feature: Teaser authors byline
  In order to know teasers authors
  As a visitor
  I want to see article authors byline

  Scenario: Don't show author by default
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_no_author  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 0                                                        |
    And blocks are added to page
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_no_author"
    Then I should not see "some free text"
    And I should not see "Kate Doe"

  Scenario: Show only freetext byline if author is not set
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /teaser_author_freetext |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    When I go to "/teaser_author_freetext"
    Then I should see "Af some free text"

  Scenario: Show author byline, no freetext
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_two_authors |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_two_authors"
    Then I should see the list of elements:
      | Af Kate Doe |

  Scenario: Show regular author byline with two authors, no freetext
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_two_authors |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@test.com                            |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    When I go to "/teaser_two_authors"
    Then I should see the list of elements:
      | Af Kate Doe og Who Cares |

  Scenario: Show author byline with two authors and freetext (no comma at beginning)
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_two_authors |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@test.com                            |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    When I go to "/teaser_two_authors"
    Then I should see the list of elements:
      | Af Kate Doe, Who Cares og some free text |

  Scenario: Show author byline with two authors and freetext (with comma at beginning)
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_two_authors |
      | title       | Custom page title   |
      | description | Custom description  |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option           | value             |
      | type             | news              |
      | title            | Article title     |
      | article_url      | /article/title1   |
      | body             | article body      |
      | author_free_text | , i'm with comma! |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@test.com                            |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    When I go to "/teaser_two_authors"
    Then I should see the list of elements:
      | Af Kate Doe og Who Cares, i'm with comma! |

  Scenario: Show regular author byline with three authors
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_three_authors |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And author exist:
      | option       | value          |
      | author_name  | Luke Woo       |
      | author_email | tes1t@test.com |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@test.com                            |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    And "Luke Woo" is author of "Article title" article
    When I go to "/teaser_three_authors"
    Then I should see the list of elements:
      | Af Kate Doe, Who Cares og Luke Woo |

  Scenario: Dont show author if it is not set
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_no_author  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    When I go to "/teaser_no_author"
    Then I should see an ".teaser-author:empty" element

  Scenario: Show author based on presentation tag
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_author_by_tag |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | title       | Large teaser                                             |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 1                                                        |
      | template    | large                                                    |
      | show_byline | 0                                                        |
    And blocks are added to page
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And tags exist:
      | name                           | full_name                      | type         |
      | www.b.dk > Teaser > Vis byline | www.b.dk > Teaser > Vis byline | presentation |
    And article "Article title" has tag "www.b.dk > Teaser > Vis byline"
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_author_by_tag"
    Then I should see "some free text"

  Scenario: Show regular author byline for teaser small
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /teaser_author_small |
      | title       | Custom page title    |
      | description | Custom description   |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | show_byline    | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_author_small"
    Then I should see "Kate Doe"

  Scenario: Show regular author byline for teaser xsmall
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_author_xsmall |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | xsmall teaser                                            |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | show_byline    | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_author_xsmall"
    Then I should see "Kate Doe"

  Scenario: Show regular author byline for teaser xxsmall
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /teaser_author_xxsmall |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xxsmall                                                  |
      | show_byline    | 1                                                        |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_author_xxsmall"
    Then I should see "Kate Doe"

  Scenario: Show regular author byline for teaser xlarge (based on presentation tag)
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_author_xlarge |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | xlarge                                                   |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | Article title                  |
      | article_url | /article/title1                |
      | body        | article body                   |
      | main_image  | game-of-thrones-main-image.jpg |
    And author exist:
      | option       | value         |
      | author_name  | Kate Doe      |
      | author_email | test@test.com |
    And tags exist:
      | name                           | full_name                      | type         |
      | www.b.dk > Teaser > Vis byline | www.b.dk > Teaser > Vis byline | presentation |
    And article "Article title" has tag "www.b.dk > Teaser > Vis byline"
    And "Kate Doe" is author of "Article title" article
    When I go to "/teaser_author_xlarge"
    Then I should see "Kate Doe"
