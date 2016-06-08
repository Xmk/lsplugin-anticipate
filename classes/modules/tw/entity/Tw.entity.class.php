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
		$this->aValidateRules[]=array('title','string','min'=>3,'max'=>200,'allowEmpty'=>false,'label'=>$this->Lang_Get('plugin.anticipate.form_title'));
		$this->aValidateRules[]=array('text','string','min'=>0,'max'=>1500,'allowEmpty'=>true,'label'=>$this->Lang_Get('plugin.anticipate.form_text'));
		$this->aValidateRules[]=array('date_start','type','type'=>'datetime','datetimeFormat'=>'yyyy-MM-dd hh:mm','allowEmpty'=>false,'label'=>$this->Lang_Get('plugin.anticipate.form_date_start'));
		$this->aValidateRules[]=array('date_end','type','type'=>'datetime','datetimeFormat'=>'yyyy-MM-dd hh:mm','allowEmpty'=>false,'label'=>$this->Lang_Get('plugin.anticipate.form_date_end'));
		$this->aValidateRules[]=array('date_end','check_date');
		$this->aValidateRules[]=array('include','string','min'=>1,'max'=>200,'allowEmpty'=>false,'label'=>$this->Lang_Get('plugin.anticipate.form_include'));
		$this->aValidateRules[]=array('include','check_page','*'=>true);
		$this->aValidateRules[]=array('exclude','check_page');
	}

	public function ValidateCheckDate($sValue,$aParams) {
		$sDateStart = $this->getDateStart();
		$sDateEnd = $this->getDateEnd();
		if (strtotime($sDateEnd) <= strtotime($sDateStart)) {
			return $this->Lang_Get('plugin.anticipate.form_error_date');
		}
		return true;
	}
	public function ValidateCheckPage($sValue,$aParams) {
		$sValue = trim($sValue);
		if (!$sValue || ($sValue == '*' && isset($aParams['*']))) {
			return true;
		}
		$aValuePages = explode(',', $sValue);
		$aRouterPages = array_keys(Config::Get('router.page'));
		foreach ($aValuePages as $sPage) {
			/**
			 * $aPageRoute[0]		- action
			 * $aPageRoute[1]		- event
			 * $aPageRoute[2..n]	- param
			 */
			$aPageRoute=explode('/',$sPage);
			if (!in_array(trim($aPageRoute[0]),$aRouterPages)) {
				return $this->Lang_Get('plugin.anticipate.form_error_router',array('url'=>trim($aPageRoute[0])));
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

	public function getIncludeArray() {
		$aResult=array();
		$aPages=explode(',', $this->getInclude());
		foreach ($aPages as $sPage) {
			$sPage=trim($sPage);
			$aPage=array(
				'title'=>$sPage
			);
			if (strpos($sPage, '*') === false) {
				$aPage['url']=Router::GetPath($sPage);
			}
			$aResult[]=$aPage;
		}
		return $aResult;
	}
	public function getExcludeArray() {
		$aResult=array();
		$aPages=explode(',', trim($this->getExclude()));
		foreach ($aPages as $sPage) {
			$sPage=trim($sPage);
			$aPage=array(
				'title'=>$sPage
			);
			if (strpos($sPage, '*') === false) {
				$aPage['url']=Router::GetPath($sPage);
			}
			$aResult[]=$aPage;
		}
		return $aResult;
	}
}
