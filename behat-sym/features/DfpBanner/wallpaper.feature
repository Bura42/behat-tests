Feature: Show Wallpaper DFP banner
    In order to monetize
    As a visitor
    I should see Wallpaper banner

  Scenario: Wallpaper banner on frontpage
    Given "custom_page" site manager page exists:
      | option      | value              |
      | url         | /                  |
      | title       | Custom page title  |
      | description | Custom description |
    And "bm_custom_markup.block" building block exists:
      | option        | value                        |
      | custom_markup | Because there can NOT be page without blocks! |
    And blocks are added to page
    When I go to homepage
    Then I should see an "#Wallpaper" element with attribute "class" set to "dfp-top-wallpaper"

  Scenario: Wallpaper banner in article
    Given "news" article page exists
    And article exist:
      | option      | value           |
      | type        | news            |
      | title       | Article title   |
      | article_url | /article/title1 |
      | body        | Article body    |
    When I go to "/article/title1"
    Then I should see an "#Wallpaper" element with attribute "class" set to "dfp-top-wallpaper"

  Scenario: Not showing Wallpaper banner in longread
    Given "longRead" article page exists
    And article exist:
      | option      | value                          |
      | type        | longread                       |
      | title       | Article title                  |
      | article_url | /article/title1                |
      | main_image  | game-of-thrones-main-image.jpg |
      | body        | Article body                   |
    When I go to "/article/title1"
    Then I should not see an "#Wallpaper" element
