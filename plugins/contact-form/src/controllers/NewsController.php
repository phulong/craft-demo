<?php

namespace craft\contactform\controllers;

use Craft;

use craft\contactform\models\Submission;
use craft\contactform\Plugin;
use craft\web\Controller;
use craft\web\UploadedFile;
use yii\web\Response;
use craft\contactform\models\News;
use craft\web\View;
use craft\web\twig\variables\Request;

class NewsController extends Controller
{
    // Properties
    // =========================================================================

    /**
     * @inheritdoc
     */
    public $allowAnonymous = true;

    // Public Methods
    // =========================================================================

    /**
     * Sends a contact form submission.
     *
     * @return Response|null
     */
    public function actionIndex()
    {
        // echo "Index";
        $news = new News ();
        $data = $news->fetchData();
        // Craft::$app->getView()->renderTemplate('/path/to/template');
        // $this->requirePostRequest();
        // $request = Craft::$app->getRequest();
        // $plugin = Plugin::getInstance();
        // $settings = $plugin->getSettings();

        // return Craft::$app->view->renderTemplate('contact-form/_settings', [
        //     'datas' => $data,
           
        // ]);

       

        // $oldMode = Craft::$app->view->getTemplateMode();
        // Craft::$app->view->setTemplateMode(View::TEMPLATE_MODE_CP);
        // $html = Craft::$app->view->renderTemplate('contact-form/list_news');

        // Craft::$app->view->setTemplateMode($oldMode);
        $variables = ['1','1'];
        return $this->renderTemplate('contact-form/list_news', ['data'=>$variables]);

      
    }

    public function actionAddnews () {
        $request = new Request();
        $data =$request->getPost();
        $news = new News();
        $result = $news->addNews($data);
       if ($result) {           
        header('Location: ' . $_SERVER['HTTP_REFERER']);

       }

    }

    public function actionPostnews (){
        $data = array ();
        return $this->renderTemplate('contact-form/post_news',['data'=>$data]);
    }
    public function actionFindid () {
        echo "Find eidsdsd";
    }
}