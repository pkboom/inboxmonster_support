<?php

$inboxmonsterPath = '/Users/keunbae/code/inboxmonster';
$inboxmonsterSupportPath = '/Users/keunbae/code/inboxmonster_support';

copy("{$inboxmonsterSupportPath}/helpers.php", "{$inboxmonsterPath}/helpers.php");

$composerPath = "/{$inboxmonsterPath}/composer.json";

$composer = json_decode(file_get_contents($composerPath), true);

$composer['autoload']['files'] = [
    'helpers.php',
];

// $composer['config']['platform-check'] = false;

file_put_contents($composerPath, json_encode($composer, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

echo "Done!\n";
