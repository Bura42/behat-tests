Feature: User profile functionality
  In order to be able to change data in profile
  As a visitor|user
  I should be able to change data in profile

  Scenario: See the page as a not logged in user
    When I am on "/user"
    Then I should be on "/login"

  @javascript
  Scenario: See the page as a logged in user
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /user_profile_custom_page |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    And I am on "/user_profile_custom_page" as authenticated user without subscription
    And I go to "/user"
    Then I should see the list of elements:
      | Din profilside              |
      | Navn:                       |
      | Adresse:                    |
      | Postnummer:                 |
      | By:                         |
      | Telefon:                    |
      | Email:                      |
      | Få hjælp til dit abonnement |
      | Kontakt kundeservice        |
