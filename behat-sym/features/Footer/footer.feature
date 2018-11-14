Feature: Show site footer
  In order to get basic page information
  As a visitor
  I should see site footer

  Background:
    Given snippet "site_footer" exist

  Scenario: Displaying basic information
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /footer            |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | <div class="foo">Hello</div> |
    And blocks are added to page
    When I go to "/footer"
    Then I should see the list of elements:
      | Kontakt os                   |
      | Send pressemeddelelse        |
      | Kundeservice                 |
      | Redaktionelt regnskab        |
      | Fejl og fakta                |
      | Etiske regler                |
      | Ledige stillinger            |
      | Annoncering                  |
      | Kontakt kundeservice         |
      | Er avisen ikke kommet?       |
      | E-avis                       |
      | Køb abonnement               |
      | Sitemap                      |
      | Artikelarkiv                 |
      | Nyhedsbreve                  |
      | RSS                          |
      | Ophavsret og vilkår          |
      | Generelle handelsbetingelser |
      | Cookie- og Privatlivspolitik |
