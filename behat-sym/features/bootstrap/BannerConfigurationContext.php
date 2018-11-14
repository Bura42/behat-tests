<?php

use Behat\Behat\Context\Context;

class BannerConfigurationContext implements Context
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;

    /**
     * @Given banner configuration :bannerType exist
     */
    public function bannerConfigurationExist(string $bannerType)
    {
        switch ($bannerType) {
            case 'Leaderboard_1':
                $this->insertLeaderBoardBannerConfiguration();
                break;
            case 'Overlay':
                $this->inserOverlayBannerConfiguration();
                break;
        }
    }

    private function addSql(string $sql)
    {
        $this->doctrineContext->getEntityManager()->getConnection()->exec($sql);
    }

    private function insertLeaderBoardBannerConfiguration()
    {
        $this->addSql("INSERT INTO dfp_banner_configuration VALUES (null, 'Leaderboard_1', 0, 0, 0, 'eager')");

        $this->addSql(sprintf("INSERT INTO dfp_device(name, dimensions, banner_configuration_id) VALUES" .
            " ('desktop', '%s', 1)", json_encode([[930,180]])));

        $this->addSql(sprintf("INSERT INTO dfp_device(name, dimensions, banner_configuration_id) " .
            "VALUES ('mobile', '%s', 1)", json_encode([[320,320]])));
    }

    private function inserOverlayBannerConfiguration()
    {
        $this->addSql("INSERT INTO dfp_banner_configuration VALUES (null, 'Overlay', 1, 1, 1, 'eager')");

        $this->addSql(sprintf("INSERT INTO dfp_device(name, dimensions, banner_configuration_id) VALUES" .
            " ('mobile', '%s', 2)", json_encode([[320,320]])));
    }
}
