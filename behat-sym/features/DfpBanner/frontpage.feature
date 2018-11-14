Feature: Show DFP banners on frontpage
  In order to monetize
  As a visitor
  I should see DFP banners

  Scenario: Displaying banners on frontpage
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to homepage
    Then I should see "#Leaderboard_1" div with "Leaderboard_1" slotId
    And I should see "#MLeaderboard_1" div with "Leaderboard_1" slotId
