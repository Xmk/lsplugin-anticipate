<li id="tw_{$oTw->getId()}" class="tw-container {if $oTw->getActive()}active{/if}" data-include="{$oTw->getInclude()}" data-exclude="{$oTw->getExclude()}" data-date-start="{date_format date=$oTw->getDateStart() format='d.m.Y'}" data-time-start="{date_format date=$oTw->getDateStart() format='H:i'}" data-date-end="{date_format date=$oTw->getDateEnd() format='d.m.Y'}" data-time-end="{date_format date=$oTw->getDateEnd() format='H:i'}">
	<div class="tw-item">
		<div class="tw-right">
			<div class="tw-percent">
				<span>{$oTw->getPercent()}%</span>
			</div>
			<div class="tw-actions">
				<a href="javascript:ls.anticipate.admin.showEditForm({$oTw->getId()})" title="{$aLang.plugin.anticipate.edit}" class="icon-edit"></a> 
				<a href="javascript:ls.anticipate.admin.deleteTw({$oTw->getId()})" title="{$aLang.plugin.anticipate.delete}" class="icon-remove"></a>
			</div>
		</div>
		<div class="tw-title">{$oTw->getTitle()|escape:"html"}</div>
		<div class="tw-text">{$oTw->getText()|wordwrap:50:" ":true|escape:"html"}</div>
		<div class="tw-date">
			<div><strong>{$aLang.plugin.anticipate.date_start}</strong>: <span class="tw-date-start">{date_format date=$oTw->getDateStart() format="j F Y, H:i"}</span></div>
			<div><strong>{$aLang.plugin.anticipate.date_end}</strong>: <span class="tw-date-end">{date_format date=$oTw->getDateEnd() format="j F Y, H:i"}</span></div>
		</div>
		<div class="tw-page">
			{if $oTw->getInclude()}
			<div>
				<strong>{$aLang.plugin.anticipate.include}</strong>:
				{foreach $oTw->getIncludeArray() as $aIncludePage}
					{if $aIncludePage.url}
						<a class="tw-page-include" href="{$aIncludePage.url}">{$aIncludePage.title}</a>
					{else}
						<span class="tw-page-include">{$aIncludePage.title}</span>
					{/if}
				{/foreach}
			</div>
			{/if}
			{if $oTw->getExclude()}
			<div>
				<strong>{$aLang.plugin.anticipate.exclude}</strong>:
				{foreach $oTw->getExcludeArray() as $aExcludePage}
					{if $aExcludePage.url}
						<a class="tw-page-include" href="{$aExcludePage.url}">{$aExcludePage.title}</a>
					{else}
						<span class="tw-page-include">{$aExcludePage.title}</span>
					{/if}
				{/foreach}
			</div>
			{/if}
		</div>
	</div>
</li>