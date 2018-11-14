Feature: Rss
  In order to get latest content
  As a visitor
  I should be able to get rss feed

  Scenario: Get latest msn news
    Given articles exist in list with nodeId "5738" and name "www.b.dk > MSN":
      | title  | article_url     | body                                                           | type |
      | title1 | /article/title1 | <p>Some body<p><p>{embedded type="node/node_image" id="1"}</p> | news |
      | title2 | /article/title2 | <p>Test</p>                                                    | news |
      | title3 | /article/title3 | <p>Tere fere</p>                                               | news |
      | title4 | /article/title4 | <p>Test2</p>                                                   | news |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "title1" has embedded equipment "Equipment title 1"
    When I go to "content/list/1/full-export"
    Then I should see in xml response
      | item_index | title  | description      | img                            |
      | 0          | title1 | <p>Some body<p>  | game-of-thrones-main-image.jpg |
      | 1          | title2 | <p>Test</p>      |                                |
      | 2          | title3 | <p>Tere fere</p> |                                |
      | 3          | title4 | <p>Test2</p>     |                                |

  Scenario: Get latest news
    Given articles exist in list with nodeId "123" and name "www.b.dk > something":
      | title  | article_url     | body                              | type | summary         |
      | title1 | /article/title1 | <p>Some body<p><p>Bla bla bla</p> | news | This is Sparta! |
      | title2 | /article/title2 | <p>Test</p>                       | news | Boring summary. |
      | title3 | /article/title3 | <p>Tere fere</p>                  | news | Blanlablasa     |
      | title4 | /article/title4 | <p>Test2</p>                      | news | Tere fere       |
    When I go to "nodequeue/123/rss"
    Then I should see in xml response
      | item_index | title  | description     |
      | 0          | title1 | This is Sparta! |
      | 1          | title2 | Boring summary. |
      | 2          | title3 | Blanlablasa     |
      | 3          | title4 | Tere fere       |

  Scenario: Get content list
    Given articles exist:
      | title  | article_url     | type      | supertitle  | date_created | summary       | body   |
      | title1 | /article/title1 | news      | supertitle1 | 2016-01-02   | description 1 | body 1 |
      | title2 | /article/title2 | news      |             | 2015-12-30   | description 2 | body 2 |
      | title3 | /article/title3 | news      | supertitle3 | 2015-12-30   | description 3 | body 3 |
      | title4 | /article/title4 | news      |             | 2015-03-10   | description 4 | body 4 |
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title5            |
      | article_url | /article/title5   |
      | summary     | description 5     |
      | body        | this is free body |
      | body_paid   | this is paid body |
    And article "title1" has related article "title2"
    And article "title2" has related article "title3"
    And article "title3" has related article "title4"
    And tag exist:
      | option    | value       |
      | type      | topic       |
      | full_name | Topic title |
      | name      | Topic title |
    And tag exist:
      | option    | value                    |
      | type      | category                 |
      | full_name | www.b.dk > category > TV |
      | name      | TV                       |
    And article "title1" has tag "Topic title"
    And article "title4" has tag "Topic title"
    And article "title2" has tag "TV"
    And article "title3" has tag "TV"
    When I go to "api/articles/1+2+3+4+5?token=d7f88198d0142d520abb9c5ef55928b1"
    Then I should see in xml response
      | item_index | title  | summary       | description       | relatedArticles | topics      | category | section  |
      | 0          | title1 | description 1 | body 1            | title2          | Topic title |          |          |
      | 1          | title2 | description 2 | body 2            | title3          |             | TV       | category |
      | 2          | title3 | description 3 | body 3            | title4          |             | TV       | category |
      | 3          | title4 | description 4 | body 4            |                 | Topic title |          |          |
      | 4          | title5 | description 5 | this is paid body |                 |             |          |          |

  Scenario: Get 500 response on non-existing nodequeue
    When I go to "api/articles/1+2+3+4"
    Then the response status code should be 500

  Scenario: Get 404 response on non-existing nodequeue
    When I go to "nodequeue/98765/rss"
    Then the response status code should be 404
    And I should see an empty response
