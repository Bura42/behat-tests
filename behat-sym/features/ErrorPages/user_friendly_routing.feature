Feature: User friendly routing information
  In order have good user experience while triggering routing error
  As a visitor
  I should see user friendly content

  Scenario: Accessing non-existent page
    When I go to non-existent page
    Then I should see the list of elements:
      | Måske kan du finde den ved at foretage en søgning |
      | Ups. Siden findes ikke!                           |

  Scenario: Accessing non-existent page with meta page type tag
    When I go to non-existent page
    Then I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: Accessing the page that is gone
    When I go to page is gone
    Then I should see the list of elements:
      | Måske kan du finde den ved at foretage en søgning |
      | Ups. Siden findes ikke!                           |
