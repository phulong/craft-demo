<?php
/**
 * long-demo plugin for Craft CMS 3.x
 *
 * long-demo
 *
 * @link      nlstech.net
 * @copyright Copyright (c) 2019 NLstech
 */

namespace \longdemo\controllers;

use \longdemo\Longdemo;

use Craft;
use craft\web\Controller;

/**
 * LongPlugin Controller
 *
 * Generally speaking, controllers are the middlemen between the front end of
 * the CP/website and your plugin’s services. They contain action methods which
 * handle individual tasks.
 *
 * A common pattern used throughout Craft involves a controller action gathering
 * post data, saving it on a model, passing the model off to a service, and then
 * responding to the request appropriately depending on the service method’s response.
 *
 * Action methods begin with the prefix “action”, followed by a description of what
 * the method does (for example, actionSaveIngredient()).
 *
 * https://craftcms.com/docs/plugins/controllers
 *
 * @author    NLstech
 * @package   Longdemo
 * @since     1.0.0
 */
class LongPluginController extends Controller
{

    // Protected Properties
    // =========================================================================

    /**
     * @var    bool|array Allows anonymous access to this controller's actions.
     *         The actions must be in 'kebab-case'
     * @access protected
     */
    protected $allowAnonymous = ['index', 'do-something'];

    // Public Methods
    // =========================================================================

    /**
     * Handle a request going to our plugin's index action URL,
     * e.g.: actions/long-demo/long-plugin
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $result = 'Welcome to the LongPluginController actionIndex() method';

        return $result;
    }

    /**
     * Handle a request going to our plugin's actionDoSomething URL,
     * e.g.: actions/long-demo/long-plugin/do-something
     *
     * @return mixed
     */
    public function actionDoSomething()
    {
        $result = 'Welcome to the LongPluginController actionDoSomething() method';

        return $result;
    }
}
