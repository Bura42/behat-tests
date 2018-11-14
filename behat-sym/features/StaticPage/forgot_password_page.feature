@javascript
Feature: Forgot password page
  In order to recover my account
  As a visitor|user
  I should be able to reset my password

  Scenario: Provide invalid email
    Given I am on "/glemtPassword"
    When I fill in element "input#resetPasswordForm_mail" with content "invalid_email" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "form#resetPasswordForm div.form-message--error" element to be shown
    And I should see "Du skal indtaste en gyldig e-mailadresse"

  Scenario: Provide email for non-existing user
    Given I am on "/glemtPassword"
    When I fill in element "input#resetPasswordForm_mail" with content "qwe@qwe.pl.invalid" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "form#resetPasswordForm div.form-message--error" element to be shown
    And I should see "Ukendt bruger. Du skal indtaste en gyldig e-mailadresse."

  Scenario: Provide email for existing user
    Given I am on "/glemtPassword"
    When I fill in element "input#resetPasswordForm_mail" with content "bdk_with_sub@gmail.com.invalid" using jquery
    And I click on "button#resetPasswordForm_submit"
    Then I wait for "div#resetPasswordFormSuccess" element to be shown
    And I should see "Vi har nu sendt dig en e-mail med instruktioner om, hvordan du ændrer din adgangskode."
