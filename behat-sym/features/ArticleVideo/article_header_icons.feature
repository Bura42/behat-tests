Feature: Article header icons
  In order to be able to share content
  As a visitor
  I want to see header social share icons

  Scenario: Show video article with header icons
    Given "video" article page exists
    And articles exist:
      | type  | title  | article_url     | body         | summary                           |
      | video | title1 | /article/title1 | article body | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-header__share-buttons--facebook" element with Facebook share action
    And I should see an ".article-header__share-buttons--facebook > .bicon-facebook" element
    And I should see an ".article-header__share-buttons--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--twitter > .bicon-twitter" element
    And I should see an ".article-header__share-buttons--linkedin" element with Linkedin share action with title "title1", description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--linkedin > .bicon-linkedin" element
    And I should see an ".article-header__share-buttons--print" element
    And I should see an ".article-header__share-buttons--print > .bicon-print" element
