{assign var="noSidebar" value=true}
{include file='header.tpl'}

<h2 class="page-header">
	<a href="{router page='admin'}">{$aLang.admin_header}</a>
	<span>&raquo;</span> {$aLang.plugin.anticipate.admin_title}
</h2>

{include file="$sTemplatePathAnticipate/modals/modal.add.tpl"}

<div class="tw-help">
	<h4>{$aLang.plugin.anticipate.help_block_title}</h4>
	<ul>
		<li>{$aLang.plugin.anticipate.help_block_router_title}:
			<ul>
				{foreach $aLang.plugin.anticipate.help_block_router as $sTtl => $sTxt}
					<li><div class="highlight"><code><span class="pln">{$sTtl}</span></code> {$sTxt}</div></li>
				{/foreach}
			</ul>
		</li>
		<li>{$aLang.plugin.anticipate.help_block_delimiter_title}
			<ul class="inline">
				{foreach $aLang.plugin.anticipate.help_block_delimiter as $sTtl => $sTxt}
					<li><div class="highlight"><code><span class="pln">{$sTtl}</span></code> {$sTxt}</div></li>
				{/foreach}
			</ul>
		</li>
	</ul>
</div>

<a href="javascript:ls.anticipate.admin.showAddForm()" class="link-dotted" id="tw_form_show">{$aLang.plugin.anticipate.create_title}</a>

<div class="tw-container">
	<ul class="tw-list" id="tw_list">
	{if $aTw}
		{foreach from=$aTw item=oTw}
			{include file="$sTemplatePathAnticipate/actions/ActionAnticipate/admin_item.tpl"}
		{/foreach}
	{/if}
	</ul>
</div>

{include file='footer.tpl'}