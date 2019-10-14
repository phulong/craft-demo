<?php
/**
 * @link https://craftcms.com/
 * @copyright Copyright (c) Pixel & Tonic, Inc.
 * @license MIT
 */

namespace craft\contactform\models;

use craft\base\Model;
use craft\web\UploadedFile;
use craft\db\Query;
use craft\db\mysql\QueryBuilder;
use craft\db\Command;
use craft\db\ActiveRecord;

/**
 * Class Submission
 *
 * @package craft\contactform
 */
class News extends ActiveRecord
{
    public static function tableName()
{
    return 'news';
}
    /**
     * @var UploadedFile[]|null
     */
    public $attachment;

    public $attributes = ['title','content','author'];

    /**
     * @inheritdoc
     */
    
     public  function fetchData () {
        $query = new Query;
        // compose the query
        $query->select('*')
            ->from('news')
            ->limit(10);
        // build and execute the query
        $rows = $query->all();
        // alternatively, you can create DB command and execute it
        $command = $query->createCommand();
        // $command->sql returns the actual SQL
        $rows = $command->queryAll();
        return $rows;
     }

    public function addNews ($data) {    
        if (!empty($data)) {
            extract($data);
        }

        $this->title = $title;
        $this->content = $content;
        $this->author = $author;
        return  $this->save();
    }
    public function rules()
    {
        return [
         
        ];
    }
}
