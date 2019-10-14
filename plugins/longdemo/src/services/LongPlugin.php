<?php
/**
 * long-demo plugin for Craft CMS 3.x
 *
 * long-demo
 *
 * @link      nlstech.net
 * @copyright Copyright (c) 2019 NLstech
 */

namespace \longdemo\services;

use \longdemo\Longdemo;

use Craft;
use craft\base\Component;

/**
 * LongPlugin Service
 *
 * All of your plugin’s business logic should go in services, including saving data,
 * retrieving data, etc. They provide APIs that your controllers, template variables,
 * and other plugins can interact with.
 *
 * https://craftcms.com/docs/plugins/services
 *
 * @author    NLstech
 * @package   Longdemo
 * @since     1.0.0
 */
class LongPlugin extends Component
{
    // Public Methods
    // =========================================================================

    /**
     * This function can literally be anything you want, and you can have as many service
     * functions as you want
     *
     * From any other plugin file, call it like this:
     *
     *     Longdemo::$plugin->longPlugin->exampleService()
     *
     * @return mixed
     */
    public function exampleService()
    {
        $result = 'something';
        // Check our Plugin's settings for `someAttribute`
        if (Longdemo::$plugin->getSettings()->someAttribute) {
        }

        return $result;
    }
}
