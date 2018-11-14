@javascript
Feature: Buy subscription header functionality
  In order to be able to access protected content
  As a visitor|user
  I should see buy subscription button

  Scenario: See the page as visitor on mobile
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /subscription_on_mobile |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is phone
    And I am on "/subscription_on_mobile"
    And I should see an ".link-subscription a" element with attribute "href" set to "https://abonnement.b.dk/berlingske-abonnementer?utm_source=web_intern&utm_medium=web_abonnementlinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_top&utm_campaign=abonnementer_berlingske&ns_fee=AL-151222-CP-WKLEDIT1WK&return_url=https://behat.bdk.dev/subscription_on_mobile"

  Scenario: See the page as visitor on desktop
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /subscription_on_desktop |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is desktop
    And I am on "/subscription_on_desktop"
    And I should see an ".tools-menu-right a" element with attribute "href" set to "https://abonnement.b.dk/berlingske-abonnementer?utm_source=web_intern&utm_medium=web_abonnementlinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_top&utm_campaign=abonnementer_berlingske&ns_fee=AL-151222-CP-WKLEDIT1WK&return_url=https://behat.bdk.dev/subscription_on_desktop"

  Scenario: See the page as user without subscription
    Given "custom_page" site manager page exists:
      | option      | value                 |
      | url         | /user_no_subscription |
      | title       | Custom page title     |
      | description | Custom description    |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is desktop
    And I am on "/user_no_subscription" as authenticated user without subscription
    Then an element ".tools-menu-right .link-subscription" should be visible

  Scenario: See the page as user with subscription
    Given "custom_page" site manager page exists:
      | option      | value                   |
      | url         | /user_with_subscription |
      | title       | Custom page title       |
      | description | Custom description      |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is desktop
    And I am on "/user_with_subscription" as authenticated user with subscription
    Then an element ".tools-menu-right .link-subscription" should not be visible

  Scenario: See the page on phone as user without subscription
    Given "custom_page" site manager page exists:
      | option      | value                       |
      | url         | /phone_user_no_subscription |
      | title       | Custom page title           |
      | description | Custom description          |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is phone
    And I am on "/phone_user_no_subscription" as authenticated user without subscription
    Then an element ".mobile-user-nav .link-subscription" should be visible

  Scenario: See the page on phone as user with subscription
    Given "custom_page" site manager page exists:
      | option      | value                         |
      | url         | /phone_user_with_subscription |
      | title       | Custom page title             |
      | description | Custom description            |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is phone
    And I am on "/phone_user_with_subscription" as authenticated user with subscription
    Then an element ".mobile-user-nav .link-subscription" should not be visible
