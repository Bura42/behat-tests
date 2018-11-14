Feature: Article authors byline
  In order to know article authors
  As a visitor
  I want to see article authors byline

  Scenario: Show only freetext byline if author is not set
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title     |
      | Af some free text |
      | article body      |
    And I should not see "Kate Doe" in the ".article-layout" element

  Scenario: Show author og freeline text (if author is set and freeline text doesn't begin with comma)
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/thisIsMyAccount       |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title              |
      | some free text             |
      | article body               |
      | Kate Doe og some free text |

  Scenario: Show the freetext byline should only be shown after the last author byline
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | Google          |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/acc                   |
      | author_email   | test@berlingske.dk                       |
    And author exist:
      | option         | value                                    |
      | author_name    | Jessica Black                            |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/acc                   |
      | author_email   | test@berlingske.dk                       |
    And author exist:
      | option         | value                                    |
      | author_name    | Natalia Woods                            |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/acc                   |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    And "Jessica Black" is author of "Article title" article
    And "Natalia Woods" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title           |
      | article body            |
      | Natalia Woods og Google |
    And I should not see "Kate Doe og Google" in the ".article-layout" element
    And I should not see "Jessica Black og Google" in the ".article-layout" element

  Scenario: Show author, freeline text (if author is set and freeline text begins with comma)
    Given "news" article page exists
    And article exist:
      | option           | value            |
      | type             | news             |
      | title            | Article title    |
      | article_url      | /article/title1  |
      | body             | article body     |
      | author_free_text | , some free text |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | https://twitter.com/thisIsMyAccount      |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title             |
      | some free text            |
      | article body              |
      | Kate Doe , some free text |
      | thisIsMyAccount           |
    And I should not see "Kate Doe og some free text" in the ".article-layout" element
    And I should not see "https://twitter.com/thisIsMyAccount"

  Scenario: Show regular author byline
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | article body    |
    And author exist:
      | option         | value                                                     |
      | author_name    | Kate Doe                                                  |
      | author_image   | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_twitter | https://www.twitter.com/thisIsMyAccount                   |
      | author_url     | /redaktionen/kate-doe                                     |
      | author_email   | test@berlingske.dk                                        |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title   |
      | article body    |
      | Kate Doe        |
      | Who Cares       |
      | thisIsMyAccount |
    And I should not see "https://www.twitter.com/thisIsMyAccount"

  Scenario: Show author and freetext byline in longread
    Given longRead article page exists
    And article exist:
      | option           | value                          |
      | type             | longread                       |
      | title            | Article title                  |
      | article_url      | /article/title1                |
      | body             | article body                   |
      | author_free_text | some free text                 |
      | main_image       | game-of-thrones-main-image.jpg |
    And author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/thisIsMyAccount       |
      | author_email   | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title              |
      | some free text             |
      | article body               |
      | Kate Doe og some free text |

  Scenario: Show regular author byline in longread
    Given longRead article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | title       | Article title                  |
      | article_url | /article/title1                |
      | body        | article body                   |
      | main_image  | game-of-thrones-main-image.jpg |
    And author exist:
      | option         | value                                                     |
      | author_name    | Kate Doe                                                  |
      | author_image   | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_twitter | https://www.twitter.com/thisIsMyAccount                   |
      | author_url     | /redaktionen/kate-doe                                     |
      | author_email   | test@berlingske.dk                                        |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@berlingske.dk                       |
    And "Kate Doe" is author of "Article title" article
    And "Who Cares" is author of "Article title" article
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Article title   |
      | article body    |
      | Kate Doe        |
      | Who Cares       |
      | thisIsMyAccount |

  Scenario: Add "by" before profile name when author doesn't have profile picture
    Given "news" article page exists
    And article exist:
      | option      | value                      |
      | type        | news                       |
      | title       | Article title              |
      | article_url | /article/title1_no_picture |
      | body        | article body               |
    And author exist:
      | option       | value              |
      | author_name  | Kate Doe           |
      | author_email | test@berlingske.dk |
    And "Kate Doe" is author of "Article title" article
    When I go to "/article/title1_no_picture"
    Then I should see "Af Kate Doe" in the ".article-content__byline-author-info" element
