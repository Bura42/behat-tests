Feature: Embedded quote
  In order to understand article subject
  As a visitor
  I want to see articles quote

  Scenario: Show article body
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | Article title                                                |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/bondquotes" id="1"} more body |
    And equipment exist:
      | option | value                                |
      | type   | quote                                |
      | title  | Equipment title                      |
      | author | I don't know                         |
      | quote  | Some nice phrase related to article? |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                            |
      | more body                            |
      | I don't know                         |
      | Some nice phrase related to article? |

  Scenario: Show longRead article embedded quote
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | longread                                                     |
      | title       | Article title                                                |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/bondquotes" id="1"} more body |
    And equipment exist:
      | option | value                                |
      | type   | quote                                |
      | title  | Equipment title                      |
      | author | I don't know                         |
      | quote  | Some nice phrase related to article? |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                            |
      | more body                            |
      | I don't know                         |
      | Some nice phrase related to article? |

  Scenario: Show longRead article embedded quote
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | longread                                                     |
      | title       | Article title                                                |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/bondquotes" id="1"} more body |
    And equipment exist:
      | option | value                                |
      | type   | quote                                |
      | title  | Equipment title                      |
      | author | I don't know                         |
      | quote  | Some nice phrase related to article? |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "Article title" has tag "Longread > Black background"
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body                            |
      | more body                            |
      | I don't know                         |
      | Some nice phrase related to article? |
    And I should see an "body.longread--bg-black" element
