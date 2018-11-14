<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Gherkin\Node\TableNode;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use BM\Bundle\AppBundle\DataFixtures\ORM;
use BM\Bundle\BasicDataBundle\Entity\Content\Author;
use Prophecy\Argument;
use Symfony\Component\HttpKernel\KernelInterface;

class AuthorContext implements Context, KernelAwareContext
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;

    /**
     * @var KernelInterface
     */
    protected $kernel = null;

    public function setKernel(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }

    /**
     * @Given author exist:
     */
    public function authorExist(TableNode $table)
    {
        $params = $this->convertToParams($table);
        $author = ORM\AuthorBuilder::build($params);
        $this->buildRouting($params, $author);

        $entityManager = $this->doctrineContext->getEntityManager();
        $entityManager->persist($author);
        $entityManager->flush();
    }

    /**
     * @Given :arg1 is author of :arg2 article
     */
    public function isAuthorOfArticle(string $authorName, string $articleTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $author = $entityManager
            ->getRepository('BMBasicDataBundle:Content\Author')
            ->findOneBy(['name' => $authorName]);

        $article = $entityManager
            ->getRepository('BMBasicDataBundle:Content\AbstractItem')
            ->findOneBy(['title' => $articleTitle]);

        if ($article && $author) {
            $relation = ORM\ContentToAuthorRelationBuilder::build();

            $relation->setParent($article);
            $relation->setChild($author);
            $article->addAuthor($relation);

            $entityManager->persist($relation);
            $entityManager->flush();
        }
    }

    /**
     * @Given author :authorName has subscription list
     */
    public function authorHasSubscriptionList(string $authorName)
    {
        $this->kernel->getContainer()->get('bm_subscription_list.client.mdb_api_client.prophecy')
            ->createAuthorSubscriptionList(Argument::any(), Argument::any())
            ->willReturn([
                'nyhedsbrev_id' => 1,
                'ident' => '1-wewi',
                'response_code' => 200,
            ]);

        $author = $this->authorFindOneBy(['name' => $authorName]);
        $authorSubscriptionListManager = $this
            ->kernel
            ->getContainer()
            ->get('bm_subscription_list.manager.author_subscription_list_manager');
        $authorSubscriptionListManager->createSubscriptionList($author);
    }

    /**
     * @Then notifications to authors :authorName subscription list subscribers should be sent
     */
    public function notificationsToAuthorsSubscriptionListSubscribersShouldBeSent(string $authorName)
    {
        $this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.prophecy')
            ->createMarketingEmail(Argument::any())
            ->shouldHaveBeenCalled();

        $this->kernel->getContainer()->get('stub.prophet')->checkPredictions();
    }

    /**
     * @Then email :arg1 should be added to authors subscription list
     */
    public function emailShouldBeAddedToAuthorsSubscriptionList($arg1)
    {
        $this->kernel->getContainer()->get('bm_subscription_list.client.mdb_api_client.prophecy')
            ->addSubscriberToAuthorSubscriptionList(Argument::any())
            ->shouldHaveBeenCalled();

        $this->kernel->getContainer()->get('stub.prophet')->checkPredictions();
    }

    private function buildRouting(array $params, Author $author)
    {
        $entityManager = $this->doctrineContext->getEntityManager();
        if (!empty($params['author_url'])) {
            $routing = ORM\Tests\RoutingBuilder::build(
                [
                    'source_uri' => $params['author_url'],
                    'destination_uri' => '/staff/' . $author->getId(),
                ]
            );
            $entityManager->persist($routing);
            $entityManager->flush();
        }
    }

    private function authorFindOneBy(array $params): Author
    {
        $entityManager = $this->doctrineContext->getEntityManager();
        if (isset($params['name'])) {
            $author = $entityManager
                ->getRepository('BMBasicDataBundle:Content\Author')
                ->findOneBy(['name' => $params['name']]);
        }

        if (empty($author)) {
            throw new \Exception('Author not found');
        }

        return $author;
    }
}
