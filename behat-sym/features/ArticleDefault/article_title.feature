Feature: Article title
  In order to understand article subject
  As a visitor
  I want to see data such as title, summary and publish date

  Scenario: Show news article title, summary and published date
    Given "news" article page exists
    And article exist:
      | option       | value            |
      | type         | news             |
      | title        | title1           |
      | article_url  | /article/title1  |
      | summary      | summary1         |
      | date_created | 2016-05-31 12:00 |
    When I go to "/article/title1"
    Then I should see "title1"
    And I should see "summary1"
    And I should see "Tirsdag D. 31. MAJ 2016 KL. 12:00"

  Scenario: Show longRead article title and summary
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | title       | title1                         |
      | article_url | /article/title2                |
      | summary     | summary                        |
      | main_image  | game-of-thrones-main-image.jpg |
    When I go to "/article/title2"
    Then I should see an ".longread-head__title" element
    And I should see "title1" in the ".longread-head__title" element
    And I should see an ".longread-head__summary" element
    And I should see "summary" in the ".longread-head__summary" element

  Scenario: Show news article published 1st of January
    Given "news" article page exists
    And article exist:
      | option       | value            |
      | type         | news             |
      | title        | title1           |
      | article_url  | /article/title1  |
      | summary      | summary1         |
      | date_created | 2017-01-01 12:00 |
    When I go to "/article/title1"
    And I should see "Søndag D. 1. JANUAR 2017 KL. 12:00"

  Scenario:
    When I request "bm_app.article.header" building block
    Then I should get valid configuration for "bm_app.article.header":
      | optionName |
      | name       |
      | template   |
    And I should get valid common block configuration
