Feature: Show teasers with different border position
  In order to have good separation between teasers
  As a visitor
  I should see border lines

  Scenario: Show large teasers with border top
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /large_teasers_border_top |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 5                                                        |
      | template        | large                                                    |
      | border_position | top                                                      |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/large_teasers_border_top"
    And I should see an ".item-teaser.teaser--border-top" element

  Scenario: Show small teasers with border bottom
    Given "custom_page" site manager page exists:
      | option      | value                        |
      | url         | /small_teasers_border_bottom |
      | title       | Custom page title            |
      | description | Custom description           |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 5                                                        |
      | template        | small                                                    |
      | border_position | bottom                                                   |
      | image_position  | left                                                     |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/small_teasers_border_bottom"
    And I should see an ".item-teaser.teaser--border-bottom" element

  Scenario: Show large teasers with no borders
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /large_teasers_no_borders |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option          | value                                                    |
      | source          | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit           | 5                                                        |
      | template        | large                                                    |
      | border_position | none                                                     |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    When I go to "/large_teasers_no_borders"
    And I should see an ".item-teaser.teaser--border-none" element
