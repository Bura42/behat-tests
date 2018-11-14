Feature: Article related articles
  In order to understand article subject
  As a visitor
  I want to see data such as related articles

  Scenario: Show related articles in news article
    Given "news" article page exists
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title1 | /article/title1 | 160x160.jpg | news |
      | title2 | /article/title2 | 160x160.jpg | news |
      | title3 | /article/title3 | 160x160.jpg | news |
      | title4 | /article/title4 | 160x160.jpg | news |
      | title5 | /article/title5 | 160x160.jpg | news |
      | title6 | /article/title6 | 160x160.jpg | news |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should see "VIS ALLE"
    And I should see "title1"
    And I should see "title2"
    And I should see "title3"
    And I should see "title4"
    And I should see images with filters:
      | name        | filter      | load_type |
      | 160x160.jpg | image_80x80 | lazy      |

  Scenario: Show related articles in news article, no cropping
    Given "news" article page exists
    And articles exist:
      | title  | article_url     | main_image  | type |
      | title1 | /article/title1 | 160x160.jpg | news |
      | title2 | /article/title2 | 160x160.jpg | news |
    And article "title1" has related article "title2"
    And tag exist:
      | option    | value                                          |
      | type      | presentation                                   |
      | full_name | www.b.dk > Teaser > Ingen cropping af billeder |
      | name      | www.b.dk > Teaser > Ingen cropping af billeder |
    And article "title2" has tag "www.b.dk > Teaser > Ingen cropping af billeder"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should see "title1"
    And I should see "title2"
    And I should see images with filters:
      | name        | filter             | load_type |
      | 160x160.jpg | image_80x80-noCrop | lazy      |

  Scenario: Show related articles in longRead article
    Given "longRead" article page exists
    And articles exist:
      | title  | article_url     | main_image   | type     |
      | title1 | /article/title1 | longread.jpg | longread |
      | title2 | /article/title2 | 160x160.jpg  | news     |
      | title3 | /article/title3 | 160x160.jpg  | news     |
      | title4 | /article/title4 | 160x160.jpg  | news     |
      | title5 | /article/title5 | 160x160.jpg  | news     |
      | title6 | /article/title6 | 160x160.jpg  | news     |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should see "VIS ALLE"
    And I should see "title1"
    And I should see "title2"
    And I should see "title3"
    And I should see "title4"

  Scenario: Show related articles in longRead article with black background
    Given "longRead" article page exists
    And articles exist:
      | title  | article_url     | main_image   | type     |
      | title1 | /article/title1 | longread.jpg | longread |
      | title2 | /article/title2 | 160x160.jpg  | news     |
      | title3 | /article/title3 | 160x160.jpg  | news     |
      | title4 | /article/title4 | 160x160.jpg  | news     |
      | title5 | /article/title5 | 160x160.jpg  | news     |
      | title6 | /article/title6 | 160x160.jpg  | news     |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "title1" has tag "Longread > Black background"
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should see "VIS ALLE"
    And I should see "title1"
    And I should see "title2"
    And I should see "title3"
    And I should see "title4"
    And I should see an "body.longread--bg-black" element

  Scenario: Show related articles in large article
    Given "large" article page exists
    And articles exist:
      | title  | article_url     | main_image                     | type  |
      | title1 | /article/title1 | game-of-thrones-main-image.jpg | large |
      | title2 | /article/title2 | game-of-thrones-main-image.jpg | news  |
      | title3 | /article/title3 | game-of-thrones-main-image.jpg | news  |
      | title4 | /article/title4 | game-of-thrones-main-image.jpg | news  |
      | title5 | /article/title5 | game-of-thrones-main-image.jpg | news  |
      | title6 | /article/title6 | game-of-thrones-main-image.jpg | news  |
    And article "title1" has related article "title2"
    And article "title1" has related article "title3"
    And article "title1" has related article "title4"
    And article "title1" has related article "title5"
    And article "title1" has related article "title6"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should see "VIS ALLE"
    And I should see "title1"
    And I should see "title2"
    And I should see "title3"
    And I should see "title4"

  Scenario: Do not show VIS ALLE button
    Given "news" article page exists
    And articles exist:
      | title  | article_url     | type |
      | title1 | /article/title1 | news |
      | title2 | /article/title2 | news |
    And article "title1" has related article "title2"
    When I go to "/article/title1"
    Then I should see "Relaterede"
    And I should not see "VIS ALLE"
    And I should see "title1"
    And I should see "title2"
