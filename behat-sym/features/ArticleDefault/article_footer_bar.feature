Feature: Article footer bar
  In order to be able to share content
  As a visitor
  I want to see footer bars with social share buttons

  Scenario: Show article with footer bar
    Given "news" article page exists
    And article exist:
      | option      | value                             |
      | type        | news                              |
      | title       | title1                            |
      | article_url | /article/title1                   |
      | body        | article body                      |
      | summary     | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-bottom-share__item--facebook" element with Facebook share action
    And I should see an ".article-bottom-share__item--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-bottom-share__item--facebook > .bicon-facebook" element
    And I should see an ".article-bottom-share__item--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-bottom-share__item--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-bottom-share__item--twitter > .bicon-twitter" element

  Scenario: Show longRead article footer social bar
    Given longRead article page exists
    And article exist:
      | option      | value                             |
      | type        | longread                          |
      | title       | title1                            |
      | article_url | /article/title1                   |
      | body        | article body                      |
      | summary     | I am nice article share me please |
      | disqus      | 1                                 |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-bottom-share__item--facebook" element with Facebook share action
    And I should see an ".article-bottom-share__item--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-bottom-share__item--facebook > .bicon-facebook" element
    And I should see an ".article-bottom-share__item--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-bottom-share__item--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-bottom-share__item--twitter > .bicon-twitter" element

  Scenario: Show large article footer social bar
    Given large article page exists
    And article exist:
      | option      | value                             |
      | type        | large                             |
      | title       | title1                            |
      | article_url | /article/title1                   |
      | body        | article body                      |
      | summary     | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-bottom-share__item--facebook" element with Facebook share action
    And I should see an ".article-bottom-share__item--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-bottom-share__item--facebook > .bicon-facebook" element
    And I should see an ".article-bottom-share__item--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-bottom-share__item--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-bottom-share__item--twitter > .bicon-twitter" element
