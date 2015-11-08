<li id="tw_{$oTw->getId()}" class="tw-container {if $oTw->getActive()}active{/if}" data-percent="{$oTw->getPercent()}">
	<div class="tw-item">
		<div class="tw-percent">
			<span>{$oTw->getPercent()}%</span>
		</div>
		<div class="tw-actions">
			<a href="javascript:ls.anticipate.admin.showEditForm({$oTw->getId()})" title="{$aLang.plugin.anticipate.edit}" class="icon-edit"></a> 
			<a href="javascript:ls.anticipate.admin.deleteTw({$oTw->getId()})" title="{$aLang.plugin.anticipate.delete}" class="icon-remove"></a>
		</div>
		<div class="tw-title">{$oTw->getTitle()|escape:"html"}</div>
		<div class="tw-text">{$oTw->getText()|wordwrap:50:" ":true|escape:"html"}</div>
		<div class="tw-date">
			<span class="tw-date-start">{date_format date=$oTw->getDateStart() format="d.m.Y"}</span>
			<span class="tw-date-end">{date_format date=$oTw->getDateEnd() format="d.m.Y"}</span>
		</div>
		<div class="tw-page">
			<div class="tw-page-include">{$oTw->getInclude()}</div>
			<div class="tw-page-exclude">{$oTw->getExclude()}</div>
		</div>
	</div>
</li>