@javascript
Feature: Forgot password functionality
  In order to be able to see paid content and manage my account
  As a visitor|user
  I should be able to restore password

  Scenario: Open Forgot password screen
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And window size is desktop
    And I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    And I wait for ".site-login__forgot-password" element
    And I click on ".site-login__forgot-password"
    And I wait for ".site-login__send" element
    Then I should see "Glemt adgangskode"
    And I should see "Tilbage til log ind"

  Scenario: Close login popup
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And I am on homepage
    And I wait for ".btn-topmenu-login" element
    And I click on ".btn-topmenu-login"
    And I wait for ".site-login__forgot-password" element
    And I click on ".site-login__forgot-password"
    And I wait for ".site-login__send" element
    When I click on ".site-login__close"
    Then I wait for ".modal.site-login" element to be hidden

  @integration
  Scenario: Request new password
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    And I wait for ".site-login__forgot-password" element
    And I click on ".site-login__forgot-password"
    And I wait for ".site-login__send" element
    And I fill in "resetPasswordForm[mail]" with "bdk_no_sub@gmail.com.invalid"
    And I click on ".site-login__send"
    And I wait "5"
    Then I should see "Vi har nu sendt dig en e-mail med instruktioner om, hvordan du ændrer din adgangskode."

  Scenario: Go back to login screen
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    And I wait for ".site-login__forgot-password" element
    And I click on ".site-login__forgot-password"
    And I wait for ".site-login__send" element
    And I click on ".site-login__return"
    And I should see an ".site-login.in #user-login" element

  Scenario: Invalid email format
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    And I wait for ".site-login__forgot-password" element
    And I click on ".site-login__forgot-password"
    And I wait for ".site-login__send" element
    And I fill in "resetPasswordForm[mail]" with "test"
    And I click on ".site-login__send"
    Then I should see "Du skal indtaste en gyldig e-mailadresse"
