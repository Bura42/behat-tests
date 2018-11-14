Feature: Linkpulse tracking
  In order to be able to track articles popularity
  As a visitor
  I want to see proper tracking parameters in anchors

  Scenario: Show xxsmall teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xxsmall_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option      | value                                                    |
      | source      | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit       | 3                                                        |
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
    And article exist:
      | option       | value                          |
      | type         | external                       |
      | title        | title1                         |
      | summary      | Article summary                |
      | external_url | http://fake/url                |
      | main_image   | game-of-thrones-main-image.jpg |
      | supertitle   | Supertitle 1                   |
    And article exist:
      | option       | value                          |
      | type         | external_plus                  |
      | title        | title1                         |
      | summary      | Article summary                |
      | external_url | http://fake/url2               |
      | main_image   | game-of-thrones-main-image.jpg |
      | supertitle   | Supertitle 1                   |
    When I go to "/xxsmall_teaser"
    Then I should see an "div.flex-row div:nth-child(1) div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.flex-row div:nth-child(1) div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    Then I should see an "div.flex-row div:nth-child(2) div.teaser > a" element with attribute "data-lpurl" set to "http://fake/url"
    And I should see an "div.flex-row div:nth-child(2) div.teaser-content > a" element with attribute "data-lpurl" set to "http://fake/url"
    Then I should see an "div.flex-row div:nth-child(3) div.teaser > a" element with attribute "data-lpurl" set to "http://fake/url2"
    And I should see an "div.flex-row div:nth-child(3) div.teaser-content > a" element with attribute "data-lpurl" set to "http://fake/url2"

  Scenario: Show xsmall teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xsmall_teaser     |
      | title       | Custom page title  |
      | description | Custom description |
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
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title                 |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/xsmall_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show xlarge teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /xlarge_teaser     |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option       | value                                                    |
      | title        | Xlarge teaser                                            |
      | source       | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit        | 1                                                        |
      | template     | xlarge                                                   |
      | show_byline  | 1                                                        |
      | show_summary | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Supertitle 1                   |
    When I go to "/xlarge_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show small teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /small_teaser      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Small teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | small                                                    |
      | image_position | left                                                     |
      | show_summary   | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/small_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show large teaser with proper link
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /large_teaser      |
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
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/large_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show consumer sales teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value                  |
      | url         | /consumer_sales_teaser |
      | title       | Custom page title      |
      | description | Custom description     |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | Consumer sales teaser                                    |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | consumer_sales                                           |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | supertitle  | Only 2000E per week!           |
    When I go to "/consumer_sales_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show cartoon teaser with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /cartoon_teaser    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option            | value                                                    |
      | title             | cartoon teaser                                           |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 1                                                        |
      | template          | cartoon                                                  |
      | number_of_columns | 3                                                        |
      | button_label      | Læs hele striben                                         |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/cartoon_teaser"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"

  Scenario: Show teaser pack with proper links
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /teaser_pack       |
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
    And article "title1" has related article "title2"
    And tags exist:
      | name                                | full_name                           | type         |
      | www.b.dk > Forside > Pakke 1        | www.b.dk > Forside > Pakke 1        | presentation |
      | www.b.dk > Forside > Relaterede > 3 | www.b.dk > Forside > Relaterede > 3 | presentation |
    And article "title1" has tag "www.b.dk > Forside > Pakke 1"
    And article "title1" has tag "www.b.dk > Forside > Relaterede > 3"
    When I go to "/teaser_pack"
    Then I should see an "div.teaser > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an "div.teaser-content > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an ".teaser-pack-list a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"

  Scenario: Show default list
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /list_default_1    |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 7                                                        |
    And blocks are added to page
    And articles exist:
      | title  | type |
      | title1 | news |
      | title2 | news |
      | title3 | news |
      | title4 | news |
      | title5 | news |
    And article exist:
      | option       | value            |
      | type         | external         |
      | title        | title6           |
      | summary      | Article summary  |
      | external_url | http://fake/url1 |
      | date_created | 2015-12-30       |
    And article exist:
      | option       | value            |
      | type         | external_plus    |
      | title        | title6           |
      | summary      | Article summary  |
      | external_url | http://fake/url2 |
      | date_created | 2015-12-30       |
    When I go to "/list_default_1"
    Then I should see an ".list-items > li:nth-child(1) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an ".list-items > li:nth-child(2) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"
    And I should see an ".list-items > li:nth-child(3) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/3"
    And I should see an ".list-items > li:nth-child(4) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/4"
    And I should see an ".list-items > li:nth-child(5) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/5"
    And I should see an ".list-items > li:nth-child(6) a" element with attribute "data-lpurl" set to "http://fake/url1"
    And I should see an ".list-items > li:nth-child(7) a" element with attribute "data-lpurl" set to "http://fake/url2"

  Scenario: Show related articles with proper links
    Given "news" article page exists
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title1 | /article/title1 | 160x160.jpg | news |
      | title2 | /article/title2 | 160x160.jpg | news |
      | title3 | /article/title3 | 160x160.jpg | news |
      | title4 | /article/title4 | 160x160.jpg | news |
      | title5 | /article/title5 | 160x160.jpg | news |
      | title6 | /article/title6 | 160x160.jpg | news |
    And article exist:
      | option       | value            |
      | type         | external         |
      | title        | title7           |
      | summary      | Article summary  |
      | external_url | http://fake/url1 |
      | date_created | 2015-12-30       |
    And article exist:
      | option       | value            |
      | type         | external_plus    |
      | title        | title8           |
      | summary      | Article summary  |
      | external_url | http://fake/url2 |
      | date_created | 2015-12-30       |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    And article "title1" has related article "title7"
    And article "title1" has related article "title8"
    When I go to "/article/title1"
    Then I should see an ".list > li:nth-child(1) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"
    And I should see an ".list > li:nth-child(2) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/3"
    And I should see an ".list > li:nth-child(3) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/4"
    And I should see an ".list > li:nth-child(4) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/5"
    And I should see an ".list > li:nth-child(5) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/6"
    And I should see an ".list > li:nth-child(6) a" element with attribute "data-lpurl" set to "http://fake/url1"
    And I should see an ".list > li:nth-child(7) a" element with attribute "data-lpurl" set to "http://fake/url2"

  Scenario: Show news article embedded articles with proper links
    Given "news" article page exists
    And article exist:
      | option      | value                                                                                                                                              |
      | type        | news                                                                                                                                               |
      | title       | title1                                                                                                                                             |
      | article_url | /article/title1                                                                                                                                    |
      | body        | some body {embedded type="node/news_article" id="2"}{embedded type="node/news_article" id="3"}{embedded type="node/news_article" id="4"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option       | value            |
      | type         | external         |
      | title        | title3           |
      | summary      | Article summary  |
      | external_url | http://fake/url1 |
      | date_created | 2015-12-30       |
    And article exist:
      | option       | value            |
      | type         | external_plus    |
      | title        | title4           |
      | summary      | Article summary  |
      | external_url | http://fake/url2 |
      | date_created | 2015-12-30       |
    And article "title1" has embedded related article "title2"
    And article "title1" has embedded related article "title3"
    And article "title1" has embedded related article "title4"
    When I go to "/article/title1"
    Then I should see an ".article-body .article-embedded-link:nth-child(2) .article-embedded-link__image > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"
    Then I should see an ".article-body .article-embedded-link:nth-child(2) .article-embedded-link__title > a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"
    Then I should see an ".article-body .article-embedded-link:nth-child(3) .article-embedded-link__title > a" element with attribute "data-lpurl" set to "http://fake/url1"
    Then I should see an ".article-body .article-embedded-link:nth-child(4) .article-embedded-link__title > a" element with attribute "data-lpurl" set to "http://fake/url2"

  Scenario: Archive page - articles
    Given articles exist:
      | title          | article_url     | type | supertitle  | date_created |
      | Article title2 | /article/title2 | news |             | 2015-12-30   |
      | Article title3 | /article/title3 | news | supertitle3 | 2015-12-30   |
    And article exist:
      | option       | value            |
      | type         | external         |
      | title        | title1           |
      | summary      | Article summary  |
      | external_url | http://fake/url1 |
      | date_created | 2015-12-30       |
    And article exist:
      | option       | value            |
      | type         | external_plus    |
      | title        | title2           |
      | summary      | Article summary  |
      | external_url | http://fake/url2 |
      | date_created | 2015-12-30       |
    When I go to "/artikel-arkiv"
    And I click on the element with xpath "//a[text()='2015']"
    And I click on the element with xpath "//a[text()='December']"
    And I click on the element with xpath "//a[text()='del 1']"
    And I should see an ".list > li:nth-child(1) a" element with attribute "data-lpurl" set to "http://fake/url1"
    And I should see an ".list > li:nth-child(2) a" element with attribute "data-lpurl" set to "http://fake/url2"
    Then I should see an ".list > li:nth-child(3) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/1"
    And I should see an ".list > li:nth-child(4) a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"

  Scenario: Add Linkpulse attribute to article body links
    Given "news" article page exists
    And article exist:
      | option      | value                                                                                                                                       |
      | type        | news                                                                                                                                        |
      | title       | title1                                                                                                                                      |
      | article_url | /article/title1                                                                                                                             |
      | body        | <a href="http://behat.bdk.dev/article/title2">LINK</a><a href="http://domain.com/test">LINK2</a><a href="http://domain.com/test2">LINK3</a><a href="http://www.cmore.dk" target="_blank">Cmore.dk</a><a href="https://www.cmore.dk" target="_blank">Cmore.dk</a><a attr="something" href="https://www.tere.dk" target="_blank">tere.dk</a> |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | body        | body            |
    When I go to "/article/title1"
    And I should see an ".article-body a[data-lpurl='http://behat.bdk.dev/content/item/2']" element
    And I should see an ".article-body a[data-lpurl='http://domain.com/test']" element
    And I should see an ".article-body a[data-lpurl='http://domain.com/test2']" element
    And I should see an ".article-body a[data-lpurl='http://www.cmore.dk']" element
    And I should see an ".article-body a[data-lpurl='https://www.cmore.dk']" element
    And I should see an ".article-body a[data-lpurl='https://www.tere.dk']" element

  @javascript
  Scenario: Add Linkpulse attribute to paid article body links
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                                                                         |
      | type        | news_plus                                                                     |
      | title       | title1                                                                        |
      | article_url | /article/news_plus/title1                                                     |
      | body        | some body                                                                     |
      | body_paid   | article body <a href="http://behat.bdk.dev/article/title2">LINK</a> more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title2 |
      | body        | body            |
    When I am on "/article/news_plus/title1" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    And I should see an ".article-body a" element with attribute "data-lpurl" set to "http://behat.bdk.dev/content/item/2"

  Scenario: Add Linkpulse tracking to common article page parts
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title1                         |
      | article_url        | /article/title1                |
      | body               | article body                   |
      | disqus             | 1                              |
      | main_image         | game-of-thrones-main-image.jpg |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@berlingske.dk                       |
    And "Who Cares" is author of "title1" article
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title2 | /article/title2 | 160x160.jpg | news |
      | title3 | /article/title3 | 160x160.jpg | news |
      | title4 | /article/title4 | 160x160.jpg | news |
      | title5 | /article/title5 | 160x160.jpg | news |
      | title6 | /article/title6 | 160x160.jpg | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    And tag exist:
      | option    | value  |
      | type      | topic  |
      | full_name | Topic1 |
      | name      | Topic1 |
    And tag exist:
      | option    | value  |
      | type      | topic  |
      | full_name | Topic2 |
      | name      | Topic2 |
    And article "title1" has tag "Topic1"
    And article "title1" has tag "Topic2"
    When I go to "/article/title1"
    Then I should see an ".article-header__share-buttons--facebook.lp_article_so_me_fb_small" element
    And I should see an ".article-header__share-buttons--twitter.lp_article_so_me_tw_small" element
    And I should see an ".article-header__share-buttons--linkedin.lp_article_so_me_in_small" element
    And I should see an ".article-header__share-buttons--print.lp_article_print_article" element
    And I should see an ".article-header__comments a.lp_article_comments_write" element
    And I should see an ".article-content__image.lp_article_image_main" element
    And I should see an ".article-content__byline-author.lp_article_author_profile" element
    And I should see an ".article-content__byline-author-follow.lp_article_author_follow" element
    And I should see an ".list__button--show-more.lp_article_link_related_showall" element
    And I should see an ".article-bottom-share__item--facebook.lp_article_so_me_fb_large" element
    And I should see an ".article-bottom-share__item--twitter.lp_article_so_me_tw_large" element
    And I should see an ".article-bottom-share__item--comments.lp_article_comments_see" element
    And I should see an ".article-bottom-related-title-left__item--topic.lp_article_topics_1" element
    And I should see an ".article-bottom-related-title-left__item--topic.lp_article_topics_last" element

  @javascript
  Scenario: Add Linkpulse tracking to article embeds
    Given "news" article page exists
    And article exist:
      | option             | value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | type               | news                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | title              | title1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | article_url        | /article/lp_embeds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | body               | <p>body start</p><p><a href="http://behat.bdk.dev/article/title2">INTERNAL INLINE LINK</a><br><a href="http://some.invalid.url">EXTERNAL INLINE LINK</a></p> <p>{embedded type="node/news_article" id="2"}{embedded type="node/news_article" id="3"}</p><p>{embedded type="node/node_image" id="5"}{embedded type="node/node_image" id="6"}</p><p>{embedded type="node/facts" id="7"}{embedded type="node/facts" id="8"}</p><p>{embedded type="node/custom_code_html" id="9"}<br>{embedded type="node/custom_code_html" id="10"}</p><p>{embedded type="node/news_article" id="7"}</p><p>{embedded type="node/news_article" id="8"}</p><p>body end</p> |
      | main_image         | khaleesi.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | image_caption      | image description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | image_photographer | John Doe                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title3          |
      | article_url | /article/title3 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    And article "title1" has embedded related article "title3"
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Image1                  |
      | file         | khaleesi.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Image2                         |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Image3                  |
      | file         | longread.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "title1" has embedded equipment "Image1"
    And article "title1" has embedded equipment "Image2"
    And article "title1" has embedded equipment "Image3"
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title1                      |
      | fact   | Here we have truly amazing fact! |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title2                      |
      | fact   | Here we have truly amazing fact! |
    And article "title1" has embedded equipment "Fact title1"
    And article "title1" has embedded equipment "Fact title2"
    And equipment exist:
      | option      | value             |
      | type        | custom_code       |
      | custom_code | Custom Code Here! |
      | title       | Custom code1      |
    And equipment exist:
      | option      | value                                                                                                                                                                                                                                                                    |
      | type        | custom_code                                                                                                                                                                                                                                                              |
      | custom_code | <blockquote class="twitter-tweet" data-lang="da">&mdash; Anders FjordbakTrier (@aftrier) <a href="https://twitter.com/aftrier/status/828335451337588737">5. februar 2017</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script> |
      | title       | Custom twitter code                                                                                                                                                                                                                                                      |
    And article "title1" has embedded equipment "Custom code1"
    And article "title1" has embedded equipment "Custom twitter code"
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title4 | /article/title4 | 160x160.jpg | news |
      | title5 | /article/title5 | 160x160.jpg | news |
      | title6 | /article/title6 | 160x160.jpg | news |
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact default1                    |
      | fact   | Here we have truly amazing fact! |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact default2                    |
      | fact   | Here we have truly amazing fact! |
    And article "title1" has default equipment "Fact default1"
    And article "title1" has default equipment "Fact default2"
    And article exist:
      | option       | value                      |
      | type         | external                   |
      | title        | title7                     |
      | external_url | http://www.aok.dk/example1 |
      | main_image   | 160x160.jpg                |
    And article exist:
      | option       | value                      |
      | type         | external_plus              |
      | title        | title8                     |
      | external_url | http://www.aok.dk/example2 |
      | main_image   | 160x160.jpg                |
    And article "title1" has embedded related article "title7"
    And article "title1" has embedded related article "title8"
    When I go to "/article/lp_embeds"
    Then I wait for ".article-body p a.lp_article_link_inline_1" element
    And I wait for ".article-body p a.lp_article_link_inline_last" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_1" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_2" element
    And I wait for ".article-body figure.article-embedded-image.lp_article_image_embedded_1" element
    And I wait for ".article-body figure.article-embedded-image.lp_article_image_embedded_last" element
    And I wait for ".article-body aside.article-embedded-factbox.continue-reading-fact.lp_article_factbox_embedded_1" element
    And I wait for ".article-body aside.article-embedded-factbox.continue-reading-fact.lp_article_factbox_embedded_last" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_1" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_2" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_last" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_3" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_last" element
    And I should see an ".lp_article_link_embedded_3 figure a" element with attribute "data-lpurl" set to "http://www.aok.dk/example1"
    And I should see an ".lp_article_link_embedded_last figure a" element with attribute "data-lpurl" set to "http://www.aok.dk/example2"

  @javascript
  Scenario: Add Linkpulse tracking to paid article embeds
    Given "newsPlus" article page exists
    And article exist:
      | option             | value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | type               | news_plus                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | title              | title1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | article_url        | /article/lp_paid_embeds                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | body               | free body                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | body_paid          | <p>body start</p><p><a href="http://behat.bdk.dev/article/title2">INTERNAL INLINE LINK</a><br><a href="http://some.invalid.url">EXTERNAL INLINE LINK</a></p> <p>{embedded type="node/news_article" id="2"}{embedded type="node/news_article" id="3"}</p><p>{embedded type="node/node_image" id="5"}{embedded type="node/node_image" id="6"}</p><p>{embedded type="node/facts" id="7"}{embedded type="node/facts" id="8"}</p><p>{embedded type="node/custom_code_html" id="9"}<br>{embedded type="node/custom_code_html" id="10"}</p>{embedded type="node/news_article" id="7"}</p><p>{embedded type="node/news_article" id="8"}<p>body end</p> |
      | main_image         | khaleesi.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | image_caption      | image description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | image_photographer | John Doe                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title3          |
      | article_url | /article/title3 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    And article "title1" has embedded related article "title3"
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Image1                  |
      | file         | khaleesi.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Image2                         |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Image3                  |
      | file         | longread.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "title1" has embedded equipment "Image1"
    And article "title1" has embedded equipment "Image2"
    And article "title1" has embedded equipment "Image3"
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title1                      |
      | fact   | Here we have truly amazing fact! |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title2                      |
      | fact   | Here we have truly amazing fact! |
    And article "title1" has embedded equipment "Fact title1"
    And article "title1" has embedded equipment "Fact title2"
    And equipment exist:
      | option      | value             |
      | type        | custom_code       |
      | custom_code | Custom Code Here! |
      | title       | Custom code1      |
    And equipment exist:
      | option      | value                                                                                                                                                                                                                                                                    |
      | type        | custom_code                                                                                                                                                                                                                                                              |
      | custom_code | <blockquote class="twitter-tweet" data-lang="da">&mdash; Anders FjordbakTrier (@aftrier) <a href="https://twitter.com/aftrier/status/828335451337588737">5. februar 2017</a></blockquote><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script> |
      | title       | Custom twitter code                                                                                                                                                                                                                                                      |
    And article "title1" has embedded equipment "Custom code1"
    And article "title1" has embedded equipment "Custom twitter code"
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title4 | /article/title4 | 160x160.jpg | news |
      | title5 | /article/title5 | 160x160.jpg | news |
      | title6 | /article/title6 | 160x160.jpg | news |
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact default1                    |
      | fact   | Here we have truly amazing fact! |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact default2                    |
      | fact   | Here we have truly amazing fact! |
    And article "title1" has default equipment "Fact default1"
    And article "title1" has default equipment "Fact default2"
    And article exist:
      | option       | value                      |
      | type         | external                   |
      | title        | title7                     |
      | external_url | http://www.aok.dk/example1 |
      | main_image   | 160x160.jpg                |
    And article exist:
      | option       | value                      |
      | type         | external_plus              |
      | title        | title8                     |
      | external_url | http://www.aok.dk/example2 |
      | main_image   | 160x160.jpg                |
    And article "title1" has embedded related article "title7"
    And article "title1" has embedded related article "title8"
    When I am on "/article/lp_paid_embeds" as authenticated user with subscription
    Then I wait for ".article-body p a.lp_article_link_inline_1" element
    And I wait for ".article-body p a.lp_article_link_inline_last" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_1" element
    And I wait for ".article-body aside.article-embedded-link.lp_article_link_embedded_last" element
    And I wait for ".article-body figure.article-embedded-image.lp_article_image_embedded_1" element
    And I wait for ".article-body figure.article-embedded-image.lp_article_image_embedded_last" element
    And I wait for ".article-body aside.article-embedded-factbox.continue-reading-fact.lp_article_factbox_embedded_1" element
    And I wait for ".article-body aside.article-embedded-factbox.continue-reading-fact.lp_article_factbox_embedded_last" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_1" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_2" element
    And I wait for ".article-bottom li.article-bottom-related-title-left__item.lp_article_link_related_last" element
