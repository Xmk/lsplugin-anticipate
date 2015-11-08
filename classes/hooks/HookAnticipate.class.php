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
	//	$this->AddHook('viewer_init_start', 'ViewerInitStart');
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
		if ($oTw = $this->PluginAnticipate_Tw_GetTwByTwDateStartLteAndTwDateEndGt($sCurrentDate,$sCurrentDate)) {
			if ($this->checkPage($oTw->getExclude(),'exclude')) {
				return false;
			}
			if (!$this->checkPage($oTw->getInclude(),'include')) {
				return false;
			}
			Router::Action('anticipate',$oTw->getId());
		}
	}
}

?>