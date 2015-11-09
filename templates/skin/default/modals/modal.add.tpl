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
				<label for="tw_date_end">{$aLang.plugin.anticipate.form_date_end}</label>
				<input class="input-text input-width-full date-picker" readonly="readonly" type="text" name="date_end" id="tw_date_end" value="">
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