{assign var="noSidebar" value=true}
{include file='header.tpl'}

<h2 class="page-header">{$aLang.anticipate_admin}</h2>

<form action="" method="POST">
	<input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" /> 

	{hook run='form_anticipate_begin'}

	{hook run='form_anticipate_end'}

	<button type="submit" name="submit_feedback" class="button button-primary">{$aLang.anticipate_form_submit}</button>
</form>

{include file='footer.tpl'}