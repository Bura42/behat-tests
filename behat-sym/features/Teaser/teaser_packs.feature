Feature: Show teaser packs
  In order to have see teaser with related articles
  As a visitor
  I should see teaser pack

  Scenario: Show teaser pack 1
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_1     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 |                                | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
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
    When I go to "/teaser_pack_1"
    Then I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-large div.teaser-img-left.teaser-theme-feature"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-xsmall"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-xsmall"
    And I should see "title4"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should not see "summary4"
    And I should not see "title5"
    And I should not see "summary5"
    And I should not see an ".related-summary-category" element
    And I should see images with filters:
      | name         | filter        | load_type |
      | khaleesi.jpg | image_106x106 | lazy      |

  Scenario: Show teaser pack 2
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_2     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 |                                | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 2              | www.b.dk > Forside > Pakke 2              | presentation |
      | www.b.dk > Forside > Relaterede > 2       | www.b.dk > Forside > Relaterede > 2       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 2"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 2"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title3" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_2"
    Then I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-large div.teaser-img-right"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-xsmall"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should not see "title4"
    And I should not see "summary4"
    And I should not see "title5"
    And I should not see "summary5"
    And I should see images with filters:
      | name         | filter        | load_type |
      | khaleesi.jpg | image_160x106 | lazy      |

  Scenario: Show teaser pack 3
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_3     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 3              | www.b.dk > Forside > Pakke 3              | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 3"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_3"
    Then I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-large div.teaser-img-left"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-large div.teaser-img-right"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should see "summary3"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-xsmall"
    And I should see "title4"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should not see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-xsmall"
    And I should see "title5"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should not see "summary5"
    And I should see images with filters:
      | name         | filter        | load_type |
      | khaleesi.jpg | image_160x106 | lazy      |
      | 160x160.jpg  | image_160x106 | lazy      |

  Scenario: Show teaser pack 4
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_4     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 | image_160x106.jpg              | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 4              | www.b.dk > Forside > Pakke 4              | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 4"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title3" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "title4" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/teaser_pack_4"
    Then I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-small.teaser-img-left"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should not see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-small.teaser-img-left.teaser-theme-feature"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-large.teaser-img-right.teaser-theme-feature"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-large.teaser-img-right"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should see "summary5"
    And I should see images with filters:
      | name              | filter        | load_type |
      | khaleesi.jpg      | image_140x93  | lazy      |
      | 160x160.jpg       | image_93x93   | lazy      |
      | image_160x106.jpg | image_106x106 | lazy      |

  Scenario: Show teaser pack 5
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_5     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 | image_160x106.jpg              | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 5              | www.b.dk > Forside > Pakke 5              | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 5"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_5"
    Then I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-small div.teaser-img-left"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should not see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-small div.teaser-img-left"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-large"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-large"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should see "summary5"
    And I should see images with filters:
      | name         | filter       | load_type |
      | khaleesi.jpg | image_140x93 | lazy      |
      | 160x160.jpg  | image_140x93 | lazy      |

  Scenario: Show teaser pack 6
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_6     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 |                                | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 6              | www.b.dk > Forside > Pakke 6              | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 6"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/teaser_pack_6"
    Then I should see an ".teaser-img-left.item-teaser.teaser-small.teaser-theme-feature" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-large"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-large"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-large"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-large"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should see "summary5"

  Scenario: Show teaser pack 7
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_7     |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   |
      | title2 | /article/title2 |                                | news | supertitle article 2 | summary2 | 2015-01-01   |
      | title3 | /article/title3 |                                | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 |                                | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Pakke 7              | www.b.dk > Forside > Pakke 7              | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 7"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/teaser_pack_7"
    Then I should see an ".teaser-img-right.item-teaser.teaser-small.teaser-theme-feature" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-xsmall"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should not see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-xsmall"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-xsmall"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should not see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-xsmall"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should not see "summary5"

  Scenario: Show teaser pack extra giant
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /teaser_pack_extra_giant |
      | title       | Custom page title        |
      | description | Custom description       |
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
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |
      | title4 | /article/title4 | image_160x106.jpg              | news | supertitle article 4 | summary4 | 2015-01-03   |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Extra giant          | www.b.dk > Forside > Extra giant          | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Extra giant"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title1" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_extra_giant"
    Then I should see an ".item-teaser.teaser-xxlarge.teaser-theme-xtragiant" element
    And I should see "Tophistorie" in the ".teaser-body" element
    And I should not see "Tophistorie" in the ".teaser-img" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-small div.teaser-img-left"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should not see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-small div.teaser-img-left"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-small div.teaser-img-left"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should not see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-xsmall"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should not see "summary5"
    And I should see images with filters:
      | name                           | filter       | load_type |
      | game-of-thrones-main-image.jpg | image_1240   | lazy      |
      | khaleesi.jpg                   | image_140x93 | lazy      |
      | 160x160.jpg                    | image_140x93 | lazy      |
      | image_160x106.jpg              | image_140x93 | lazy      |

  Scenario: Show teaser pack giant
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack_giant |
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
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created | rating |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   | 4      |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |        |
      | title3 | /article/title3 | 160x160.jpg                    | news | supertitle article 3 | summary3 | 2015-01-02   |        |
      | title4 | /article/title4 | image_160x106.jpg              | news | supertitle article 4 | summary4 | 2015-01-03   |        |
      | title5 | /article/title5 |                                | news | supertitle article 5 | summary5 | 2015-01-04   |        |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Forside > Giant                | www.b.dk > Forside > Giant                | presentation |
      | www.b.dk > Forside > Relaterede > 4       | www.b.dk > Forside > Relaterede > 4       | presentation |
      | www.b.dk > Forside > Badges > Live        | www.b.dk > Forside > Badges > Live        | presentation |
      | www.b.dk > Forside > Badges > Tophistorie | www.b.dk > Forside > Badges > Tophistorie | presentation |
    And article "title1" has tag "www.b.dk > Forside > Giant"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    And article "title1" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title5" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title2" has tag "www.b.dk > Forside > Badges > Live"
    And article "title4" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/teaser_pack_giant"
    Then I should see an ".item-teaser.teaser-xlarge.teaser-theme-giant" element
    And I should see "Tophistorie" in the ".teaser-body" element
    And I should not see "Tophistorie" in the ".teaser-img" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "1" containing "div.related-small div.teaser-img-left"
    And I should see "title2"
    And I should see "supertitle article 2" in the ".teaser-pack .teaser-pack-list li:nth-child(1) .related-tools" element
    And I should not see "summary2"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "2" containing "div.related-small div.teaser-img-left"
    And I should see "title3"
    And I should see "supertitle article 3" in the ".teaser-pack .teaser-pack-list li:nth-child(2) .related-tools" element
    And I should not see "summary3"
    And I should see "title4"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "3" containing "div.related-small div.teaser-img-left"
    And I should see "supertitle article 4" in the ".teaser-pack .teaser-pack-list li:nth-child(3) .related-tools" element
    And I should not see "summary4"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element
    And I should see "title5"
    And I should see an element ".teaser-pack .teaser-pack-list" with child "li" on position "4" containing "div.related-xsmall"
    And I should see "supertitle article 5" in the ".teaser-pack .teaser-pack-list li:nth-child(4) .related-tools" element
    And I should not see "summary5"
    And I should see images with filters:
      | name                           | filter       | load_type |
      | game-of-thrones-main-image.jpg | image_1240   | lazy      |
      | khaleesi.jpg                   | image_140x93 | lazy      |
      | 160x160.jpg                    | image_140x93 | lazy      |
      | image_160x106.jpg              | image_140x93 | lazy      |

  Scenario: Do not show teaser pack with old pack tags
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_regular    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And articles exist:
      | title  | article_url     | main_image                     | type | supertitle           | summary  | date_created | rating |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   | 4      |
      | title2 | /article/title2 | khaleesi.jpg                   | news | supertitle article 2 | summary2 | 2015-01-01   |        |
    And article "title1" has related article "title2"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 10       | www.b.dk > Forside > Pakke 10       | presentation |
      | www.b.dk > Forside > Relaterede > 4 | www.b.dk > Forside > Relaterede > 4 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 10"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 4"
    When I go to "/teaser_regular"
    Then I should see "title1"
    And I should not see an ".teaser-pack .teaser-pack-list" element
    And I should not see "title2"
