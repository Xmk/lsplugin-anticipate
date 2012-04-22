{if !$oUserCurrent}
	<div class="modal modal-login" id="window_login_form">
		<header class="modal-header">
			<h3>{$aLang.user_authorization}</h3>
			<a href="#" class="close jqmClose"></a>
		</header>

		<script type="text/javascript">
			jQuery(function($){
				$('#popup-login-form').bind('submit',function(){
					ls.user.login('popup-login-form');
					return false;
				});
				$('#popup-login-form-submit').attr('disabled',false);
			});
		</script>

		<div class="modal-content">
			<form action="{router page='login'}" method="post" id="popup-login-form">
				{hook run='form_login_popup_begin'}

				<p><label for="popup-login">{$aLang.user_login}:</label>
				<input type="text" name="login" id="popup-login" class="input-text input-width-300"></p>

				<p><label for="popup-password">{$aLang.user_password}:</label>
				<input type="password" name="password" id="popup-password" class="input-text input-width-300">
				<small class="validate-error-hide validate-error-login"></small></p>

				<p><label><input type="checkbox" name="remember" class="input-checkbox" checked> {$aLang.user_login_remember}</label></p>

				{hook run='form_login_popup_end'}

				<button name="submit_login" class="button button-primary" id="popup-login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
			</form>
		</div>
	</div>
{/if}