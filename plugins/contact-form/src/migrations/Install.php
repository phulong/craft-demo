<?php

namespace craft\contactform\migrations;

use Craft;
use craft\db\Migration;

/**
 * m191014_032037_newsmigrate migration.
 */
class Install extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('news', [
            'id' =>  $this->primaryKey(),
            'title' => $this->text(),
            'content' => $this->text(),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m191014_032037_newsmigrate cannot be reverted.\n";
        return false;
    }
}
