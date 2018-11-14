Feature: Topic page
  In order to know more about some topic
  As a visitor
  I want to see topic page by special term

  Scenario: Show topic page
    Given topic page exists
    Given menu exists
    And articles exist:
      | title          | article_url     | main_image                     | type | supertitle           | summary  | date_created | rating |
      | Article title1 | /article/title1 | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1 | 2016-01-01   | 3      |
      | Article title2 | /article/title2 | game-of-thrones-main-image.jpg | news | supertitle article 2 | summary2 | 2015-12-30   |        |
      | Article title3 | /article/title3 | game-of-thrones-main-image.jpg | news | supertitle article 3 | summary3 | 2015-11-30   | 2      |
      | Article title4 | /article/title4 | game-of-thrones-main-image.jpg | news | supertitle article 4 | summary4 | 2015-09-15   | 5      |
      | Article title5 | /article/title5 | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary5 | 2015-03-10   |        |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/thisIsMyAccount       |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title1" article
    And tags exist:
      | name                                      | full_name                                 | type         | description       |
      | Topic page title                          | Topic page title                          | topic        | topic description |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |                   |
      | www.b.dk > Forside > Badges > Opdateres   | www.b.dk > Forside > Badges > Opdateres   | presentation |                   |
    And article "Article title1" has tag "Topic page title"
    And article "Article title2" has tag "Topic page title"
    And article "Article title2" has tag "www.b.dk > Forside > Badges > Opdateres"
    And article "Article title3" has tag "Topic page title"
    And article "Article title3" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "Article title4" has tag "Topic page title"
    And article "Article title5" has tag "Topic page title"
    When I go to "/tag/item/1"
    Then I should see "Topic page title" in the ".section-title-no-border" element
    And I should see an ".teaser-large" element
    And I should see an ".teaser-img-wide" element
    And I should see an ".teaser-small" element
    And I should see an ".teaser-img-right" element
    And I should see "topic description"
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_910x511 | lazy      |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |
      | game-of-thrones-main-image.jpg | image_300x300 | lazy      |

  Scenario: Show page type metadata on topic page
    Given topic page exists
    And tags exist:
      | name             | full_name        | type  | meta_description |
      | Topic page title | Topic page title | topic | description text |
    When I go to "/tag/item/1"
    Then I should see social meta tags:
      | tag     | value   |
      | og:type | website |
    And I should see meta tags:
      | tag         | value            |
      | description | description text |
    And I should see "Topic page title" in the "head > title" element
