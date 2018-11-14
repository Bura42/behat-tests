Feature: Author teasers
  In order to know author publications
  As a visitor
  I want to see author articles as teasers

  Scenario: Show author teasers
    Given menu exists
    Given author page exists
    And articles exist in list:
      | title   | article_url      | type | main_image                     | summary         |
      | title1  | /article/title1  | news | game-of-thrones-main-image.jpg | Article summary |
      | title2  | /article/title2  | news | game-of-thrones-main-image.jpg | Article summary |
      | title3  | /article/title3  | news | game-of-thrones-main-image.jpg | Article summary |
      | title4  | /article/title4  | news | game-of-thrones-main-image.jpg | Article summary |
      | title5  | /article/title5  | news | game-of-thrones-main-image.jpg | Article summary |
      | title6  | /article/title6  | news | game-of-thrones-main-image.jpg | Article summary |
      | title7  | /article/title7  | news | game-of-thrones-main-image.jpg | Article summary |
      | title8  | /article/title8  | news | game-of-thrones-main-image.jpg | Article summary |
      | title9  | /article/title9  | news | game-of-thrones-main-image.jpg | Article summary |
      | title10 | /article/title10 | news | game-of-thrones-main-image.jpg | Article summary |
      | title11 | /article/title11 | news | game-of-thrones-main-image.jpg | Article summary |
      | title12 | /article/title12 | news | game-of-thrones-main-image.jpg | Article summary |
      | title13 | /article/title13 | news | game-of-thrones-main-image.jpg | Article summary |
      | title14 | /article/title14 | news | game-of-thrones-main-image.jpg | Article summary |
      | title15 | /article/title15 | news | game-of-thrones-main-image.jpg | Article summary |
      | title16 | /article/title16 | news | game-of-thrones-main-image.jpg | Article summary |
      | title17 | /article/title17 | news | game-of-thrones-main-image.jpg | Article summary |
      | title18 | /article/title18 | news | game-of-thrones-main-image.jpg | Article summary |
      | title19 | /article/title19 | news | game-of-thrones-main-image.jpg | Article summary |
      | title20 | /article/title20 | news | game-of-thrones-main-image.jpg | Article summary |
      | title21 | /article/title21 | news | game-of-thrones-main-image.jpg | Article summary |
      | title22 | /article/title22 | news | game-of-thrones-main-image.jpg | Article summary |
      | title23 | /article/title23 | news | game-of-thrones-main-image.jpg | Article summary |
      | title24 | /article/title24 | news | game-of-thrones-main-image.jpg | Article summary |
      | title25 | /article/title25 | news | game-of-thrones-main-image.jpg | Article summary |
    And author exist:
      | option       | value              |
      | author_name  | Kate Doe           |
      | author_email | test@berlingske.dk |
    And "Kate Doe" is author of "title1" article
    And "Kate Doe" is author of "title2" article
    And "Kate Doe" is author of "title3" article
    And "Kate Doe" is author of "title4" article
    And "Kate Doe" is author of "title5" article
    And "Kate Doe" is author of "title6" article
    And "Kate Doe" is author of "title7" article
    And "Kate Doe" is author of "title8" article
    And "Kate Doe" is author of "title9" article
    And "Kate Doe" is author of "title10" article
    And "Kate Doe" is author of "title11" article
    And "Kate Doe" is author of "title12" article
    And "Kate Doe" is author of "title13" article
    And "Kate Doe" is author of "title14" article
    And "Kate Doe" is author of "title15" article
    And "Kate Doe" is author of "title16" article
    And "Kate Doe" is author of "title17" article
    And "Kate Doe" is author of "title18" article
    And "Kate Doe" is author of "title19" article
    And "Kate Doe" is author of "title20" article
    And "Kate Doe" is author of "title21" article
    And "Kate Doe" is author of "title22" article
    And "Kate Doe" is author of "title23" article
    And "Kate Doe" is author of "title24" article
    And "Kate Doe" is author of "title25" article
    When I go to "/staff/1"
    Then I should see "title1"
    And I should see "Article summary"
    And I should see an "#Advertorial_1" element
    And I should see an "#Advertorial_2" element
    And I should see an "#MAdvertorial_1" element
    And I should see an "#MAdvertorial_2" element
    And I should see an "#Leaderboard_2" element
    And I should see an "#Leaderboard_3" element
    And I should see an ".teaser-img-right.teaser-small.item-teaser-bt" element
    And I should see "Seneste artikler af Kate Doe"
    And I should see images with filters:
      | name                           | filter        | load_type |
      | game-of-thrones-main-image.jpg | image_320x180 | lazy      |
    And I should see the list of elements:
      | title1  |
      | title2  |
      | title3  |
      | title4  |
      | title5  |
      | title6  |
      | title7  |
      | title8  |
      | title9  |
      | title10 |
      | title11 |
      | title12 |
      | title13 |
      | title14 |
      | title15 |
      | title16 |
      | title17 |
      | title18 |
      | title19 |
      | title20 |
      | title21 |
      | title22 |
      | title23 |
      | title24 |
      | title25 |
    And I should see "Anmeldelser" in the ".main-navigation" element

  Scenario: Get 404 response on staff url
    When I go to "staff"
    Then the response status code should be 404
