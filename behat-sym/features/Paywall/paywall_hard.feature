@javascript
Feature: Article paywall hard
  In order to see understand article paywall hard subject
  As a visitor
  I want to see paywall in the article

  Background:
    Given snippet "paywall_hard" exist
    And snippet "paywall_soft" exist

  Scenario: Show paywall hard in plus news article
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
    And window size is desktop
    When I go to "/news_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see the list of elements:
      | this is free body          |
      | Velkommen                  |
      | Få den første måned gratis |
      | Allerede abonnent          |
      | Klik her                   |
    And I should not see the list of elements:
      | this is paid body |
    And I should not see an ".article-bottom" element
    And I should not see "Relaterede"

  Scenario: Click buy subscription button
    Given "newsPlus" article page exists
    And article exist:
      | option      | value             |
      | type        | news_plus         |
      | title       | title1            |
      | article_url | /news_plus/title1 |
      | body        | this is free body |
      | body_paid   | this is paid body |
    When I go to "/news_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see the list of elements:
      | this is free body          |
      | Velkommen                  |
      | Få den første måned gratis |
      | Allerede abonnent          |
      | Klik her                   |
    And I should not see the list of elements:
      | this is paid body |
    And I should see an ".paywall__button" element with attribute "data-url" set to "https://abonnement.b.dk/berlingske-to-produkter-paywallbanner/?utm_source=paywall&utm_medium=paywall_bdk&utm_term=AL-151222-CP-WKLEDIT1PW&utm_content=hard&utm_campaign=abonnementer_berlingske&return_url=https://behat.bdk.dev/news_plus/title1"

  Scenario: Show paywall hard in plus longRead article
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value                 |
      | type        | longread_plus         |
      | title       | title1                |
      | article_url | /longread_plus/title1 |
      | body        | this is free body     |
      | body_paid   | this is paid body     |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I go to "/longread_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And the ".article-body" element should contain "this is free body"
    And I should see the list of elements:
      | Velkommen         |
      | Allerede abonnent |
      | Klik her          |
    And I should not see the list of elements:
      | this is paid body |
    And I should not see an ".article-bottom" element
    And I should not see "Relaterede"

  Scenario: Show paywall hard in plus large article
    Given "largePlus" article page exists
    And article exist:
      | option      | value              |
      | type        | large_plus         |
      | title       | title1             |
      | article_url | /large_plus/title1 |
      | body        | this is free body  |
      | body_paid   | this is paid body  |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I go to "/large_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see the list of elements:
      | this is free body |
      | Velkommen         |
      | Allerede abonnent |
      | Klik her          |
    And I should not see the list of elements:
      | this is paid body |
    And I should not see an ".article-bottom" element
    And I should not see "Relaterede"

  Scenario: Show paywall hard in plus video article
    Given "videoPlus" article page exists
    And article exist:
      | option      | value              |
      | type        | video_plus         |
      | title       | title1             |
      | article_url | /video_plus/title1 |
      | body        | this is free body  |
      | body_paid   | this is paid body  |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I go to "/video_plus/title1"
    Then I wait for ".javascriptCacheBlock" element
    And I should see the list of elements:
      | this is free body |
      | Velkommen         |
      | Allerede abonnent |
      | Klik her          |
    And I should not see the list of elements:
      | this is paid body |
    And I should not see an ".article-bottom" element
    And I should not see "Relaterede"

  Scenario: Show blogs article paid with paywall
    Given "blogsPlus" article page exists
    And article exist:
      | option      | value           |
      | title       | blogs title     |
      | type        | blogs_plus      |
      | article_url | /article/title1 |
      | summary     | blogs subtitle  |
      | body        | free blogs body |
      | body_paid   | paid blogs body |
    When I go to "/article/title1"
    Then I wait for ".javascriptCacheBlock" element
    And the ".article-body" element should contain "free blogs body"
    And I should see an ".article-header" element
    And I should see "blogs title" in the ".article-header__title" element
    And I should see "blogs subtitle" in the ".article-header__summary" element
    Then I should see the list of elements:
      | free blogs body |
    And I should not see the list of elements:
      | paid blogs body |

  Scenario: Do not show paywall hard in plus news article when user is logged in with subscription
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
    And I am on "/news_plus_no_paywall/title1" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | this is free body    |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Do not show paywall hard in plus longRead article when user is logged in with subscription
    Given "longReadPlus" article page exists
    And article exist:
      | option      | value                            |
      | type        | longread_plus                    |
      | title       | title1                           |
      | article_url | /longread_plus_no_paywall/title2 |
      | body        | this is free body                |
      | body_paid   | this is paid body                |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And I am on "/longread_plus_no_paywall/title2" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | this is free body    |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Do not show paywall hard in plus large article when user is logged in with subscription
    Given "largePlus" article page exists
    And article exist:
      | option      | value                         |
      | type        | large_plus                    |
      | title       | title1                        |
      | article_url | /large_plus_no_paywall/title2 |
      | body        | this is free body             |
      | body_paid   | this is paid body             |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I am on "/large_plus_no_paywall/title2" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | this is free body    |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Do not show paywall hard in plus video article when user is logged in with subscription
    Given "videoPlus" article page exists
    And article exist:
      | option      | value                                     |
      | type        | video_plus                                |
      | title       | title1                                    |
      | article_url | /video_plus_no_paywall/title2             |
      | body        | this is free body                         |
      | body_paid   | this is paid body                         |
      | video_type  | 1                                         |
    And articles exist:
      | title  | article_url     | type |
      | title2 | /article/title1 | news |
      | title3 | /article/title2 | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    When I am on "/video_plus_no_paywall/title2" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | this is paid body |
    And I should not see the list of elements:
      | this is free body    |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
    And I should see an ".article-bottom" element
    And I should see "Relaterede"

  Scenario: Show blogs paid article when user is logged in with subscription
    Given "blogsPlus" article page exists
    And article exist:
      | option      | value           |
      | title       | blogs title     |
      | type        | blogs_plus      |
      | article_url | /article/title2 |
      | summary     | blogs subtitle  |
      | body        | free blogs body |
      | body_paid   | paid blogs body |
    When I am on "/article/title2" as authenticated user with subscription
    And I wait for ".javascriptCacheBlock" element
    Then I should see the list of elements:
      | paid blogs body |
    And I should not see the list of elements:
      | this is free body    |
      | Velkommen            |
      | Kontakt Kunceservice |
      | Allerede abonnent    |
      | Klik her             |
