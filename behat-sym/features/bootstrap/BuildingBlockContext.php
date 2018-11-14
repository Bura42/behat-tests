<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\TableNode;
use BM\Bundle\AppBundle\DataFixtures\BuildersTrait;
use BM\Bundle\AppBundle\DataFixtures\BuildingBlocks;

class BuildingBlockContext implements Context
{
    use ParamsConverterTrait,
        BuildersTrait;

    private $blocks = [];

    protected static function getBuilders(): array
    {
        return [
            'bm_custom_markup.block' => BuildingBlocks\CustomMarkupBuilder::class,
            'bm_basic_data.list.various_sources' => BuildingBlocks\ListBuilder::class,
            'bm_basic_data.teaser.various_sources' => BuildingBlocks\TeaserBuilder::class,
            'bm_app.article.header' => BuildingBlocks\ArticleHeaderBuilder::class,
            'bm_app.article.content' => BuildingBlocks\ArticleContentBuilder::class,
            'bm_storm_geo.block' => BuildingBlocks\StormGeoBuilder::class,
        ];
    }

    /**
     * @Given /^"([^"]*)" building block exists:$/
     */
    public function blockExists(string $blockName, TableNode $paramsTable)
    {
        $params = $this->convertToParams($paramsTable);
        $this->blocks[] = self::executeBuilder($blockName, $params);
    }

    /**
     * @Given :arg1 building block exists
     */
    public function buildingBlockExists(string $blockName)
    {
        $this->blocks[] = self::executeBuilder($blockName);
    }

    public function getBlocks(): array
    {
        return $this->blocks;
    }
}
