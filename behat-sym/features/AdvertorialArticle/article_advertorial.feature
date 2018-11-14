Feature: Advertorial article
  In order to see advertorial/sponsored article subject
  As a visitor
  I want to see special sponsored supertitle instead of normal supertitle above article title

  Scenario: Show advertorial article supertitle on advertorial article page
    Given "advertorial" article page exists
    And articles exist:
      | title  | article_url     | main_image  | type        | supertitle        |
      | title1 | /article/title1 | 160x160.jpg | advertorial | ArticleSupertitle |
      | title2 | /article/title2 | 160x160.jpg | news        |                   |
      | title3 | /article/title3 | 160x160.jpg | news        |                   |
      | title4 | /article/title4 | 160x160.jpg | advertorial | Supertitle4       |
      | title5 | /article/title5 | 160x160.jpg | advertorial |                   |
      | title6 | /article/title6 | 160x160.jpg | news        |                   |
    And tag exist:
      | option    | value              |
      | type      | category           |
      | full_name | www.b.dk > Annonce |
      | name      | www.b.dk > Annonce |
    And article "title1" has tag "www.b.dk > Annonce"
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    When I go to "/article/title1"
    Then I should not see an ".article-header__trumpet" element
    And I should not see "ArticleSupertitle" in the ".article-header__advertorial" element
    And I should see "Sponsoreret indhold" in the ".article-header__advertorial" element
    And I should not see an "Tophistorier" element
    And I should see "title1"
    And I should see "title2"
    And I should see "title3"
    And I should see "title4"
    And I should see "title5"
    And I should see "title6"

  Scenario: Show advertorial article without related articles
    Given "advertorial" article page exists
    And article exist:
      | option      | value           |
      | type        | advertorial     |
      | title       | title2          |
      | article_url | /article/title2 |
      | body        | article body    |
    And tag exist:
      | option    | value              |
      | type      | category           |
      | full_name | www.b.dk > Annonce |
      | name      | www.b.dk > Annonce |
    And article "title2" has tag "www.b.dk > Annonce"
    When I go to "/article/title2"
    And I should see "title2"
    And I should not see "Relaterede artikler"
