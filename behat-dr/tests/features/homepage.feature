Feature: Homepage
  As a site visitor
  I want see the welcome message
  So that I know I am on the right site

  Background:
    Given I am on the homepage

  @menaiset
  Scenario: Visitor visits the homepage and observes the welcome message
    Then I should see "Tilaa Me Naiset"

  @kekmama
  Scenario: Visitor visits the homepage and observes the welcome message
    Then I should see "ABONNEREN"

  @gloria
  Scenario: Visitor visits the homepage and observes the welcome message
    Then I should see "Tilaa Gloria"

  @vauva
  Scenario: Visitor visits the homepage and observes the welcome message
    Then I should see "Tilaa Gloria"
