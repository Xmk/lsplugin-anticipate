<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 0.5.1+
* @File Name: HookAnticipate.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

/**
 * Регистрация хуков
 *
 */
class PluginAnticipate_HookAnticipate extends Hook {
	public function RegisterHook() {
		$this->AddHook('init_action', 'InitAction');
	}

	public function InitAction() {
		if (LS::Adm()) {
			return false;
		}
		/**
		 * Смотрим, подходит ли текущая страница под список исключений
		 */
		foreach((array)Config::Get('plugin.anticipate.exclude') as $sPath) {
			$sPattern = "~".str_replace(array('/','*'),array('\/','\w+'), $sPath)."~";
			if (preg_match($sPattern, Router::GetPathWebCurrent())) {
				return;
			}
		}
		Router::Action('anticipate');
	}
}

?>