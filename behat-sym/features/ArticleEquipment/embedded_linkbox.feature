Feature: Embedded linkboxes
  In order to see clear article
  As a visitor
  I should not see embedded linkboxes

  Scenario: Don't show news article embedded linkbox
    Given "news" article page exists
    And article exist:
      | option      | value                                                          |
      | type        | news                                                           |
      | title       | Article title                                                  |
      | article_url | /article/title1                                                |
      | body        | some body {embedded type="node/linkbox" id="1"} more body      |
    And equipment exist:
      | option      | value                                |
      | type        | linkbox                              |
      | title       | Linkbox title                      |
      | description | I don't know                         |
      | url         | /test_linkbox_url                    |
    And article "Article title" has embedded equipment "Linkbox title"
    When I go to "/article/title1"
    Then I should not see "Linkbox title"
