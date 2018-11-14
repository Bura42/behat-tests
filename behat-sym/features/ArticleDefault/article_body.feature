Feature: Article body
  In order to understand article subject
  As a visitor
  I want to see article body

  Scenario: Show article body
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | body        | article body    |
    When I go to "/article/title1"
    Then I should see "article body"

  Scenario: Check configuration
    When I request "bm_app.article.content" building block
    Then I should get valid configuration for "bm_app.article.content":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration

  Scenario: Show partner byline
    Given "news" article page exists
    And article exist:
      | option           | value                                                                |
      | type             | news                                                                 |
      | title            | title1                                                               |
      | article_url      | /article/title1                                                      |
      | author_free_text | Af: Jess Hammerstone, Videnskab.dk og Loris G. Nilsson, Videnskab.dk |
    And tag exist:
      | option    | value                                           |
      | type      | presentation                                    |
      | full_name | www.b.dk > Artikel > Partner > www.videnskab.dk |
      | name      | www.b.dk > Artikel > Partner > www.videnskab.dk |
    And article "title1" has tag "www.b.dk > Artikel > Partner > www.videnskab.dk"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Af: Jess Hammerstone, Videnskab.dk og Loris G. Nilsson, Videnskab.dk |
      | I samarbejde med                                                     |
