Feature: Show teaser packs summary
  In order to see summary of main teaser in teaser packs
  As a visitor
  I should see teaser pack summary

  Scenario: Teaser pack 1 - don't show summary by default (for main and related)
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /teaser_pack_1_summary |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
    And article "title1" has related article "title2"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 1              | www.b.dk > Forside > Pakke 1              | presentation |
      | www.b.dk > Forside > Relaterede > 3       | www.b.dk > Forside > Relaterede > 3       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title2" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/teaser_pack_1_summary"
    Then I should not see "summary1"
    And I should not see "summary2"

  Scenario: Teaser pack 1 - show summary based on presentation tag (for main and related)
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /teaser_pack_1_summary2 |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
    And article "title1" has related article "title2"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 1        | www.b.dk > Forside > Pakke 1        | presentation |
      | www.b.dk > Forside > Relaterede > 3 | www.b.dk > Forside > Relaterede > 3 | presentation |
      | www.b.dk > Teaser > Vis underrubrik | www.b.dk > Teaser > Vis underrubrik | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Teaser > Vis underrubrik"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    When I go to "/teaser_pack_1_summary2"
    Then I should see "summary1"
    Then I should see "summary2"

  Scenario: Teaser pack 1 - show summary whe it is turned on in SiteManager options (for main and related)
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /teaser_pack_1_summary3 |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
    And article "title1" has related article "title2"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 1        | www.b.dk > Forside > Pakke 1        | presentation |
      | www.b.dk > Forside > Relaterede > 3 | www.b.dk > Forside > Relaterede > 3 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    When I go to "/teaser_pack_1_summary3"
    Then I should see "summary1"
    Then I should see "summary2"
