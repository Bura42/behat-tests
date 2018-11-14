Feature: Follow author
  In order get notifications about new articles
  As a visitor
  I want to subscribe to authors recipient list

  @javascript
  Scenario: Follow author email submit
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/follow |
      | body        | article body    |
    And author exist:
      | option         | value                                                     |
      | author_name    | Kate Doe                                                  |
      | author_image   | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_twitter | https://www.twitter.com/thisIsMyAccount                   |
      | author_url     | /redaktionen/kate-doe                                     |
      | author_email   | test@berlingske.dk                                        |
    And "Kate Doe" is author of "Article title" article
    And author "Kate Doe" has subscription list
    And I am on "/article/follow"
    And I click on ".article-content__byline-author-follow button"
    And I wait for ".article-follow-1.in" element
    When I fill in element "input[name='input-follow-author-1']" with content "test@test.dk" using jquery
    And I click on ".form-follow-author .btn"
    Then I wait for ".form-oneliner-ok" element

  @javascript
  Scenario: Follow second author email submit
    Given "news" article page exists
    And article exist:
      | option      | value                                              |
      | type        | news                                               |
      | title       | EU-topmøde, armlægning og 10 scener fra valgnatte1 |
      | article_url | /article/follow1                                   |
      | body        | article body                                       |
    And author exist:
      | option         | value                                                     |
      | author_name    | Kate Doe                                                  |
      | author_image   | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_twitter | https://www.twitter.com/thisIsMyAccount                   |
      | author_url     | /redaktionen/kate-doe                                     |
      | author_email   | test@berlingske.dk                                        |
    And author exist:
      | option       | value                                                     |
      | author_name  | Does Not Matter                                           |
      | author_image | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_url   | /redaktionen/does-not-matter                              |
      | author_email | test@berlingske.dk                                        |
    And "Kate Doe" is author of "EU-topmøde, armlægning og 10 scener fra valgnatte1" article
    And "Does Not Matter" is author of "EU-topmøde, armlægning og 10 scener fra valgnatte1" article
    And author "Does Not Matter" has subscription list
    And I am on "/article/follow1"
    And I click on ".article-content__byline-author-follow button[data-target='#follow-author-2']"
    And I wait for ".article-follow-2.in" element
    When I fill in element "input[name='input-follow-author-2']" with content "test@test.dk" using jquery
    And I click on ".article-follow-2.in .form-follow-author .btn"
    Then I wait for ".article-follow-2.in .form-oneliner-ok" element

  Scenario: Send emails to recipents
    Given article with nodeId "38605725" was imported from bond
    And author "bm-bewi" has subscription list
    When article with nodeId "37768943" is imported from bond
    Then notifications to authors "bm-bewi" subscription list subscribers should be sent
