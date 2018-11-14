Feature: Browser version warning
  In order to be warned that my browser is not supported by website
  As a visitor
  I want to see browser warning message

  Scenario:  Show browser warning for old browser
    Given snippet "browser_version_warning" exist
    And "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                                         |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to homepage
    Then I should see an ".browser-warning" element
