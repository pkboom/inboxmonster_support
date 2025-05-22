# Set up inboxmonster dev environment

```sh
valet use 8.1
cd ~/code/inboxmonster
php ~/code/inboxmonster_support/helpers_composer.php
composer require laravel/nova:4.32.9 --with-all-dependencies
composer require --dev pkboom/laravel-tinker-on-vscode pkboom/laravel-pick barryvdh/laravel-debugbar
composer dump-autoload
ln -s jetstream ./node-workers
ln -s dotfiles /Users/keunbae/.dotfiles
```

config > pick.php
http://pick-server-10.test/webhook

# Fix mysql

```sh
sudo chown -R $(whoami):admin /opt/homebrew
```
