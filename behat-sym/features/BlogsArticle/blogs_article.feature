Feature: Blogs article free
  In order to see articles as a blogs
  As a visitor
  I should see blogs article page

  Scenario: Show blogs article
    Given "blogs" article page exists
    And article exist:
      | option      | value           |
      | title       | blogs title     |
      | type        | blogs           |
      | article_url | /article/title1 |
      | summary     | blogs subtitle  |
      | body        | blogs body      |
  When I go to "/article/title1"
  Then I should see an ".article-header" element
  And I should see "blogs title" in the ".article-header__title" element
  And I should see "blogs subtitle" in the ".article-header__summary" element
