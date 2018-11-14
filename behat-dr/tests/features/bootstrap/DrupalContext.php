<?php

/**
 * @file
 * DrupalContext for LM project.
 */

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\field\Entity\FieldStorageConfig;
use Drupal\Core\Entity\EntityInterface;
use Drupal\file\Entity\File;
use Drupal\menu_link_content\Entity\MenuLinkContent;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\TableNode;

class DrupalContext extends RawDrupalContext implements SnippetAcceptingContext {
  // TODO: Here we will be add new tests.
}
