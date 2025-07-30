# Set up inboxmonster dev environment

```sh
valet use 8.1
cd ~/code/inboxmonster
php ~/code/inboxmonster_support/helpers_composer.php
brew install shivammathur/extensions/imap@8.1
composer update
# composer require laravel/nova:4.32.9 --with-all-dependencies
composer require --dev pkboom/laravel-tinker-on-vscode pkboom/laravel-pick
composer dump-autoload
php artisan vendor:publish --provider="Pkboom\Pick\PickServiceProvider"
```

config > pick.php
http://pick-server-10.test/webhook

# Cron

## Full Disk Access

1. System Settings > Privacy & Security > Full Disk Access
1. Add cron
   - command + shift + G
   - /usr/sbin/cron

## Schedule

```sh
crontab -e
```

```sh
#*/15 * * * * cd /Users/keunbae/code/rendering-ios && /opt/homebrew/bin/node dev/pingServersCommand.js --mail > /dev/null 2>&1
*/15 * * * * cd /Users/keunbae/code/rendering-ios && /opt/homebrew/bin/node dev/getQueueAttributeCommand.js --attribute ApproximateNumberOfMessages --mail > /dev/null 2>&1
0 9 * * 1,3,5 cd /Users/keunbae/code/dmarc_lambda && /opt/homebrew/bin/node dev/queryDmarcCommand.js --mail > /dev/null 2>&1
0 9 * * 1,3,5 cd /Users/keunbae/code/dmarc_lambda && /opt/homebrew/bin/node dev/queryRecordCommand.js --mail > /dev/null 2>&1
0 9 * * 1,2,3,4,5 cd /Users/keunbae/code/node-workers && /opt/homebrew/bin/node dev/queryTooManyCommand.js --mail > /dev/null 2>&1
0 9 * * 1,2,3,4,5 cd /Users/keunbae/code/node-workers && /opt/homebrew/bin/node dev/queryTotalCommand.js --mail > /dev/null 2>&1
```

# Error

## `Require ext-imap` when running composer update

```sh
brew install shivammathur/extensions/imap@8.1
```

> https://github.com/shivammathur/homebrew-extensions
