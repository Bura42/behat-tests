Feature: Show teaser packs
  In order to see teaser with related external articles
  As a visitor
  I should see teaser pack

  Scenario: Show teaser pack 1 with external articles (business.dk)
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_1_ext |
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
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url                   |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-01   | http://www.business.dk/example |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-02   | http://www.business.dk/example |
      | title4 | /article/title4 |              | external | supertitle article 4 | summary4 | 2015-01-03   | http://www.business.dk/example |
      | title5 | /article/title5 |              | external | supertitle article 5 | summary5 | 2015-01-04   | http://www.business.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
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
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_ext"
    Then I should see "business.dk" in the ".related-large .related-summary-category" element
    And I should see an ".teaser-theme-business.related-large .related-header-trumpet" element

  Scenario: Show teaser pack 1 with external articles (aok)
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_pack_1_ext2 |
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
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url              |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-01   | http://www.aok.dk/example |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-02   | http://www.aok.dk/example |
      | title4 | /article/title4 |              | external | supertitle article 4 | summary4 | 2015-01-03   | http://www.aok.dk/example |
      | title5 | /article/title5 |              | external | supertitle article 5 | summary5 | 2015-01-04   | http://www.aok.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
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
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_ext2"
    Then I should see "aok.dk" in the ".related-summary-category" element
    And I should see an ".teaser-theme-aok.related-large .related-header-trumpet" element

  Scenario: Show teaser pack 7 with external articles (business.dk + aok)
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_pack_1_ext3 |
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
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url                   |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-01   | http://www.business.dk/example |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-02   | http://www.aok.dk/example      |
      | title4 | /article/title4 |              | external | supertitle article 4 | summary4 | 2015-01-03   | http://www.business.dk/example |
      | title5 | /article/title5 |              | external | supertitle article 5 | summary5 | 2015-01-04   | http://www.business.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 7              | www.b.dk > Forside > Pakke 7              | presentation |
      | www.b.dk > Forside > Relaterede > 3       | www.b.dk > Forside > Relaterede > 3       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 7"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title2" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_ext3"
    And I should see an ".teaser-theme-business.related-xsmall .related-header-trumpet" element
    And I should see an ".teaser-theme-aok.related-xsmall .related-header-trumpet" element

  Scenario: Show teaser pack 5 with external articles (business.dk + aok)
    Given "custom_page" site manager page exists:
      | option      | value               |
      | url         | /teaser_pack_1_ext4 |
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
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url                   |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-01   | http://www.business.dk/example |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-02   | http://www.aok.dk/example      |
      | title4 | /article/title4 |              | external | supertitle article 4 | summary4 | 2015-01-03   | http://www.business.dk/example |
      | title5 | /article/title5 |              | external | supertitle article 5 | summary5 | 2015-01-04   | http://www.business.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 5              | www.b.dk > Forside > Pakke 5              | presentation |
      | www.b.dk > Forside > Relaterede > 3       | www.b.dk > Forside > Relaterede > 3       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 5"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title2" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_ext4"
    And I should see an ".teaser-theme-business.related-small .related-header-trumpet" element
    And I should see an ".teaser-theme-aok.related-small .related-header-trumpet" element

  Scenario: Show teaser pack 5 with paid external articles (business.dk + aok)
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /teaser_pack_1_ext4_plus |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type          | supertitle           | summary  | date_created | external_url                   |
      | title2 | /article/title2 | khaleesi.jpg | external_plus | supertitle article 2 | summary2 | 2015-01-01   | http://www.business.dk/example |
      | title3 | /article/title3 |              | external_plus | supertitle article 3 | summary3 | 2015-01-02   | http://www.aok.dk/example      |
      | title4 | /article/title4 |              | external_plus | supertitle article 4 | summary4 | 2015-01-03   | http://www.business.dk/example |
      | title5 | /article/title5 |              | external_plus | supertitle article 5 | summary5 | 2015-01-04   | http://www.business.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 5              | www.b.dk > Forside > Pakke 5              | presentation |
      | www.b.dk > Forside > Relaterede > 3       | www.b.dk > Forside > Relaterede > 3       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 5"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title2" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_ext4_plus"
    And I should see an ".teaser-theme-business.related-small .related-header-trumpet" element
    And I should see an ".teaser-theme-aok.related-small .related-header-trumpet" element
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Don't show external domain for blog related articles
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /teaser_pack_ext_blog |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | title        | title1                         |
      | article_url  | /article/title1                |
      | main_image   | game-of-thrones-main-image.jpg |
      | type         | news                           |
      | supertitle   | supertitle article 1           |
      | summary      | summary1                       |
      | date_created | 2016-01-01                     |
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url                       |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-01   | http://blogger.blogs.berlingske.dk |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-02   | http://puls.b.dk/exampleee         |
      | title4 | /article/title4 |              | external | supertitle article 4 | summary4 | 2015-01-03   | http://www.b.dk/xxx                |
      | title5 | /article/title5 |              | external | supertitle article 5 | summary5 | 2015-01-04   | http://google.com/trump    |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 6        | www.b.dk > Forside > Pakke 6        | presentation |
      | www.b.dk > Forside > Relaterede > 4 | www.b.dk > Forside > Relaterede > 4 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 6"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    When I go to "/teaser_pack_ext_blog"
    Then I should not see "blogger.blogs.berlingske.dk"
    And I should not see "puls.b.dk/exampleee"
    And I should not see "www.b.dk/xxx"
    And I should see "google.com"
