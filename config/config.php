<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet CMS
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 0.5.1+
* @File Name: config.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

$config=array();

/**
 * Настройки роутера
 */
Config::Set('router.page.anticipate', 'PluginAnticipate_ActionAnticipate');

/** 
 * Настройки JS и CSS файлов
 */
/*Config::Set('head.rules.anticipate', array(
	'path'=>array(
		'___path.root.web___/',
	),
	'css'=>array(
		'exclude'=>array(
			"___path.static.skin___/css/topic.css",
			"___path.static.skin___/css/comments.css",
			"___path.static.skin___/css/blocks.css",
			"___path.static.skin___/css/blog.css",
			"___path.static.skin___/css/profile.css",
			"___path.static.skin___/css/wall.css"
		)
	),
	'js'=>array(
		'exclude'=>array(
			"___path.root.engine_lib___/internal/template/js/favourite.js",
			"___path.root.engine_lib___/internal/template/js/blocks.js",
			"___path.root.engine_lib___/internal/template/js/talk.js",
			"___path.root.engine_lib___/internal/template/js/vote.js",
			"___path.root.engine_lib___/internal/template/js/poll.js",
			"___path.root.engine_lib___/internal/template/js/subscribe.js",
			"___path.root.engine_lib___/internal/template/js/geo.js",
			"___path.root.engine_lib___/internal/template/js/wall.js",
			"___path.root.engine_lib___/internal/template/js/usernote.js",
			"___path.root.engine_lib___/internal/template/js/comments.js",
			"___path.root.engine_lib___/internal/template/js/blog.js",
			"___path.root.engine_lib___/internal/template/js/userfeed.js",
			"___path.root.engine_lib___/internal/template/js/userfield.js",
			"___path.root.engine_lib___/internal/template/js/stream.js",
			"___path.root.engine_lib___/internal/template/js/photoset.js",
			"___path.root.engine_lib___/internal/template/js/settings.js",
			"___path.root.engine_lib___/internal/template/js/topic.js",
			"___path.static.skin___/js/developer-jquery.js"
		)
	)
));*/

$config['exclude'] = array('login');

$config['params'] = array(
	/**
	 * Проценты, целое число (или false|null)
	 */
	'percent'	=> 8,
	/**
	 * Заголовок страницы
	 */
	'title'		=> 'Hello',
	/**
	 * Текст
	 */
	'text'		=> 'Cooming Soon',
	/**
	 * Дата, в формате например: 2012-04-30 00:00:00 (или false|null)
	 */
	'date'		=> false
);

return $config;

?>