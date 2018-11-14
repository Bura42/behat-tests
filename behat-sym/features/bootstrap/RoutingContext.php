<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\TableNode;
use BM\Bundle\AppBundle\DataFixtures\ORM;

class RoutingContext implements Context
{
    use SymfonyDoctrineContextTrait;
    use ParamsConverterTrait;

    /**
     * @Given /^routing exists:$/
     */
    public function routingExists(TableNode $table)
    {
        $params = $this->convertToParams($table);
        $entityManager = $this->doctrineContext->getEntityManager();
        $routing = ORM\Tests\RoutingBuilder::build(
            [
                'source_uri' => $params['source_uri'],
                'destination_uri' => $params['destination_uri'],
                'type' => $params['type'],
                'status' => 1,
            ]
        );
        $entityManager->persist($routing);
        $entityManager->flush();
    }
}
