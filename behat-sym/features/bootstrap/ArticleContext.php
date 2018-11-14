<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Gherkin\Node\TableNode;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use BM\Bundle\AppBundle\DataFixtures\ORM;
use BM\Bundle\BasicDataBundle\Entity\Collection\ItemsList;
use BM\Bundle\BasicDataBundle\Entity\Content\AbstractItem;
use BM\Bundle\BasicDataBundle\Entity\Tag;
use BM\Bundle\BasicDataBundle\Entity\Equipment;
use BM\Bundle\BasicDataBundle\Entity\Content\Author;
use BM\Bundle\BasicDataBundle\Entity\Content\ContentToEquipmentRelation;
use BM\Bundle\SynchronizationBundle\Entity\Import;
use Symfony\Component\HttpKernel\KernelInterface;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Prophecy\Argument;
use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Mink\Driver\Selenium2Driver;

class ArticleContext implements Context, KernelAwareContext
{
    use ParamsConverterTrait;
    use SymfonyDoctrineContextTrait;
    use TagContextTrait;
    use MinkContextTrait;

    /**
     * @var KernelInterface
     */
    protected $kernel = null;

    public function setKernel(KernelInterface $kernel)
    {
        $this->kernel = $kernel;
    }

    /**
     * @BeforeScenario
     */
    public function clearBodyCache(BeforeScenarioScope $event)
    {
        $this->kernel->getContainer()->get('core.cache_provider')->flushAll();
    }

    /**
     * @Given /^articles exist:$/
     */
    public function articlesExist(TableNode $paramsTable)
    {
        foreach ($paramsTable->getHash() as $row) {
            $this->buildArticle($row);
        }
        $this->doctrineContext->getEntityManager()->flush();
    }

    /**
     * @Given articles exist in list with nodeId :nodeId and name :name:
     */
    public function articlesExistInListWithBondId(string $nodeId, string $name, TableNode $paramsTable)
    {
        $articles = [];
        foreach ($paramsTable->getHash() as $row) {
            $articles[] = $row;
        }

        $this->createArticleLinkedToNodeQueue($nodeId, $name, $articles);
    }

    /**
     * @Given article exist in list with nodeId :nodeId and name :name:
     */
    public function articleExistInListWithBondId(string $nodeId, string $name, TableNode $paramsTable)
    {
        $params = $this->convertToParams($paramsTable);
        $this->createArticleLinkedToNodeQueue($nodeId, $name, [$params]);
    }

    private function createArticleLinkedToNodeQueue(string $nodeId, string $name, array $articles)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $collection = $entityManager->getRepository(ItemsList::class)->findOneBy(['name' => $name]);
        if (!$collection) {
            $collection = ORM\ItemsListBuilder::build(['name' => $name]);
        }

        foreach ($articles as $row) {
            $article = $this->buildArticle($row);
            $item = ORM\OrderedItemBuilder::build(['item' => $article, 'list' => $collection]);
            $collection->addItem($item);
        }

        $importList = $entityManager->getRepository(Import\ListItem::class)->findOneBy(['originalId' => $nodeId]);

        if (!$importList) {
            $importList = new Import\ListItem();
        }

