Feature: Widget for ni.dk
  In order to read headlines of the latest Berlingske news on ni.dk in an iframe
  As a visitor
  I want to see Berlingske widget

  Scenario: Show widget for ni.dk on a standalone page for news article
    And articles exist in list with nodeId "210" and name "topstories":
      | title  | article_url     | type | main_image  |
      | title1 | /article/title1 | news | 160x160.jpg |
      | title2 | /article/title2 | news |             |
      | title3 | /article/title3 | news |             |
      | title4 | /article/title4 | news |             |
      | title5 | /article/title5 | news |             |
    When I go to "/nidk/ni_2011"
    Then I should see "Berlingske - dit overblik" in the "h1" element
    And I should see "Berlingske" in the ".content-wrapper .logo" element
    And I should see "Seneste" in the ".tabs li:first-child" element
    And I should see "Mest læste" in the ".tabs li:last-child" element
    And I should see an "#tabContent1 .list-items a" element with attribute "href" set to "https://adx.adform.net/adx/ct/?bn=17577172&cpdir=http://behat.bdk.dev/article/title1"
    And I should see "Berlingske" in the "footer .logo" element
    And I should see the list of elements:
      | title1 |
      | title2 |
      | title3 |
      | title4 |
    And I should not see "title5"

  Scenario: Show widget for ni.dk on a standalone page for external article
    And articles exist in list with nodeId "210" and name "topstories":
      | title  | article_url     | type     | main_image  | external_url      |
      | title1 | /article/title1 | external | 160x160.jpg | http://google.com |
    When I go to "/nidk/ni_2011"
    Then I should see "Berlingske - dit overblik" in the "h1" element
    And I should see "Berlingske" in the ".content-wrapper .logo" element
    And I should see "Seneste" in the ".tabs li:first-child" element
    And I should see "Mest læste" in the ".tabs li:last-child" element
    And I should see an "#tabContent1 .list-items a" element with attribute "href" set to "https://adx.adform.net/adx/ct/?bn=17577172&cpdir=http://google.com"
    And I should see "Berlingske" in the "footer .logo" element

  Scenario: Show widget for ni.dk on a standalone page (for politiko) - news article
    Given articles exist in list with nodeId "5772" and name "topstories":
      | title  | article_url     | type | main_image  |
      | title1 | /article/title1 | news | 160x160.jpg |
    When I go to "/politiko/nidk/ni_2015"
    Then I should see "Berlingske Politiko - seneste nyheder" in the "h1" element
    And I should see "Berlingske" in the ".logo" element
    And I should see an ".list-items a" element with attribute "href" set to "https://adx.adform.net/adx/ct/?bn=17577176&cpdir=http://behat.bdk.dev/article/title1"

  Scenario: Show widget for ni.dk on a standalone page (for politiko) - external article
    And articles exist in list with nodeId "5772" and name "topstories":
      | title  | article_url     | type     | main_image  | external_url      |
      | title1 | /article/title1 | external | 160x160.jpg | http://google.com |
    When I go to "/politiko/nidk/ni_2015"
    Then I should see "Berlingske Politiko - seneste nyheder" in the "h1" element
    And I should see "Berlingske" in the ".logo" element
    And I should see an ".list-items a" element with attribute "href" set to "https://adx.adform.net/adx/ct/?bn=17577176&cpdir=http://google.com"
