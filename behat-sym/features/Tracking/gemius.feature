Feature: Gemius tracking
  In order to store my choices for business
  As a visitor
  I want to run gemius script

  Scenario: Gemius script
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /gemius_script     |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to "/gemius_script"
    Then I should see "var ghmxy_identifier = 'AprlFO_aJPUen0G3ubBiicVl.KfNlkyAMuQ1ZxHQLU3.i7';"
    And I should see "var ghmxy_type = 'percent';"
    And I should see "var ghmxy_hitcollector = 'gadk.hit.gemius.pl';"