        $entityManager->persist($collection);
        $importList->setSource('bond')->setItemsList($collection)->setOriginalId($nodeId)->setOriginalData('');
        $entityManager->persist($importList);
        $entityManager->flush();
    }

    /**
     * @Given /^articles exist in list:$/
     */
    public function articlesExistInList(TableNode $paramsTable)
    {
        $collection = ORM\ItemsListBuilder::build([]);

        foreach ($paramsTable->getHash() as $row) {
            $article = $this->buildArticle($row);
            $item = ORM\OrderedItemBuilder::build(['item' => $article, 'list' => $collection]);
            $collection->addItem($item);
        }

        $entityManager = $this->doctrineContext->getEntityManager();
        $entityManager->persist($collection);
        $entityManager->flush();
    }

    private function buildRouting(array $params, AbstractItem $entity)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        if (!empty($params['article_url'])) {
            $routing = ORM\Tests\RoutingBuilder::build(
                [
                    'source_uri' => $params['article_url'],
                    'destination_uri' => '/content/item/' . $entity->getId(),
                ]
            );
            $entityManager->persist($routing);
            $entityManager->flush();
        }
    }

    private function buildArticle(array $params): AbstractItem
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $article = ORM\ArticleBuilder::build($params);

        $entityManager->persist($article);
        $entityManager->flush();

        if (!empty($params['main_image'])) {
            $params['articleObj'] = $article;
            $image = ORM\ImageBuilder::build($params);
            $article->setMainImage($image);

            $entityManager->persist($image);
            $entityManager->flush();
        }

        if (!empty($params['playlist'])) {
            ORM\PlaylistBuilder::build(['articleObj' => $article, 'playlist' => $params['playlist']]);
        }

        if (!empty($params['node_id'])) {
            $importItem = new Import\ContentItem();
            $importItem->setContentItem($article)
                ->setOriginalId($params['node_id'])
                ->setOriginalData('')
                ->setSource('bond');
            $this->doctrineContext->getEntityManager()->persist($importItem);
            $this->doctrineContext->getEntityManager()->flush();
        }

        $this->buildRouting($params, $article);
        $this->buildAuthor($params, $article);

        return $article;
    }

    /**
     * @Given article exist:
     */
    public function articleExist(TableNode $table)
    {
        $params = $this->convertToParams($table);
        $this->buildArticle($params);
    }

    /**
     * @Given equipment exist:
     */
    public function equipmentExist(TableNode $table)
    {
        $params = $this->convertToParams($table);
        $equipment = ORM\EquipmentBuilder::build($params);

        $entityManager = $this->doctrineContext->getEntityManager();
        $entityManager->persist($equipment);
        $entityManager->flush();
    }

    /**
     * @Given article :arg1 has embedded equipment :arg2
     */
    public function articleHasEmbeddedEquipment(string $articleTitle, string $equipmentTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $article = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        if (empty($article)) {
            throw new \Exception('Article not found');
        }

        $equipment = $entityManager
            ->getRepository(Equipment\AbstractItem::class)
            ->findOneBy(['title' => $equipmentTitle]);

        if (empty($equipment)) {
            throw new \Exception('Equipment not found');
        }

        if ($article && $equipment) {
            $article->addEmbeddedEquipment($equipment);
            $entityManager->flush();
        }
    }

    /**
     * @Given article :arg1 has default equipment :arg2
     */
    public function articleHasDefaultEquipment(string $articleTitle, string $equipmentTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $relation = new ContentToEquipmentRelation();

        $article = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        $equipment = $entityManager
            ->getRepository(Equipment\AbstractItem::class)
            ->findOneBy(['title' => $equipmentTitle]);

        if ($article && $equipment) {
            $relation
                ->setParent($article)
                ->setChild($equipment);
            $article->addEquipment($relation);
            $entityManager->persist($relation);
            $entityManager->flush();
        }
    }

    /**
     * @Given /^article "([^"]*)" has embedded related article "([^"]*)"$/
     */
    public function articleHasEmbeddedRelatedArticle(string $articleTitle, string $relatedEmbeddedArticleTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $article = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        $relatedArticle = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $relatedEmbeddedArticleTitle]);

        $article->addEmbeddedContent($relatedArticle);
        $entityManager->flush();
    }

    /**
     * @Given /^article "([^"]*)" has related article "([^"]*)"$/
     */
    public function articleHasRelatedArticle(string $articleTitle, string $relatedArticleTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();
        $article = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        $relatedArticle = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $relatedArticleTitle]);

        $relation = ORM\ContentRelationBuilder::build(['parent' => $article, 'child' => $relatedArticle]);

        $entityManager->persist($relation);
        $article->addRelatedContent($relation);
        $entityManager->flush();
    }

    /**
     * @Given /^article "([^"]*)" has tag "([^"]*)"$/
     */
    public function articleHasTag(string $articleTitle, string $tagName)
    {
        $article = $this->doctrineContext->getEntityManager()
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        $tag = $this->doctrineContext->getEntityManager()
            ->getRepository(Tag\AbstractTag::class)
            ->findOneBy(['name' => $tagName]);

        $article->addTag($tag);
        $this->doctrineContext->getEntityManager()->flush();
    }

    private function buildAuthor(array $params, AbstractItem $entity)
    {
        if (empty($params['author_name'])) {
            return;
        }

        $entityManager = $this->doctrineContext->getEntityManager();
        $relation = ORM\ContentToAuthorRelationBuilder::build($params);
        $author = ORM\AuthorBuilder::build($params);
        $entityManager->persist($author);
        $relation->setChild($author);
        $relation->setParent($entity);
        $entity->addAuthor($relation);
        $entityManager->persist($relation);
    }

    /**
     * @Given /^article "([^"]*)" has tag with paywallsoft$/
     */
    public function articleHasTagWithPaywallsoft($articleTitle)
    {
        $tagName = $this->kernel->getContainer()->getParameter('article_paywall_soft_tag_name');
        $tagFullName = $this->kernel->getContainer()->getParameter('article_paywall_soft_tag_full_name');
        $this->tagContext->buildTag(['type' => 'presentation', 'full_name' => $tagFullName, 'name' => $tagName,]);
        $this->articleHasTag($articleTitle, $tagName);
    }

    /**
     * @Then :imageTitle is articles :articleTitle main image
     */
    public function isArticlesMainImage(string $imageTitle, string $articleTitle)
    {
        $entityManager = $this->doctrineContext->getEntityManager();

        $article = $entityManager
            ->getRepository(AbstractItem::class)
            ->findOneBy(['title' => $articleTitle]);

        $image = $entityManager
            ->getRepository(Equipment\Image::class)
            ->findOneBy(['title' => $imageTitle]);

        $article->setMainImage($image);
        $entityManager->flush();
    }

    /**
     * @Then I should see follow author form
     */
    public function iShouldSeeFollowAuthorForm()
    {
        $this->minkContext->assertElementOnPage('.form-signup.follow-author');
    }

    /**
     * @Then I should see success message
     */
    public function iShouldSeeSuccessMessage()
    {
        $this->minkContext->assertElementOnPage('.form-oneliner-ok');
    }

    /**
     * @Given author :authorName has subscriber :subscriberEmail
     */
    public function authorHasSubscriber($authorName, $subscriberEmail)
    {
        $author = $this->doctrineContext->getEntityManager()
            ->getRepository(Author::class)
            ->findOneBy(['name' => $authorName]);

        if (empty($author)) {
            throw new \Exception('Author not found');
        }

        $authorSubscriptionManager = $this->kernel->getContainer()->get('bm_newsletter.subscription.manager');
        $subscription = $authorSubscriptionManager->createSubscription($author, $subscriberEmail);

        if (empty($subscription)) {
            throw new \Exception('Subscription has not been created');
        }
    }

    /**
     * @Given article with nodeId :nodeId was imported from bond
     * @When article with nodeId :nodeId is imported from bond
     */
    public function importArticleFromBond($nodeId)
    {
        $this->kernel->getContainer()->get('bm_subscription_list.client.mdb_api_client.prophecy')
            ->createAuthorSubscriptionList(Argument::any())
            ->willReturn(1);
        $this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.prophecy')
            ->createMarketingEmail(Argument::any())
            ->willReturn($this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.real'));
        $this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.prophecy')
            ->createMarketingSchedule(Argument::any())
            ->willReturn($this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.real'));
        $queueManager = $this->kernel->getContainer()->get('bm_synchronization.queue_manager');
        $queueManager->getContent($nodeId, null, []);
    }

    /**
     * @Then notification about article should be sent to subscriber :subscriberEmail
     */
    public function notificationAboutArticleShouldBeSentToSubscriber($subscriberEmail)
    {
        $this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.prophecy')
            ->createMarketingEmail(Argument::any())
            ->shouldHaveBeenCalled();

        $this->kernel->getContainer()->get('bm_email_campaign.send_grid_api_client.prophecy')
            ->createMarketingSchedule(Argument::any())
            ->shouldHaveBeenCalled();

        $this->kernel->getContainer()->get('stub.prophet')->checkPredictions();
    }

    /**
     * @AfterStep
     */
    public function takeScreenshotAfterFailedStep(AfterStepScope $scope)
    {
        if (99 === $scope->getTestResult()->getResultCode()) {
            $driver = $this->minkContext->getSession()->getDriver();

            if (!$driver instanceof Selenium2Driver) {
                return;
            }

            $path = $this->kernel->getRootDir() . '/../var/screenshots';
            if (! is_dir($path)) {
                mkdir($path, 0777, true);
            }

            $filename = sprintf(
                '%s_%s_%s.%s',
                $this->minkContext->getMinkParameter('browser_name'),
                date('Ymd') . '-' . date('His'),
                uniqid('', true),
                'png'
            );

            $this->minkContext->saveScreenshot($filename, $path);
        }
    }
}
