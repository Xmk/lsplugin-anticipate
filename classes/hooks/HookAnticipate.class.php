<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
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

	protected function checkPage($sPages='*',$sType='include') {
		if (LS::Adm()) {
			return false;
		}
		if (!in_array($sType,array('include','exclude')) || !$sPages) {
			return false;
		}
		if ($sPages=='*' && $sType=='include') {
			return true;
		}
		$aPages=explode(',', $sPages);
		foreach($aPages as $sPath) {
			$sPattern = "~".str_replace(array('/','*'),array('\/','\w+'), $sPath)."~";
			if (preg_match($sPattern, Router::GetPathWebCurrent())) {
				return true;
			}
		}
		return false;
	}

	public function InitAction() {
		$sCurrentDate = date('Y-m-d 00:00:00');
		if ($aTws = $this->PluginAnticipate_Tw_GetTwItemsByTwDateStartLteAndTwDateEndGt($sCurrentDate,$sCurrentDate)) {
			foreach ($aTws as $oTw) {
				if ($this->checkPage($oTw->getExclude(),'exclude')) {
					continue;
				}
				if (!$this->checkPage($oTw->getInclude(),'include')) {
					continue;
				}
				Router::Action('anticipate',$oTw->getId());
				break;
			}
		}
	}
}

?>