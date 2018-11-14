<?php

use Behat\Behat\Context\Context;
use BM\Bundle\AppBundle\DataFixtures\ORM;
use BM\Bundle\SynchronizationBundle\Entity\Import;

class MenuContext implements Context
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;

    /**
     * @Given /^menu exists$/
     */
    public function menuWithRootExists()
    {
        $menu = [
            [1, null, 'bdk', 'bdk', null,],
            [2, 1, 'anmeldelser', 'Anmeldelser', '/anmeldelser'],
            [3, 1, 'vi_anbefaler', 'Vi anbefaler', '/vianbefaler'],
            [4, 1, 'musik', 'Musik', '/musik'],
            [5, 1, 'film', 'Film', '/film'],
            [6, 1, 'bøger', 'Bøger', '/boeger'],
            [7, 1, 'koncerter', 'Koncerter', '/koncerter'],
            [8, 1, 'scene', 'Scene', '/scene'],
            [9, 1, 'kunst', 'Kunst', '/kunst'],
            [10, 1, 'satiren', 'Satiren', '/satiren'],
            [11, 1, 'tv', 'TV', '/tv'],
        ];

        $date = date('Y-m-d H:i:s');
        $entityManager = $this->doctrineContext->getEntityManager();
        foreach ($menu as $item) {
            $entityManager->getConnection()->insert('ktw_menu_items', [
                'id' => $item[0],
                'parent_id' => $item[1],
                'name' => $item[2],
                'label' => $item[3],
                'uri' => $item[4],
                'data' => $this->getAttributes(),
                'display' => 1,
                'displayChildren' => 1,
                'created' => $date,
                'updated' => $date
            ]);
        }
    }

    /**
     * @Given /^off canvas menu exists$/
     */
    public function offCanvasMenuExists()
    {
        $menu = [
            [21, null, 'off-canvas', 'off-canvas', null,],
            [22, 21, 'krimi2', 'krimi', '/krimi'],
            [23, 22, 'sport2', 'sundhed', '/sundhed'],
            [24, 22, 'musik2', 'Musik', '/musik'],
            [25, 21, 'film2', 'Film', '/film'],
            [26, 25, 'bøger2', 'Bøger', '/boeger'],
            [27, 25, 'koncerter2', 'Koncerter', '/koncerter'],
            [28, 25, 'scene2', 'Scene', '/scene'],
            [29, 21, 'kunst2', 'Kunst', '/kunst'],
            [30, 29, 'satiren2', 'Satiren', '/satiren'],
            [31, 29, 'tv2', 'TV', '/tv'],
        ];

        $date = date('Y-m-d H:i:s');
        $entityManager = $this->doctrineContext->getEntityManager();
        foreach ($menu as $item) {
            $entityManager->getConnection()->insert('ktw_menu_items', [
                'id' => $item[0],
                'parent_id' => $item[1],
                'name' => $item[2],
                'label' => $item[3],
                'uri' => $item[4],
                'data' => $this->getAttributes(),
                'display' => 1,
                'displayChildren' => 1,
                'created' => $date,
                'updated' => $date
            ]);
        }
    }

    private function getAttributes(): string
    {
        $data = [
            'attributes' => [],
            'linkAttributes' => [],
            'childrenAttributes' => [],
            'labelAttributes' => [],
            'extras' => [],
        ];

        return serialize($data);
    }
}
