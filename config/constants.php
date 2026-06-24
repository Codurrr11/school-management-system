<?php
// config/constants.php

if (!defined('ROOT_PATH')) {
    define('ROOT_PATH', str_replace('\\', '/', realpath(dirname(__FILE__) . '/../')) . '/');
}

if (!defined('SITE_NAME')) {
    define('SITE_NAME', 'SchoolSaaS');
}
if (!defined('VERSION')) {
    define('VERSION', '1.0.0');
}
if (!defined('BASE_URL')) {
    $docRoot = isset($_SERVER['DOCUMENT_ROOT']) ? str_replace('\\', '/', realpath($_SERVER['DOCUMENT_ROOT'])) : '';
    $projectRoot = str_replace('\\', '/', realpath(dirname(__FILE__) . '/../'));
    
    $base_url = '/';
    if (!empty($docRoot) && stripos($projectRoot, $docRoot) === 0) {
        $base_url = substr($projectRoot, strlen($docRoot));
        $base_url = '/' . ltrim($base_url, '/');
    } else {
        // Fallback for CLI or cases where DOCUMENT_ROOT is not matching
        $base_url = '/schoolerp/';
    }
    // Ensure trailing slash
    if (substr($base_url, -1) !== '/') {
        $base_url .= '/';
    }
    define('BASE_URL', $base_url);
}
