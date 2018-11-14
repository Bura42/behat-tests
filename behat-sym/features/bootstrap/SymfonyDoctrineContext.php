<?php

use Behat\Behat\Hook\Scope\AfterScenarioScope;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Tools\SchemaTool;
use Symfony\Component\HttpKernel\KernelInterface;

class SymfonyDoctrineContext implements KernelAwareContext
{
    /**
     * @var KernelInterface
     */
    protected $kernel = null;

    /**
     * @BeforeScenario
     */
    public function buildSchema(BeforeScenarioScope $event)
    {
        $entityManager = $this->getEntityManager();
        $metadata = $this->getMetadata($entityManager);
        if (!empty($metadata)) {
            $tool = new SchemaTool($entityManager);
            $tool->dropSchema($metadata);
            $tool->createSchema($metadata);
        }
    }

    /**
     * @AfterScenario
     */
    public function closeDBALConnections(AfterScenarioScope $event)
    {
        $this->getEntityManager()->clear();
        /** @var Connection $connection */
        foreach ($this->getConnections() as $connection) {
            $connection->close();
        }
    }

    public function setKernel(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }

    protected function getMetadata(EntityManager $entityManager): array
    {
        return $entityManager->getMetadataFactory()->getAllMetadata();
    }

    public function getEntityManager(): EntityManager
    {
        return $this->kernel->getContainer()->get('doctrine')->getManager();
    }

    protected function getConnections(): array
    {
        return $this->kernel->getContainer()->get('doctrine')->getConnections();
    }
}
