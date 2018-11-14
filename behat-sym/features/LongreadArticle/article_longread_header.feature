Feature: Article header
  In order to have a possibility to see article header on longRead article page
  As a visitor
  I should see article main image, title and summary on longRead article page

  Scenario: Show longRead header without main image
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | title       | titleLongread1  |
      | type        | longread        |
      | article_url | /article/title1 |
      | main_image  |                 |
      | summary     | subtitle        |
    When I go to "/article/title1"
    Then I should see an ".longread-head" element
    And I should see "titleLongread1" in the ".longread-head__title" element
    And I should see "subtitle" in the ".longread-head__summary" element
    And I should see an ".longread-head__no-image" element

  Scenario: Show longRead header
    Given "longRead" article page exists
    And article exist:
      | option             | value                          |
      | title              | titleLongread1                 |
      | type               | longread                       |
      | article_url        | /article/title2                |
      | main_image         | game-of-thrones-main-image.jpg |
      | image_photographer | John Doe                       |
      | summary            | subtitle                       |
    When I go to "/article/title2"
    Then I should see an ".longread-head" element
    And I should see images in background with filters:
      | name                           | filter      | className            |
      | game-of-thrones-main-image.jpg | image_2560x | longread-head__image |
    And I should see "titleLongread1" in the ".longread-head__title" element
    And I should see "subtitle" in the ".longread-head__summary" element
    And I should see "John Doe" in the ".longread-head__image-byline" element

  Scenario: Show longread article with black background
    Given "longRead" article page exists
    And article exist:
      | option      | value           |
      | type        | longread        |
      | title       | titleLongread1  |
      | article_url | /article/title1 |
      | body        | article body    |
      | main_image  | longread.jpg    |
    And equipment exist:
      | option       | value                   |
      | type         | image                   |
      | title        | Equipment title 1       |
      | file         | longread.jpg            |
      | caption      | Image equipment caption |
      | photographer | Mr. Some Photographer   |
    And tag exist:
      | option    | value                       |
      | type      | presentation                |
      | full_name | Longread > Black background |
      | name      | Longread > Black background |
    And article "titleLongread1" has tag "Longread > Black background"
    And article "titleLongread1" has default equipment "Equipment title 1"
    When I go to "/article/title1"
    Then I should see an ".longread-head" element
    And I should see an "body.longread--bg-black" element

  Scenario: Replace main image if more then 1 attached image
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | title       | titleLongread1                 |
      | article_url | /article/title1                |
      | body        | article body                   |
      | main_image  | game-of-thrones-main-image.jpg |
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
    And article "titleLongread1" has tag "www.b.dk > Artikel > Vis ikke første billede i artikel"
    And article "titleLongread1" has default equipment "Equipment title 1"
    And article "titleLongread1" has default equipment "Equipment title 2"
    And "Equipment title 1" is articles "titleLongread1" main image
    When I go to "/article/title1"
    Then I should see an ".longread-head" element
    And I should see images in background with filters:
      | name         | filter      | className            |
      | longread.jpg | image_2560x | longread-head__image |

  Scenario: Replace main image if only 1 attached image (show article without image)
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | title       | titleLongread1                 |
      | article_url | /article/title1                |
      | body        | article body                   |
      | summary     | article summary                |
      | main_image  | game-of-thrones-main-image.jpg |
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
    And article "titleLongread1" has tag "www.b.dk > Artikel > Vis ikke første billede i artikel"
    And article "titleLongread1" has default equipment "Equipment title 1"
    And "Equipment title 1" is articles "titleLongread1" main image
    When I go to "/article/title1"
    Then I should see an ".longread-head" element
    And I should see "titleLongread1" in the ".longread-head__title" element
    And I should see "article summary" in the ".longread-head__summary" element
    And I should see an ".longread-head__no-image" element

  Scenario: Video as main element for Longread
    Given "longRead" article page exists
    And article exist:
      | option      | value                         |
      | type        | longread                      |
      | title       | Romeo & Juliette              |
      | article_url | /longread-with-video          |
      | body        | Who wants to live forever?    |
      | summary     | Who wants to love forever?    |
      | main_image  | romeo-and-juliette.jpg        |
    And article exist:
      | option      | value                                     |
      | title       | Romeo & Juliette video                    |
      | article_url | /article/video                            |
      | type        | video                                     |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
    And tag exist:
      | option    | value                        |
      | type      | presentation                 |
      | full_name | Longread > Video top element |
      | name      | Longread > Video top element |
    And article "Romeo & Juliette" has related article "Romeo & Juliette video"
    And article "Romeo & Juliette" has tag "Longread > Video top element"
    When I go to "/longread-with-video"
    Then I should see an ".longread-head" element
    And I should see "Romeo & Juliette" in the ".longread-head__title" element
    And I should see "Who wants to love forever?" in the ".longread-head__summary" element
    Then I should see an ".article-embedded-video" element
    And I should see "\"autostart\": true"
