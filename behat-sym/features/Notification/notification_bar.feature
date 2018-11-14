Feature: Notification bar
  In order to see what are the most important articles
  As a visitor
  I should be able to see notification bar

  Scenario: Don't show notification bar if there are no articles in queues
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    When I go to "/article/title1"
    Then I should not see an ".teaser-oneliner" element

  Scenario: Don't show "Breaking news" notification bar when it is self referencing
    Given "news" article page exists
    And articles exist in list with nodeId "6257" and name "www.b.dk > Artikel > Breaking":
      | title  | article_url     | type |
      | title1 | /article/title1 | news |
    When I go to "/article/title1"
    Then I should not see an ".teaser-oneliner" element

  Scenario: Show "Breaking news" and "Others also read" notification bars (in view one is on top o the other)
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    And articles exist in list with nodeId "6257" and name "www.b.dk > Artikel > Breaking":
      | title  | article_url     | type |
      | title2 | /article/title2 | news |
    And articles exist in list with nodeId "6256" and name "www.b.dk > Artikel > Andre læser også":
      | title  | article_url     | type |
      | title3 | /article/title3 | news |
    When I go to "/article/title1"
    Then I should see "title2" in the ".teaser-oneliner.teaser-oneliner--breaking" element
    And I should see "title3" in the ".teaser-oneliner.teaser-oneliner--default" element
    And I should see an ".teaser-oneliner.teaser-oneliner--breaking .teaser-oneliner__title" element with attribute "href" set to "/article/title2"
    And I should see an ".teaser-oneliner.teaser-oneliner--default .teaser-oneliner__title" element with attribute "href" set to "/article/title3"

  Scenario: Show "Others also read" notification bar on large article page (when "Breaking news" node queue is empty)
    Given "large" article page exists
    And article exist:
      | option      | value           |
      | type        | large           |
      | title       | title1          |
      | article_url | /article/title1 |
    And articles exist in list with nodeId "6256" and name "www.b.dk > Artikel > Andre læser også":
      | title  | article_url     | type |
      | title2 | /article/title2 | news |
    When I go to "/article/title1"
    Then I should see "title2" in the ".teaser-oneliner.teaser-oneliner--default" element

  Scenario: Don't show notification bar on longRead article page
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | title1          |
      | article_url | /article/title1 |
    And articles exist in list with nodeId "6256" and name "www.b.dk > Artikel > Andre læser også":
      | title  | article_url     | type |
      | title2 | /article/title2 | news |
    When I go to "/article/title1"
    Then I should not see an ".teaser-oneliner" element

  Scenario: Show notification bar on news plus article page
    Given "newsPlus" article page exists
    And article exist:
      | option      | value           |
      | type        | news_plus        |
      | title       | title1          |
      | article_url | /article/title1 |
    And articles exist in list with nodeId "6256" and name "www.b.dk > Artikel > Andre læser også":
      | title  | article_url     | type |
      | title2 | /article/title2 | news |
    When I go to "/article/title1"
    Then I should see "title2" in the ".teaser-oneliner.teaser-oneliner--default" element
