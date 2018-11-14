Feature: Teaser advertorial trumpet
  In order to recognize sponsored articles
  As a visitor
  I should be able to see sponsored mark

  Scenario: Showing sponsored articles on teasers
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /sponsored_articles_on_teasers |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value          |
      | type        | advertorial    |
      | title       | Article title  |
      | article_url | /article/title |
      | body        | article body   |
    And tag exist:
      | option    | value              |
      | type      | category           |
      | full_name | www.b.dk > Annonce |
      | name      | www.b.dk > Annonce |
    And article "Article title" has tag "www.b.dk > Annonce"
    When I go to "/sponsored_articles_on_teasers"
    Then I should see "Sponsoreret" in the ".teaser-footer .teaser-spon-sored" element

  Scenario: Showing sponsored articles on advertorial video teasers
    Given "custom_page" site manager page exists:
      | option      | value                          |
      | url         | /sponsored_articles_on_teasers |
      | title       | Custom page title              |
      | description | Custom description             |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value             |
      | type        | advertorial_video |
      | title       | Article title     |
      | article_url | /article/title    |
      | body        | article body      |
    And tag exist:
      | option    | value              |
      | type      | category           |
      | full_name | www.b.dk > Annonce |
      | name      | www.b.dk > Annonce |
    And article "Article title" has tag "www.b.dk > Annonce"
    When I go to "/sponsored_articles_on_teasers"
    Then I should see "Sponsoreret" in the ".teaser-footer .teaser-spon-sored" element

  Scenario: Showing regular articles on teasers
    Given "custom_page" site manager page exists:
      | option      | value                        |
      | url         | /regular_articles_on_teasers |
      | title       | Custom page title            |
      | description | Custom description           |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value          |
      | type        | news           |
      | title       | Article title  |
      | article_url | /article/title |
      | body        | article body   |
    When I go to "/regular_articles_on_teasers"
    Then I should not see "Sponsoreret"
