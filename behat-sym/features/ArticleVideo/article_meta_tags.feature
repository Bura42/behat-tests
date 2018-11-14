Feature: Article meta tags
  In order to be able to share content
  As a visitor
  Meta tags should be set correctly

  Scenario: Show video article og tags
    Given "video" article page exists
    And articles exist:
      | type  | title  | article_url     | body         | summary                           | node_id |
      | video | title1 | /article/title1 | article body | I am nice article share me please | 756     |
    When I go to "/article/title1"
    Then I should see social meta tags:
      | tag                 | value                             |
      | og:title            | title1                            |
      | og:type             | video.other                       |
      | og:site_name        | www.b.dk                          |
      | og:description      | I am nice article share me please |
      | og:url              | /content/item/1                   |
      | twitter:card        | summary                           |
      | twitter:site        | @bdk                              |
      | twitter:title       | title1                            |
      | twitter:description | I am nice article share me please |
      | twitter:url         | /article/title1                   |
      | articleId           | 1                                 |
    And I should see meta tags:
      | tag         | value                             |
      | node-id     | 756                               |
      | description | I am nice article share me please |
    And I canonical link should be set to "/article/title1"
