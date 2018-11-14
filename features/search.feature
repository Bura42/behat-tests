Feature: search wiki
  in order learn about bdd
  as a pas deve
  i need to able...

  Scenario: Seach for BDD
    Given I am on wikipedia
    When  I search for "Behavior driven development"
    Then the first heading should be "Behavior-driven development"