Feature: Sitemap page
  In order to see available articles
  As a visitor
  I want to see the sitemap of articles on the page

  Background:
    Given articles exist:
      | title          | article_url     | type | supertitle  | date_created |
      | Article title1 | /article/title1 | news | supertitle1 | 2016-01-02   |
      | Article title2 | /article/title2 | news |             | 2015-12-30   |
      | Article title3 | /article/title3 | news | supertitle3 | 2015-12-30   |
      | Article title4 | /article/title4 | news |             | 2015-03-10   |
      | Article title5 | /article/title5 | news |             | 2013-03-15   |
    Given articles exist:
      | title                   | external_url                               | type     | supertitle  | date_created |
      | External article title1 | http://external_host/some_external_address | external | supertitle2 | 2016-03-02   |


  Scenario: List of resources on sitemap page
    Given I go to "/sitemap.xml"
    Then I should see in sitemap.xml response
      | sitemap_index | loc                                            |
      | 0             | https://behat.bdk.dev/sitemap.xml/articles     |
      | 1             | https://behat.bdk.dev/sitemap.xml/tags         |
      | 2             | https://behat.bdk.dev/sitemap.xml/custom-pages |

