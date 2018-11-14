Feature: Article partner articles
  In order to understand article subject
  As a visitor
  I want to see article partner articles

  Scenario: Show article partner articles
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | title1          |
      | article_url      | /article/title1 |
      | author_free_text | Jesper Kongskov |
      | body             | my super body   |
    And tag exist:
      | option    | value                                           |
      | type      | presentation                                    |
      | full_name | www.b.dk > Artikel > Partner > www.videnskab.dk |
      | name      | www.b.dk > Artikel > Partner > www.videnskab.dk |
    And article "title1" has tag "www.b.dk > Artikel > Partner > www.videnskab.dk"
    And articles exist in list with nodeId "4426" and name "that is > not important > in this scenario":
      | title  | article_url     | type |
      | title2 | /article/title2 | news |
      | title3 | /article/title3 | news |
      | title4 | /article/title4 | news |
      | title5 | /article/title5 | news |
    When I go to "/article/title1"
    Then I should see "title2"
    And I should see "title3"
    And I should see "Jesper Kongskov"

  Scenario: Not show article partner articles
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    And tag exist:
      | option    | value                               |
      | type      | presentation                        |
      | full_name | www.b.dk > Artikel > Partner > Test |
      | name      | www.b.dk > Artikel > Partner > Test |
    And article "title1" has tag "www.b.dk > Artikel > Partner > Test"
    When I go to "/article/title1"
    Then I should not see "title2"
