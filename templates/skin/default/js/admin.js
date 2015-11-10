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
		var form = $('#tw_form');
		form.find('input[name="date_start"]').val('');
		form.find('input[name="date_end"]').val('');
		form.find('input[name="title"]').val('');
		form.find('textarea[name="text"]').val('');
		form.find('input[name="include"]').val('*');
		form.find('input[name="exclude"]').val('login');
		$('#tw_form_id').val('');
		$('#tw_form_action').val('add');
		$('#tw_window').jqmShow();
	};

	this.showEditForm = function(id) {
		var form = $('#tw_form');
		var tw = $('#tw_'+id);
		var title = tw.find('.tw-title').text(),
			text = tw.find('.tw-text').text(),
			date_start = tw.data('date-start'),
			time_start = tw.data('time-start'),
			date_end = tw.data('date-end'),
			time_end = tw.data('time-end'),
			include = tw.data('include'),
			exclude = tw.data('exclude');
		var time_start_a = time_start.split(':');
		var time_end_a = time_end.split(':');
		form.find('input[name="date_start"]').val(date_start);
		form.find('select[name="time_start_h"] option[value="'+time_start_a[0]+'"]').attr('selected', 'selected');
		form.find('select[name="time_start_m"] option[value="'+time_start_a[1]+'"]').attr('selected', 'selected');
		form.find('input[name="date_end"]').val(date_end);
		form.find('select[name="time_end_h"] option[value="'+time_end_a[0]+'"]').attr('selected', 'selected');
		form.find('select[name="time_end_m"] option[value="'+time_end_a[1]+'"]').attr('selected', 'selected');
		form.find('input[name="title"]').val(title);
		form.find('textarea[name="text"]').val(text);
		form.find('input[name="include"]').val(include);
		form.find('input[name="exclude"]').val(exclude);
		$('#tw_form_id').val(id);
		$('#tw_form_action').val('edit');
		$('#tw_window').jqmShow();
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
		var form = $('#tw_form');

		ls.ajaxSubmit(aRouter.anticipate+'admin', form, function(result) { 
			if (result.bStateError) {
				ls.msg.error(null,result.sMsg);
			} else {
				ls.msg.notice(null,result.sMsg);
				$('#tw_window').jqmHide();
				$('#tw_list').append($(result.sHtml));
			}
		});
	};

	this.editTw = function() {
		var form = $('#tw_form');
		var id = $('#tw_form_id').val();

		ls.ajaxSubmit(aRouter.anticipate+'admin', form, function(result) { 
			if (result.bStateError) {
				ls.msg.error(null,result.sMsg);
			} else {
				ls.msg.notice(null,result.sMsg);
				$('#tw_window').jqmHide();
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
	$('#tw_window').jqm();

});