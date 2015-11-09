<?php
/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
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
		/**
		 * Получаем текущего пользователя
		 */
		$this->oUserCurrent=$this->User_GetUserCurrent();
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
		$this->AddEventPreg('/^(\d+)$/i','EventShow');
	}

	/**
	 * Страница тех.работ
	 *
	 */
	public function EventShow() {
		$sTwId = $this->sCurrentEvent;
		if (!$oTw = $this->PluginAnticipate_Tw_GetTwById($sTwId)) {
			return parent::EventNotFound();
		}
		/**
		 * Загружаем в шаблон необходимые переменные
		 */
		$this->Viewer_Assign('oTw',$oTw);
		/**
		 * Устанавливаем заголовок
		 */
		$this->Viewer_AddHtmlTitle($oTw->getTitle());
		/**
		 * Устанавливаем шаблон вывода
		 */
		$this->SetTemplateAction('show');
	}

	/**
	 * Админка
	 *
	 */
	public function EventAdmin() {
		if (!LS::Adm()) {
			return parent::EventNotFound();
		}

		switch(getRequestStr('action')) {
			// Создание нового tw
			case 'add':
				// Обрабатываем как ajax запрос (json)
				$this->Viewer_SetResponseAjax('json');
				// приводим даты к нужному формату
				$sDateStart=getRequestStr('date_start');
				if (func_check($sDateStart,'text',6,10) && substr_count($sDateStart,'.')==2) {
					list($d,$m,$y)=explode('.', $sDateStart);
					$sDateStart="{$y}-{$m}-{$d}";
				}
				$sDateEnd=getRequestStr('date_end');
				if (func_check($sDateEnd,'text',6,10) && substr_count($sDateEnd,'.')==2) {
					list($d,$m,$y)=explode('.',getRequestStr('date_end'));
					$sDateEnd="{$y}-{$m}-{$d}";
				}
				// приводим в нужный формат список разделов
				$sInclude=implode(',', preg_split('/[\s,;.:_\-\+]+/', getRequestStr('include')));
				$sExclude=implode(',', preg_split('/[\s,;.:_\-\+]+/', getRequestStr('exclude')));
				// создаем объект
				$oTwNew = Engine::GetEntity('PluginAnticipate_Tw_Tw');
				$oTwNew->setTitle(getRequestStr('title'));
				$oTwNew->setText(getRequestStr('text'));
				$oTwNew->setDateStart($sDateStart);
				$oTwNew->setDateEnd($sDateEnd);
				$oTwNew->setInclude($sInclude);
				$oTwNew->setExclude($sExclude);
				if(!$oTwNew->_Validate()) {
					$this->Message_AddError($oTwNew->_getValidateError(),$this->Lang_Get('error'));
					return false;
				}
				if(!$oTw = $this->PluginAnticipate_Tw_AddTw($oTwNew)) {
					$this->Message_AddError($this->Lang_Get('system_error'),$this->Lang_Get('error'));
					return;
				}
				// Прогружаем переменные в ajax ответ
				$oViewer = $this->Viewer_GetLocalViewer();
				$oViewer->Assign('oTw',$oTw);
				$this->Viewer_AssignAjax('sHtml',$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__).'actions/ActionAnticipate/admin_item.tpl'));
				$this->Message_AddNotice($this->Lang_Get('plugin.anticipate.add_success'));
				break;
			// Удаление tw
			case 'delete':
				// Обрабатываем как ajax запрос (json)
				$this->Viewer_SetResponseAjax('json');
				if (!$oTw=$this->PluginAnticipate_Tw_GetTwById(getRequestStr('id'))) {
					$this->Message_AddError($this->Lang_Get('system_error'),$this->Lang_Get('error'));
					return;
				}
				$this->PluginAnticipate_Tw_DeleteTw($oTw);
				$this->Message_AddNotice($this->Lang_Get('plugin.anticipate.delete_success'),$this->Lang_Get('attention'));
				break;
			// Изменение категории
			case 'edit':
				// Обрабатываем как ajax запрос (json)
				$this->Viewer_SetResponseAjax('json');
				if (!$oTw=$this->PluginAnticipate_Tw_GetTwById(getRequestStr('id'))) {
					$this->Message_AddError($this->Lang_Get('system_error'),$this->Lang_Get('error'));
					return;
				}
				// приводим даты к нужному формату
				$sDateStart=getRequestStr('date_start');
				if (func_check($sDateStart,'text',6,10) && substr_count($sDateStart,'.')==2) {
					list($d,$m,$y)=explode('.', $sDateStart);
					$sDateStart="{$y}-{$m}-{$d}";
				}
				$sDateEnd=getRequestStr('date_end');
				if (func_check($sDateEnd,'text',6,10) && substr_count($sDateEnd,'.')==2) {
					list($d,$m,$y)=explode('.',getRequestStr('date_end'));
					$sDateEnd="{$y}-{$m}-{$d}";
				}
				// приводим в нужный формат список разделов
				$sInclude=implode(',', preg_split('/[\s,;.:_\-\+]+/', getRequestStr('include')));
				$sExclude=implode(',', preg_split('/[\s,;.:_\-\+]+/', getRequestStr('exclude')));
				// обновляем данные объекта
				$oTw->setTitle(getRequestStr('title'));
				$oTw->setText(getRequestStr('text'));
				$oTw->setDateStart($sDateStart);
				$oTw->setDateEnd($sDateEnd);
				$oTw->setInclude($sInclude);
				$oTw->setExclude($sExclude);
				if(!$oTw->_Validate()) {
					$this->Message_AddError($oTw->_getValidateError(),$this->Lang_Get('error'));
					return false;
				}
				if (!$this->PluginAnticipate_Tw_UpdateTw($oTw)) {
					$this->Message_AddError($this->Lang_Get('system_error'),$this->Lang_Get('error'));
					return;
				}
				$oViewer = $this->Viewer_GetLocalViewer();
				$oViewer->Assign('oTw',$oTw);
				$this->Viewer_AssignAjax('sHtml',$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__).'actions/ActionAnticipate/admin_item.tpl'));
				$this->Message_AddNotice($this->Lang_Get('plugin.anticipate.edit_success'),$this->Lang_Get('attention'));
				break;
			/**
			 * Показываем страницу со списком полей
			 */
			default:
				$this->sMenuItemSelect='admin';
				// Загружаем в шаблон JS текстовки
				$this->Lang_AddLangJs(array('plugin.anticipate.delete_confirm'));
				// Подключаем CSS
				$this->Viewer_AppendStyle(Plugin::GetTemplatePath(__CLASS__).'css/admin.css');
				// Подключаем JS
				$this->Viewer_AppendScript(Plugin::GetTemplatePath(__CLASS__).'js/admin.js');
				// Получаем список всего
				$this->Viewer_Assign('aTw',$this->PluginAnticipate_Tw_GetTwItemsAll());
				$this->Viewer_AddHtmlTitle($this->Lang_Get('plugin.anticipate.admin_title'));
				$this->SetTemplateAction('admin');
		}
	}

}

?>