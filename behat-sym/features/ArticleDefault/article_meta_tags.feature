Feature: Article meta tags
  In order to be able to share content
  As a visitor
  Meta tags should be set correctly

  Scenario: Show article og tags
    Given "news" article page exists
    And article exist:
      | option       | value                             |
      | type         | news                              |
      | title        | title1                            |
      | article_url  | /article/title1                   |
      | body         | article body                      |
      | summary      | I am nice article share me please |
      | node_id      | 756                               |
      | date_created | 2016-10-10                        |
    And tag exist:
      | option    | value          |
      | type      | category       |
      | full_name | www.b.dk       |
      | name      | www.b.dk       |
      | tag_url   | /main_category |
    And tag exist:
      | option    | value                           |
      | type      | category                        |
      | full_name | www.b.dk > Custom category name |
      | name      | Custom category name            |
      | tag_url   | /subCategory123                 |
    And tag exist:
      | option    | value                                    |
      | type      | category                                 |
      | full_name | www.b.dk > Custom category name > myname |
      | name      | myname                                   |
      | tag_url   | /sub_category1                           |
    And "www.b.dk" tag is parent of "www.b.dk > Custom category name" tag
    And "www.b.dk > Custom category name" tag is parent of "www.b.dk > Custom category name > myname" tag
    And article "title1" has tag "myname"
    When I go to "/article/title1"
    Then I should see social meta tags:
      | tag                    | value                                |
      | og:title               | title1                               |
      | og:type                | article                              |
      | og:site_name           | www.b.dk                             |
      | og:description         | I am nice article share me please    |
      | og:url                 | /content/item/1                      |
      | article:published_time | 2016-10-10T00:00:00+02:00            |
      | article:modified_time  | 2016-10-10T00:00:00+02:00            |
      | article:section        | Custom category name                 |
      | article:section_url    | https://behat.bdk.dev/subCategory123 |
      | twitter:card           | summary                              |
      | twitter:site           | @bdk                                 |
      | twitter:title          | title1                               |
      | twitter:description    | I am nice article share me please    |
      | twitter:url            | /article/title1                      |
      | lp:url                 | /content/item/1                      |
      | articleId              | 1                                    |
      | fb:app_id              | 82121733915                          |
    And I should see meta tags:
      | tag         | value                             |
      | node-id     | 756                               |
      | description | I am nice article share me please |
    And I canonical link should be set to "/article/title1"

  Scenario: Show article tags
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | Article title   |
      | article_url | /article/title2 |
    And tags exist:
      | name         | full_name    | type  |
      | Topic title1 | Topic title1 | topic |
      | Topic title2 | Topic title2 | topic |
      | Topic title3 | Topic title3 | topic |
    And article "Article title" has tag "Topic title1"
    And article "Article title" has tag "Topic title2"
    And article "Article title" has tag "Topic title3"
    When I go to "/article/title2"
    And I should see an "meta[property='article:tag'][content='Topic title1']" element
    And I should see an "meta[property='article:tag'][content='Topic title2']" element
    And I should see an "meta[property='article:tag'][content='Topic title3']" element
    And I should not see an "meta[name='robots'][content='noindex,nofollow']" element

  Scenario: Show default og:image if article has no image
    Given "news" article page exists
    And article exist:
      | option      | value                             |
      | type        | news                              |
      | title       | title1                            |
      | article_url | /article/title1_default_og_image  |
      | body        | article body                      |
      | summary     | I am nice article share me please |
    When I go to "/article/title1_default_og_image"
    Then I should see social meta tags:
      | tag      | value                                                                        |
      | og:image | http://behat.bdk.dev:8080/images/bdk-opengraph-logo_bdk-opengraph-logo_1.png |

  Scenario: Show noindex meta tag
    Given "news" article page exists
    And article exist:
      | option       | value                             |
      | type         | news                              |
      | title        | title1                            |
      | article_url  | /article/title1                   |
      | body         | article body                      |
      | summary      | I am nice article share me please |
      | node_id      | 756                               |
      | date_created | 2016-10-10                        |
    And tag exist:
      | option    | value               |
      | type      | presentation        |
      | full_name | Ikke i Google index |
      | name      | Ikke i Google index |
    And article "title1" has tag "Ikke i Google index"
    When I go to "/article/title1"
    Then I should see an "meta[name='robots'][content='noindex,nofollow']" element
    And I should not see an "meta[name='robots'][content='index,follow']" element
