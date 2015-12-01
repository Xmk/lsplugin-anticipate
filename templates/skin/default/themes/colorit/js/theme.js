/*---------------------------------------------------------------------------
* Colorit theme for LS Anticipate
* @Author: Chiffa
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

/**
 * Переопределяем функцию инициализации таймера
 */
ls.anticipate.initTimer = function(date) {
	var anticipateDay = new Date(date);
	$('.js-countdown').countdown({
		until: anticipateDay,
		layout: '<span class="timer"><strong>{dn}</strong> {dl}</span><span class="timer"><strong>{hn}</strong> {hl}</span><span class="timer"><strong>{mn}</strong> {ml}</span><span class="timer"><strong>{sn}</strong> {sl}</span>',
		onExpiry: ls.anticipate.refreshPage
	});
};

/**
 * Переопределяем функцию инициализации прогресс бара
 */
ls.anticipate.initTimer.initProgressBar = function(i) {

};

jQuery(document).ready(function($) {
	$('.tw-page').removeClass('^="tw-color-"')
		.addClass('tw-color-'+Math.floor((Math.random() * 4) + 1))	// выбираем рандомный цвет
		.addClass('tw-back-'+Math.floor((Math.random() * 3) + 1));	// выбираем рандомный фон
});
