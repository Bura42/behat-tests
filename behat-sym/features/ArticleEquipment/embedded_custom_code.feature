Feature: Embedded custom code
  In order to understand article subject
  As a visitor
  I want to see articles custom code

  Scenario: Show article body
    Given "news" article page exists
    And article exist:
      | option      | value                                                              |
      | type        | news                                                               |
      | title       | Article title                                                      |
      | article_url | /article/title1                                                    |
      | body        | some body {embedded type="node/custom_code_html" id="1"} more body |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body      |
      | more body      |
      | Equipment code |
    And I should not see an ".article-embed-center" element

  Scenario: Show article body with embedded twitter widget
    Given "news" article page exists
    And article exist:
      | option      | value                                                              |
      | type        | news                                                               |
      | title       | Article title                                                      |
      | article_url | /article/title2                                                    |
      | body        | some body {embedded type="node/custom_code_html" id="1"} more body |
    And equipment exist:
      | option      | value                                                                                                                                                                                                                                                                   |
      | type        | custom_code                                                                                                                                                                                                                                                             |
      | custom_code | <blockquote class="twitter-tweet" data-lang="da">&mdash; Anders FjordbakTrier (@aftrier) <a href="http://twitter.com/aftrier/status/828335451337588737">5. februar 2017</a></blockquote><script class="twitter-script" async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>|
      | title       | Equipment title                                                                                                                                                                                                                                                         |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title2"
    Then I should see the list of elements:
      | some body            |
      | more body            |
      | Anders FjordbakTrier |
    And I should see an ".article-embed-center" element
    And I should see an "script.twitter-script" element with attribute "src" set to "https://platform.twitter.com/widgets.js"

  Scenario: Show embedded custom code - longread article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                              |
      | type        | longread                                                           |
      | title       | Article title                                                      |
      | article_url | /article/title3                                                    |
      | summary     | Article subtitle                                                   |
      | body        | some body {embedded type="node/custom_code_html" id="1"} more body |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title3"
    Then I should see the list of elements:
      | some body      |
      | more body      |
      | Equipment code |
    And I should not see an ".article-embed-center" element

  Scenario: Show embedded left half width custom code - longread article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                              |
      | type        | longread                                                                                           |
      | title       | Article title                                                                                      |
      | article_url | /article/title3                                                                                    |
      | summary     | Article subtitle                                                                                   |
      | body        | some body {embedded type="node/custom_code_html" id="1" width="half_width" align="left"} more body |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title3"
    Then I should see the list of elements:
      | some body      |
      | more body      |
      | Equipment code |
    And I should not see an ".article-embed-center" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show embedded right half width custom code - longread article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                               |
      | type        | longread                                                                                            |
      | title       | Article title                                                                                       |
      | article_url | /article/title3                                                                                     |
      | summary     | Article subtitle                                                                                    |
      | body        | some body {embedded type="node/custom_code_html" id="1" width="half_width" align="right"} more body |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title3"
    Then I should see the list of elements:
      | some body      |
      | more body      |
      | Equipment code |
    And I should not see an ".article-embed-center" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show article body with black background
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                              |
      | type        | longread                                                           |
      | title       | Article title                                                      |
      | article_url | /article/title1                                                    |
      | body        | some body {embedded type="node/custom_code_html" id="1"} more body |
    And equipment exist:
      | option      | value           |
      | type        | custom_code     |
      | custom_code | Equipment code  |
      | title       | Equipment title |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "Article title" has tag "Longread > Black background"
    And article "Article title" has embedded equipment "Equipment title"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | some body      |
      | more body      |
      | Equipment code |
    And I should not see an ".article-embed-center" element
    And I should see an "body.longread--bg-black" element
