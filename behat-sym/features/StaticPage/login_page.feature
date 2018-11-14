@javascript
Feature: Login page
  In order to be able to see paid content and manage my account
  As a visitor|user
  I should be able to login/logout

  Scenario: Succesfull login in login page - user with subscription
    Given window size is phone
    And "custom_page" site manager page exists:
      | option      | value            |
      | url         | /                |
      | title       | Frontpage!       |
      | description | Some description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                         |
      | custom_markup | <div class="foo">Hello!</div> |
    And blocks are added to page
    And I am on "/login"
    When I login in login page as user with subscription
    Then I should be on "/"
    And I wait for ".mobile-user-nav  .topmenu-label" element
    And I should see "Mocked user Plus" in the ".mobile-user-nav .topmenu-label" element

  Scenario: Switch to forgot password tab and back
    Given window size is desktop
    And I am on "/login"
    When I click on ".site-login__forgot-password"
    And I wait for "div#forgot_password_form" element
    And I wait for ".carousel-inner .carousel-item:nth-child(2).active" element
    And I click on ".site-login__return"
    Then I wait for ".carousel-inner .carousel-item:nth-child(1).active" element

  Scenario: Switch to forgot password and provide invalid email
    Given I am on "/login"
    When I click on ".site-login__forgot-password"
    And I wait for "div#forgot_password_form" element
    And I wait for ".carousel-inner .carousel-item:nth-child(2).active" element
    And I wait for "input#resetPasswordForm_mail" element
    And I fill in element "input#resetPasswordForm_mail" with content "invalid_email" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "form#resetPasswordForm div.form-message--error" element to be shown
    And I should see "Du skal indtaste en gyldig e-mailadresse"

  Scenario: Switch to forgot password and provide email for non-existing user
    Given I am on "/login"
    When I click on ".site-login__forgot-password"
    And I wait for "div#forgot_password_form" element
    And I wait for ".carousel-inner .carousel-item:nth-child(2).active" element
    And I wait for "input#resetPasswordForm_mail" element
    And I fill in element "input#resetPasswordForm_mail" with content "qwe@qwe.pl.invalid" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "form#resetPasswordForm div.form-message--error" element to be shown
    And I should see "Ukendt bruger. Du skal indtaste en gyldig e-mailadresse."

  Scenario: Switch to forgot password and provide email for existing user
    Given I am on "/login"
    When I click on ".site-login__forgot-password"
    And I wait for "div#forgot_password_form" element
    And I wait for ".carousel-inner .carousel-item:nth-child(2).active" element
    And I wait for "input#resetPasswordForm_mail" element
    And I fill in element "input#resetPasswordForm_mail" with content "bdk_with_sub@gmail.com.invalid" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "div#forgot_password_form div.alert--success" element to be shown
    And I should see "Vi har nu sendt dig en e-mail med instruktioner om, hvordan du ændrer din adgangskode."

  Scenario: Show error messages when providing bad email and no password
    Given I am on "/login"
    When I fill in element "input#login-email" with content "invalid_email" using jquery
    And I click on "button.form-submit"
    Then I wait for "form#user-login div.form-message--error:eq(0)" element to be shown
    And I wait for "form#user-login div.form-message--error:eq(1)" element to be shown

  Scenario: Show message when user with given credentals doesn't exist
    Given I am on "/login"
    When I fill in element "input#login-email" with content "some@email.com.invalid" using jquery
    And I fill in element "input#login-password" with content "IShouldBeValid!" using jquery
    And I click on "button.form-submit"
    Then I wait for "div.alert--danger" element to be shown

  Scenario: Succesfull login in login page - user without subscription
    Given "custom_page" site manager page exists:
      | option      | value            |
      | url         | /                |
      | title       | Frontpage!       |
      | description | Some description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                         |
      | custom_markup | <div class="foo">Hello!</div> |
    And blocks are added to page
    And I am on "/login"
    When I login in login page as user without subscription
    Then I should be on "/"
    And I wait for ".menu-login > a.btn-topmenu-user .topmenu-label" element
    And I should see "Mocked user" in the ".menu-login .topmenu-label" element

  Scenario: Redirect from login page if user is already logged in
    Given "custom_page" site manager page exists:
      | option      | value            |
      | url         | /                |
      | title       | Frontpage!       |
      | description | Some description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                         |
      | custom_markup | <div class="foo">Hello!</div> |
    And blocks are added to page
    And I am on "/" as authenticated user with subscription
    When I go to "/login"
    Then I should be on "/user"
