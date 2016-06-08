<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet CMS
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
* @File Name: config.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

$config=array();

$config['theme']	= 'colorit';		// Тема

/**
 * Настройки роутера
 */
Config::Set('router.page.anticipate', 'PluginAnticipate_ActionAnticipate');

return $config;
