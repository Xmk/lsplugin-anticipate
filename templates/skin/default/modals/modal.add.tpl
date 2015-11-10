<div class="modal modal-tw" id="tw_window">
	<header class="modal-header">
		<h3>{$aLang.plugin.anticipate.create_title}</h3>
		<a href="#" class="close jqmClose"></a>
	</header>

	<form class="modal-content" id="tw_form">
		<div class="tw-input-form">
			<label for="tw_title">{$aLang.plugin.anticipate.form_title}</label>
			<input class="input-text input-width-full" type="text" name="title" id="tw_title" value="">
		</div>

		<div class="tw-input-form">
			<label for="tw_text">{$aLang.plugin.anticipate.form_text}</label>
			<textarea class="input-text input-width-full" name="text" id="tw_text" rows="4"></textarea>
		</div>

		<div class="tw-input-form tw-input-cols">
			<div class="tw-input-col">
				<label for="tw_date_start">{$aLang.plugin.anticipate.form_date_start}</label>
				<input class="input-text input-width-full date-picker" readonly="readonly" type="text" name="date_start" id="tw_date_start" value="">
			</div>
			<div class="tw-input-col">
				<label for="time_start_h">{$aLang.plugin.anticipate.form_time_start}</label>
				<select class="input-width-50" name="time_start_h">
				{section name=time_start_h start=0 loop=24 step=1}
					{$iH = $smarty.section.time_start_h.index}
					<option value="{if $iH < 10}0{/if}{$iH}">{if $iH < 10}0{/if}{$iH}</option>
				{/section}
				</select>
				<div class="tw-select-sep">:</div>
				<select class="input-width-50" name="time_start_m">
				{section name=time_start_m start=0 loop=60 step=10}
					{$iM = $smarty.section.time_start_m.index}
					<option value="{if $iM < 10}0{/if}{$iM}">{if $iM < 10}0{/if}{$iM}</option>
				{/section}
				</select>
			</div>
		</div>

		<div class="tw-input-form tw-input-cols">
			<div class="tw-input-col">
				<label for="tw_date_end">{$aLang.plugin.anticipate.form_date_end}</label>
				<input class="input-text input-width-full date-picker" readonly="readonly" type="text" name="date_end" id="tw_date_end" value="">
			</div>
			<div class="tw-input-col">
				<label for="time_end_h">{$aLang.plugin.anticipate.form_time_end}</label>
				<select class="input-width-50" name="time_end_h">
				{section name=time_end_h start=0 loop=24 step=1}
					{$iH = $smarty.section.time_end_h.index}
					<option value="{if $iH < 10}0{/if}{$iH}">{if $iH < 10}0{/if}{$iH}</option>
				{/section}
				</select>
				<div class="tw-select-sep">:</div>
				<select class="input-width-50" name="time_end_m">
				{section name=time_end_m start=00 loop=60 step=10}
					{$iM = $smarty.section.time_end_m.index}
					<option value="{if $iM < 10}0{/if}{$iM}">{if $iM < 10}0{/if}{$iM}</option>
				{/section}
				</select>
			</div>
		</div>

		<div class="tw-input-form">
			<label for="tw_include">{$aLang.plugin.anticipate.form_include}</label>
			<input class="input-text input-width-full" type="text" name="include" id="tw_include" value="">
			<small class="note">{$aLang.plugin.anticipate.form_include_note}</small>
		</div>

		<div class="tw-input-form">
			<label for="tw_exclude">{$aLang.plugin.anticipate.form_exclude}</label>
			<input class="input-text input-width-full" type="text" name="exclude" id="tw_exclude" value="">
			<small class="note">{$aLang.plugin.anticipate.form_exclude_note}</small>
		</div>

		<input type="hidden" id="tw_form_action" name="action" />
		<input type="hidden" id="tw_form_id" name="id" />

		<button type="button" onclick="ls.anticipate.admin.applyForm(); return false" class="button button-primary">{$aLang.plugin.anticipate.form_submit}</button>
	</form>
</div>