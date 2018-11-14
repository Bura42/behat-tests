Feature: Show DFP banners in articles
  In order to monetize
  As a visitor
  I should see DFP banners

  Scenario: Displaying banners in news article
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | type             | news            |
    When I go to "/article/title1"
    Then I should see "#Leaderboard_1" div with "Leaderboard_1" slotId
    And I should see "#MLeaderboard_1" div with "Leaderboard_1" slotId
    And I should see "#Article_marketing" div with "Article_marketing" slotId
    And I should see "#Square_2" div with "Square_2" slotId


  Scenario: Remove "Article_marketing" and "Square_2" banners from article body by presentation tag (free article)
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | body        | article body    |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Artikel > Fjern bannere i brødtekst |
      | name      | www.b.dk > Artikel > Fjern bannere i brødtekst |
    And article "title1" has tag "www.b.dk > Artikel > Fjern bannere i brødtekst"
    When I go to "/article/title1"
    Then I should not see "#Article_marketing"
    And I should not see "#Square_2"

  Scenario: Remove "Article_marketing" and "Square_2" banners from article body by presentation tag (paid article)
    Given "newsPlus" article page exists
    And article exist:
      | option      | value           |
      | type        | news_plus       |
      | title       | title1          |
      | article_url | /article/title1 |
      | body        | article body    |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Artikel > Fjern bannere i brødtekst |
      | name      | www.b.dk > Artikel > Fjern bannere i brødtekst |
    And article "title1" has tag "www.b.dk > Artikel > Fjern bannere i brødtekst"
    When I go to "/article/title1"
    Then I should not see "#Article_marketing"
    And I should not see "#Square_2"
    And I should see "For abonnenter" in the ".article-header .subscriber-notice" element
