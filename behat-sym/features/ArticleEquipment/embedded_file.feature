Feature: Embedded file
  In order to understand article subject
  As a visitor
  I want to see article files

  Scenario: Show text file
    Given "news" article page exists
    And article exist:
      | option      | value                                                       |
      | type        | news                                                        |
      | title       | Article title                                               |
      | article_url | /article/title1                                             |
      | body        | some body {embedded type="node/node_file" id="1"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | pdf-file.pdf      |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
    And I should see a "i.bicon-doc-text" element

  Scenario: Show other type of file
    Given "news" article page exists
    And article exist:
      | option      | value                                                       |
      | type        | news                                                        |
      | title       | Article title                                               |
      | article_url | /article/title1                                             |
      | body        | some body {embedded type="node/node_file" id="1"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | zip-file.zip      |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
    And I should see a "i.bicon-download-alt" element

  Scenario: Download file
    Given "news" article page exists
    And article exist:
      | option      | value                                                       |
      | type        | news                                                        |
      | title       | Article title                                               |
      | article_url | /article/title1                                             |
      | body        | some body {embedded type="node/node_file" id="1"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | zip-file.zip      |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should be able to download "Equipment title 1"

  Scenario: Show text file
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                       |
      | type        | longread                                                    |
      | title       | Article title                                               |
      | article_url | /article/title1                                             |
      | body        | some body {embedded type="node/node_file" id="1"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | pdf-file.pdf      |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
    And I should see a "i.bicon-doc-text" element

  Scenario: Show other type of file
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                       |
      | type        | longread                                                    |
      | title       | Article title                                               |
      | article_url | /article/title1                                             |
      | body        | some body {embedded type="node/node_file" id="1"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | zip-file.zip      |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
    And I should see a "i.bicon-download-alt" element

  Scenario: Show several files one after another
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                                                      |
      | type        | longread                                                                                                                   |
      | title       | Article title                                                                                                              |
      | article_url | /article/title1                                                                                                            |
      | body        | some body {embedded type="node/node_file" id="1"} <p>asdasdasdasdasd</p> {embedded type="node/node_file" id="2"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | pdf-file.pdf      |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 2 |
      | file   | zip-file.zip      |
    And article "Article title" has embedded equipment "Equipment title 1"
    And article "Article title" has embedded equipment "Equipment title 2"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
      | Equipment title 2 |
    And I should see a "i.bicon-download-alt" element
    And I should see a "i.bicon-doc-text" element

  Scenario: Show several files one after another with black background
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                                                      |
      | type        | longread                                                                                                                   |
      | title       | Article title                                                                                                              |
      | article_url | /article/title1                                                                                                            |
      | body        | some body {embedded type="node/node_file" id="1"} <p>asdasdasdasdasd</p> {embedded type="node/node_file" id="2"} more body |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 1 |
      | file   | pdf-file.pdf      |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 2 |
      | file   | zip-file.zip      |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "Article title" has tag "Longread > Black background"
    And article "Article title" has embedded equipment "Equipment title 1"
    And article "Article title" has embedded equipment "Equipment title 2"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body         |
      | more body         |
      | Download          |
      | Equipment title 1 |
      | Equipment title 2 |
    And I should see a "i.bicon-download-alt" element
    And I should see a "i.bicon-doc-text" element
    And I should see an "body.longread--bg-black" element
