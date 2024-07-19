<?php

use PhpCsFixer\Config;

return (new Config())
    ->setRules([
        '@PhpCsFixer' => true,
        'not_operator_with_successor_space' => true,
        'blank_line_before_statement' => [
            'statements' => ['break', 'continue', 'declare', 'return', 'throw', 'try'],
        ],
        'multiline_whitespace_before_semicolons' => true,
        'php_unit_method_casing' => ['case' => 'snake_case'],
        'php_unit_test_class_requires_covers' => false,
        'php_unit_internal_class' => false,
        'global_namespace_import' => true,
        'phpdoc_add_missing_param_annotation' => false,
    ]);
