Feature: Article main image
  In order to have a possibility to see main image on article page
  As a visitor
  I should see article main image on article page

  Scenario: No image
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | title1          |
      | article_url | /article/title1 |
      | main_image  |                 |
      | body        | article body    |
    When I go to "/article/title1"
    Then I should not see an ".article-content__image" element

  Scenario: Large image - default
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title2                         |
      | article_url        | /article/title2                |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    When I go to "/article/title2"
    Then I should see an ".article-content__image" element
    And I should see images with filters:
      | name                           | filter      | load_type |
      | game-of-thrones-main-image.jpg | image_1500x | eager     |
    And I should see "image description" in the ".article-top .article-content__image-caption" element
    And I should see "Foto: John Doe" in the ".article-content__image-byline" element
    And I should see an "span.article-content__image__gallery-magnifier" element

  Scenario: Small image
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title3                         |
      | article_url        | /article/title3                |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Artikel > Lille billede |
      | name      | www.b.dk > Artikel > Lille billede |
    And author exist:
      | option         | value                                                     |
      | author_name    | Kate Doe                                                  |
      | author_image   | http://a.bimg.dk/node-images/173/6/6173749-ida-byline.jpg |
      | author_twitter | https://www.twitter.com/thisIsMyAccount                   |
      | author_url     | /redaktionen/kate-doe                                     |
      | author_email   | test@berlingske.dk                                        |
    And author exist:
      | option       | value                                    |
      | author_name  | Who Cares                                |
      | author_image | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_url   | /redaktionen/who-cares                   |
      | author_email | test@berlingske.dk                       |
    And "Kate Doe" is author of "title3" article
    And "Who Cares" is author of "title3" article
    And article "title3" has tag "www.b.dk > Artikel > Lille billede"
    When I go to "/article/title3"
    Then I should see an ".article-content__image--pull-right" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_640x | eager     |
    And I should see "image description" in the ".article-body .article-content__image-caption" element
    And I should see "Foto: John Doe" in the ".article-content__image-byline" element
    And I should see an "span.article-content__image__gallery-magnifier" element

  Scenario: Small image on paid new article
    Given "newsPlus" article page exists
    And article exist:
      | option             | value                          |
      | type               | news_plus                      |
      | title              | title_plus                     |
      | article_url        | /article/titlePlus             |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    And tag exist:
      | option    | value                              |
      | type      | presentation                       |
      | full_name | www.b.dk > Artikel > Lille billede |
      | name      | www.b.dk > Artikel > Lille billede |
    And article "title_plus" has tag "www.b.dk > Artikel > Lille billede"
    When I go to "/article/titlePlus"
    Then I should see "For abonnenter" in the ".article-header .subscriber-notice" element
    And I should see an ".article-content__image--pull-right" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_640x | eager     |
    And I should see "image description" in the ".article-body .article-content__image-caption" element
    And I should see "Foto: John Doe" in the ".article-content__image-byline" element
    And I should see an "span.article-content__image__gallery-magnifier" element

  @javascript
  Scenario: Large image, multiple embedded images
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title2                         |
      | article_url        | /article/ami1                  |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 2              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And equipment exist:
      | option | value             |
      | type   | file              |
      | title  | Equipment title 3 |
      | file   | zip-file.zip      |
    And article "title2" has embedded equipment "Equipment title 1"
    And article "title2" has embedded equipment "Equipment title 2"
    And article "title2" has embedded equipment "Equipment title 3"
    When I go to "/article/ami1"
    Then I wait for ".article-content__image span.article-content__image__gallery-counter" element
    And the ".article-content__image span.count" element should contain "2"

  @javascript
  Scenario: Open gallery popup when article has only main image
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title2                         |
      | article_url        | /article/ami2                  |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    When I go to "/article/ami2"
    And I wait for ".article-gallery-item img" element
    And I click on ".article-gallery-item img"
    Then I wait for "div.mfp-content" element

  @javascript
  Scenario: Close gallery popup when article has only main image
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title2                         |
      | article_url        | /article/ami3                  |
      | main_image         | game-of-thrones-main-image.jpg |
      | body               | article body                   |
      | image_caption      | image description              |
      | image_photographer | John Doe                       |
    When I go to "/article/ami3"
    And I wait for ".article-gallery-item img" element
    And I click on ".article-gallery-item img"
    And I wait for "div.mfp-content" element
    And I wait "1"
    And I wait for ".mfp-close" element
    And I click on ".mfp-close"
    Then I wait for "img.mfp-img" element to disappear

  @javascript
  Scenario: Open gallery popup when clicking on embedded image
    Given "news" article page exists
    And article exist:
      | option             | value                                                            |
      | type               | news                                                             |
      | title              | title2                                                           |
      | article_url        | /article/ami4                                                    |
      | main_image         | game-of-thrones-main-image.jpg                                   |
      | body               | article body {embedded type="node/node_image" id="3"} after body |
      | image_caption      | image description                                                |
      | image_photographer | John Doe                                                         |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 2       |
      | file         | khaleesi.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 3       |
      | file         | longread.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "title2" has embedded equipment "Equipment title 1"
    And article "title2" has embedded equipment "Equipment title 2"
    And article "title2" has embedded equipment "Equipment title 3"
    When I go to "/article/ami4"
    And I wait for ".article-embedded-image .article-gallery-item img" element
    And I click on ".article-embedded-image .article-gallery-item img"
    Then I wait for "div.mfp-content" element

  Scenario: Replace main image if more then 1 attached image
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title1                         |
      | article_url        | /article/title1                |
      | body               | article body                   |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | image description              |
      | photographer | John Doe                       |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 2       |
      | file         | longread.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And tag exist:
      | option    | value                                                  |
      | type      | presentation                                           |
      | full_name | www.b.dk > Artikel > Vis ikke første billede i artikel |
      | name      | www.b.dk > Artikel > Vis ikke første billede i artikel |
    And article "title1" has tag "www.b.dk > Artikel > Vis ikke første billede i artikel"
    And article "title1" has default equipment "Equipment title 1"
    And article "title1" has default equipment "Equipment title 2"
    And "Equipment title 1" is articles "title1" main image
    When I go to "/article/title1"
    Then I should see images with filters:
      | name         | filter      | load_type |
      | longread.jpg | image_1500x | eager     |

  Scenario: Replace main image if only 1 attached image (show article without image)
    Given "news" article page exists
    And article exist:
      | option             | value                          |
      | type               | news                           |
      | title              | title1                         |
      | article_url        | /article/title1                |
      | body               | article body                   |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | image description              |
      | photographer | John Doe                       |
    And tag exist:
      | option    | value                                                  |
      | type      | presentation                                           |
      | full_name | www.b.dk > Artikel > Vis ikke første billede i artikel |
      | name      | www.b.dk > Artikel > Vis ikke første billede i artikel |
    And article "title1" has tag "www.b.dk > Artikel > Vis ikke første billede i artikel"
    And article "title1" has default equipment "Equipment title 1"
    And "Equipment title 1" is articles "title1" main image
    When I go to "/article/title1"
    Then I should not see an ".article-content__image" element
