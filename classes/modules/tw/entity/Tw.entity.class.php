<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
* @File Name: Board.entity.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

class PluginAnticipate_ModuleTw_EntityTw extends EntityORM {
	/**
	 * Определяем правила валидации
	 */
	public function Init() {
		parent::Init();
		$this->aValidateRules[]=array('title','string','min'=>0,'max'=>200,'allowEmpty'=>true);
		$this->aValidateRules[]=array('text','string','min'=>0,'max'=>1500,'allowEmpty'=>true);
		$this->aValidateRules[]=array('date_start','date','format'=>'yyyy-MM-dd');
		$this->aValidateRules[]=array('date_end','date','format'=>'yyyy-MM-dd');
		$this->aValidateRules[]=array('include','check_page','*'=>true);
		$this->aValidateRules[]=array('exclude','check_page',);
	}

	public function ValidateCheckPage($sValue,$aParams) {
		$sValue = trim($sValue);
		if (!$sValue || ($sValue == '*' && isset($aParams['*']))) {
			return true;
		}
		$aValuePages = explode(',', $sValue);
		$aRouterPages = array_keys(Config::Get('router.page'));
		foreach ($aValuePages as $sPage) {
			if (!in_array(trim($sPage),$aRouterPages)) {
				return $this->Lang_Get('plugin.anticipate.form_error_router',array('url'=>trim($sPage)));
			}
		}
		return true;
	}

	public function getActive() {
		$iCurrentDate=time();
		return (strtotime($this->getDateStart()) <= $iCurrentDate) && (strtotime($this->getDateEnd()) > $iCurrentDate);
	}
	public function getPercent() {
		$iCurrentDate=time();
		$iStartDate=strtotime($this->getDateStart());
		$iEndDate=strtotime($this->getDateEnd());
		$a = $iEndDate-$iCurrentDate;
		if ($a < 0) return 100;
		$b = $iCurrentDate-$iStartDate;
		if ($b < 0) return 0;
		$c = $iEndDate-$iStartDate;
		return round((100/$c)*$b);
	}

}
?>