Feature: Custom Markup Block
  In order to create custom html markup
  As a site manager
  I should be able to use Custom Markup building block

  Scenario:
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to homepage
    Then I should see "Hello" in the ".foo" element

  Scenario: Show page type metadata on custom pages
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to homepage
    Then I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: Show meta tags on custom page
    Given "custom_page" site manager page exists:
      | option      | value                                                                                                        |
      | url         | /                                                                                                            |
      | title       | Custom page title                                                                                            |
      | description | Custom description                                                                                           |
      | tags        | [{"attributes":[{"name":"property","value":"main_property"},{"name":"content","value":"Some description"}]}] |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to homepage
    Then I should see social meta tags:
      | tag           | value            |
      | main_property | Some description |

  Scenario:
    When I request "bm_custom_markup.block" building block
    Then I should get valid configuration for "bm_custom_markup.block":
      | optionName   |
      | name         |
      | template     |
      | customMarkup |
    And I should get valid common block configuration
