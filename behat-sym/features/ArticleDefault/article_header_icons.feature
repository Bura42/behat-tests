Feature: Article header icons
  In order to be able to share content
  As a visitor
  I want to see header social share icons

  Scenario: Show news article with header icons
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
    And I should see an ".article-header__share-buttons--facebook" element with Facebook share action
    And I should see an ".article-header__share-buttons--facebook > .bicon-facebook" element
    And I should see an ".article-header__share-buttons--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-header__share-buttons--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--twitter > .bicon-twitter" element
    And I should see an ".article-header__share-buttons--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-header__share-buttons--linkedin" element with Linkedin share action with title "title1", description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--linkedin > .bicon-linkedin" element
    And I should see an ".article-header__share-buttons--linkedin" element with attribute "title" set to "Del på LinkedIn"
    And I should see an ".article-header__share-buttons--print" element
    And I should see an ".article-header__share-buttons--print > .bicon-print" element
    And I should see an ".article-header__share-buttons--print" element with attribute "title" set to "Print artiklen"

  Scenario: Show longRead article with header icons
    Given longRead article page exists
    And article exist:
      | option      | value                             |
      | title       | title1                            |
      | type        | longread                          |
      | article_url | /article/title1                   |
      | body        | article body                      |
      | summary     | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-header__share-buttons--facebook" element with Facebook share action
    And I should see an ".article-header__share-buttons--facebook > .bicon-facebook" element
    And I should see an ".article-header__share-buttons--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-header__share-buttons--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--twitter > .bicon-twitter" element
    And I should see an ".article-header__share-buttons--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-header__share-buttons--linkedin" element with Linkedin share action with title "title1", description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--linkedin > .bicon-linkedin" element
    And I should see an ".article-header__share-buttons--linkedin" element with attribute "title" set to "Del på LinkedIn"
    And I should see an ".article-header__share-buttons--print" element
    And I should see an ".article-header__share-buttons--print > .bicon-print" element
    And I should see an ".article-header__share-buttons--print" element with attribute "title" set to "Print artiklen"

  Scenario: Show large article with header icons
    Given large article page exists
    And article exist:
      | option      | value                             |
      | title       | title1                            |
      | type        | large                             |
      | article_url | /article/title1                   |
      | body        | article body                      |
      | summary     | I am nice article share me please |
    When I go to "/article/title1"
    Then I should see "article body"
    And I should see an ".article-header__share-buttons--facebook" element with Facebook share action
    And I should see an ".article-header__share-buttons--facebook > .bicon-facebook" element
    And I should see an ".article-header__share-buttons--facebook" element with attribute "title" set to "Del på Facebook"
    And I should see an ".article-header__share-buttons--twitter" element with Twiter share action with description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--twitter > .bicon-twitter" element
    And I should see an ".article-header__share-buttons--twitter" element with attribute "title" set to "Del på Twitter"
    And I should see an ".article-header__share-buttons--linkedin" element with Linkedin share action with title "title1", description "I am nice article share me please" and link "/article/title1"
    And I should see an ".article-header__share-buttons--linkedin > .bicon-linkedin" element
    And I should see an ".article-header__share-buttons--linkedin" element with attribute "title" set to "Del på LinkedIn"
    And I should see an ".article-header__share-buttons--print" element
    And I should see an ".article-header__share-buttons--print > .bicon-print" element
    And I should see an ".article-header__share-buttons--print" element with attribute "title" set to "Print artiklen"
