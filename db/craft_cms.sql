-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 14, 2019 at 12:34 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2019-10-14 02:57:45', '2019-10-14 02:57:45', 'd6eb40c2-83a3-428e-b630-066b6c29f32a');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft.request.getPost()', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php:67', '2019-10-14 10:17:24', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php', 67, 'craft.request.getPost() has been deprecated. Use craft.app.request.getBodyParam() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":444,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getPost()\\\", \\\"craft.request.getPost() has been deprecated. Use craft.app.reque...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php\",\"line\":67,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getPost\",\"args\":null},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"method\":\"actionAddnews\",\"args\":null},{\"objectClass\":null,\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\contactform\\\\controllers\\\\NewsController, \\\"actionAddnews\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-10-14 10:17:24', '2019-10-14 10:17:24', 'ecef781c-1f53-412b-bb3c-c4429782ce69'),
(3, 'craft.request.getPost()', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php:64', '2019-10-14 10:32:42', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php', 64, 'craft.request.getPost() has been deprecated. Use craft.app.request.getBodyParam() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":444,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getPost()\\\", \\\"craft.request.getPost() has been deprecated. Use craft.app.reque...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php\",\"line\":64,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getPost\",\"args\":null},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"method\":\"actionAddnews\",\"args\":null},{\"objectClass\":null,\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\contactform\\\\controllers\\\\NewsController, \\\"actionAddnews\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-10-14 10:32:42', '2019-10-14 10:32:42', '00753663-4222-426d-a05e-e1d3f23c58ff'),
(11, 'craft.request.getPost()', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php:65', '2019-10-14 10:34:21', '/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php', 65, 'craft.request.getPost() has been deprecated. Use craft.app.request.getBodyParam() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/twig/variables/Request.php\",\"line\":444,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.request.getPost()\\\", \\\"craft.request.getPost() has been deprecated. Use craft.app.reque...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/contact-form/src/controllers/NewsController.php\",\"line\":65,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\Request\",\"method\":\"getPost\",\"args\":null},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"method\":\"actionAddnews\",\"args\":null},{\"objectClass\":null,\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\contactform\\\\controllers\\\\NewsController, \\\"actionAddnews\\\"], []\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\contactform\\\\controllers\\\\NewsController\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"contact-form/news/addnews\\\", [\\\"p\\\" => \\\"admin/addNews\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/opt/lampp/htdocs/craft/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-10-14 10:34:21', '2019-10-14 10:34:21', 'b5be4451-bdb9-46e2-80ab-f78b13e996a8');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2019-10-14 02:57:45', '2019-10-14 02:57:45', NULL, '38978bb6-f3e6-417b-beae-a9b33442d231');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2019-10-14 02:57:45', '2019-10-14 02:57:45', '86c68461-8b76-4970-a4a6-e1723aceff80');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2019-10-14 02:57:45', '2019-10-14 02:57:45', 'fb1b9385-19c4-44f3-89e1-0d6d5d0c8a70');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `config` mediumtext DEFAULT NULL,
  `configMap` mediumtext DEFAULT NULL,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.3.9', '3.3.3', 0, '{\"fieldGroups\":{\"fb1b9385-19c4-44f3-89e1-0d6d5d0c8a70\":{\"name\":\"Common\"}},\"siteGroups\":{\"dd6b3afc-55bb-4ed7-ac81-b8df88df9dc9\":{\"name\":\"Craft CMS Zublu\"}},\"sites\":{\"66bf300b-38e0-4864-b503-ecdcf7aee2e4\":{\"baseUrl\":\"$DEFAULT_SITE_URL\",\"handle\":\"default\",\"hasUrls\":true,\"language\":\"en-US\",\"name\":\"Craft CMS Zublu\",\"primary\":true,\"siteGroup\":\"dd6b3afc-55bb-4ed7-ac81-b8df88df9dc9\",\"sortOrder\":1}},\"email\":{\"fromEmail\":\"admin@gmail.com\",\"fromName\":\"Craft CMS Zublu\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"},\"system\":{\"edition\":\"solo\",\"name\":\"Craft CMS Zublu\",\"live\":true,\"schemaVersion\":\"3.3.3\",\"timeZone\":\"America/Los_Angeles\"},\"users\":{\"requireEmailVerification\":true,\"allowPublicRegistration\":false,\"defaultGroup\":null,\"photoVolumeUid\":null,\"photoSubpath\":\"\"},\"dateModified\":1571024717,\"plugins\":{\"contact-form\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\"}}}', '[]', 'YNFJWUd34qZD', '2019-10-14 02:57:44', '2019-10-14 02:57:44', '4c7e7e86-e4f0-4b19-8662-4bd53d100129');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', 'ad662eb6-ff29-4a0c-be2d-496bf34aee79'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '380f4c0a-307e-4651-8a01-6608a013d82b'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '55f29572-22ac-422e-bce1-3204570d668c'),
(4, NULL, 'app', 'm150403_184533_field_version', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', 'f8574142-dd87-4925-a7e4-4c1adb028d54'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', 'c346b42c-29c5-4463-b50e-12d446a208db'),
(6, NULL, 'app', 'm150403_185142_volumes', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '36b34960-9bc4-43b2-b546-62b60d8a12d8'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '607da7c6-9f07-4040-bb3a-0b18ab9619d3'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '5b294fd3-621a-409d-9788-77801c0f4259'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '87de8bdb-9ee9-491d-abc5-bd6e32383ff3'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', 'c2727c67-e1bc-4d8a-b2a0-813b6e51e0e1'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '94920e3c-56c2-4ca8-a100-891c357ce2e5'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '177274bf-31b6-461e-85f2-baddda95a3d5'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '2019-10-14 02:57:46', '4c49adce-29c2-4b6c-8139-3a282a12871b'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', 'f898f55e-29e0-4080-87ab-d0a7399e13a6'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2044abcc-9986-4634-98b7-7527fc6b6cf7'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', 'b6cb5553-216b-4e75-a813-6d7f66b4ff30'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', 'f3aca417-17d6-430c-a3e0-289f29df4819'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '0615f3e8-5aa1-4312-8570-6152ac6f7a15'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', 'd57101fb-172e-4e87-b7cc-f8908e7849fa'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '8a2996d3-2b45-4111-a4cd-058d1c6224f9'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', 'fa80af88-7334-4c1f-aaad-bf71060e26f4'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '33c37b7f-7326-4746-bedf-e284a2edc666'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '26dc63cf-9ca8-4468-ba24-ec84bbc91044'),
(24, NULL, 'app', 'm160807_144858_sites', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '2019-10-14 02:57:47', '12e5b1d0-f453-48c8-b1ef-04f8016b8dc4'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '604c3516-9548-4c5f-a1e4-5087d6ebb143'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'b93d175f-a156-4b67-99d9-4446920e92bd'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'f7b7a191-a22e-496d-81a5-8ce698a807b2'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '66b574ec-a7c2-498f-a26a-4701ab59779a'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'aedae28f-122a-4116-b20a-02eefe901d46'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '008f55e9-677f-48cc-a785-d2dc6182039d'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '9f6e7aba-dbdf-4cba-802f-dca15f564197'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '3e9e4086-559d-4c7b-8004-5d2e23741c40'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'b25f6cce-7a4e-40d9-9a56-854f5d94adf8'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '4208d25f-852d-4377-a09e-98be330b6a2d'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '97255ea6-bd78-48f5-a575-2184b3f59256'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'a7cbb8ee-b45c-416d-98c8-55e2ee4c3a45'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'c433f74a-9d54-44ef-8c84-fc97209f10dc'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2019-10-14 02:57:48', '2019-10-14 02:57:48', '2019-10-14 02:57:48', 'c3170354-89e1-42e6-84c8-e5ce96dc1b9b'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '24b350f8-4db2-4569-8d9f-93e0b8915619'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '1592cb08-bd84-4e48-a8dd-d72707f73781'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'bc89b081-e400-459d-a31e-abdfe67886ec'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'bc6d70c6-28a9-4f18-a063-d76ce121ba5f'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '6266c138-5cde-44b4-867f-d83332a02089'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'dd483bef-50b5-42c8-9984-400b32f290af'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '56f134db-e0a9-4f37-a3aa-17b8a324c1f7'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '446cfd23-0267-4c7d-92b7-b9485e8c1aaa'),
(47, NULL, 'app', 'm170206_142126_system_name', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '72d9dc00-16c5-495f-8c02-19f3c3840b15'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'e9df2231-9a01-4efb-a525-ae5236565bbc'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'c274b89f-8484-468a-8000-81023842628e'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'f6d904b7-1d56-49a3-9cbc-9b02860d7abc'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'ab8af09d-b0b4-4b45-b844-a7271a766db9'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '675c07c6-8dc8-4bfd-97a6-bd52c6b5ca1e'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '6c31cc05-5fd0-4eeb-befe-d07b66ddc4d2'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'ea38c10a-8746-4395-b1b2-902b29019420'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'a581192a-ba8e-4cfa-a2e3-cc6fde7225da'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'ba5e8257-d72e-461a-b4fb-7bfe5d620002'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', 'bfd1a72d-ef1d-43f8-ad39-3203212c4d9f'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '94b13e6e-b30c-419d-9365-242cc873bdb4'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '12333d3d-907f-4870-b50d-2774323fb7e3'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '2019-10-14 02:57:49', '34af681b-3c72-4c06-848d-f6a172e3c2a7'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '35629b84-a9d6-49cd-9a38-eaf42f3580fe'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '856d0bcc-c0a0-4a35-9ca6-b1b4150718fa'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '706ac243-91bd-45c8-bd17-3c5841e31c3d'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '09b6fec0-cee2-4ace-bdbe-a6ca90f0a314'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '360ec749-77f8-43ab-a1dc-3cfc3293fbec'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'f2a29042-9a33-48ee-a0ae-fb9545758080'),
(67, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'aa4ff2d5-8574-4759-928b-16f78a7c4dc1'),
(68, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'f15f3ab1-2e84-4f78-895e-d4a6653cb260'),
(69, NULL, 'app', 'm171011_214115_site_groups', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '987625d5-97fa-4417-8177-6905dad40bf8'),
(70, NULL, 'app', 'm171012_151440_primary_site', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'f2e9ab99-6c38-47f0-a1c0-95f0f7c6aae4'),
(71, NULL, 'app', 'm171013_142500_transform_interlace', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'f3543395-f214-4992-9a7a-f35812884e66'),
(72, NULL, 'app', 'm171016_092553_drop_position_select', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'd5c81942-b2fa-4776-b66d-8ef16b2cc888'),
(73, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '9f87b53e-0e9b-4dd7-9661-fb9ce0a5d984'),
(74, NULL, 'app', 'm171107_000000_assign_group_permissions', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'cc3da5ce-bb05-4791-b6e7-e98a8a44ceba'),
(75, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'e54ee935-82b4-4852-9ee1-bf26dfa759e0'),
(76, NULL, 'app', 'm171126_105927_disabled_plugins', '2019-10-14 02:57:50', '2019-10-14 02:57:50', '2019-10-14 02:57:50', 'b84e3d0f-67ee-460d-a981-bcc5bd1dfe2d'),
(77, NULL, 'app', 'm171130_214407_craftidtokens_table', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'ada5a36e-d8ff-4681-9475-a321cfbff295'),
(78, NULL, 'app', 'm171202_004225_update_email_settings', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'bc8d763b-c9a0-4e7c-b98a-e5905e75ce63'),
(79, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '68bbfc69-d5fc-4652-8f5f-bf72b0c988df'),
(80, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '3a9ac7ff-a433-408c-859d-85cc05c46563'),
(81, NULL, 'app', 'm171218_143135_longtext_query_column', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '0af93613-54d7-4e8a-83c1-d4e2d146a2bf'),
(82, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'd41bf41d-be48-4e04-a052-7e36b9b72bdf'),
(83, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '016388d6-477f-4572-9789-263d64534893'),
(84, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '19055f7c-6a79-4d6b-8039-cff95e71eb3a'),
(85, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'a12156a3-54e6-4a55-84f0-2230840be258'),
(86, NULL, 'app', 'm180128_235202_set_tag_slugs', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2bbbc93c-77a7-42a3-af90-2121203dca58'),
(87, NULL, 'app', 'm180202_185551_fix_focal_points', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '274981a1-f71e-4390-9e44-a867564acb87'),
(88, NULL, 'app', 'm180217_172123_tiny_ints', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '5ecaa4f3-8965-449a-ab09-cfebac63bf11'),
(89, NULL, 'app', 'm180321_233505_small_ints', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '4cc4a038-bef0-4589-8afe-4564d2c8104e'),
(90, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '8bbe3319-4420-4884-8d3f-8326731e180a'),
(91, NULL, 'app', 'm180404_182320_edition_changes', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'ef7e6612-6e98-4984-bdf2-ea15324072a9'),
(92, NULL, 'app', 'm180411_102218_fix_db_routes', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '559ca75f-3669-42c7-8bf9-af49c4a404fe'),
(93, NULL, 'app', 'm180416_205628_resourcepaths_table', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'd50ed1dc-1ef1-4a91-93ea-0a8bb0e58a14'),
(94, NULL, 'app', 'm180418_205713_widget_cleanup', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', 'a8a66921-a7d5-4a48-ad73-dc763b1aca0f'),
(95, NULL, 'app', 'm180425_203349_searchable_fields', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '722be2bb-ce44-4d52-8b82-d1c7c4050c3a'),
(96, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '2019-10-14 02:57:51', '917676fc-d0fb-492d-a9a3-7ab094928c37'),
(97, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'c9b62119-3c9b-4052-9a69-52598ae6e662'),
(98, NULL, 'app', 'm180518_173000_permissions_to_uid', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '40a23244-5dc9-4ea4-8dba-9ee7e6f56ddc'),
(99, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '6e9885f2-cca5-4167-aa76-4405c01c9cc3'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '6f989050-e79f-45cc-9405-5440064721f2'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '5ccc5e41-0b22-41bb-9bfa-5b05e6fe3b67'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'd986a6a4-e6e9-490e-a0a0-b6084ae20f9f'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '85572d42-a3bf-4652-b8e9-02e12fbb4837'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'b45e9850-22c6-4b53-ac4d-9542b077fdd6'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '8edb9dfd-9290-41a9-8f34-ff21848afce3'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '19c5e697-4a27-4f1e-ac93-72c2683a5bee'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'd4feacd8-5079-4300-8053-99cce1461e15'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'a6c87668-328f-48e4-9be1-14d34644d1bb'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'aacb55a5-b3e1-4971-92fa-380ecc8bfe1f'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2788d176-db02-4c51-af3d-d1f9d26b10e0'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'f5bafc4c-ae9c-43fc-8fc2-13559059044c'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'e2de1142-713c-4df8-a3c9-73526bb3b968'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '16c4dd0f-2e2a-44d5-9f65-28eebf7c93e2'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2019-10-14 02:57:52', '2019-10-14 02:57:52', '2019-10-14 02:57:52', 'f8d5ed50-0c60-42bf-8e09-0aa62f063562'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '94461b3f-b5fb-4965-9142-7d77c7bbd0db'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '0612fb12-1072-466b-a34a-6411b3a2ab73'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '42011b9e-0d97-4f82-9c1d-7bc7f085cc88'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '1deadfc6-e248-4b08-9648-753495266b3b'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', 'e10bea1c-3a5e-49b8-bd6e-5fc220283b41'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', 'f2c0584b-7fc9-4cac-8160-1f27d321aa7d'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '9af9534e-6804-479c-a88c-450e4fd3c57e'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '96b185f6-9ce8-4c49-8eb2-f08a374f21bd'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', 'd44dd428-47b2-4409-8d27-ba59fe308b17'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '6337ab23-e4f4-4f3c-935c-e151ed40f4f7'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '06cd396c-2e9b-42f0-8350-155eaa711ece'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', 'e9f5a3b6-2011-4085-ac41-ae82d36ff7a4'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '56784c1f-991b-4170-989d-40819e913b23'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '6c382b53-bd90-47f1-88aa-faded120ae46'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '2019-10-14 02:57:53', '34141f9d-8b95-4cdf-8c51-40068c224bfc'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '9d1e606b-8162-4cbc-b4a3-20ae237a7810'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '691fb2f9-f978-4ec5-8f04-bcaa994fd8d8'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'db304b40-b864-4d2b-99f3-6cd3934ee13e'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'c886e87d-a821-44d0-a613-69c662c79184'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '786f65fa-6253-49be-9073-b12dcb6d4c70'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '6e89f6ad-824f-4193-ae24-c6dbd21e4266'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'f614a32b-76f4-4e82-91cc-cf3167700f02'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '04bacfbb-c2eb-4a2c-b8ef-77829b3bcabf'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '4791e534-949f-4e2e-9a8b-ba840442e5a9'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '42632052-c1f5-44da-ac49-a3561198a363'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '8a3c5c5f-848d-41ed-99d4-1d0b8838ee4e'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'ca222de5-29e2-4a7d-8dae-31cf9008a3af'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '5811e3ac-e89f-444a-a766-10e3411ae774'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'a45d1c8a-4521-4282-93f2-d7b0884bc079'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'aa9c5feb-335c-47f3-8047-5570c53903a9'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '8ea73810-0a50-4d1e-9fdc-456c506c2a02'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'c5517136-7122-4567-86bb-2884bed83e2a'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2019-10-14 02:57:54', '2019-10-14 02:57:54', '2019-10-14 02:57:54', 'cf435bfd-eba1-4e4c-b6fd-9d940509894e'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '3dc68863-604e-47aa-ad7b-dc7e2b753111'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '4b9919ab-294a-4961-82d2-25834eb75d62'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', 'e123febe-e92f-4758-a2de-f5d150625e85'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '66c4c9ad-cb6b-418c-9b71-ed7c6708f752'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '583849e8-816f-4225-be3f-2295158b167c'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '6151df09-1b41-4a25-84c1-bb9e7ca2a811'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '767437a8-6548-4e9d-93a9-58023394b3bf'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '2019-10-14 02:57:55', '4b48c6d7-f014-44c2-ab8d-6ef6fbfc01bf'),
(156, 4, 'plugin', 'm191014_032037_newsmigrate', '2019-10-14 03:39:07', '2019-10-14 03:39:07', '2019-10-14 03:39:07', '766b40c9-d6f7-439c-a08c-1db855dbebff');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` text DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `dateCreated` date DEFAULT NULL,
  `dateUpdated` date DEFAULT NULL,
  `uid` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `author`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'First news in plugin', 'Hellfslbfsfskdfbskbfskbfskbfskbfskbfskfbskbf', 'LongHo', NULL, NULL, NULL),
(2, 'asdasdas', 'adasd', 'kdsbfksdbf', '2019-10-14', '2019-10-14', 'ea4009a3-23f2-4992-b968-65973e8811eb'),
(3, 'asdasdas', 'adasd', 'kdsbfksdbf', '2019-10-14', '2019-10-14', 'f8a9bee3-d619-4230-9023-d9083d42e37d'),
(4, 'asdasdas', 'adasd', 'kdsbfksdbf', '2019-10-14', '2019-10-14', 'c3fa818a-81b3-4983-b063-5e2e6981aeff'),
(5, 'asdasdas', 'adasd', 'kdsbfksdbf', '2019-10-14', '2019-10-14', '43e5f4a3-8128-4147-a83d-493b991e2b92'),
(6, 'asdasdas', 'adasd', 'kdsbfksdbf', '2019-10-14', '2019-10-14', 'd3e79857-89d6-4c85-acf1-cac27e3222c7'),
(7, '1111111', '222222222', 'sds3333333333', '2019-10-14', '2019-10-14', '23d92693-839f-46bf-9b33-a4412ced654e'),
(8, '4444444444', '222222222444', '44444', '2019-10-14', '2019-10-14', '8870a46f-9bae-4f18-9c0d-b2fa3e92ac6f'),
(9, '4444444444', '222222222444', '44444', '2019-10-14', '2019-10-14', 'e3f2fb57-3dab-4492-94d4-a459d5854915'),
(10, '4444444444', '222222222444', '44444', '2019-10-14', '2019-10-14', '8a8ab739-09d2-49f3-a97f-b8b4818b3ab3'),
(11, 'w', 'w', 'www', '2019-10-14', '2019-10-14', 'a2735c90-2f27-477f-8a2c-3d9eb54d4fa4'),
(12, 'w', 'w', 'www', '2019-10-14', '2019-10-14', '4b2d6b7e-7988-4035-8585-80583706630a'),
(13, 'w', 'w', 'www', '2019-10-14', '2019-10-14', 'c4ed6ef7-faa4-4b19-8134-16936a08a2a7'),
(14, 'w', 'w', 'www', '2019-10-14', '2019-10-14', '33a05603-6178-4bd7-a3e5-df1ab5c5e599'),
(15, 'w', 'w', 'www', '2019-10-14', '2019-10-14', '19993b31-59c2-41c0-b3be-0d11e8bcadcf'),
(16, 'w', 'w', 'www', '2019-10-14', '2019-10-14', 'd0c4ffb8-0c67-4523-b0dc-7f8bbd8942b5'),
(17, 'w', 'w', 'www', '2019-10-14', '2019-10-14', '8dcf0452-eab0-4663-90c2-b7e8a5876e55');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 'contact-form', '2.2.5', '1.0.0', 'unknown', NULL, '2019-10-14 03:39:07', '2019-10-14 03:39:07', '2019-10-14 05:49:13', '99757f6b-b96f-430c-91bd-d1e5362b7433');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('17248d63', '@lib/fabric'),
('262595d', '@lib/garnishjs'),
('27926f74', '@lib/fileupload'),
('2ec26fcc', '@craft/web/assets/utilities/dist'),
('31df4edb', '@lib/d3'),
('38de5248', '@lib/jquery-touch-events'),
('3f7a6e8a', '@lib/picturefill'),
('4f86aaf4', '@app/web/assets/plugins/dist'),
('50f4ccf9', '@craft/web/assets/recententries/dist'),
('60573d91', '@craft/web/assets/installer/dist'),
('61680784', '@lib/xregexp'),
('6450563a', '@craft/web/assets/pluginstore/dist'),
('6b04430e', '@lib/selectize'),
('6d2b6647', '@craft/web/assets/cp/dist'),
('7755bfd6', '@craft/web/assets/updateswidget/dist'),
('8bfa93f5', '@lib'),
('8fb46311', '@craft/web/assets/dashboard/dist'),
('9c40f9f8', '@lib/element-resize-detector'),
('a25fa570', '@lib/velocity'),
('ae40d354', '@app/web/assets/feed/dist'),
('b3d0520d', '@bower/jquery/dist'),
('be780a98', '@lib/jquery.payment'),
('c9e2789e', '@craft/web/assets/craftsupport/dist'),
('cc63d5c1', '@app/web/assets/pluginstore/dist'),
('d30d8e26', '@app/web/assets/recententries/dist'),
('d4de7e7', '@app/web/assets/dashboard/dist'),
('d75b98ea', '@app/web/assets/cp/dist'),
('d8fffe12', '@craft/web/assets/login/dist'),
('e3256089', '@app/web/assets/craftsupport/dist'),
('eb53be25', '@craft/web/assets/plugins/dist'),
('ecf63ed5', '@lib/jquery-ui'),
('efec749b', '@craft/web/assets/feed/dist'),
('f4acfd09', '@app/web/assets/updateswidget/dist'),
('fde29e77', '@app/web/assets/updater/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' admin gmail com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '_FMvwmw2CgoGyF-pFi-a0iDT5usmiDS3r9oj4X1Oyk3ZRIKbID6WS9LszlosE3b2pu45d0-fYfCa5dI6Qrj_aMttSOCwAwyeusUy', '2019-10-14 02:57:46', '2019-10-14 04:36:34', '0ad64b43-650a-488a-8ed4-76b0dfdf13b8'),
(2, 1, 'SLNwEx9xaAc29_zoyWwC0-Uht1u1kcv69YOnrGVfTailm3kGmTzNsFKh_nMvlskuswmuGedZ5LMbA9MCdLqG5gp-FxkHHf12t61S', '2019-10-14 05:36:38', '2019-10-14 09:48:21', '1dca869c-0460-4b9f-a273-9d5f7d3c10d5'),
(3, 1, 'ztY17NSosO5ojLQ82Q_Z_qkQzDvpahmfPOhSOmgD4UOzdZqvzoE0xBAn8TxY4402KTCJ2xJoOZLPyF0IrZSagVcgES1q5jq5O-4v', '2019-10-14 09:49:42', '2019-10-14 10:34:21', 'baac4344-298d-469d-af82-0d28bd6861cb');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft CMS Zublu', '2019-10-14 02:57:45', '2019-10-14 02:57:45', NULL, 'dd6b3afc-55bb-4ed7-ac81-b8df88df9dc9');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Craft CMS Zublu', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2019-10-14 02:57:45', '2019-10-14 02:57:45', NULL, '66bf300b-38e0-4864-b503-ecdcf7aee2e4');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'admin@gmail.com', '$2y$13$IvCS.s5fIE9Ic7omY2WSpOvU4ZtfQDx0w64HeDdNuMPPoyWueBNK6', 1, 0, 0, 0, '2019-10-14 09:49:42', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2019-10-14 02:57:45', '2019-10-14 02:57:45', '2019-10-14 09:49:42', 'afefd132-e952-4768-a6d4-edcebdae193a');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2019-10-14 02:57:56', '2019-10-14 02:57:56', '306c0f53-d6a6-49f8-a521-fadc645dd11e'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2019-10-14 02:57:56', '2019-10-14 02:57:56', 'f464446c-6804-433d-b37a-ede360c3dc2c'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2019-10-14 02:57:56', '2019-10-14 02:57:56', 'aa4bb601-0b6f-45db-a885-ab8cfa06c456'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2019-10-14 02:57:57', '2019-10-14 02:57:57', 'fff61bb9-0483-4a32-92ff-5577eedbf87e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqlschemas_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqlschemas_name_unq_idx` (`name`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_handle_idx` (`handle`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
