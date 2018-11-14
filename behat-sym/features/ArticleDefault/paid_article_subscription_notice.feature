Feature: Article subscription notice
  In order to recognize paid article
  As a visitor
  I want to see subscription notice

  Scenario: Show subscription notice in plus news article
    Given "newsPlus" article page exists
    And article exist:
      | option      | value           |
      | type        | news_plus       |
      | title       | title1          |
      | article_url | /news_plus/sub1 |
    When I go to "/news_plus/sub1"
    And I should see "For abonnenter" in the ".article-header .subscriber-notice" element

  Scenario: Show subscription notice in plus longRead article
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread_plus                  |
      | title       | title1                         |
      | article_url | /longread_plus/sub2            |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/longread_plus/sub2"
    And I should see "For abonnenter" in the ".longread-header .subscriber-notice.text-center" element

  Scenario: Show subscription notice in plus large article
    Given "largePlus" article page exists
    And article exist:
      | option      | value            |
      | type        | large_plus       |
      | title       | title1           |
      | article_url | /large_plus/sub3 |
    When I go to "/large_plus/sub3"
    And I should see "For abonnenter" in the ".article-header .subscriber-notice" element

  Scenario: Show subscription notice in plus video article
    Given "videoPlus" article page exists
    And article exist:
      | option      | value            |
      | type        | video_plus       |
      | title       | title1           |
      | article_url | /video_plus/sub4 |
    When I go to "/video_plus/sub4"
    And I should see "For abonnenter" in the ".article-header .subscriber-notice" element
