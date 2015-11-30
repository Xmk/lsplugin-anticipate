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

var ls=ls || {}

ls.anticipate = (function ($) {
	this.initTimer = function(date) {
		var anticipateDay = new Date(date);
		$('#anticipate-timer').countdown({
			until: anticipateDay,
			layout: '<span class="timer"><strong>{dn}</strong> {dl}</span><span class="timer"><strong>{hn}</strong> {hl}</span><span class="timer"><strong>{mn}</strong> {ml}</span><span class="timer"><strong>{sn}</strong> {sl}</span>',
			onExpiry: ls.anticipate.refreshPage
		});
	};

	this.initProgressBar = function(perc) {
		var progressBar = $('#anticipate-bar'), progressPiece = $('#anticipate-piece');

		var et_multiply = 7,
			et_percent = perc,
			et_percent_width = et_multiply*et_percent;

		if (et_percent === 100) et_percent_width = 714;

		progressBar.animate({'width': (et_percent_width - 20)}, 2000, function(){
			$(this).animate({'width': (et_percent_width)}, 200);
			$('#anticipate-percent-text').animate({'opacity': 'toggle'}, 300);
			if (et_percent != 100) {
				progressPiece.css({left: (et_percent_width-9)}).show();
			}
		});
	};

	this.refreshPage = function() {
		windows.location.refresh;
	};

	this.auth = function(form) {
		if (typeof(form)=='string') {
			form=$('#'+form);
		}
		this.formLoader(form);
		var options = {
			type: 'POST',
			url: DIR_WEB_ROOT +'/login/ajax-login/',
			data: { security_ls_key: LIVESTREET_SECURITY_KEY },
			dataType: 'json',
			success: function(result) {
				this.formLoader(form,true);
				form.find('.validate-login').removeClass('has-error').find('.help-block.show').removeClass('show').addClass('hidden');

				if (result.bStateError) {
					form.find('.validate-login').addClass('has-error').find('.help-block').removeClass('hidden').addClass('show').html(result.sMsg);
				} else {
					if (result.sMsg) {
						ls.msg.notice(null,result.sMsg);
					}
					if (result.sUrlRedirect) {
						window.location=result.sUrlRedirect;
					}
				}
			}.bind(this)
		};
		form.ajaxSubmit(options);
	}

	this.formLoader = function(form,bHide) {
		if (typeof(form)=='string') {
			form=$('#'+form);
		}
		form.find('input[type="text"], input[type="password"]').each(function(k,v){
			if (bHide) {
				$(v).removeClass('loader');
			} else {
				$(v).addClass('loader');
			}
		});
	};

	return this;
}).call(ls.anticipate || {},jQuery);
