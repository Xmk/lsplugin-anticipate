{**
 * Тема "colorit"
 * Автор: Chiffa
 *
 * Шаблон принимает переменную $oTw, которая имеет следующие данные
 *		getTitle()			- заголовок страницы
 *		getText()			- текст
 *		getIncludeArray()	- массив, содержащий список страниц для закрытия (getInclude() - возвращает этот список в виде строки)
 *		getExcludeArray()	- массив, содержащий список исключений (getExclude() - возвращает этот список в виде строки)
 *		getDateStart()		- дата начала тех.работ
 *		getDateEnd()		- дата окончания тех.работ
 *		getPercent()		- текущий процент (расчитывается относительно текущей даты между датой начали и датой окончания)
 *		getActive()			- определяет активность, если false эта страница не используется))
 *}


<div class="tw-page">
	<div class="container">
		<div class="tw-back">
			<div class="jumbotron shadow-box">
				<h1><a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a></h1>
				<p>{cfg name='view.description'}</p>

				{if $oTw->getDateEnd()}
					<p class="tw-timer js-countdown"></p>
				{/if}

				{if $oTw->getPercent()}
				<div class="tw-progress">
					<div class="progress shadow-box">
						{if $oTw->getPercent() < 25}
							{$sProgressClass = 'danger'}
						{elseif $oTw->getPercent() < 50}
							{$sProgressClass = 'warning'}
						{elseif $oTw->getPercent() < 75}
							{$sProgressClass = 'info'}
						{else}
							{$sProgressClass = 'success'}
						{/if}
						<div class="progress-bar progress-bar-{$sProgressClass} progress-bar-striped active" role="progressbar" aria-valuenow="{$oTw->getPercent()}" aria-valuemin="0" aria-valuemax="100" style="width: {$oTw->getPercent()}%">
							{$oTw->getPercent()}%
						</div>
					</div>
				</div>
				{/if}

				{if $oTw->getTitle() || $oTw->getText()}
				<div class="tw-text shadow-box">
					<div class="well">
						{if $oTw->getTitle()}
							<h2>{$oTw->getTitle()}</h2>
						{/if}
						{if $oTw->getText()}
							<p>{$oTw->getText()}</p>
						{/if}
					</div>
				</div>
				{/if}
			</div>
		</div>

		<div class="tw-footer">
			<div class="col-sm-6">
				{hook run='copyright'}
			</div>
			<div class="col-sm-6 text-right">
				{if $oUserCurrent}
					<span class="text-muted">{$oUserCurrent->getLogin()}</span>
				{else}
					<a href="#window_login" data-toggle="modal" data-target="#window_login">{$aLang.user_authorization}</a>
				{/if}
			</div>
		</div>
	</div>
</div>