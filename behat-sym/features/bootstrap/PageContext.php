<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Gherkin\Node\TableNode;
use Behat\Symfony2Extension\Context\KernelAwareContext;
use BM\Bundle\AppBundle\DataFixtures\Blocks;
use BM\Bundle\AppBundle\DataFixtures\Blocks\AbstractArticle\TopStoriesBuilder;
use BM\Bundle\AppBundle\DataFixtures\BuildersTrait;
use BM\Bundle\AppBundle\DataFixtures\Pages;
use BM\Bundle\BlockBundle\DataFixtures\IdTranslator;
use BM\Bundle\BlockBundle\Generator\PageGeneratorInterface;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Finder\Finder;
use Symfony\Component\HttpKernel\KernelInterface;
use BM\Bundle\SynchronizationBundle\Entity\Import;
use BM\Bundle\AppBundle\DataFixtures\ORM;

class PageContext implements Context, KernelAwareContext
{
    use ParamsConverterTrait,
        BuildersTrait;

    private $page;

    private $buildingBlockContext;

    private $pageGenerator;

    private $translator;

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
    public function clearRedisCache(BeforeScenarioScope $event)
    {
        $this->kernel->getContainer()->get('bm_block_template.cache_provider')->flushAll();
        $this->clearRedisCacheFiles();
    }

    public function __construct(PageGeneratorInterface $pageGenerator, IdTranslator $translator)
    {
        $this->pageGenerator = $pageGenerator;
        $this->translator = $translator;
    }

    protected static function getBuilders(): array
    {
        return [
            'custom_page' => Pages\CustomPageBuilder::class,
            'article_page' => Pages\ArticlePageBuilder::class,
            'section_page' => Pages\SectionPageBuilder::class,
        ];
    }

    /**
     * @BeforeScenario
     */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        $environment = $scope->getEnvironment();
        $this->buildingBlockContext = $environment->getContext('BuildingBlockContext');
        $this->doctrineContext = $environment->getContext(SymfonyDoctrineContext::class);
    }

    /**
     * @Given /^"([^"]*)" site manager page exists:$/
     */
    public function pageExists(string $pageType, TableNode $paramsTable)
    {
        $params = $this->convertToParams($paramsTable);
        $this->page = self::executeBuilder($pageType, $params);
    }

    /**
     * @Given author page exists
     */
    public function authorPageExists()
    {
        $fixture = new Blocks\AuthorPageFixture();
        $fixture->load($this->pageGenerator);
    }

    /**
     * @Given section page exists
     */
    public function sectionPageExists()
    {
        $fixture = new Blocks\SectionPageFixture();
        $fixture->load($this->pageGenerator);
    }

    /**
     * @Given topic page exists
     */
    public function topicPageExists()
    {
        $fixture = new Blocks\TopicPageFixture();
        $fixture->load($this->pageGenerator);
    }

    /**
     * @Given :articleType article page exists
     */
    public function articlePageExists(string $articleType)
    {
        $pageFixtureClass = sprintf(
            'BM\Bundle\AppBundle\DataFixtures\Blocks\\%sArticlePageFixture', ucfirst($articleType)
        );

        if (!class_exists($pageFixtureClass)) {
            throw new \InvalidArgumentException(
                sprintf('Page fixture class does not exist: %s', $pageFixtureClass)
            );
        }

        $articleTypesRequiringTopStories = [
            'news',
            'newsPlus',
            'longRead',
            'longReadPlus',
            'large',
            'largePlus',
            'video',
            'videoPlus',
            'blogs',
            'blogsPlus'
        ];

        if(in_array($articleType, $articleTypesRequiringTopStories)){
            $this->createTopStoriesNodeQueue();
        }

        $fixture = new $pageFixtureClass();
        $fixture->load($this->pageGenerator);
    }

    private function createTopStoriesNodeQueue()
    {
        $entityManager = $this->doctrineContext->getEntityManager();
        $collection = ORM\ItemsListBuilder::build(['name' => 'topstories']);

        $entityManager->persist($collection);

        $importList = new Import\ListItem();
        $importList
            ->setSource('bond')
            ->setItemsList($collection)
            ->setOriginalId(TopStoriesBuilder::TOP_STORIES_NQ_ID)
            ->setOriginalData('');

        $entityManager->persist($importList);
        $entityManager->flush();
    }

    /**
     * @Given test front page exists
     */
    public function testFrontPageExists()
    {
        $fixture = new Blocks\TestFrontPageFixture();
        $fixture->load($this->pageGenerator);
    }

    /**
     * @Given blocks are added to page
     */
    public function blocksAreAddedToPage()
    {
        $this->page->setBlocks($this->buildingBlockContext->getBlocks());

        try {
            $this->pageGenerator->generate($this->page);
        } catch (\BM\Bundle\BlockBundle\Exception\PageNotValidException $e) {
            throw new Exception("Page model is not valid:\n" . print_r($e->getViolations(), true));
        }
    }

    private function getRedisCacheFilesPath(): string
    {
        return $this->kernel->getContainer()->getParameter('template_path');
    }

    private function clearRedisCacheFiles()
    {
        $files = $this->getFilesInDirectory($this->getRedisCacheFilesPath());
        foreach ($files as $file) {
            $this->removeFile($file);
        }
    }

    private function removeFile(string $filePath)
    {
        $filesystem = new Filesystem();
        try {
            $filesystem->remove($filePath);
        } catch (IOExceptionInterface $e) {
            echo 'An error occurred while removing file: ' . $filePath;
        }
    }

    private function getFilesInDirectory(string $directory): array
    {
        $finder = new Finder();
        $files = $finder->files()->in($directory);
        $filePaths = [];
        foreach ($files as $file) {
            $filePaths[] = $file->getRealPath();
        }

        return $filePaths;
    }
}
