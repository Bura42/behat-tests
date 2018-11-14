<?php

use Behat\Gherkin\Node\TableNode;

trait ParamsConverterTrait
{
    public function convertToParams(TableNode $paramsTable): array
    {
        return array_combine(
            array_column($paramsTable->getHash(), 'option'),
            array_column($paramsTable->getHash(), 'value')
        );
    }
}
