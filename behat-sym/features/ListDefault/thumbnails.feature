Feature: Show thumbnails on default list
  In order to have a possibility to see thumbnails on default list block
  As a visitor
  I should see thumbnails on default list block

  Scenario: Show thumbnails on default with lazy loading
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /thumbnails_1      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option     | value                                                    |
      | title      | List title                                               |
      | list_style | none                                                     |
      | show_image | 1                                                        |
      | source     | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit      | 5                                                        |
    And blocks are added to page
    And articles exist:
      | title                                                                                             | main_image   | type |
      | Lars Seier fra lystyachten Brexit er et fatalt dødsstød mod EU, men folk kan tage det helt roligt | 160x160.jpg  | news |
      | Efter skandalehistorier om kongehuset Kendt chef for dansk ugeblad stopper                        | khaleesi.jpg | news |
    When I go to "/thumbnails_1"
    Then I should see images with filters:
      | name         | filter      | load_type |
      | 160x160.jpg  | image_80x80 | lazy      |
      | khaleesi.jpg | image_80x80 | lazy      |

  Scenario: Show thumbnails on default list with eager loading
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /thumbnails_1      |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_basic_data.list.various_sources" building block exists:
      | option            | value                                                    |
      | title             | List title                                               |
      | list_style        | none                                                     |
      | show_image        | 1                                                        |
      | source            | bm_basic_data.data_provider.content_by_criteria_provider |
      | limit             | 5                                                        |
      | disable_lazy_load | 1                                                        |
    And blocks are added to page
    And articles exist:
      | title                                                                                             | main_image   | type |
      | Lars Seier fra lystyachten Brexit er et fatalt dødsstød mod EU, men folk kan tage det helt roligt | 160x160.jpg  | news |
      | Efter skandalehistorier om kongehuset Kendt chef for dansk ugeblad stopper                        | khaleesi.jpg | news |
    When I go to "/thumbnails_1"
    Then I should see images with filters:
      | name         | filter      | load_type |
      | 160x160.jpg  | image_80x80 | eager     |
      | khaleesi.jpg | image_80x80 | eager     |
