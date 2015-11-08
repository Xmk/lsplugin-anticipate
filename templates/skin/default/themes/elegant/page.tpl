<div id="anticipate-top-shadow">
	<div id="anticipate-highlight">
		<div id="anticipate-container" class="clear_fix">
			<div id="anticipate-content">
				<header id="anticipate-header">
					<hgroup class="site-info">
						<h1 class="site-name"><a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a></h1>
						<h2 class="site-description">{cfg name='view.description'}</h2>
					</hgroup>
				</header>

				{if $oTw->getDateEnd()}
					<div id="anticipate-timer"></div>
				{/if}

				{if $oTw->getPercent()}
				<div id="anticipate-progress-bar" class="clear_fix">
					<div id="anticipate-bar"></div>
					<div id="anticipate-piece"></div>
					<span id="anticipate-percent-text">{$oTw->getPercent()}%</span>
					<div id="anticipate-overlay"></div>
				</div>
				{/if}
			</div>

			<div id="anticipate-textrow">
				<article class="anticipate-text">
					<div class="anticipate-quote">
						<div class="anticipate-quote-bottom">
							<h2>{$oTw->getTitle()}</h2>
							{if $oTw->getText()}
								<p>{$oTw->getText()}</p>
							{/if}
						</div>
					</div>
				</article>
			</div>

			<footer id="anticipate-footer">
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
			</footer>
		</div>
	</div>
</div>