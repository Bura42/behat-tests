@javascript
Feature: Login functionality
  In order to be able to see paid content and manage my account
  As a visitor|user
  I should be able to login/logout

  Background:
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page

  Scenario: Not displaying login popup by default
    When I am on homepage
    Then I should see an ".menu-login" element
    And I should not see an ".site-login.in" element
    And I should not see an ".toggle-user-menu" element

  Scenario: Open login popup
    Given I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    Then I wait for ".site-login.in #user-login" element
    And an element "#login-email+.form-message--error" should not be visible
    And an element "#login-password+.form-message--error" should not be visible
    And an element "[data-message=badLogin]" should not be visible
    And I should see "Kontakt Kundeservice på 3375 3330"

  @integration
  Scenario: Close login popup
    Given I am on homepage
    And I wait for ".btn-topmenu-login" element
    And I click on ".btn-topmenu-login"
    And I wait for ".site-login.in #user-login" element
    When I click on ".site-login__close"
    Then I should not see an ".site-login.in" element

  @integration
  Scenario: Click "Køb abonnement" link
    Given I am on homepage
    And I wait for ".btn-topmenu-login" element
    And I click on ".btn-topmenu-login"
    And I wait for ".site-login.in" element
    When I click on ".site-login__buy"
    Then should be on "https://abonnement.b.dk/berlingske-alle-produkter-abonnementslink/?ns_campaign=_BM_alle_produkter_Abonnementslink&ns_mchannel&ns_source=web_intern&ns_linkname=web_abonnementlinks&ns_fee=AL-150827-CP-MALEDIT1WI"

  @integration
  Scenario: Form validation
    Given I am on homepage
    And I wait for ".btn-topmenu-login" element
    When I click on ".btn-topmenu-login"
    And I wait for ".site-login.in #user-login" element
    And I click on ".site-login.in #user-login .form-submit"
    Then an element "#login-email+.form-message--error" should be visible
    And an element "#login-password+.form-message--error" should be visible

  @integration
  Scenario: Unsuccessful login
    Given I am on homepage
    When I try to login with bad credentials
    Then an element "[data-message=badLogin]" should be visible

  @integration
  Scenario: Successful login
    Given I am on homepage
    When I am authenticated as user without subscription
    And I should see "MOCKED USER" in the ".toggle-user-menu" element

  @integration
  Scenario: Successful login - integration
    Given I am on homepage
    And I login as user without subscription
    And I should see "BDK TEST 1" in the ".toggle-user-menu" element

  @integration
  Scenario: Remember me - keep the session
    Given I am on homepage
    And I login as user without subscription
    When I restart the browser
    And I reload the page
    Then I wait for ".user-menu-container" element
    And I should see "BDK TEST 1" in the ".toggle-user-menu" element

  @integration
  Scenario: Remember me - do not keep the session
    Given I am on homepage
    And I wait for ".btn-topmenu-login" element
    And I click on ".btn-topmenu-login"
    And I wait for ".site-login.in #user-login" element
    And I fill in the following:
      | login-email                | bdk_no_sub@gmail.com.invalid |
      | login-password             | xyzzz                        |
    And I uncheck "bme_session_stay_logged_in"
    And I click on ".site-login.in #user-login .form-submit"
    And I wait for ".user-menu-container" element
    When I restart the browser
    And I reload the page
    Then I should not see an ".toggle-user-menu" element

  @integration
  Scenario: logout
    Given I am on homepage
    And I login as user without subscription
    And I click on ".btn-topmenu-user"
    And I wait for ".show-usermenu" element
    And I click on ".btn.site-login__logout"
    Then I should be on "/"
    And I should see an ".menu-login" element
    And I should not see an ".site-login.in" element
    And I should not see an ".toggle-user-menu" element

  @integration
  Scenario: Open and close user menu
    Given I am on homepage
    And I am authenticated as user without subscription
    And I click on ".btn-topmenu-user"
    Then I wait for ".show-usermenu" element
    And I click on "div.main-wrapper"
    And I wait for ".show-usermenu" element to disappear

  @integration
  Scenario: Redirect to user profile menu
    Given I am on homepage
    And I am authenticated as user without subscription
    And I click on ".btn-topmenu-user"
    And I wait for ".show-usermenu" element
    When I click on ".show-usermenu .site-login__profile"
    Then I should be on "/user"

  @integration
  Scenario: Redirect to user subscriptions page
    Given I am on homepage
    And I am authenticated as user without subscription
    When I click on ".btn-topmenu-user"
    And I wait for ".show-usermenu" element
    Then I should see an ".show-usermenu .site-login__subscription" element with attribute "href" set to "https://b.kundeunivers.dk.test.bemit.dk/mine-abonnementer"
