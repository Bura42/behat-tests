Feature: External article teaser
  In order to have quick understanding of article
  As a visitor
  I should see external article teaser

  Scenario: Show large business.dk article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext1       |
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
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://www.business.dk/example |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext1"
    Then I should see "business.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-business" element

  Scenario: Show large paid business.dk article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_plus   |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser plus                                        |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external_plus                  |
      | title        | External article title         |
      | external_url | http://www.business.dk/example |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_plus"
    Then I should see "business.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-business" element
    And I should see an "div.teaser a" element with attribute "href" set to "http://www.business.dk/example"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show small aok teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext2       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://www.aok.dk/example      |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext2"
    Then I should see "aok.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-aok" element

  Scenario: Show small paid aok article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_plus   |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser plus                                        |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external_plus                  |
      | title        | External article title         |
      | external_url | http://www.aok.dk/example      |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_plus"
    Then I should see "aok.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-aok" element
    And I should see an "div.teaser a" element with attribute "href" set to "http://www.aok.dk/example"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show xsmall business.dk article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_3      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://www.business.dk/example |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_3"
    Then I should see "business.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-business" element

  Scenario: Show xsmall paid business.dk article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_plus   |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Xsmall teaser plus                                       |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external_plus                  |
      | title        | External article title         |
      | external_url | http://www.business.dk/example |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_plus"
    Then I should see "business.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-business" element
    And I should see an "div.teaser a" element with attribute "href" set to "http://www.business.dk/example"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show xsmall article teaser
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext4       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | left                                                     |
    And blocks are added to page
    And article exist:
      | option       | value                            |
      | type         | external                         |
      | title        | External article title           |
      | external_url | http://www.other.site.dk/example |
      | main_image   | game-of-thrones-main-image.jpg   |
    When I go to "/teaser_ext4"
    Then I should see "other.site.dk" in the "span.teaser-category" element
    Then I should not see "business.dk" in the "span.teaser-category" element
    And I should not see "aok.dk" in the "span.teaser-category" element
    And I should not see an "div.teaser-theme-business" element
    And I should not see an "div.teaser-theme-aok" element

  Scenario: Show xsmall business.dk article teaser - qa environment
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext5       |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | xsmall                                                   |
      | image_position | right                                                    |
    And blocks are added to page
    And article exist:
      | option       | value                                                          |
      | type         | external                                                       |
      | title        | External article title                                         |
      | external_url | http://www.business.dk.test.bemit.dk/example                   |
      | main_image   | game-of-thrones-main-image.jpg                                 |
    When I go to "/teaser_ext5"
    Then I should see "business.dk" in the "span.teaser-category" element
    And I should see an "div.teaser-theme-business" element

  Scenario: Don't show external domain for blog articles
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_blog   |
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
      | option       | value                              |
      | type         | external                           |
      | title        | External article title             |
      | external_url | http://blogger.blogs.berlingske.dk |
      | main_image   | game-of-thrones-main-image.jpg     |
    When I go to "/teaser_ext_blog"
    Then I should not see an "span.teaser-category" element

  Scenario: Don't show external domain for puls.politiko.dk external articles
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /teaser_ext_blog_politiko |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | image_position | wide                                                     |
      | template       | xsmall                                                   |
    And blocks are added to page
    And article exist:
      | option       | value                    |
      | type         | external                 |
      | title        | A Lover's Complaint      |
      | external_url | http://puls.politiko.dk/ |
      | main_image   | romeo-and-juliette.jpg   |
    When I go to "/teaser_ext_blog_politiko"
    Then I should not see an "span.teaser-category" element

  Scenario: Dont show external domain for b.dk
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_bdk1   |
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
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://b.dk/something          |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_bdk1"
    Then I should not see an "span.teaser-category" element

  Scenario: Dont show external domain for www.b.dk
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_bdk2   |
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
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://www.b.dk/something      |
      | main_image   | game-of-thrones-main-image.jpg |
    When I go to "/teaser_ext_bdk2"
    Then I should not see an "span.teaser-category" element

  Scenario: Show external domain for external subdomain.b.dk
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_bdk3   |
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
      | option       | value                           |
      | type         | external                        |
      | title        | External article title          |
      | external_url | http://subdomain.b.dk/something |
      | main_image   | game-of-thrones-main-image.jpg  |
    When I go to "/teaser_ext_bdk3"
    Then I should see "subdomain.b.dk" in the "span.teaser-category" element

  Scenario: Show large business.dk article teaser with trumpet
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_ext_badge  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Large teaser                                             |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | large                                                    |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option       | value                          |
      | type         | external                       |
      | title        | External article title         |
      | external_url | http://www.business.dk/example |
      | main_image   | game-of-thrones-main-image.jpg |
      | supertitle   | Super title is super!          |
      | summary      | Summary sums it up             |
    When I go to "/teaser_ext_badge"
    Then I should see "business.dk" in the ".teaser-footer span.teaser-category" element
    And I should see an "div.teaser-theme-business" element

  Scenario: Show large business.dk article teaser for teaser pack related articles
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /teaser_pack_1_external |
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
    And articles exist:
      | title  | article_url     | main_image   | type     | supertitle           | summary  | date_created | external_url                   |
      | title2 | /article/title2 | khaleesi.jpg | external | supertitle article 2 | summary2 | 2015-01-02   | http://www.business.dk/example |
      | title3 | /article/title3 |              | external | supertitle article 3 | summary3 | 2015-01-03   | http://www.business.dk/example |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 1              | www.b.dk > Forside > Pakke 1              | presentation |
      | www.b.dk > Forside > Relaterede > 3       | www.b.dk > Forside > Relaterede > 3       | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_1_external"
    Then I should see "business.dk" in the ".related-tools .related-summary-category" element
