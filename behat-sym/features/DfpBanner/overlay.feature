@javascript @integration
Feature: Show Overlay DFP banner
  In order to monetize
  As a visitor
  I should see Overlay banner

  Background:
    Given snippet "paywall_hard" exist
    And snippet "paywall_soft" exist

  Scenario: Show Overlay banners on free article
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | body        | article body    |
    When I go to "/article/title1"
    Then I should see "#Overlay" div with "Overlay" slotId
    And I should see "#MOverlay" div with "Overlay" slotId

  Scenario: Do not show Overlay banners on paid article when paywall
    Given "newsPlus" article page exists
    And article exist:
      | option      | value           |
      | type        | news_plus       |
      | title       | title1          |
      | article_url | /article/title1 |
      | body        | article body    |
    When I go to "/article/title1"
    Then I should not see an "#Overlay" element
    And I should not see an "#MOverlay" element
    And I should see "For abonnenter" in the ".article-header .subscriber-notice" element
