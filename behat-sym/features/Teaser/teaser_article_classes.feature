Feature: Show teaser additional classes
  In order to see  article in different styling
  As a visitor
  I should see styled article

  Scenario: Show additional article classes
    Given "custom_page" site manager page exists:
      | option      | value                    |
      | url         | /large_teaser_with_class |
      | title       | Custom page title        |
      | description | Custom description       |
    And "bm_basic_data.teaser.various_sources" building block exists:
      | option         | value                                                    |
      | title          | Large teaser                                             |
      | source         | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit          | 1                                                        |
      | template       | large                                                    |
      | article_classes | new-article-class                                        |
    And blocks are added to page
    And article exist:
      | option      | value                          |
      | type        | news                           |
      | title       | title1                         |
      | summary     | Article summary                |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
    And tags exist:
      | name                                      | full_name                                 | type         |
      | www.b.dk > Artikel > Rundt teaser billede | www.b.dk > Artikel > Rundt teaser billede | presentation |
    And article "title1" has tag "www.b.dk > Artikel > Rundt teaser billede"
    When I go to "/large_teaser_with_class"
    And I should see an ".item-teaser.new-article-class" element
