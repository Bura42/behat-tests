Feature: Menaiset feature
  As a site visitor
  I want check gloria
  So that I know I am on the right site


  Scenario: I login site create and delete node

    # I click "Asiakaspalvelu" in the "footer" region.

#    Given I visit "/user"
    Given I visit "/sacu/admin"
    Then I accept cookie
#    Then I should see "Käyttäjätili"
    Then I should see "Admin login"
#    And I switch to iframe "sacu-iframe"
#    Then I should see "Sähköpostiosoite"
#    When I fill in "username" with "m.horiachev@levi9.com"
    When I fill in "edit-name" with "admin1"
#    When I fill in "password" with "m.horiachev@levi9.com"
    When I fill in "edit-pass" with "admin"
#    When I press "Kirjaudu"
    When I press "Kirjaudu sisään"
    When I visit "/node/add/article"
    When I fill in "edit-title" with "Behat Test"
    When I press "Save"
    Then I should see "Article Behat Test has been created."
    Then I click "Edit" in the tabs_primary
    Then I press "Delete"
    #confirm
    Then I press "Delete"
    Then I should see "Article Behat Test has been deleted."

#    And I wait 2 second

  #@menaiset
  Scenario: Create and delete node
    Given I visit "/sacu/admin"
    Then I accept cookie
    When I click "Asiakaspalvelu" in the "footer" region
#  Article Behat Test has been deleted.



