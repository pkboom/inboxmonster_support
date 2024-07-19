<?php

if (! function_exists('hit')) {
    function hit()
    {
        logger('--------------------------------------------------');
    }
}

if (! function_exists('clear')) {
    function clear()
    {
        $log = '/Users/keunbae/code/inboxmonster/storage/logs/laravel.log';

        file_put_contents($log, '');
    }
}

if (! function_exists('history')) {
    function history()
    {
        pick(debug_backtrace(DEBUG_BACKTRACE_PROVIDE_OBJECT, 5));
    }
}
