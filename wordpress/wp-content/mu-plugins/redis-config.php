<?php
/**
 * Plugin Name: Redis Config
 * Description: Sets Redis connection details from environment variables for the Redis Object Cache plugin.
 */
if (getenv('WP_REDIS_HOST')) {
    define('WP_REDIS_HOST', getenv('WP_REDIS_HOST'));
}
if (getenv('WP_REDIS_PORT')) {
    define('WP_REDIS_PORT', getenv('WP_REDIS_PORT'));
}
if (getenv('WP_REDIS_DATABASE')) {
    define('WP_REDIS_DATABASE', getenv('WP_REDIS_DATABASE'));
}
if (getenv('WP_REDIS_PASSWORD')) {
    define('WP_REDIS_PASSWORD', getenv('WP_REDIS_PASSWORD'));
}
if (getenv('WP_CACHE_KEY_SALT')) {
    define('WP_CACHE_KEY_SALT', getenv('WP_CACHE_KEY_SALT'));
}
