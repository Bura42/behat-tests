Feature: Author header profile page
  In order to know author
  As a visitor
  I want to see author profile page

  Scenario: Show author with full profile
    Given author page exists
    And author exist:
      | option            | value                                    |
      | author_name       | Kate Doe                                 |
      | author_image      | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter    | http://twitter.com/thisIsMyAccount       |
      | author_facebook   | http://facebook.com/a                    |
      | author_email      | test@berlingske.dk                       |
      | author_phone      | +48 606 606 606                          |
      | author_about_info | about info                               |
    And "Kate Doe" is author of "Article title" article
    When I go to "/staff/1"
    Then I should see the list of elements:
      | Kate Doe           |
      | about info         |
      | test@berlingske.dk |
      | Facebook           |
      | thisIsMyAccount    |
      | +48 60 66 06 60 6  |
      | Følg               |

  Scenario: Show author with minimum profile information
    Given author page exists
    And author exist:
      | option       | value              |
      | author_name  | Kate Doe           |
      | author_email | test@berlingske.dk |
    And "Kate Doe" is author of "Article title" article
    When I go to "/staff/1"
    Then I should see the list of elements:
      | Kate Doe           |
      | test@berlingske.dk |
    And I should not see the list of elements:
      | about info      |
      | Facebook        |
      | thisIsMyAccount |

  Scenario: Show page type metadata on author page
    Given author page exists
    And author exist:
      | option       | value              |
      | author_name  | Kate Doe           |
      | author_email | test@berlingske.dk |
    And "Kate Doe" is author of "Article title" article
    When I go to "/staff/1"
    Then I should see social meta tags:
      | tag     | value   |
      | og:type | website |
