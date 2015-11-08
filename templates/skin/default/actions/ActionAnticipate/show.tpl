{$sTheme = $oConfig->Get('plugin.anticipate.theme')}
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

	<link rel="stylesheet" type="text/css" href="{$sTemplatePathAnticipateWeb}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="{$sTemplatePathAnticipateWeb}/themes/{$sTheme}/css/style.css">
	<link href="{cfg name='path.static.skin'}/images/favicon.ico?v1" rel="shortcut icon" />

	<script type="text/javascript">
		var DIR_WEB_ROOT 			= '{cfg name="path.root.web"}';
		var DIR_STATIC_SKIN 		= '{cfg name="path.static.skin"}';
		var DIR_ROOT_ENGINE_LIB 	= '{cfg name="path.root.engine_lib"}';
		var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
		var SESSION_ID				= '{$_sPhpSessionId}';
	</script>

	<!--[if lt IE 7]> <script type="text/javascript" src="{cfg name='path.root.engine_lib'}/external/html5shiv.js"></script> <![endif]-->
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/jquery.js"></script>
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/jquery.browser.js"></script>
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/jquery.form.js"></script>
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="{$sTemplatePathAnticipateWeb}/js/ls.anticipate.js"></script>
</head>

<body>
	{if !$oUserCurrent}
		{include file="$sTemplatePathAnticipate/modals/modal.auth.tpl"}
	{/if}

	{include file="$sTemplatePathAnticipate/themes/$sTheme/page.tpl"}


	<script type="text/javascript">
	{if $oTw->getDateEnd()}
		ls.anticipate.initTimer('{date_format date=$oTw->getDateEnd() format="Y-m-d"}');
	{/if}
	{if $oTw->getPercent()}
		ls.anticipate.initProgressBar({$oTw->getPercent()});
	{/if}
	</script>

</body>
</html>