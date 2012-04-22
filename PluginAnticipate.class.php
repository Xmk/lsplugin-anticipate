<?
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet CMS
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 0.5.1+
* @File Name: PluginAnticipate.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

if (!class_exists('Plugin')) {
	die('Hacking attemp!');
}

class PluginAnticipate extends Plugin {
	protected $aInherits=array();

	/**
	 * Активация плагина
	 */
	public function Activate() {
		if (!$this->isTableExists('prefix_anticipate')) {
			$this->ExportSQL(dirname(__FILE__).'/sql/install.sql');
		}
		return true;
	}

	/**
	 * Деактивация плагина
	 */
	public function Deactivate() {
		$this->ExportSQL(dirname(__FILE__).'/sql/deinstall.sql');
		return true;
	}

	/**
	 * Инициализация плагина
	 */
	public function Init() {
		return true;
	}
}

?>