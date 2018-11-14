Feature: Gallup tracking
  In be able to track articles popularity
  As a visitor
  I want to see proper tracking parameters in source

  Background:
    Given author exist:
      | option         | value                                    |
      | author_name    | Kate Doe                                 |
      | author_image   | http://blogs.bt.dk/avatar/user-61-96.png |
      | author_twitter | http://twitter.com/thisIsMyAccount       |
      | author_email   | test@berlingske.dk                       |
    And tags exist:
      | name         | full_name                              | type     | tag_url       |
      | www.b.dk     | www.b.dk                               | category |               |
      | MainCategory | www.b.dk > MainCategory                | category | /maincategory |
      | Subcategory  | www.b.dk > MainCategory >  Subcategory | category | /subcategory  |
    And "www.b.dk" tag is parent of "www.b.dk > MainCategory" tag
    And "www.b.dk > MainCategory" tag is parent of "www.b.dk > MainCategory >  Subcategory" tag

  Scenario: Add tracking parameters to news article
    Given "news" article page exists
    And article exist:
      | option           | value           |
      | type             | news            |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to newsPlus article
    Given "newsPlus" article page exists
    And article exist:
      | option           | value           |
      | type             | news_plus       |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to large article
    Given "large" article page exists
    And article exist:
      | option           | value           |
      | type             | large           |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to largePlus article
    Given "largePlus" article page exists
    And article exist:
      | option           | value           |
      | type             | large_plus      |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to longread article
    Given "longRead" article page exists
    And article exist:
      | option           | value           |
      | type             | longread        |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to longreadPlus article
    Given "longReadPlus" article page exists
    And article exist:
      | option           | value           |
      | type             | longread_plus   |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to advertorial article
    Given "advertorial" article page exists
    And article exist:
      | option           | value           |
      | type             | advertorial     |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to video article
    Given "video" article page exists
    And article exist:
      | option           | value           |
      | type             | video           |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
      | video_type       | 1               |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to videoPlus article
    Given "videoPlus" article page exists
    And article exist:
      | option           | value           |
      | type             | video_plus      |
      | title            | Article title   |
      | article_url      | /article/title1 |
      | body             | article body    |
      | author_free_text | some free text  |
      | video_type       | 1               |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to image gallery article
    Given "imageGallery" article page exists
    And article exist:
      | option             | value             |
      | type               | image_gallery     |
      | title              | Article title     |
      | article_url        | /article/title1   |
      | main_image         | image_160x106.jpg |
      | image_caption      | image description |
      | image_photographer | John Doe          |
    And "Kate Doe" is author of "Article title" article
    And article "Article title" has tag "Subcategory"
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
    And article "Article title" has default equipment "Equipment title 1"
    And article "Article title" has default equipment "Equipment title 2"
    When I go to "/article/title1"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/article     |
      | url       | document.location.href |

  Scenario: Add tracking parameters to frontpage
    Given test front page exists
    When I go to "/frontpage"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/frontpage   |
      | url       | document.location.href |

  Scenario: Add tracking parameters to category page
    And section page exists
    When I go to "/subcategory"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/subcategory |
      | url       | document.location.href |

  Scenario: Add tracking parameters to topic page
    And topic page exists
    And tag exist:
      | option    | value            |
      | type      | topic            |
      | full_name | Topic page title |
      | name      | Topic page title |
    When I go to "/tag/item/4"
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/tag         |
      | url       | document.location.href |

  Scenario: Add tracking parameters to 404 page
    When I go to non-existent page
    Then gallup tracking params should be set to:
      | parameter | value                  |
      | s         | berlingske             |
      | cp        | berlingske/_error      |
      | url       | document.location.href |
