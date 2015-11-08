/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
* @File Name: anticipate.js
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

var ls=ls || {};
ls.anticipate=ls.anticipate || {};

ls.anticipate.admin = (function ($) {

	this.showAddForm = function() {
		var form = $('#tw-form');
		form.find('input[name="date_start"]').val('');
		form.find('input[name="date_end"]').val('');
		form.find('input[name="title"]').val('');
		form.find('textarea[name="text"]').val('');
		form.find('input[name="include"]').val('*');
		form.find('input[name="exclude"]').val('login');
		$('#tw_form_id').val('');
		$('#tw_form_action').val('add');
		$('#tw-window').jqmShow();
	};

	this.showEditForm = function(id) {
		var form = $('#tw-form');
		var tw = $('#tw_'+id);
		var title = tw.find('.tw-title').text(),
			text = tw.find('.tw-text').text(),
			date_start = tw.find('.tw-date .tw-date-start').text(),
			date_end = tw.find('.tw-date .tw-date-end').text(),
			include = tw.find('.tw-page .tw-page-include').text(),
			exclude = tw.find('.tw-page .tw-page-exclude').text();
		form.find('input[name="date_start"]').val(date_start);
		form.find('input[name="date_end"]').val(date_end);
		form.find('input[name="title"]').val(title);
		form.find('textarea[name="text"]').val(text);
		form.find('input[name="include"]').val(include);
		form.find('input[name="exclude"]').val(exclude);
		$('#tw_form_id').val(id);
		$('#tw_form_action').val('edit');
		$('#tw-window').jqmShow();
	};

	this.applyForm = function() {
		var val = $('#tw_form_action').val();
		if (val == 'add') {
			this.addTw();
		} else if (val == 'edit')  {
			this.editTw();
		}
	};

	this.addTw = function() {
		var form = $('#tw-form');

		ls.ajaxSubmit(aRouter.anticipate+'admin', form, function(result) { 
			if (result.bStateError) {
				ls.msg.error(null,result.sMsg);
			} else {
				ls.msg.notice(null,result.sMsg);
				$('#tw-window').jqmHide();
				$('#tw-list').append($(result.sHtml));
			}
		});
	};

	this.editTw = function() {
		var form = $('#tw-form');
		var id = $('#tw_form_id').val();

		ls.ajaxSubmit(aRouter.anticipate+'admin', form, function(result) { 
			if (result.bStateError) {
				ls.msg.error(null,result.sMsg);
			} else {
				ls.msg.notice(null,result.sMsg);
				$('#tw-window').jqmHide();
				$('#tw_'+id).replaceWith(result.sHtml);
			}
		});
	};

	this.deleteTw = function(id) {
		if (!confirm(ls.lang.get('plugin.anticipate.delete_confirm'))) {return;}

		var params = {'action':'delete', 'id':id};

		ls.ajax(aRouter.anticipate+'admin', params, function(result) { 
			if (result.bStateError) {
				ls.msg.error(null,result.sMsg);
			} else {
				ls.msg.notice(null,result.sMsg);
				$('#tw_'+id).remove();
			}
		});
	};

	return this;
}).call(ls.anticipate.admin || {},jQuery);

jQuery(document).ready(function($){
	$('#tw-window').jqm();

});