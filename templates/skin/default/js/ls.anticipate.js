/*---------------------------------------------------------------------------
* @Module Name: Anticipate
* @Description: Anticipate plugin for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 0.5.1+
* @File Name: anticipate.js
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

var ls=ls || {}

ls.anticipate = (function ($) {
	this.initTimer = function(date) {
		//var anticipateDay = new Date();
		var anticipateDay = new Date(date);
		$('#anticipate-timer').countdown({
			until: anticipateDay,
			layout: '<span class="timer"><strong>{dn}</strong> {dl}</span><span class="timer"><strong>{hn}</strong> {hl}</span><span class="timer"><strong>{mn}</strong> {ml}</span><span class="timer"><strong>{sn}</strong> {sl}</span>'
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

	return this;
}).call(ls.anticipate || {},jQuery);

jQuery(document).ready(function($){
	$('#window_login_form').jqm();

	$('#js-toolbar-login').click(function(){
		$('#window_login_form').jqmShow();
	});
});