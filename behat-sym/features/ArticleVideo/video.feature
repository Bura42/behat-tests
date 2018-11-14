Feature: Article video
  In order to understand article subject
  As a visitor
  I want to see article video player

  Scenario: Show video teaser
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                                | video_type |
      | title1 | /article/title1 | video | playlist.xml | http://webtv.metropol.dk/clip/37906/bt/25 | 1          |
    When I go to "/article/title1"
    Then I should see an ".article-embedded-video" element
    And I should see "\"autostart\": true"

  Scenario: Autoplay video
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                                | video_type |
      | title1 | /article/title1 | video | playlist.xml | http://webtv.metropol.dk/clip/37906/bt/25 | 1          |
    When I go to "/article/title1"
    Then I should see "\"autostart\": true"

  Scenario: Autoplay youtube
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                   | video_type |
      | title1 | /article/title1 | video | playlist.xml | https://youtu.be/Tu79J8n8k_k | 3          |
    When I go to "/article/title1"
    Then the response should contain "autoplay=true"

  Scenario: Autoplay stream
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                        | video_type |
      | title1 | /article/title1 | video | playlist.xml | rtmp://82.180.24.18/live/bmedia03 | 2          |
    When I go to "/article/title1"
    Then I should see "\"autostart\": true"

  Scenario: Autoplay audio
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                                | video_type |
      | title1 | /article/title1 | video | playlist.xml | http://webtv.metropol.dk/clip/42693/bt/38 | 4          |
    When I go to "/article/title1"
    Then I should see "\"autostart\": true"

  Scenario: Enable ads
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                                | video_type | skip_ads |
      | title1 | /article/title1 | video | playlist.xml | http://webtv.metropol.dk/clip/37906/bt/25 | 1          | 0        |
    When I go to "/article/title1"
    Then I should see "\"skipButton\": false"
    Then I should see "\"autostart\": true"

  Scenario: Disable ads
    Given "video" article page exists
    And articles exist:
      | title  | article_url     | type  | playlist     | video_link                                | video_type | skip_ads |
      | title1 | /article/title1 | video | playlist.xml | http://webtv.metropol.dk/clip/37906/bt/25 | 1          | 1        |
    When I go to "/article/title1"
    Then I should not see "\"skipButton\""
    Then I should see "\"autostart\": true"
