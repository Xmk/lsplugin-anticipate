{assign var="noSidebar" value=true}
{include file='header.tpl'}

<h2 class="page-header">
	<a href="{router page='admin'}">{$aLang.admin_header}</a>
	<span>&raquo;</span> {$aLang.plugin.anticipate.admin_title}
</h2>

<div class="modal modal-tw" id="tw-window">
	<header class="modal-header">
		<h3>{$aLang.plugin.anticipate.create_title}</h3>
		<a href="#" class="close jqmClose"></a>
	</header>

	<form class="modal-content" id="tw-form">
		<p><label for="tw_title">{$aLang.plugin.anticipate.form_title}</label>
		<input class="input-text input-width-full" type="text" name="title" id="tw_title" value="">
		</p>

		<label for="tw_text">{$aLang.plugin.anticipate.form_text}</label>
		<textarea class="input-text input-width-full" name="text" id="tw_text" rows="4"></textarea>
		<br>

		<p><label for="tw_include">{$aLang.plugin.anticipate.form_include}</label>
		<input class="input-text input-width-full" type="text" name="include" id="tw_include" value="">
		<small class="note">{$aLang.plugin.anticipate.form_include_note}</small>
		</p>

		<p><label for="tw_exclude">{$aLang.plugin.anticipate.form_exclude}</label>
		<input class="input-text input-width-full" type="text" name="exclude" id="tw_exclude" value="">
		<small class="note">{$aLang.plugin.anticipate.form_exclude_note}</small>
		</p>

		<p><label for="tw_date_start">{$aLang.plugin.anticipate.form_date_start}</label>
		<input class="input-text input-width-200 date-picker" readonly="readonly" type="text" name="date_start" id="tw_date_start" value="">
		</p>

		<p><label for="tw_date_end">{$aLang.plugin.anticipate.form_date_end}</label>
		<input class="input-text input-width-200 date-picker" readonly="readonly" type="text" name="date_end" id="tw_date_end" value="">
		</p>

		<input type="hidden" id="tw_form_action" name="action" />
		<input type="hidden" id="tw_form_id" name="id" />

		<button type="button" onclick="ls.anticipate.admin.applyForm(); return false" class="button button-primary">{$aLang.plugin.anticipate.form_submit}</button>
	</form>
</div>

<a href="javascript:ls.anticipate.admin.showAddForm()" class="link-dotted" id="tw_form_show">{$aLang.plugin.anticipate.create_title}</a>

<div class="tw_container">
	<ul class="tw_list" id="tw-list">
	{if $aTw}
		{foreach from=$aTw item=oTw}
			{include file="$sTemplatePathAnticipate/actions/ActionAnticipate/admin_item.tpl"}
		{/foreach}
	{/if}
	</ul>
</div>

{include file='footer.tpl'}