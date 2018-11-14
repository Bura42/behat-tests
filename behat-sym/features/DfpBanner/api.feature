Feature: Expose DFP block configuration to Site Manager
  In order to be able to configure banners
  As a site manager
  I should see get valid block configuration

  Scenario: API response test
    When I request "bm_dfp.banner.block" building block
    Then I should get valid configuration for "bm_dfp.banner.block":
      | optionName |
      | name       |
      | template   |
      | slotId     |
    And I should get valid common block configuration

  Scenario: Display banner configurations
    Given banner configuration "Leaderboard_1" exist
    And banner configuration "Overlay" exist
    And I request "/api/v1/banner_configurations"
    Then the response should be JSON
    And response status code should be 200
    Then response data params should be set to:
      | parameter                       | value         |
      | [0].id                          | 1             |
      | [0].name                        | Leaderboard_1 |
      | [0].hideOnList                  | false         |
      | [0].addToAllPages               | false         |
      | [0].outOfPage                   | false         |
      | [0].devices[0].name             | desktop       |
      | [0].devices[0].dimensions[0][0] | 930           |
      | [0].devices[0].dimensions[0][1] | 180           |
      | [0].devices[1].name             | mobile        |
      | [0].devices[1].dimensions[0][0] | 320           |
      | [0].devices[1].dimensions[0][1] | 320           |
      | [1].id                          | 2             |
      | [1].name                        | Overlay       |
      | [1].hideOnList                  | true          |
      | [1].addToAllPages               | true          |
      | [1].outOfPage                   | true          |
      | [1].devices[0].name             | mobile        |
      | [1].devices[0].dimensions[0][0] | 320           |
      | [1].devices[0].dimensions[0][1] | 320           |

  Scenario: Changing banner configuration
    Given banner configuration "Leaderboard_1" exist
    And I put request "/api/v1/banner_configurations/1" with '{"name":"Leaderboard_1","devices":[{"name":"desktop","dimensions":[[2,2]]},{"name":"mobile","dimensions":[[1,1]]},{"name": "tablet","dimensions": [[21,21]]}],"addToAllPages":false, "outOfPage":true,"hideOnList":true ,"loadType":"eager"}'
    And response status code should be 204
    And I request "/api/v1/banner_configurations"
    Then the response should be JSON
    And response status code should be 200
    Then response data params should be set to:
      | parameter                       | value         |
      | [0].id                          | 1             |
      | [0].name                        | Leaderboard_1 |
      | [0].devices[0].name             | desktop       |
      | [0].devices[0].dimensions[0][0] | 2             |
      | [0].devices[0].dimensions[0][1] | 2             |
      | [0].hideOnList                  | true          |
      | [0].addToAllPages               | false         |
      | [0].outOfPage                   | true          |
      | [0].loadType                    | eager         |
      | [0].devices[1].name             | mobile        |
      | [0].devices[1].dimensions[0][0] | 1             |
      | [0].devices[1].dimensions[0][1] | 1             |
      | [0].devices[2].name             | tablet        |
      | [0].devices[2].dimensions[0][0] | 21            |
      | [0].devices[2].dimensions[0][1] | 21            |

  Scenario: Creating banner configuration
    And I post request "/api/v1/banner_configurations" with '{"name":"Leaderboard_1","devices":[{"name":"desktop","dimensions":[[5,5]]},{"name":"mobile","dimensions":[[1,1]]},{"name": "tablet","dimensions": [[21,21]]}],"addToAllPages":false, "outOfPage":true,"hideOnList":true ,"loadType":"eager"}'
    And response status code should be 201
    And I request "/api/v1/banner_configurations"
    Then the response should be JSON
    And response status code should be 200
    Then response data params should be set to:
      | parameter                       | value         |
      | [0].id                          | 1             |
      | [0].name                        | Leaderboard_1 |
      | [0].devices[0].name             | desktop       |
      | [0].devices[0].dimensions[0][0] | 5             |
      | [0].devices[0].dimensions[0][1] | 5             |
      | [0].hideOnList                  | true          |
      | [0].addToAllPages               | false         |
      | [0].outOfPage                   | true          |
      | [0].loadType                    | eager         |
      | [0].devices[1].name             | mobile        |
      | [0].devices[1].dimensions[0][0] | 1             |
      | [0].devices[1].dimensions[0][1] | 1             |
      | [0].devices[2].name             | tablet        |
      | [0].devices[2].dimensions[0][0] | 21            |
      | [0].devices[2].dimensions[0][1] | 21            |
