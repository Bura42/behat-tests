Feature: Factboxes
  In order to understand article subject
  As a visitor
  I want to see article factboxes

  Scenario: Show embedded factbox
    Given "news" article page exists
    And article exist:
      | option      | value                                                   |
      | type        | news                                                    |
      | title       | Article title                                           |
      | article_url | /article/title1                                         |
      | body        | some body {embedded type="node/facts" id="1"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has embedded equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | more body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see "Udvid faktaboks"

  Scenario: Show default factbox
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | some body       |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has default equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see an "button.article-embedded-factbox__button" element
    And I should see an "aside.article-embedded-factbox" element
    And I should not see an "aside.article-embedded-factbox.expanded" element

  Scenario: Show embedded and default factbox at the same time
    Given "news" article page exists
    And article exist:
      | option      | value                                                                                       |
      | type        | news                                                                                        |
      | title       | Article title                                                                               |
      | article_url | /article/title1                                                                             |
      | body        | some body {embedded type="node/facts" id="1"} {embedded type="node/facts" id="2"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title1                      |
      | fact   | Here we have truly amazing fact! |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title2                      |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has embedded equipment "Fact title1"
    And article "Article title" has default equipment "Fact title2"
    When I go to "/article/title1"

  Scenario: Show longRead article default factbox
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | some body       |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has default equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see an "button.article-embedded-factbox__button" element
    And I should see an "aside.article-embedded-factbox" element
    And I should not see an "aside.article-embedded-factbox.expanded" element

  Scenario: Show longRead article embedded factbox
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                   |
      | type        | longread                                                |
      | title       | Article title                                           |
      | article_url | /article/title1                                         |
      | body        | some body {embedded type="node/facts" id="1"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has embedded equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | more body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see "Udvid faktaboks"

  Scenario: Show longRead article left half width embedded factbox
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                   |
      | type        | longread                                                                                |
      | title       | Article title                                                                           |
      | article_url | /article/title1                                                                         |
      | body        | some body {embedded type="node/facts" id="1" width="half_width" align="left"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has embedded equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | more body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see "Udvid faktaboks"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article right half width embedded factbox
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                    |
      | type        | longread                                                                                 |
      | title       | Article title                                                                            |
      | article_url | /article/title1                                                                          |
      | body        | some body {embedded type="node/facts" id="1" width="half_width" align="right"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And article "Article title" has embedded equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | more body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see "Udvid faktaboks"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show longRead article embedded factbox with black background
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                   |
      | type        | longread                                                |
      | title       | Article title                                           |
      | article_url | /article/title1                                         |
      | body        | some body {embedded type="node/facts" id="1"} more body |
    And equipment exist:
      | option | value                            |
      | type   | fact                             |
      | title  | Fact title                       |
      | fact   | Here we have truly amazing fact! |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "Article title" has tag "Longread > Black background"
    And article "Article title" has embedded equipment "Fact title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                        |
      | more body                        |
      | Fact title                       |
      | Here we have truly amazing fact! |
    And I should see "Udvid faktaboks"
    And I should see an "body.longread--bg-black" element
