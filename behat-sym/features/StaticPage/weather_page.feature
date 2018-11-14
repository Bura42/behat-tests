Feature: Displaying weather forecast on dedicated page
  In order to be able to check weather forecast
  As a visitor|user
  I should be able to see forecast dedicated page

  Scenario: See the weather forecast
    Given "custom_page" site manager page exists:
      | option      | value   |
      | url         | /vejret |
      | title       | Vejret  |
      | description | Vejret  |
    And "bm_storm_geo.block" building block exists:
      | option | value |
    And blocks are added to page
    When I go to "/vejret"
    Then I should see an "#storm247" element

  Scenario: API response test
    When I request "bm_storm_geo.block" building block
    Then I should get valid configuration for "bm_storm_geo.block":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration
