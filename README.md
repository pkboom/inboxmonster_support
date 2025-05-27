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
```

config > pick.php
http://pick-server-10.test/webhook

# Error

## `Require ext-imap` when running composer update

```sh
brew install shivammathur/extensions/imap@8.1
```

> https://github.com/shivammathur/homebrew-extensions
