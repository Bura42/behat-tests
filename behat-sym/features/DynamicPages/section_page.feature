Feature: Section page
  In order to know more about some section
  As a visitor
  I want to see section page

  Scenario: Show section page
    Given menu exists
    And section page exists
    And tag exist:
      | option          | value                            |
      | type            | category                         |
      | full_name       | category > categoryPageIsTheBest |
      | name            | category > categoryPageIsTheBest |
      | tag_url         | /category                        |
      | border_position | bottom                           |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
      | www.b.dk > Forside > Badges > Opdateres   | www.b.dk > Forside > Badges > Opdateres   | presentation |
    And articles exist:
      | title           | article_url      | main_image                     | type | supertitle           | summary   | date_created | rating |
      | Article title1  | /article/title1  | game-of-thrones-main-image.jpg | news | supertitle article 1 | summary1  | 2016-01-02   | 3      |
      | Article title2  | /article/title2  | game-of-thrones-main-image.jpg | news | supertitle article 2 | summary2  | 2015-12-30   |        |
      | Article title3  | /article/title3  | game-of-thrones-main-image.jpg | news | supertitle article 3 | summary3  | 2015-11-30   | 2      |
      | Article title4  | /article/title4  | game-of-thrones-main-image.jpg | news | supertitle article 4 | summary4  | 2015-09-15   | 5      |
      | Article title5  | /article/title5  | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary5  | 2015-08-10   |        |
      | Article title6  | /article/title6  | game-of-thrones-main-image.jpg | news | supertitle article 4 | summary6  | 2015-07-15   | 5      |
      | Article title7  | /article/title7  | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary7  | 2015-06-10   |        |
      | Article title8  | /article/title8  | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary8  | 2015-06-10   |        |
      | Article title9  | /article/title9  | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary9  | 2015-06-10   |        |
      | Article title10 | /article/title10 | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary10 | 2015-06-10   |        |
      | Article title11 | /article/title11 | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary11 | 2015-06-10   |        |
      | Article title12 | /article/title12 | game-of-thrones-main-image.jpg | news | supertitle article 5 | summary12 | 2015-06-10   |        |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/thisIsMyAccount       |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title1" article
    And article "Article title1" has tag "category > categoryPageIsTheBest"
    And article "Article title2" has tag "category > categoryPageIsTheBest"
    And article "Article title2" has tag "www.b.dk > Forside > Badges > Opdateres"
    And article "Article title3" has tag "category > categoryPageIsTheBest"
    And article "Article title3" has tag "www.b.dk > Artikel > Rundt teaser billede"
    And article "Article title4" has tag "category > categoryPageIsTheBest"
    And article "Article title5" has tag "category > categoryPageIsTheBest"
    And article "Article title6" has tag "category > categoryPageIsTheBest"
    And article "Article title7" has tag "category > categoryPageIsTheBest"
    And article "Article title8" has tag "category > categoryPageIsTheBest"
    And article "Article title9" has tag "category > categoryPageIsTheBest"
    And article "Article title10" has tag "category > categoryPageIsTheBest"
    And article "Article title11" has tag "category > categoryPageIsTheBest"
    And article "Article title12" has tag "category > categoryPageIsTheBest"
    When I go to "/category"
    Then I should see "categoryPageIsTheBest"
    And I should not see "category > categoryPageIsTheBest" in the ".page-title" element
    And I should see the list of elements:
      | Article title1  |
      | Article title2  |
      | Article title3  |
      | Article title4  |
      | Article title5  |
      | Article title6  |
      | Article title7  |
      | Article title8  |
      | Article title9  |
      | Article title10 |
      | Article title11 |
      | Article title12 |
    And I should see "categoryPageIsTheBest" in the "head > title" element

  Scenario: Show page type metadata on section page
    Given menu exists
    And section page exists
    And tag exist:
      | option          | value                                       |
      | type            | category                                    |
      | full_name       | www.b.dk > category > categoryPageIsTheBest |
      | name            | categoryPageIsTheBest                       |
      | tag_url         | /category                                   |
      | border_position | bottom                                      |
    When I go to "/category"
    Then I should see social meta tags:
      | tag                 | value                         |
      | og:type             | website                       |
      | article:section     | category                      |
      | article:section_url | http://behat.bdk.dev/category |
    And I should see "categoryPageIsTheBest - category" in the "head > title" element
