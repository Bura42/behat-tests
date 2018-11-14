Feature: Show archives
  In order to read archived pages
  As a visitor
  I should see archive section

  Background:
    Given articles exist:
      | title          | article_url     | type | supertitle  | date_created |
      | Article title1 | /article/title1 | news | supertitle1 | 2016-01-02   |
      | Article title2 | /article/title2 | news |             | 2015-12-30   |
      | Article title3 | /article/title3 | news | supertitle3 | 2015-12-30   |
      | Article title4 | /article/title4 | news |             | 2015-03-10   |
      | Article title5 | /article/title5 | news |             | 2013-03-15   |
    Given articles exist:
      | title                   | external_url                               | type     | supertitle  | date_created |
      | External article title1 | http://external_host/some_external_address | external | supertitle2 | 2016-03-02   |

  Scenario: Archive page - years
    When I go to "/artikel-arkiv"
    Then I should see 3 "ul.list-box > li > a" elements
    And I should see "2016"
    And I should see "2015"
    And I should see "2013"
    And I should see an ".search-oneliner-result" element
    And I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: Archive page - months
    Given I go to "/artikel-arkiv"
    When I click on the element with xpath "//a[text()='2015']"
    Then I should see 12 "ul.list-box > li > a" elements
    And I should see "Marts"
    And I should see "December"
    And I should see an ".search-oneliner-result" element
    And I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: Archive page - pages
    Given I go to "/artikel-arkiv"
    And I click on the element with xpath "//a[text()='2015']"
    Then I click on the element with xpath "//a[text()='December']"
    Then I should see 1 "ul.list-box > li > a" elements
    And I should see "del 1"
    And I should see an ".search-oneliner-result" element
    And I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: Archive page - articles
    Given I go to "/artikel-arkiv"
    And I click on the element with xpath "//a[text()='2015']"
    And I click on the element with xpath "//a[text()='December']"
    Then I click on the element with xpath "//a[text()='del 1']"
    Then I should see 2 "ul.list-news> li > a" elements
    And I should see "Article title2"
    And I should see "SUPERTITLE3: Article title3"
    And I should see an ".search-oneliner-result" element
    And I should see social meta tags:
      | tag     | value   |
      | og:type | website |

  Scenario: External article url in Archive page
    Given I go to "/artikel-arkiv"
    And I click on the element with xpath "//a[text()='2016']"
    And I click on the element with xpath "//a[text()='Marts']"
    And I click on the element with xpath "//a[text()='del 1']"
    And I should see an ".list-news li a" element with attribute "href" set to "http://external_host/some_external_address"

  Scenario: News article url in Archive page
    Given I go to "/artikel-arkiv"
    And I click on the element with xpath "//a[text()='2016']"
    And I click on the element with xpath "//a[text()='Januar']"
    And I click on the element with xpath "//a[text()='del 1']"
    And I should see an ".list-news li a" element with attribute "href" set to "/article/title1"
