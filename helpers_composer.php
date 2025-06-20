<?php

$inboxmonsterPath = '/Users/keunbae/code/inboxmonster';
$inboxmonsterSupportPath = '/Users/keunbae/code/inboxmonster_support';

$composerPath = "/{$inboxmonsterPath}/composer.json";

$composer = json_decode(file_get_contents($composerPath), true);

$composer['autoload']['files'] = ['helpers.php'];

// remove => {"packagist.org": false}
foreach ($composer['repositories'] as $key => $repository) {
    if (isset($repository['packagist.org']) && ! is_null($repository['packagist.org'])) {
        unset($composer['repositories'][$key]);
    }
}

$source = "{$inboxmonsterSupportPath}/helpers.php";
$destination = "{$inboxmonsterPath}/helpers.php";
copy($source, $destination);

$source = "{$inboxmonsterSupportPath}/current_ticket.js";
$destination = "{$inboxmonsterPath}/current_ticket.js";
copy($source, $destination);

file_put_contents($composerPath, json_encode($composer, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

echo "Done!\n";
