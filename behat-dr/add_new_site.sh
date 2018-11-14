#!/usr/bin/env bash

#define parameters which are passed in.
SITENAME=$( echo $1 | cut -d"." -f1)
DOMAIN=$1
SITES_PATH=configs/sites

#define the template.
cat << EOF > $SITES_PATH/$SITENAME.yml
default:
  suites:
    $SITENAME:
      paths:
        - '%paths.base%/tests/features'
      filters:
        tags: '@$SITENAME'
      contexts:
        - FeatureContext:
            parameters:
              base_url: 'http://local.$DOMAIN'
        - DrupalContext
        - Drupal\DrupalExtension\Context\DrupalContext
        - Drupal\DrupalExtension\Context\MinkContext
        - Drupal\DrupalExtension\Context\MessageContext
        - Drupal\DrupalExtension\Context\DrushContext
        - IntegratedExperts\BehatScreenshotExtension\Context\ScreenshotContext
      extensions:
        Drupal\DrupalExtension:
          drupal:
            # This assumes that we're running Behat from within
            drupal_root: '/vagrant/drupal/current'

develop:
  suites:
    $SITENAME:
      paths:
        - '%paths.base%/tests/features'
      filters:
        tags: '@$SITENAME'
      contexts:
        - FeatureContext:
            parameters:
              base_url: 'https://sanomalifestyle:kanapalat@dev-$SITENAME.smf.aws.sanomacloud.net'
        - DrupalContext
        - Drupal\DrupalExtension\Context\DrupalContext
        - Drupal\DrupalExtension\Context\MinkContext
        - Drupal\DrupalExtension\Context\MessageContext
        - Drupal\DrupalExtension\Context\DrushContext
        - IntegratedExperts\BehatScreenshotExtension\Context\ScreenshotContext
      extensions:
        Drupal\DrupalExtension:
          drupal:
            # This assumes that we're running Behat from within
            drupal_root: '/vagrant/drupal/current'

staging:
  suites:
    $SITENAME:
      paths:
        - '%paths.base%/tests/features'
      filters:
        tags: '@$SITENAME'
      contexts:
        - FeatureContext:
            parameters:
              base_url: 'https://sanomalifestyle:kanapalat@staging-$SITENAME.smf.aws.sanomacloud.net'
        - DrupalContext
        - Drupal\DrupalExtension\Context\DrupalContext
        - Drupal\DrupalExtension\Context\MinkContext
        - Drupal\DrupalExtension\Context\MessageContext
        - Drupal\DrupalExtension\Context\DrushContext
        - IntegratedExperts\BehatScreenshotExtension\Context\ScreenshotContext
      extensions:
        Drupal\DrupalExtension:
          drupal:
            # This assumes that we're running Behat from within
            drupal_root: '/vagrant/drupal/current'

production:
  suites:
    $SITENAME:
      paths:
        - '%paths.base%/tests/features'
      filters:
        tags: '@$SITENAME'
      contexts:
        - FeatureContext:
            parameters:
              base_url: 'https://www.$DOMAIN'
        - DrupalContext
        - Drupal\DrupalExtension\Context\DrupalContext
        - Drupal\DrupalExtension\Context\MinkContext
        - Drupal\DrupalExtension\Context\MessageContext
        - Drupal\DrupalExtension\Context\DrushContext
        - IntegratedExperts\BehatScreenshotExtension\Context\ScreenshotContext
      extensions:
        Drupal\DrupalExtension:
          drupal:
            # This assumes that we're running Behat from within
            drupal_root: '/vagrant/drupal/current'
EOF

echo "  - $SITES_PATH/$SITENAME.yml" >> new.behat.yml