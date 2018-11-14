Feature: Search results page
  In order to find articles by different criteria
  As a visitor
  I want to see the list of articles by these criteria on search result page

  @integration
  Scenario: Show search results page
    When I go to "/search/article"
    Then I should see "Søgeresultat" in the "h1.section-title-no-border" element
    And I should see "resultater for \"article\"."
    And I should see an "#searchInputAdv" element with attribute "value" set to "article"
    And I should see an "div.search-results" element
