Feature: Embedded links
  In order to understand article subject
  As a visitor
  I want to see article embedded video links

  Scenario: Show video article free embedded link with video
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | 160x160.jpg                               |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video" element
    And the response should contain "\"autostart\": false"

  Scenario: Show video article free embedded link with stream
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                             |
      | type        | video                             |
      | title       | title2                            |
      | article_url | /article/title2                   |
      | video_link  | rtmp://82.180.24.18/live/bmedia03 |
      | video_type  | 2                                 |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-stream" element
    And the response should contain "\"autostart\": false"

  Scenario: Show video article free embedded link with youtube
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                        |
      | type        | video                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"

  Scenario: Show video article free embedded link with audio
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | video_link  | http://webtv.metropol.dk/clip/42693/bt/38 |
      | video_type  | 4                                         |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-audio" element
    And the response should contain "\"autostart\": false"

  Scenario: Show video article free embedded link with iframe
    Given "news" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | news                                                         |
      | title       | title1                                                       |
      | article_url | /article/title3                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                                 |
      | type        | video                                 |
      | title       | title2                                |
      | article_url | /article/title2                       |
      | video_link  | http://www.tv3play.dk/embed?id=656711 |
      | video_type  | 5                                     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title3"
    Then I should see an ".article-embedded-video-iframe" element

  Scenario: Show longRead article free embedded link with youtube
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                        |
      | type        | longread                                                     |
      | title       | title1                                                       |
      | article_url | /article/title1                                              |
      | body        | some body {embedded type="node/webtv_link" id="2"} more body |
    And article exist:
      | option      | value                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | type        | video                        |
      | playlist    | playlist.xml                 |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"

  Scenario: Show longRead article free screen width embedded link with video
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                             |
      | type        | longread                                                                          |
      | title       | title1                                                                            |
      | article_url | /article/title1                                                                   |
      | body        | some body {embedded type="node/webtv_link" id="2" width="screen_width"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | 160x160.jpg                               |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video" element
    And the response should contain "\"autostart\": false"
    And I should see an ".article-embedded-video--screen-width" element

  Scenario: Show longRead article free left half width embedded link with video
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                        |
      | type        | longread                                                                                     |
      | title       | title1                                                                                       |
      | article_url | /article/title1                                                                              |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="left"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | 160x160.jpg                               |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article free right half width embedded link with video
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                         |
      | type        | longread                                                                                      |
      | title       | title1                                                                                        |
      | article_url | /article/title1                                                                               |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="right"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | playlist    | playlist.xml                              |
      | video_link  | http://webtv.metropol.dk/clip/37906/bt/25 |
      | video_type  | 1                                         |
      | main_image  | 160x160.jpg                               |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show longRead article free screen width embedded link with youtube
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                             |
      | type        | longread                                                                          |
      | title       | title1                                                                            |
      | article_url | /article/title1                                                                   |
      | body        | some body {embedded type="node/webtv_link" id="2" width="screen_width"} more body |
    And article exist:
      | option      | value                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | type        | video                        |
      | playlist    | playlist.xml                 |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"
    And I should see an ".article-embedded-video--screen-width" element

  Scenario: Show longRead article free left half width embedded link with youtube
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                        |
      | type        | longread                                                                                     |
      | title       | title1                                                                                       |
      | article_url | /article/title1                                                                              |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="left"} more body |
    And article exist:
      | option      | value                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | type        | video                        |
      | playlist    | playlist.xml                 |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article free right half width embedded link with youtube
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                         |
      | type        | longread                                                                                      |
      | title       | title1                                                                                        |
      | article_url | /article/title1                                                                               |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="right"} more body |
    And article exist:
      | option      | value                        |
      | title       | title2                       |
      | article_url | /article/title2              |
      | type        | video                        |
      | playlist    | playlist.xml                 |
      | video_link  | https://youtu.be/Tu79J8n8k_k |
      | video_type  | 3                            |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-youtube" element
    And the response should contain "autoplay=false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show longRead article free screen width embedded link with iframe
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                             |
      | type        | longread                                                                          |
      | title       | title1                                                                            |
      | article_url | /article/title1                                                                   |
      | body        | some body {embedded type="node/webtv_link" id="2" width="screen_width"} more body |
    And article exist:
      | option      | value                                 |
      | type        | video                                 |
      | title       | title2                                |
      | article_url | /article/title2                       |
      | video_link  | http://www.tv3play.dk/embed?id=656711 |
      | video_type  | 5                                     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-iframe" element
    And I should see an ".article-embedded-video--screen-width" element

  Scenario: Show longRead article free left half width embedded link with iframe
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                        |
      | type        | longread                                                                                     |
      | title       | title1                                                                                       |
      | article_url | /article/title1                                                                              |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="left"} more body |
    And article exist:
      | option      | value                                 |
      | type        | video                                 |
      | title       | title2                                |
      | article_url | /article/title2                       |
      | video_link  | http://www.tv3play.dk/embed?id=656711 |
      | video_type  | 5                                     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-iframe" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article free right half width embedded link with iframe
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                         |
      | type        | longread                                                                                      |
      | title       | title1                                                                                        |
      | article_url | /article/title1                                                                               |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="right"} more body |
    And article exist:
      | option      | value                                 |
      | type        | video                                 |
      | title       | title2                                |
      | article_url | /article/title2                       |
      | video_link  | http://www.tv3play.dk/embed?id=656711 |
      | video_type  | 5                                     |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-iframe" element
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show longRead article free screen width embedded link with stream
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                             |
      | type        | longread                                                                          |
      | title       | title1                                                                            |
      | article_url | /article/title1                                                                   |
      | body        | some body {embedded type="node/webtv_link" id="2" width="screen_width"} more body |
    And article exist:
      | option      | value                             |
      | type        | video                             |
      | title       | title2                            |
      | article_url | /article/title2                   |
      | video_link  | rtmp://82.180.24.18/live/bmedia03 |
      | video_type  | 2                                 |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-stream" element
    And the response should contain "\"autostart\": false"
    And I should see an ".article-embedded-video--screen-width" element

  Scenario: Show longRead article free left half width embedded link with stream
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                        |
      | type        | longread                                                                                     |
      | title       | title1                                                                                       |
      | article_url | /article/title1                                                                              |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="left"} more body |
    And article exist:
      | option      | value                             |
      | type        | video                             |
      | title       | title2                            |
      | article_url | /article/title2                   |
      | video_link  | rtmp://82.180.24.18/live/bmedia03 |
      | video_type  | 2                                 |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-stream" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article free right half width embedded link with stream
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                         |
      | type        | longread                                                                                      |
      | title       | title1                                                                                        |
      | article_url | /article/title1                                                                               |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="right"} more body |
    And article exist:
      | option      | value                             |
      | type        | video                             |
      | title       | title2                            |
      | article_url | /article/title2                   |
      | video_link  | rtmp://82.180.24.18/live/bmedia03 |
      | video_type  | 2                                 |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video-stream" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element

  Scenario: Show longRead article free screen width embedded link with audio
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                             |
      | type        | longread                                                                          |
      | title       | title1                                                                            |
      | article_url | /article/title1                                                                   |
      | body        | some body {embedded type="node/webtv_link" id="2" width="screen_width"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | video_link  | http://webtv.metropol.dk/clip/42693/bt/38 |
      | video_type  | 4                                         |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-audio" element
    And the response should contain "\"autostart\": false"
    And I should see an ".article-embedded-video--screen-width" element

  Scenario: Show longRead article free left half width embedded link with audio
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                        |
      | type        | longread                                                                                     |
      | title       | title1                                                                                       |
      | article_url | /article/title1                                                                              |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="left"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | video_link  | http://webtv.metropol.dk/clip/42693/bt/38 |
      | video_type  | 4                                         |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-audio" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-left" element
    And I should not see an ".longread-embedded-half-width--pull-right" element

  Scenario: Show longRead article free right half width embedded link with audio
    Given "longRead" article page exists
    And article exist:
      | option      | value                                                                                         |
      | type        | longread                                                                                      |
      | title       | title1                                                                                        |
      | article_url | /article/title1                                                                               |
      | body        | some body {embedded type="node/webtv_link" id="2" width="half_width" align="right"} more body |
    And article exist:
      | option      | value                                     |
      | type        | video                                     |
      | title       | title2                                    |
      | article_url | /article/title2                           |
      | video_link  | http://webtv.metropol.dk/clip/42693/bt/38 |
      | video_type  | 4                                         |
    And article "title1" has embedded related article "title2"
    When I go to "/article/title1"
    Then I should see an ".article-embedded-audio" element
    And the response should contain "\"autostart\": false"
    And I should see an ".longread-embedded-half-width" element
    And I should see an ".longread-embedded-half-width--pull-right" element
    And I should not see an ".longread-embedded-half-width--pull-left" element
