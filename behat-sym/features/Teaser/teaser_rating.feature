Feature: Article rating on teaser
  In order to check article popularity
  As a visitor
  I want to see article rating visualised by stars on teaser

  Scenario: Show large teaser with article rating
    Given "custom_page" site manager page exists:
      | option      | value                     |
      | url         | /large_teaser_with_rating |
      | title       | Custom page title         |
      | description | Custom description        |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option   | value                                                    |
      | title    | Large teaser                                             |
      | source   | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit    | 1                                                        |
      | template | large                                                    |
    And blocks are added to page
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | rating      | 4               |
    When I go to "/large_teaser_with_rating"
    Then I should see "title1"
    And I should see an ".teaser-large" element
    And I should see an ".article-header__rating" element
    And I should see 4 ".bicon-star--full" elements
    And I should see 6 ".bicon-star" elements
