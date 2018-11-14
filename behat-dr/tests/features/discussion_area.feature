Feature: Discussion area
  As a site visitor
  I want visit and see the Discussion pages

  @gloria
  Scenario: [Main page] Visitor visits the Main Discussion page
    Given I am on "/keskustelu"
    Then I should see "KESKUSTELUT"
    And I should see "TERVETULOA KESKUSTELEMAAN"
    Then I should see the link "Lue keskustelualueen säännöt." in the "content" region
    And I should see a ".pane-discussion-front-list .sanoma-2col-header .top .first a[href='http://www.menaiset.fi/keskustelujen_saannot']" element

  @menaiset
  Scenario: [Main page] Visitor visits the Main Discussion page
    Given I am on "/keskustelu"
    Then I should see "KESKUSTELUT"
    And I should see "TERVETULOA KESKUSTELEMAAN ME NAISTEN SIVUILLE!"
    Then I should see the link "Lue keskustelualueen säännöt." in the "content" region
    And I should see a ".pane-discussion-front-list .sanoma-2col-header .top .first a[href='http://www.menaiset.fi/keskustelujen_saannot']" element

  @menaiset
  Scenario: [Main page] Visitor can see Discussion sort links
    Given I am on "/keskustelu"
    Then I should see the link "Uusimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu']" element
    Then I should see the link "Suosituimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu?sort=popular_date']" element
    Then I should see the link "Kommentoiduimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu?sort=comment']" element

  @menaiset
  Scenario: [Main page] Visitor can see Search block above action links on mobile
    Given I am on "/keskustelu"
    Then I should see an ".sanoma-2col-header #views-exposed-form-discussion-search-block" element

  @menaiset
  Scenario: [Main page] Visitor can see Discussion action links
    Given I am on "/keskustelu"
    Then I should see the link "Aloita uusi keskustelu"
    And I should see an ".action-links .add[href='/node/add/discussion-topic']" element
    Then I should see the link "Tallennetut"
    And I should see an ".action-links .save[href='/user/#user-followed-topics']" element

  @menaiset
  Scenario: [Main page] Visitor can see Discussion sections list
    Given I am on "/keskustelu"
    Then I should see the link "Ajankohtaista"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ajankohtaista']" element
    Then I should see the link "Muoti ja kauneus"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/muoti_ja_kauneus']" element
    Then I should see the link "Tyyli"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/tyyli']" element
    Then I should see the link "Hyvä olo"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/hyva_olo']" element
    Then I should see the link "Suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/suhteet']" element
    Then I should see the link "Ruoka"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ruoka']" element
    Then I should see the link "Matkailu"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/matkailu']" element
    Then I should see the link "Häät"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/haat']" element
    Then I should see the link "Seksi ja suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/seksi_ja_suhteet']" element

  @menaiset
  Scenario: [Main page] Visitor can see Main Discussion column
    Given I am on "/keskustelu"
    Then I should see an ".view-discussion-front-list .ds-view-content" element

  @menaiset
  Scenario: [Main page] Visitor can see 30 Threads in main column
    Given I am on "/keskustelu"
    Then I should see 30 ".cols-4 .row .title a" elements

  @menaiset
  Scenario: [Main page] Visitor can't see "Vierailija" in threads
    Given I am on "/keskustelu"
    Then I should not see "Vierailija"

  @menaiset
  Scenario: [Main page] Visitor can see Sidebar on Discussion page
    Given I am on "/keskustelu"
    Then I should see an ".region-sidebar .theiaStickySidebar" element

  @menaiset
  Scenario: [Main page] Visitor can see Search block in sidebar
    Given I am on "/keskustelu"
    Then I should see an ".region-sidebar .pane-views-exp-discussion-search-block" element

  @menaiset
  Scenario: [Main page] Visitor can see CTS-4 and CTS-5 blocks in sidebar
    Given I am on "/keskustelu"
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-4" element
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-5" element

  @menaiset
  Scenario: [Main page] Visitor can see Most popular section in sidebar
    Given I am on "/keskustelu"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-popular" element

  @menaiset
  Scenario: [Main page] Visitor can see Most recent section in sidebar
    Given I am on "/keskustelu"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-recent" element

  @menaiset
  Scenario: [Category page] Visitor visits the Main Discussion page
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see "KESKUSTELUT"
    And I should see "TERVETULOA KESKUSTELEMAAN ME NAISTEN SIVUILLE!"
    Then I should see the link "Lue keskustelualueen säännöt." in the "content" region
    And I should see a ".pane-discussion-front-list .sanoma-2col-header .top .first a[href='http://www.menaiset.fi/keskustelujen_saannot']" element

  @menaiset
  Scenario: [Category page] Visitor can see Discussion sort links
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see the link "Uusimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu/alue/ajankohtaista']" element
    Then I should see the link "Suosituimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu/alue/ajankohtaista?sort=popular_date']" element
    Then I should see the link "Kommentoiduimmat"
    And I should see an ".discussion-sort-links a[href='/keskustelu/alue/ajankohtaista?sort=comment']" element

  @menaiset
  Scenario: [Category page] Visitor can see Search block above action links on mobile
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".sanoma-2col-header #views-exposed-form-discussion-search-block" element

  @menaiset
  Scenario: [Category page] Visitor can see Discussion action links
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see the link "Aloita uusi keskustelu"
    And I should see an ".action-links .add[href='/node/add/discussion-topic?section=26836']" element
    Then I should see the link "Tallennetut"
    And I should see an ".action-links .save[href='/user/#user-followed-topics']" element

  @menaiset
  Scenario: [Category page] Visitor can see Discussion sections list
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see the link "Ajankohtaista"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ajankohtaista']" element
    Then I should see the link "Muoti ja kauneus"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/muoti_ja_kauneus']" element
    Then I should see the link "Tyyli"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/tyyli']" element
    Then I should see the link "Hyvä olo"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/hyva_olo']" element
    Then I should see the link "Suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/suhteet']" element
    Then I should see the link "Ruoka"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ruoka']" element
    Then I should see the link "Matkailu"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/matkailu']" element
    Then I should see the link "Häät"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/haat']" element
    Then I should see the link "Seksi ja suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/seksi_ja_suhteet']" element

  @menaiset
  Scenario: [Category page] Visitor can see Main Discussion column
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".view-discussion-front-list .ds-view-content" element

  @menaiset
  Scenario: [Category page] Visitor can see 30 Threads in main column
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see 30 ".cols-4 .row .title a" elements

  @menaiset
  Scenario: [Category page] Visitor can't see "Vierailija" in threads
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should not see "Vierailija"

  @menaiset
  Scenario: [Category page] Visitor can see Sidebar on Discussion page
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".region-sidebar .theiaStickySidebar" element

  @menaiset
  Scenario: [Category page] Visitor can see Search block in sidebar
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".region-sidebar .pane-views-exp-discussion-search-block" element

  @menaiset
  Scenario: [Category page] Visitor can see CTS-4 and CTS-5 blocks in sidebar
    Given I am on "/keskustelu/alue/ajankohtaista"
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-4" element
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-5" element

  @menaiset
  Scenario: [Category page] Visitor can see Most popular section in sidebar
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-popular" element

  @menaiset
  Scenario: [Category page] Visitor can see Most recent section in sidebar
    Given I am on "/keskustelu/alue/ajankohtaista"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-recent" element
    
  @menaiset
  Scenario: [Thread page] Visitor visits the Main Discussion page
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see "Seksipositiivinen kulttuuri on ollut nousussa 2010-luvulla. Mutta ei se pelkästään nuoriin liity."

  @menaiset
  Scenario: [Thread page] Visitor can see Discussion action links
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see the link "Aloita uusi keskustelu"
    And I should see an ".action-links .add[href='/node/add/discussion-topic']" element
    Then I should see the link "Tallennetut"
    And I should see an ".action-links .save[href='/user/#user-followed-topics']" element

  @menaiset
  Scenario: [Thread page] Visitor can see Discussion sections list
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see the link "Ajankohtaista"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ajankohtaista']" element
    Then I should see the link "Muoti ja kauneus"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/muoti_ja_kauneus']" element
    Then I should see the link "Tyyli"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/tyyli']" element
    Then I should see the link "Hyvä olo"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/hyva_olo']" element
    Then I should see the link "Suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/suhteet']" element
    Then I should see the link "Ruoka"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/ruoka']" element
    Then I should see the link "Matkailu"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/matkailu']" element
    Then I should see the link "Häät"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/haat']" element
    Then I should see the link "Seksi ja suhteet"
    And I should see an ".discussion-sections-list a[href='/keskustelu/alue/seksi_ja_suhteet']" element

  @menaiset
  Scenario: [Thread page] Visitor can see Main Discussion column
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see an ".node-discussion-topic" element

  @menaiset
  Scenario: [Thread page] Visitor can see Sidebar on Discussion page
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see an ".region-sidebar .theiaStickySidebar" element

  @menaiset
  Scenario: [Thread page] Visitor can see Search block in sidebar
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see an ".region-sidebar .pane-views-exp-discussion-search-block" element

  @menaiset
  Scenario: [Thread page] Visitor can see CTS-4 and CTS-5 blocks in sidebar
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-4" element
    And I should see an ".region-sidebar .pane-sbase-cts-sbase-cts-block-5" element

  @menaiset
  Scenario: [Thread page] Visitor can see Most popular section in sidebar
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-popular" element

  @menaiset
  Scenario: [Thread page] Visitor can see Most recent section in sidebar
    Given I am on "/keskustelu/76447/yha-useampi-pari-valmis-harkitsemaan-erilaisia-tapoja-olla-yhdessa"
    Then I should see an ".region-sidebar #ajahdiscussionsmost-recent" element
