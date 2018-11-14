Feature: Article footer bar
  In order to be able to share content
  As a visitor
  I want to see footer bars with social share buttons

  Scenario: Show video article with footer bar
    Given "video" article page exists
    And articles exist:
      | type  | title  | article_url     | body         | summary                           |
      | video | title1 | /article/title1 | article body | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-bottom-share__item--facebook" element with Facebook share action
    And I should see an ".article-bottom-share__item--facebook > .bicon-facebook" element
    And I should see an ".article-bottom-share__item--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-bottom-share__item--twitter > .bicon-twitter" element
