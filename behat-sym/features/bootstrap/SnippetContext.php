<?php

use Behat\Behat\Context\Context;

class SnippetContext implements Context
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;

    /**
     * @Given /^snippet "([^"]*)" exist$/
     */
    public function paywallExist(string $paywallType)
    {
        switch ($paywallType) {
            case 'paywall_soft':
                $this->paywallSoft();
                break;
            case 'paywall_hard':
                $this->paywallHard();
                break;
            case 'addblock_soft':
                $this->addblockSoft();
                break;
            case 'addblock_hard':
                $this->addblockHard();
                break;
            case 'browser_version_warning':
                $this->browserVersionWarning();
                break;
            case 'site_footer':
                $this->siteFooter();
                break;
        }
    }

    private function addSql(string $sql)
    {
        $this->doctrineContext->getEntityManager()->getConnection()->exec($sql);
    }

    private function paywallSoft()
    {
        $this->addSql("INSERT INTO snippet VALUES ('paywall_soft')");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('message', 'paywall_soft', 'textarea', '<h2>God fornøjelse.</h2><p>
                Denne artikel er normalt kun for abonnenter, men i dag kan du læse den gratis.
            </p><p>
                Få adgang til alle artikler med et digitalt abonnement.
            </p>', 1)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_text', 'paywall_soft', 'input', 'Få den første måned gratis nu', 2)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_link', 'paywall_soft', 'input', " .
            "'https://abonnement.b.dk/berlingske-to-produkter-paywallbanner/?utm_source=paywall&utm_medium=paywall_bdk" .
            "&utm_term=AL-151222-CP-WKLEDIT1PW&utm_content=soft&utm_campaign=abonnementer_berlingske', 3)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_css', 'paywall_soft', 'input', '', 4)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('continue_reading_text', 'paywall_soft', 'input', 'Nej tak, jeg vil bare læse artiklen', 5)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('login_text', 'paywall_soft', 'input', 'Allerede abonnent?', 6)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('login_cta', 'paywall_soft', 'input', 'Klik her', 7)");

        $this->addSql("INSERT INTO snippet VALUES ('paywall_soft_signup_encouragement')");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('header_text_sticky', 'paywall_soft_signup_encouragement', 'input', 'Få adgang til alle artikler', 1)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('body_text_sticky', 'paywall_soft_signup_encouragement', 'input', '- hvor som helst og når som helst på Berlingske.dk', 2)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_text_sticky', 'paywall_soft_signup_encouragement', 'input', '0 kr. første måned', 3)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_css_sticky', 'paywall_soft_signup_encouragement', 'input', 'Få adgang til alle artikler', 4)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('header_text', 'paywall_soft_signup_encouragement', 'input', 'Appetit på mere?', 5)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('body_text', 'paywall_soft_signup_encouragement', 'input', 'Har du lyst til at læse flere interessante artikler på Berlingske.dk?', 6)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_text', 'paywall_soft_signup_encouragement', 'input', '0 kr. første måned', 7)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_css', 'paywall_soft_signup_encouragement', 'input', '', 8)");

    }

    private function paywallHard()
    {
        $this->addSql("INSERT INTO snippet VALUES ('paywall_hard')");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('message', 'paywall_hard', 'textarea', '<p class=\"paywall__caption\">Artiklen er kun for abonnenter" .
            "</p><h2>Velkommen</h2><p>Få adgang til alle artikler på Berlingske.dk og Business.dk med et digitalt" .
            " abonnement.</p>', 1)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_text', 'paywall_hard', 'input', 'Få den første måned gratis nu', 2)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_link', 'paywall_hard', 'input', " .
            "'https://abonnement.b.dk/berlingske-to-produkter-paywallbanner/?utm_source=paywall&utm_medium=paywall_bdk" .
            "&utm_term=AL-151222-CP-WKLEDIT1PW&utm_content=hard&utm_campaign=abonnementer_berlingske', 3)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('button_buy_css', 'paywall_hard', 'input', '', 4)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('login_text', 'paywall_hard', 'input', 'Allerede abonnent?', 5)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('login_cta', 'paywall_hard', 'input', 'Klik her', 6)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('message_no_access', 'paywall_hard', 'textarea', '<p>Du er logget ind med en profil, der desværre " .
            "ikke giver adgang til Berlingske.dk i dag. Det kan skyldes, at dit abonnement har begrænset digital " .
            "adgang, eller at din ordre ikke er tilknyttet din profil. <a href=\"https://b.kundeunivers.dk/\">" .
            "Tilknyt ordrenummer</a></p><p><strong>Har du brug for hjælp?</strong>&nbsp;Kontakt Kundeservice på " .
            "3375 3330</p>', 7)");
    }

    private function addblockHard()
    {
        $this->addSql("INSERT INTO snippet VALUES ('addblock_hard')");
        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('message', 'addblock_hard', 'textarea', '<h2>Hov! Hvor blev min artikel af..!?</h2>
                    <p>
                        Du er træt af reklamer. <strong>Vi ved det godt!</strong> Men de betaler for den artikel, du du
                        sidder og læser.
                        Vi vil derfor sætte stor pris på, at du tilføjer b.dk til din adblocker " .
            "\"<a href=\"/adblocker\">whiteliste</a>\".</p><p>Tak for din forståelse.</p>', 1)");
    }

    private function addblockSoft()
    {
        $this->addSql("INSERT INTO snippet VALUES ('addblock_soft')");
        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('header_title', 'addblock_soft', 'input', 'Hov! Hvor blev min artikel af..!?', 1)");
        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('message', 'addblock_soft', 'textarea', '<p>
                            Vi kan se, at du har installeret en adblocker, så vi ikke kan vise dig annoncer.
                        </p>
                        <p>
                            Det er vi kede af, fordi indtægter fra annoncer er en helt afgørende årsag til, at vi
                            dagligt kan tilbyde dig journalistik af høj kvalitet.
                        </p>
                        <p>
                            For få adgang til indhold på b.dk skal du tillade visning af annoncer på
                            b.dk.
                            <a href=\"/adblocker\">Se hvordan du gør her.</a>.
                        </p>
                        <p>Tak for din forståelse.</p>', 2)");
    }

    private function browserVersionWarning()
    {
        $this->addSql("INSERT INTO snippet VALUES ('browser_version_warning')");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('title', 'browser_version_warning', 'input', 'Din browser ser ud til at være forældet.', 1)");

        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('body', 'browser_version_warning', 'textarea', 'Tak fordi du besøger Berlingske.dk. Vi har opdaget, at 
            din browser er forældet og i en version som vi ikke længere understøtter på Berlingske.dk. Vi opfordrer dig 
            til at <a href=\"https://browser-update.org/update.html\">opdatere</a> den - eller besøge os på din tablet eller mobil.', 2)");
    }

    private function siteFooter()
    {
        $this->addSql("INSERT INTO snippet VALUES ('site_footer')");
        $this->addSql("INSERT INTO snippet_element(name, snippet_id, type, content, position) VALUES" .
            " ('site_footer', 'site_footer', 'textarea', '<div class=\"site-footer\">
    <div class=\"footer-top\">
        <div class=\"container\">
            <div class=\"row\">
                <div class=\"col-xs-12\">
                    <a href=\"http://www.berlingskemedia.dk\" class=\"site-logo\">Berlingske</a>
                    <a href=\"#\" class=\"top-link\">Til toppen <span class=\"btn-circle\"><i
                                    class=\"bicon-angle-up\"></i></span></a>
                </div>
            </div>
        </div>
    </div>
    <div class=\"footer-middle\">
        <div class=\"container\">
            <div class=\"row\">
                <div class=\"col-md-4\">
                    <div class=\"row\">
                        <div class=\"col-md-5  col-xs-5 \">
                            <div class=\"footer-logo\">
                                <a href=\"http://www.berlingskemedia.dk\"><img
                                            src=\"http://www.b.dk/images/footer/vaabenskjold-footer.png\" alt=\"\" class=\"mb\"></a>
                            </div>
                            <p class=\"text-center\">Grundlagt 1749 af E.H. Berling</p>
                        </div>
                        <div class=\"col-md-7 col-xs-12 mb\">
                            <p>Berlingske<br>
                                Pilestræde 34<br>
                                DK-1147 København K<br>
                                Danmark</p>

                            <p>Tlf: 33 75 75 75<br>
                                Fax: 33 75 20 20</p>

                            <ul class=\"footer-list\">
                                <li>
                                    <a href=\"/kontakt\">Kontakt os</a></li>
                                <li>
                                    <a href=\"mailto:redaktionen@berlingske.dk\">Send pressemeddelelse</a>
                                </li>
                                <li>
                                    <a href=\"https://b.kundeunivers.dk/kontaktinformation?utm_source=web_intern&utm_medium=web_kundeservicelinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_bund&utm_campaign=abonnementer_berlingske\">Kundeservice</a>
                                </li>
                            </ul>

                            <p>CVR.nr.: 29 20 73 13 </p>
                        </div>
                    </div>
                </div>

                <div class=\"col-md-8\">
                    <div class=\"row\">
                        <div class=\"col-md-4 mb-1\">
                            <strong>Om Berlingske</strong>
                            <ul class=\"footer-list\">
                                <li>
                                    <a href=\"/nationalt/berlingskes-redaktionelle-regnskab-for-2015\">Redaktionelt regnskab</a>
                                </li>
                                <li><a href=\"/fejlogfakta\">Fejl og fakta</a></li>
                                <li><a href=\"/etik\">Etiske regler</a></li>
                                <li>
                                    <a href=\"http://www.berlingskemedia.dk/karriere-landing/\">Ledige stillinger</a>
                                </li>
                                <li><a href=\"http://www.berlingskemedia.dk/kontakt-salg/\">Annoncering</a>
                                </li>
                            </ul>
                        </div>
                        <div class=\"col-md-4  mb-1\">
                            <strong>Kundeservice</strong>
                            <ul class=\"footer-list\">
                                <li>
                                    <a href=\"https://b.kundeunivers.dk/kontaktinformation?utm_source=web_intern&utm_medium=web_kundeservicelinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_bund&utm_campaign=abonnementer_berlingske\">Kontakt kundeservice</a>
                                </li>
                                <li>
                                    <a href=\"https://b.kundeunivers.dk/reklamation?utm_source=web_intern&utm_medium=web_kundeservicelinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_bund&utm_campaign=abonnementer_berlingske\">Er avisen ikke kommet?</a>
                                </li>
                                <li><a href=\"https://b.kundeunivers.dk/e-avis\">E-avis</a></li>
                                <li>
                                    <a href=\"https://abonnement.b.dk/berlingske-alle-produkter-abonnementslink/?utm_source=web_intern&utm_medium=web_abonnementlinks&utm_term=AL-151222-CP-WKLEDIT1WK&utm_content=b_bund&utm_campaign=abonnementer_berlingske\">Køb abonnement</a>
                                </li>
                            </ul>
                        </div>
                        <div class=\"col-md-4  mb-1\">
                            <strong>Tjenester</strong>
                            <ul class=\"footer-list\">
                                <li><a href=\"/mobil\">Apps</a></li>
                                <li><a href=\"/sitemap\">Sitemap</a></li>
                                <li><a href=\"/artikel-arkiv\">Artikelarkiv</a></li>
                                <li>
                                    <a href=\"http://profil.berlingskemedia.dk/nyhedsbreve/berlingske\">Nyhedsbreve</a>
                                </li>
                                <li><a href=\"/rss\">RSS</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div><!-- row -->

            <div class=\"row\">
                <div class=\"col-xs-12\">
                    <div class=\"text-center social-buttons\">
                        <p><strong>Følg Berlingske </strong>
                            <a href=\"http://www.facebook.com/berlingske\" class=\"btn-circle\"><i
                                        class=\"bicon-facebook\"></i></a>
                            <a href=\"http://www.twitter.com/berlingske\" class=\"btn-circle\"><i class=\"bicon-twitter\"></i></a>
                            <a href=\"https://www.instagram.com/berlingske/\" class=\"btn-circle\"><i
                                        class=\"bicon-instagram\"></i></a></p>
                    </div>
                </div>
            </div>

            <div class=\"row\">
                <div class=\"col-xs-12 text-center\">
                    <p>Copyright &copy; Berlingske Media.
                        <span class=\"divider\">|</span> <a href=\"http://www.berlingskemedia.dk/ophavsret-og-vilkaar/\"
                                                          target=\"blank\">Ophavsret og vilkår</a>
                        <span class=\"divider\">|</span> <a
                                href=\"http://www.berlingskemedia.dk/generelle-handelsbetingelser/\">Generelle handelsbetingelser</a>
                        <span class=\"divider\">|</span> <a
                                href=\"http://www.berlingskemedia.dk/cookie-og-privatlivspolitik/\"
                                target=\"_blank\" rel=\"noopener noreferrer\">Cookie- og Privatlivspolitik</a></p>
                </div>
            </div>
        </div>
    </div>
</div>', 1)");
    }
}
