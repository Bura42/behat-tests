<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\TableNode;
use BM\Bundle\AppBundle\DataFixtures\ORM;
use BM\Bundle\BasicDataBundle\Entity\Tag\AbstractTag;

class TagContext implements Context
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;

    /**
     * @Given tag exist:
     */
    public function tagExist(TableNode $table)
    {
        $params = $this->convertToParams($table);
        $this->buildTag($params);
    }

    /**
     * @Given tags exist:
     */
    public function tagsExist(TableNode $paramsTable)
    {
        foreach ($paramsTable->getHash() as $row) {
            $this->buildTag($row);
        }
    }

    /**
     * @Given :parentFullName tag is parent of :childFullName tag
     */
    public function tagIsParentOfTag($parentFullName, $childFullName)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $parent = $entityManager
            ->getRepository('BMBasicDataBundle:Tag\AbstractTag')
            ->findOneBy(['fullName' => $parentFullName]);

        $child = $entityManager
            ->getRepository('BMBasicDataBundle:Tag\AbstractTag')
            ->findOneBy(['fullName' => $childFullName]);

        if ($parent && $child) {
            $child->setParentTag($parent);

            $entityManager->persist($child);
            $entityManager->flush();
        }
    }

    private function buildTagRouting(array $params, AbstractTag $entity)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        if (!empty($params['tag_url'])) {
            $routing = ORM\Tests\RoutingBuilder::build(
                [
                    'source_uri' => $params['tag_url'],
                    'destination_uri' => '/tag/item/' . $entity->getId(),
                ]
            );
            $entityManager->persist($routing);
            $entityManager->flush();
        }
    }

    public function buildTag(array $params)
    {
        $equipment = ORM\TagBuilder::build($params);

        $entityManager = $this->doctrineContext->getEntityManager();
        $entityManager->persist($equipment);
        $entityManager->flush();

        $this->buildTagRouting($params, $equipment);
    }
}
