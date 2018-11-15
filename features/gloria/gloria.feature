Feature: Gloria feature
  As a site visitor
  I want check gloria
  So that I know I am on the right site

  Scenario: Visitor visits the homepage and check site
    Given I am on "https://www.gloria.fi/"
    Then I should see "Saat tuoreimmat sisällöt suoraan sähköpostiisi!" in the "#subscribe_newsletter_block_text" element


