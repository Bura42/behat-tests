@superguide
@api
Feature: superguide feature

  Scenario: Visitor visits the homepage and check site
    Given I restart the browser
    Given I am on the homepage
    Then I accept cookie
    Then I should see "Kirjaudu"


