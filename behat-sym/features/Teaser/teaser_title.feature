Feature: Article title on teaser
  In order to understand article subject
  As a visitor
  I want to see data such as supertitle, title, summary on teaser

  Scenario: Show small teaser with supertitle, title and summary
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
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | video           |
      | supertitle  | supertitle1     |
      | title       | title1          |
      | summary     | Article summary |
      | article_url | /article/title1 |
    When I go to "/small_teaser_left"
    Then I should see "supertitle1"
    And I should see "title1"
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-left" element
    And I should see an ".teaser-trumpet" element
    And I should see an "h2.header" element

  Scenario: Show small teaser without supertitle
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
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | large           |
      | supertitle  |                 |
      | title       | title1          |
      | summary     | Article summary |
      | article_url | /article/title1 |
    When I go to "/small_teaser_right"
    Then I should not see "supertitle1"
    And I should not see an ".teaser-trumpet" element

  Scenario: Xsmall teaser should not render summary
    Given "custom_page" site manager page exists:
      | option      | value                |
      | url         | /xsmall_teaser_right |
      | title       | Custom page title    |
      | description | Custom description   |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | title1          |
      | summary     | Article summary |
      | article_url | /article/title1 |
    When I go to "/xsmall_teaser_right"
    Then I should not see "Article summary"
    And I should not see an ".teaser-summary-content" element
