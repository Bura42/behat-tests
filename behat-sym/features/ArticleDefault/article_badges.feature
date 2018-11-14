Feature: Article badges
  In order to see specific article subject
  As a visitor
  I want to see header badge above article title

  Scenario: Show article with "Breaking news" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And article "title1" has tag "www.b.dk > Forside > Badges > Breaking"
    When I go to "/article/title1"
    Then I should see "title1"
    And I should see an ".article-header__event-header--yellow" element
    And I should see "Breaking news" in the ".article-header__event-header--yellow" element

  Scenario: Show article with "Opdateres" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title2          |
      | article_url | /article/title2 |
    And tag exist:
      | option    | value                                   |
      | type      | presentation                            |
      | full_name | www.b.dk > Forside > Badges > Opdateres |
      | name      | www.b.dk > Forside > Badges > Opdateres |
    And article "title2" has tag "www.b.dk > Forside > Badges > Opdateres"
    When I go to "/article/title2"
    Then I should see "title2"
    And I should see an ".article-header__event-header--red" element
    And I should see "Opdateres" in the ".article-header__event-header--red" element

  Scenario: Show article with "Lige nu" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title3          |
      | article_url | /article/title3 |
    And tag exist:
      | option    | value                                 |
      | type      | presentation                          |
      | full_name | www.b.dk > Forside > Badges > Lige nu |
      | name      | www.b.dk > Forside > Badges > Lige nu |
    And article "title3" has tag "www.b.dk > Forside > Badges > Lige nu"
    When I go to "/article/title3"
    Then I should see "title3"
    And I should see an ".article-header__event-header--red" element
    And I should see "Lige nu" in the ".article-header__event-header--red" element

  Scenario: Show article with "Live" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title4          |
      | article_url | /article/title4 |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Forside > Badges > Live |
      | name      | www.b.dk > Forside > Badges > Live |
    And article "title4" has tag "www.b.dk > Forside > Badges > Live"
    When I go to "/article/title4"
    Then I should see "title4"
    And I should see an ".article-header__event-header--live" element
    And I should see "Live" in the ".article-header__event-header--live" element

  Scenario: Show article with "Tophistorie" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title5          |
      | article_url | /article/title5 |
    And tag exist:
      | option    | value                                     |
      | type      | presentation                              |
      | full_name | www.b.dk > Forside > Badges > Tophistorie |
      | name      | www.b.dk > Forside > Badges > Tophistorie |
    And article "title5" has tag "www.b.dk > Forside > Badges > Tophistorie"
    When I go to "/article/title5"
    Then I should see "title5"
    And I should see an ".article-header__event-header--blue" element
    And I should see "Tophistorie" in the ".article-header__event-header--blue" element

  Scenario: Show article with "Nyhed på vej" badge
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title6          |
      | article_url | /article/title6 |
    And tag exist:
      | option    | value                                      |
      | type      | presentation                               |
      | full_name | www.b.dk > Forside > Badges > Nyhed på vej |
      | name      | www.b.dk > Forside > Badges > Nyhed på vej |
    And article "title6" has tag "www.b.dk > Forside > Badges > Nyhed på vej"
    When I go to "/article/title6"
    Then I should see "title6"
    And I should see an ".article-header__event-header--red" element
    And I should see "Nyhed på vej" in the ".article-header__event-header--red" element

  Scenario: Show article without any badges
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title7          |
      | article_url | /article/title7 |
    When I go to "/article/title7"
    Then I should see "title7"
    And I should not see an ".article-header__event-header--red" element
    And I should not see an ".article-header__event-header--yellow" element
    And I should not see an ".article-header__event-header--blue" element
    And I should not see an ".article-header__event-header--live" element

  Scenario: Show article with "Breaking news" badge and 'www.b.dk > Benyt forrider i badge' presentation tag
    Given "news" article page exists
    And article exist:
      | option      | value            |
      | type        | news             |
      | title       | Test article     |
      | article_url | /article/title1  |
      | supertitle  | This is trumpet! |
    And tag exist:
      | option    | value                                  |
      | type      | presentation                           |
      | full_name | www.b.dk > Forside > Badges > Breaking |
      | name      | www.b.dk > Forside > Badges > Breaking |
    And tag exist:
      | option    | value                             |
      | type      | presentation                      |
      | full_name | www.b.dk > Benyt forrider i badge |
      | name      | www.b.dk > Benyt forrider i badge |
    And article "Test article" has tag "www.b.dk > Benyt forrider i badge"
    And article "Test article" has tag "www.b.dk > Forside > Badges > Breaking"
    When I go to "/article/title1"
    Then I should see "Test article"
    And I should see an ".article-header__event-header--yellow" element
    And I should not see "Breaking news" in the ".article-header__event-header--yellow" element
    And I should see "This is trumpet!" in the ".article-header__event-header--yellow" element
    And I should not see an ".article-header__trumpet" element
