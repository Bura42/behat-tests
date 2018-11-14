Feature: Linkpulse meta tag for paid articles
  In order to have have proper tracking of visited pages
  As a visitor
  I want to have valid meta tags for paid articles
  
  Scenario: Show paid article meta tag for news plus type
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                   |
      | type        | news_plus               |
      | title       | title1                  |
      | article_url | /article/news_plus_meta |
      | body        | this is free body       |
      | body_paid   | this is paid body       |
    And I am on "/article/news_plus_meta"
    Then I should see social meta tags:
      | tag     | value                |
      | lp:type | article_subscription |

  Scenario: Show paid article meta tag for large plus type
    Given "largePlus" article page exists
    And article exist:
      | option      | value                    |
      | type        | large_plus               |
      | title       | title1                   |
      | article_url | /article/large_plus_meta |
      | body        | this is free body        |
      | body_paid   | this is paid body        |
    And I am on "/article/large_plus_meta"
    Then I should see social meta tags:
      | tag     | value                |
      | lp:type | article_subscription |

  Scenario: Show paid article meta tag for longread plus type
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value                       |
      | type        | longread_plus               |
      | title       | title1                      |
      | article_url | /article/longread_plus_meta |
      | body        | this is free body           |
      | body_paid   | this is paid body           |
    And I am on "/article/longread_plus_meta"
    Then I should see social meta tags:
      | tag     | value                |
      | lp:type | article_subscription |

  Scenario: Show paid article meta tag for video plus type
    Given "videoPlus" article page exists
    And article exist:
      | option      | value                    |
      | type        | video_plus               |
      | title       | title1                   |
      | article_url | /article/video_plus_meta |
      | body        | this is free body        |
      | body_paid   | this is paid body        |
    And I am on "/article/video_plus_meta"
    Then I should see social meta tags:
      | tag     | value                |
      | lp:type | article_subscription |

