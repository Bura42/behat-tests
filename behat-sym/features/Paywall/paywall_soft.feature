@javascript @integration
#Tests should be enabled when we will be able to play with request headers (request IP, referrer)
Feature: Article paywall soft
  In order to see understand article paywall soft subject
  As a visitor
  I want to see paywall in the article

  Background:
    Given snippet "paywall_hard" exist
    And snippet "paywall_soft" exist

  Scenario: Show paywall soft in plus news article
    Given "newsPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title1            |
      | article_url | /news_plus/title1 |
      | body        | this is free body |
      | body_paid   | this is paid body |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has tag with paywallsoft
    When I go to "/news_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see the list of elements:
      | this is paid body                   |
      | God fornøjelse                      |
      | Få den første måned gratis nu       |
      | Nej tak, jeg vil bare læse artiklen |
      | Allerede abonnent                   |
      | Klik her                            |
    And I should not see the list of elements:
      | this is free body |
    And I click on ".close-paywall-overlay"
    And an element ".paywall-soft" should be visible
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Click buy subscription link
    Given "newsPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title1            |
      | article_url | /news_plus/title1 |
      | body        | this is free body |
      | body_paid   | this is paid body |
    And article "title1" has tag with paywallsoft
    When I go to "/news_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see an ".paywall__button" element with attribute "data-link" set to "https://abonnement.b.dk/berlingske-to-produkter-paywallbanner/?utm_source=paywall&utm_medium=paywall_bdk&utm_term=AL-151222-CP-WKLEDIT1PW&utm_content=soft&utm_campaign=abonnementer_berlingske"

  Scenario: Do not show paywall soft in plus news article when user is logged in with subscription
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                        |
      | type        | news_plus                    |
      | title       | title1                       |
      | article_url | /news_plus_no_paywall/title1 |
      | body        | this is free body            |
      | body_paid   | this is paid body            |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has tag with paywallsoft
    And I am on "/news_plus_no_paywall/title1"
    When I am authenticated as user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | this is free body                   |
      | God fornøjelse                      |
      | Få den første måned gratis nu       |
      | Nej tak, jeg vil bare læse artiklen |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Do not show paywall soft in plus news article when user is logged in without subscription
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                                                                                  |
      | type        | news_plus                                                                              |
      | title       | title1                                                                                 |
      | article_url | /news_plus_no_paywall/title13                                                          |
      | body        | this is free body <br> this is free body<br>  this is free body<br>  this is free body |
      | body_paid   | this is paid body                                                                      |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And I am on "/news_plus_no_paywall/title13"
    When I am authenticated as user without subscription
    And I wait for ".javascriptCacheBlock" element
    Then the response should contain "this is free body"
    And I should not see an ".article-bottom" element
    And I should not see "Relaterede"

  Scenario: Show paywall soft in plus news article with paywall tag when user is logged in without subscription
    Given "newsPlus" article page exists
    And article exist:
      | option      | value                         |
      | type        | news_plus                     |
      | title       | title1                        |
      | article_url | /news_plus_no_paywall/title14 |
      | body        | this is free body             |
      | body_paid   | this is paid body             |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has tag with paywallsoft
    And I am on "/news_plus_no_paywall/title14"
    When I am authenticated as user without subscription
    And I wait for ".javascriptCacheBlock" element
    Then I click on ".close-paywall-overlay"
    And an element ".paywall-soft" should be visible
    And I should see the list of elements:
      | this is paid body |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"
