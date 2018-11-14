Feature: Embedded links
  In order to understand article subject
  As a visitor
  I want to see article embedded links

  Scenario: Show news article free embedded link
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see an ".article-embedded-link__image a" element with attribute "href" set to "/article/title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |

  Scenario: Redirect to news article page from embedded link image
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    And I click on ".article-embedded-link__image a"
    Then I should be on "/article/title2"

  Scenario: Show links for articles with different badges
    Given "news" article page exists
    And article exist:
      | option      | value                                                                                                                                                                                                                                                                                 |
      | type        | news                                                                                                                                                                                                                                                                                  |
      | title       | title1                                                                                                                                                                                                                                                                                |
      | article_url | /article/title1                                                                                                                                                                                                                                                                       |
      | body        | some body {embedded type="node/news_article" id="2"} {embedded type="node/news_article" id="3"} {embedded type="node/news_article" id="4"} {embedded type="node/news_article" id="5"} {embedded type="node/news_article" id="6"} {embedded type="node/news_article" id="7"} more body |
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
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title4          |
      | article_url | /article/title4 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title5          |
      | article_url | /article/title5 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title6          |
      | article_url | /article/title6 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title7          |
      | article_url | /article/title7 |
      | main_image  | 160x160.jpg     |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And tag exist:
      | option    | value                                   |
      | type      | presentation                            |
      | full_name | www.b.dk > Forside > Badges > Opdateres |
      | name      | www.b.dk > Forside > Badges > Opdateres |
    And tag exist:
      | option    | value                                 |
      | type      | presentation                          |
      | full_name | www.b.dk > Forside > Badges > Lige nu |
      | name      | www.b.dk > Forside > Badges > Lige nu |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Forside > Badges > Live |
      | name      | www.b.dk > Forside > Badges > Live |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Forside > Badges > Tophistorie |
      | name      | www.b.dk > Forside > Badges > Tophistorie |
    And tag exist:
      | option    | value                                      |
      | type      | presentation                               |
      | full_name | www.b.dk > Forside > Badges > Nyhed på vej |
      | name      | www.b.dk > Forside > Badges > Nyhed på vej |
    And article "title7" has tag "www.b.dk > Forside > Badges > Breaking"
    And article "title6" has tag "www.b.dk > Forside > Badges > Nyhed på vej"
    And article "title5" has tag "www.b.dk > Forside > Badges > Tophistorie"
    And article "title4" has tag "www.b.dk > Forside > Badges > Live"
    And article "title3" has tag "www.b.dk > Forside > Badges > Lige nu"
    And article "title2" has tag "www.b.dk > Forside > Badges > Opdateres"
    And article "title1" has embedded related article "title2"
    And article "title1" has embedded related article "title3"
    And article "title1" has embedded related article "title4"
    And article "title1" has embedded related article "title5"
    And article "title1" has embedded related article "title6"
    And article "title1" has embedded related article "title7"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | OPDATERES    |
      | LIGE NU      |
      | LIVE         |
      | TOPHISTORIE  |
      | NYHED PÅ VEJ |
      | BREAKING     |
      | title2       |
      | title3       |
      | title4       |
      | title5       |
      | title6       |
      | title7       |

  Scenario: Show image gallery link
    Given "news" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | news                                                            |
      | title       | News article title                                              |
      | article_url | /article/title1                                                 |
      | body        | some body {embedded type="node/image_gallery" id="2"} more body |
    And article exist:
      | option             | value                          |
      | type               | image_gallery                  |
      | title              | Gallery article title          |
      | article_url        | /article/title2                |
      | main_image         | game-of-thrones-main-image.jpg |
      | image_caption      | this is image caption!         |
      | image_photographer | Image Author                   |
    And article "News article title" has embedded related article "Gallery article title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | News article title    |
      | some body             |
      | more body             |
      | Gallery article title |
      | SE GALLERI            |
    And I should not see the list of elements:
      | this is image caption! |
      | Image Author           |

  Scenario: Redirect to gallery page
    Given "news" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | news                                                            |
      | title       | News article title                                              |
      | article_url | /article/title1                                                 |
      | body        | some body {embedded type="node/image_gallery" id="2"} more body |
    And article exist:
      | option      | value                          |
      | type        | image_gallery                  |
      | title       | Gallery article title          |
      | article_url | /article/title2                |
      | main_image  | game-of-thrones-main-image.jpg |
    And article "News article title" has embedded related article "Gallery article title"
    When I go to "/article/title1"
    And I click on ".article-embedded-link__title a"
    Then I should be on "/article/title2"

  Scenario: Show link to gallery with badge
    Given "news" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | news                                                            |
      | title       | News article title                                              |
      | article_url | /article/title1                                                 |
      | body        | some body {embedded type="node/image_gallery" id="2"} more body |
    And article exist:
      | option             | value                          |
      | type               | image_gallery                  |
      | title              | Gallery article title          |
      | article_url        | /article/title2                |
      | main_image         | game-of-thrones-main-image.jpg |
      | image_caption      | this is image caption!         |
      | image_photographer | Image Author                   |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And article "News article title" has embedded related article "Gallery article title"
    And article "Gallery article title" has tag "www.b.dk > Forside > Badges > Breaking"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | News article title    |
      | some body             |
      | more body             |
      | Gallery article title |
      | BREAKING              |
    And I should not see the list of elements:
      | this is image caption! |
      | Image Author           |
      | SE GALLERI             |

  Scenario: Show link to video article with badge
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | News article title                                           |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option             | value                                     |
      | type               | video                                     |
      | title              | Video article title                       |
      | article_url        | /article/title2                           |
      | main_image         | game-of-thrones-main-image.jpg            |
      | image_caption      | this is image caption!                    |
      | image_photographer | Image Author                              |
      | video_link         | http://webtv.metropol.dk/clip/42693/bt/38 |
      | video_type         | 4                                         |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Forside > Badges > Tophistorie |
      | name      | www.b.dk > Forside > Badges > Tophistorie |
    And article "News article title" has embedded related article "Video article title"
    And article "Video article title" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | News article title |
      | some body          |
      | more body          |
    And I should not see the list of elements:
      | this is image caption! |
      | Image Author           |
      | SE VIDEO               |
    And I should see an ".article-embedded-audio" element

  Scenario: Show longRead article free embedded link
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | longread                                                       |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |

  Scenario: Show longRead article free embedded link with black background
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | longread                                                       |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "title1" has tag "Longread > Black background"
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |
    And I should see an "body.longread--bg-black" element

  Scenario: Show longRead article free embedded link with video
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | longread                                                     |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | type        | video                        |
      | playlist    | playlist.xml                 |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"

  Scenario: Show link for news article with badge and 'www.b.dk > Benyt forrider i badge' presentation tag
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
      | supertitle  | SuuuuuperTitle! |
    And tag exist:
      | option    | value                                      |
      | type      | presentation                               |
      | full_name | www.b.dk > Forside > Badges > Nyhed på vej |
      | name      | www.b.dk > Forside > Badges > Nyhed på vej |
    And tag exist:
      | option    | value                             |
      | type      | presentation                      |
      | full_name | www.b.dk > Benyt forrider i badge |
      | name      | www.b.dk > Benyt forrider i badge |
    And article "title2" has tag "www.b.dk > Benyt forrider i badge"
    And article "title2" has tag "www.b.dk > Forside > Badges > Nyhed på vej"
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body |
      | title2    |
      | more body |
    And I should not see "Nyhed på vej" in the ".article-header__event-header--red" element
    And I should see "SuuuuuperTitle!" in the ".article-header__event-header--red" element
