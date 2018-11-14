Feature: Image gallery
  In order to have a possibility to see image gallery
  As a visitor
  I should see article image gallery on image gallery page

  @javascript
  Scenario: Replace main image if more then 1 attached image
    Given "imageGallery" article page exists
    And article exist:
      | option             | value             |
      | type               | image_gallery     |
      | title              | title1            |
      | article_url        | /gallery          |
      | main_image         | image_160x106.jpg |
      | image_caption      | image description |
      | image_photographer | John Doe          |
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
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 4       |
      | file         | image_140x93.jpg        |
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
    And article "title1" has default equipment "Equipment title 3"
    And article "title1" has default equipment "Equipment title 4"
    When I go to "/gallery"
    And I wait for ".gallery-list .slick-current img[src*='game-of-thrones']" element
    Then I should see images with filters:
      | name                           | filter                 | load_type |
      | game-of-thrones-main-image.jpg | image_1920x1080-noCrop | eager     |

  @javascript
  Scenario: Show image gallery
    Given "imageGallery" article page exists
    And article exist:
      | option             | value             |
      | type               | image_gallery     |
      | title              | title1            |
      | article_url        | /gallery          |
      | main_image         | image_160x106.jpg |
      | image_caption      | image description |
      | image_photographer | John Doe          |
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
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 4       |
      | file         | image_140x93.jpg        |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And article "title1" has default equipment "Equipment title 1"
    And article "title1" has default equipment "Equipment title 2"
    And article "title1" has default equipment "Equipment title 3"
    And article "title1" has default equipment "Equipment title 4"
    And article "title1" has default equipment "Equipment title 5"
    When I go to "/gallery"
    Then I wait for "div.slick-slider" element
    And an element ".slick-active .gallery-caption" should be visible
    When I click on ".gallery-btn-show-caption"
    Then I should see an ".slick-active .gallery-caption" element

  @javascript
  Scenario: Show last slide
    Given "imageGallery" article page exists
    And article exist:
      | option       | value                                   |
      | type         | image_gallery                           |
      | article_url  | /gallery_last                           |
      | main_image   | image_160x106.jpg                       |
      | title        | Lorem ipsum dolor sit amet, consectetur |
      | summary      | summary1                                |
      | date_created | 2016-05-31 12:00                        |
    And article exist:
      | option             | value                                          |
      | type               | image_gallery                                  |
      | article_url        | /gallery_last2                                 |
      | main_image         | longread.jpg                                   |
      | title              | utrum nisi vulputate. Proin fermentum sapien u |
      | summary            | summary2                                       |
      | image_caption      | image description                              |
      | image_photographer | John Doe                                       |
      | date_created       | 2016-05-31 13:00                               |
    And article exist:
      | option       | value                                        |
      | type         | image_gallery                                |
      | article_url  | /gallery_last3                               |
      | main_image   | khaleesi.jpg                                 |
      | title        | rutrum felis, in pharetra orci urna at magna |
      | summary      | summary3                                     |
      | date_created | 2016-05-31 14:00                             |
    And article exist:
      | option       | value                                   |
      | type         | image_gallery                           |
      | article_url  | /gallery_last4                          |
      | main_image   | game-of-thrones-main-image.jpg          |
      | title        | nia massa consequat varius. Maecenas da |
      | summary      | summary4                                |
      | date_created | 2016-05-31 15:00                        |
    And article exist:
      | option       | value                          |
      | type         | image_gallery                  |
      | article_url  | /gallery_last5                 |
      | main_image   | game-of-thrones-main-image.jpg |
      | title        | What should it be?             |
      | summary      | summary5                       |
      | date_created | 2016-05-31 16:00               |
    And article exist:
      | option       | value                                                    |
      | type         | image_gallery                                            |
      | article_url  | /gallery_last6                                           |
      | main_image   | game-of-thrones-main-image.jpg                           |
      | title        | Hey! I should be first article in latest galleries list! |
      | summary      | summary6                                                 |
      | date_created | 2016-05-31 17:00                                         |
    When I go to "/gallery_last2#slide-2"
    And I wait for "div.container.other-galleries" element
    And I should see "Seneste billedserier" in the "div.list__title" element
    And I should see 4 "div.teaser-small" elements
    And I should see "Afspil igen" in the "button.play-again" element
    And I should see "Hey! I should be first article in latest galleries list!" in the "div.teaser-small" element
    When I go to "/gallery_last6#slide-2"
    And I should not see "Hey! I should be first article in latest galleries list!"
