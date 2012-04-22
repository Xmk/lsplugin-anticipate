<!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="ru"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="ru"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="ru"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="ru"> <!--<![endif]-->

<head>
	{hook run='html_head_begin'}

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>{$sHtmlTitle}</title>

	<meta name="description" content="{$sHtmlDescription}">
	<meta name="keywords" content="{$sHtmlKeywords}">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	{$aHtmlHeadFiles.css}

	<link href="{cfg name='path.static.skin'}/images/favicon.ico?v1" rel="shortcut icon" />

	<script type="text/javascript">
		var DIR_WEB_ROOT 			= '{cfg name="path.root.web"}';
		var DIR_STATIC_SKIN 		= '{cfg name="path.static.skin"}';
		var DIR_ROOT_ENGINE_LIB 	= '{cfg name="path.root.engine_lib"}';
		var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
		var SESSION_ID				= '{$_sPhpSessionId}';

		var aRouter = new Array();
		{foreach from=$aRouter key=sPage item=sPath}
			aRouter['{$sPage}'] = '{$sPath}';
		{/foreach}
	</script>

	{$aHtmlHeadFiles.js}

	<script type="text/javascript">
		ls.lang.load({json var = $aLangJs});
	</script>

	{hook run='html_head_end'}
</head>

<body>
	{hook run='body_begin'}

	{if !$oUserCurrent}
		{include file="$sTemplatePathPlugin/window_login.tpl"}
	{/if}

	<div id="anticipate-top-shadow">
		<div id="anticipate-highlight">
			<div id="anticipate-container" class="clear_fix">
				<div id="anticipate-content">
					<header id="header">
						<hgroup class="site-info">
							<h1 class="site-name"><a href="{cfg name='path.root.web'}">{cfg name='view.name'}</a></h1>
							<h2 class="site-description">{cfg name='view.description'}</h2>
						</hgroup>
					</header>

					{if $sDate}
					<div id="anticipate-timer"></div>
					{/if}

					{if $iPercent}
					<div id="anticipate-progress-bar" class="clear_fix">
						<div id="anticipate-bar"></div>
						<div id="anticipate-piece"></div>
						<span id="anticipate-percent-text">{$iPercent}%</span>
						<div id="anticipate-overlay"></div>
					</div>
					{/if}
				</div>

				<div id="anticipate-textrow">
					<article class="anticipate-text">
						<div class="anticipate-quote">
							<div class="anticipate-quote-bottom">
								<h2>{$sTitle}</h2>
								{$sText}
							</div>
						</div>
					</article>
				</div>

				<footer id="anticipate-footer">
					<div class="fl-r">
						{hook run='copyright'}
					</div>
					{hook run='footer_end'}
				</footer>
			</div>
		</div>
	</div>

	{include file='toolbar.tpl'}

	<script type="text/javascript">
	{if $sDate}
		ls.anticipate.initTimer('{$sDate}');
	{/if}
	{if $iPercent}
		ls.anticipate.initProgressBar({$iPercent});
	{/if}
	</script>

	{hook run='body_end'}
</body>
</html>