<?php
/**
 * @link https://craftcms.com/
 * @copyright Copyright (c) Pixel & Tonic, Inc.
 * @license MIT
 */

namespace craft\contactform;

use Craft;
use craft\contactform\models\Settings;
use craft\events\PluginEvent;
use craft\web\UrlManager;
use craft\events\RegisterUrlRulesEvent;

use yii\base\Event;

/**
 * Class Plugin
 *
 * @property Settings $settings
 * @property Mailer $mailer
 * @method Settings getSettings()
 */
class Plugin extends \craft\base\Plugin
{
    /**
     * @inheritdoc
     */
    public $hasCpSettings = true;

    public function init()
    {
        parent::init();
     
        // Register our site routes
        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_SITE_URL_RULES,
            function (RegisterUrlRulesEvent $event) {
                $event->rules['siteActionTrigger1'] = 'contact-form/send/findid';
                $event->rules['siteActionTrigger2'] = 'contact-form/news/index';
            }
        );

        // Register our CP routes
        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_CP_URL_RULES,
            function (RegisterUrlRulesEvent $event) {
                $event->rules['cpActionTrigger1'] = 'contact-form/send/findid';
                $event->rules['cpActionTrigger2'] = 'contact-form/news/index';
                $event->rules['addNews'] = 'contact-form/news/addnews';
                $event->rules['postNews'] = 'contact-form/news/postnews';
            }
        );

     
    }

        
    /**
     * @return Mailer
     */
    public function getMailer(): Mailer
    {
        return $this->get('mailer');
    }

    /**
     * @inheritdoc
     */
    protected function createSettingsModel(): Settings
    {
        return new Settings();
    }

    /**
     * @inheritdoc
     */
    protected function settingsHtml(): string
    {
        // Get and pre-validate the settings
        $settings = $this->getSettings();
        $settings->validate();

        // Get the settings that are being defined by the config file
        $overrides = Craft::$app->getConfig()->getConfigFromFile(strtolower($this->handle));

        return Craft::$app->view->renderTemplate('contact-form/_settings', [
            'settings' => $settings,
            'overrides' => array_keys($overrides),
        ]);
    }

    public function registerSiteRoutes()
	{
		return array(
			'entries/find' => array('action' => 'Send/Findid'),
		);
	}
}
