<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 0.5.1+
* @File Name: ActionAnticipate.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

class PluginAnticipate_ActionAnticipate extends ActionPlugin {
	/**
	 * Текущий юзер
	 *
	 * @var ModuleUser_EntityUser
	 */
	protected $oUserCurrent=null;


	/**
	 * Инициализация экшена
	 */
	public function Init() {
		if (!LS::Adm() and Router::GetAction()!='anticipate') {
			Router::Location(Config::Get('path.root.web').'/');
		}
		/**
		 * Получаем текущего пользователя
		 */
		$this->oUserCurrent=$this->User_GetUserCurrent();
		/**
		 * Подключаем CSS
		 */
		$this->Viewer_AppendStyle($this->getTemplatePathPlugin().'css/anticipate.css');
		/**
		 * Подключаем JS
		 */
		$this->Viewer_AppendScript($this->getTemplatePathPlugin().'js/jquery.countdown.min.js');
		$this->Viewer_AppendScript($this->getTemplatePathPlugin().'js/ls.anticipate.js');
		/**
		 * Подключаем toolbar
		 */
		if (!$this->oUserCurrent) {
			$this->Viewer_AddBlock('toolbar',$this->getTemplatePathPlugin().'toolbar_login.tpl');
		}
		/**
		 * Устанавливаем дефолтный эвент
		 */
		$this->SetDefaultEvent('index');
	}


	/**
	 * Регистрация эвентов
	 */
	protected function RegisterEvent() {
		$this->AddEvent('admin','EventAdmin');
		$this->AddEvent('index','EventIndex');
	}


	/**
	 * Главная страница
	 *
	 */
	public function EventIndex() {
		$iPercent = Config::Get('plugin.anticipate.params.percent');
		$sTitle = Config::Get('plugin.anticipate.params.title');
		$sText = Config::Get('plugin.anticipate.params.text');
		$sDate = Config::Get('plugin.anticipate.params.date');
		/**
		 * Загружаем в шаблон необходимые переменные
		 */
		$this->Viewer_Assign('iPercent',$iPercent);
		$this->Viewer_Assign('sTitle',$sTitle);
		$this->Viewer_Assign('sText',$sText);
		$this->Viewer_Assign('sDate',$sDate);
		/**
		 * Устанавливаем шаблон вывода
		 */
		$this->SetTemplateAction('index');
	}

	/**
	 * Админка
	 *
	 */
	public function EventAdmin() {
		if (!LS::Adm()) return parent::EventNotFound();

		/**
		 * Устанавливаем шаблон вывода
		 */
		$this->SetTemplateAction('admin');
	}


	/**
	 * Завершение работы экшена
	 */
	public function EventShutdown() {
		/**
		 * Загружаем в шаблон необходимые переменные
		 */
		$this->Viewer_Assign('sTemplatePathPlugin',rtrim($this->getTemplatePathPlugin(),'/'));
		$this->Viewer_Assign('sTemplateWebPath',rtrim(Plugin::GetTemplateWebPath(__CLASS__),'/'));
	}
}

?>