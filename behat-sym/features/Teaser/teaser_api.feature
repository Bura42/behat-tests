Feature: Teaser Block
  In order to create teaser block
  As a site manager
  I should be able to use Teaser building block

  Scenario: API response test
    When I request "bm_basic_data.teaser.various_sources" building block
    Then I should get valid configuration for "bm_basic_data.teaser.various_sources":
    | optionName |
    | name       |
    | template   |
    And I should get valid common block configuration
