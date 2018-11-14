Feature: Snippet API management
  In order to manage snippet
  As a visitor
  I want to see the list of manage and change them

  Background:
    Given snippet "paywall_hard" exist
    And snippet "paywall_soft" exist

  Scenario: Display snippet
    Given I request "/api/v1/snippets"
    Then the response should be JSON
    And response status code should be 200
    Then response data params should be set to:
      | parameter           | value                   |
      | [0].id              | paywall_hard            |
      | [0].objects[0].name | message                 |
      | [0].objects[1].name | button_buy_text         |
      | [0].objects[2].name | button_buy_link         |
      | [0].objects[3].name | button_buy_css          |
      | [0].objects[4].name | login_text              |
      | [0].objects[5].name | login_cta               |
      | [0].objects[6].name | message_no_access       |
      | [1].id              | paywall_soft            |
      | [1].objects[0].name | message                 |
      | [1].objects[1].name | button_buy_text         |
      | [1].objects[2].name | button_buy_link         |
      | [1].objects[3].name | button_buy_css          |
      | [1].objects[4].name | continue_reading_text   |
      | [1].objects[5].name | login_text              |
      | [1].objects[6].name | login_cta               |
    And response data params should not be set to:
      | parameter           | value                   |
      | [1].objects[7].name | message_no_access       |

  Scenario: Changing snippet
    Given I put request "/api/v1/snippets/paywall_hard" with '{"id":"paywall_hard","objects":[{"name":"button_buy_text","type":"input","content":"test", "position": 1},{"name":"button_buy_link","type":"input","content":"b", "position": 2},{"name":"message_no_access","type":"textarea","content":"q", "position": 3}, {"name":"message","type":"textarea","content":"q", "position": 4}, {"name":"button_buy_css","type":"input","content":"a", "position": 5}, {"name":"login_text","type":"input","content":"login_text", "position": 6}, {"name":"login_cta","type":"input","content":"login_cta", "position": 7}]}'
    And response status code should be 204
    And I request "/api/v1/snippets"
    Then the response should be JSON
    And response status code should be 200
    Then response data params should be set to:
      | parameter              | value           |
      | [0].id                 | paywall_hard    |
      | [0].objects[0].name    | button_buy_text |
      | [0].objects[0].content | test            |
