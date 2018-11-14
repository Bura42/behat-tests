Feature: Embedded links with paid content
  In order to understand article subject
  As a visitor
  I want to see paid article embedded links

  Scenario: Show news article paid embedded link
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | news_plus       |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show external article paid embedded link
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option       | value                          |
      | type         | external_plus                  |
      | title        | External article title         |
      | external_url | http://www.aok.dk/example      |
      | main_image   | game-of-thrones-main-image.jpg |
    And article "title1" has embedded related article "External article title"
    When I go to "/article/title1"
    Then I should see "External article title"
    And I should see images with filters:
      | name                           | filter       | load_type |
      | game-of-thrones-main-image.jpg | image_100x66 | eager     |
    And I should see an "h2.article-embedded-link__title a" element with attribute "href" set to "http://www.aok.dk/example"
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show longread article paid embedded link
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | title1                                                         |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | longread_plus   |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Show large article paid embedded link
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/news_article" id="2"} more body |
    And article exist:
      | option      | value           |
      | type        | large_plus      |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see images with filters:
      | name        | filter       | load_type |
      | 160x160.jpg | image_100x66 | eager     |
    And I should see "For abonnenter" in the ".subscriber-notice" element

  Scenario: Not show For abonnenter for free embedded links
    Given "news" article page exists
    And article exist:
      | option      | value                                                                                                                                                                                         |
      | type        | news                                                                                                                                                                                          |
      | title       | title1                                                                                                                                                                                        |
      | article_url | /article/title1                                                                                                                                                                               |
      | body        | some body {embedded type="node/news_article" id="2"} {embedded type="node/news_article" id="3"} {embedded type="node/news_article" id="4"} {embedded type="node/webtv_link" id="5"} more body |
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title3          |
      | article_url | /article/title3 |
      | main_image  | 160x160.jpg     |
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | title4          |
      | article_url | /article/title4 |
      | main_image  | 160x160.jpg     |
    And article "title1" has embedded related article "title2"
    And article "title1" has embedded related article "title3"
    And article "title1" has embedded related article "title4"
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see "title3"
    And I should see "title4"
    And I should not see ".subscriber-notice"
    And I should not see "For abonnenter" in the ".article-body" element
