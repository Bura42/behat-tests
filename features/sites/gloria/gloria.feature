Feature: Gloria feature
  As a site visitor
  I want check gloria
  So that I know I am on the right site

  Scenario: Visitor visits the homepage and check site
    Given I restart the browser
    Given I visit "https://www.gloria.fi/"
    Then I accept cookie
    Then I should see "Saat tuoreimmat sisällöt suoraan sähköpostiisi!"


