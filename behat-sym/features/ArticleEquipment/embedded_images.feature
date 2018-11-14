Feature: Embedded images
  In order to mention other article context
  As a visitor
  I want to see other article images

  Scenario: Show article embedded images - news article
    Given "news" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | news                                                            |
      | title       | Article title                                                   |
      | article_url | /article/title1                                                 |
      | body        | Before body {embedded type="node/node_image" id="1"} after body |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Before body                 |
      | After body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should not see an "figure.article-embedded--pull-right" element
    And I should see an "figure.article-image-embedded" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_700x | lazy      |

  Scenario: Show article embedded images - large article
    Given "large" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | large                                                           |
      | title       | Article title                                                   |
      | article_url | /article/title1                                                 |
      | body        | Before body {embedded type="node/node_image" id="1"} after body |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Before body                 |
      | After body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should see an ".article-embedded--pull-right" element
    And I should see an ".article-image-embedded" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_350x | lazy      |

  Scenario: Show article embedded images - longRead article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | longread                                                        |
      | title       | Article title                                                   |
      | article_url | /article/title2                                                 |
      | main_image  | screen_test.jpg                                                 |
      | summary     | Article subtitle                                                |
      | body        | Before body {embedded type="node/node_image" id="2"} after body |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 1       |
      | file         | screen_test.jpg         |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title2"
    Then I should see the list of elements:
      | Before body                 |
      | after body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should not see an ".article-embedded--pull-right" element
    And I should see an ".article-embedded-image" element
    And I should see images with filters:
      | name            | filter      | load_type |
      | screen_test.jpg | image_1049x | lazy      |

  Scenario: Show article screen width embedded images - longRead article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                |
      | type        | longread                                                                             |
      | title       | Article title                                                                        |
      | article_url | /article/title2                                                                      |
      | main_image  | screen_test.jpg                                                                      |
      | summary     | Article subtitle                                                                     |
      | body        | Before body {embedded type="node/node_image" id="2" width="screen_width"} after body |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 1       |
      | file         | screen_test.jpg         |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title2"
    Then I should see the list of elements:
      | Before body                 |
      | after body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should not see an ".article-embedded--pull-right" element
    And I should see an ".article-embedded-image" element
    And I should see an ".article-embedded-image--screen-width" element
    And I should see images with filters:
      | name            | filter      | load_type |
      | screen_test.jpg | image_1500x | lazy      |

  Scenario: Show article left half width embedded images - longRead article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                           |
      | type        | longread                                                                                        |
      | title       | Article title                                                                                   |
      | article_url | /article/title2                                                                                 |
      | main_image  | screen_test.jpg                                                                                 |
      | summary     | Article subtitle                                                                                |
      | body        | Before body {embedded type="node/node_image" id="2" width="half_width" align="left"} after body |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 1       |
      | file         | screen_test.jpg         |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title2"
    Then I should see the list of elements:
      | Before body                 |
      | after body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should see an ".article-embedded-image" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element
    And I should see images with filters:
      | name            | filter     | load_type |
      | screen_test.jpg | image_524x | lazy      |

  Scenario: Show article right half width embedded images - longRead article
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                            |
      | type        | longread                                                                                         |
      | title       | Article title                                                                                    |
      | article_url | /article/title2                                                                                  |
      | main_image  | screen_test.jpg                                                                                  |
      | summary     | Article subtitle                                                                                 |
      | body        | Before body {embedded type="node/node_image" id="2" width="half_width" align="right"} after body |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 1       |
      | file         | screen_test.jpg         |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title2"
    Then I should see the list of elements:
      | Before body                 |
      | after body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should see an ".article-embedded-image" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element
    And I should see images with filters:
      | name            | filter     | load_type |
      | screen_test.jpg | image_524x | lazy      |

  Scenario: Show article embedded images - video article
    Given "video" article page exists
    And article exist:
      | option      | value                                                           |
      | title       | Article title                                                   |
      | article_url | /article/title3                                                 |
      | type        | video                                                           |
      | body        | Before body {embedded type="node/node_image" id="1"} after body |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title3"
    Then I should see the list of elements:
      | Before body                 |
      | after body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should see an ".article-image-embedded" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_700x | lazy      |

  Scenario: Show article embedded images - advertorial article
    Given "advertorial" article page exists
    And article exist:
      | option      | value                                                           |
      | type        | advertorial                                                     |
      | title       | Article title                                                   |
      | article_url | /article/title1                                                 |
      | body        | Before body {embedded type="node/node_image" id="1"} after body |
    And tag exist:
      | option    | value              |
      | type      | category           |
      | full_name | www.b.dk > Annonce |
      | name      | www.b.dk > Annonce |
    And article "Article title" has tag "www.b.dk > Annonce"
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "Article title" has embedded equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see the list of elements:
      | Before body                 |
      | After body                  |
      | Image equipment caption     |
      | Foto: Mr. Some Photographer |
    And I should not see an ".article-embedded--pull-right" element
    And I should see an ".article-image-embedded" element
    And I should see images with filters:
      | name                           | filter     | load_type |
      | game-of-thrones-main-image.jpg | image_700x | lazy      |

  @javascript
  Scenario: Image magnifier when there is no main image
    Given "news" article page exists
    And article exist:
      | option      | value                                                            |
      | type        | news                                                             |
      | title       | title1                                                           |
      | article_url | /article/title4                                                  |
      | body        | article body {embedded type="node/node_image" id="1"} after body |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "title1" has embedded equipment "Equipment title 1"
    When I go to "/article/title4"
    And I wait for ".article-body span.article-content__image__gallery-magnifier" element

  @javascript
  Scenario: Image counter when there is no main image
    Given "news" article page exists
    And article exist:
      | option      | value                                                            |
      | type        | news                                                             |
      | title       | title2                                                           |
      | article_url | /article/title5                                                  |
      | body        | article body {embedded type="node/node_image" id="3"} after body |
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
    When I go to "/article/title5"
    And I wait for ".article-body span.article-content__image__gallery-counter" element
    Then the ".article-body span.count" element should contain "3"

  @javascript
  Scenario: Show gallery for embedded image inside longread article
    Given "longRead" article page exists
    And article exist:
      | option             | value                                                            |
      | type               | longread                                                         |
      | title              | title2                                                           |
      | article_url        | /article/ami1                                                    |
      | main_image         | game-of-thrones-main-image.jpg                                   |
      | body               | article body {embedded type="node/node_image" id="2"} after body |
      | image_caption      | image description                                                |
      | image_photographer | John Doe                                                         |
    And equipment exist:
      | option       | value                          |
      | type         | image                          |
      | title        | Equipment title 1              |
      | file         | game-of-thrones-main-image.jpg |
      | caption      | Image equipment caption        |
      | photographer | Mr. Some Photographer          |
    And article "title2" has embedded equipment "Equipment title 1"
    When I go to "/article/ami1"
    And I click on ".article-gallery-item img"
    Then I wait for "div.mfp-content" element
    And I wait for ".mfp-close" element
    And I click on ".mfp-close"
    Then I wait for "img.mfp-img" element to disappear
    And I should not see an ".article-embedded-image span.article-content__image__gallery-counter" element
    And I should not see an "span.article-content__image__gallery-magnifier" element
