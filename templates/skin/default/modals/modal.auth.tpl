{if !$oUserCurrent}
<div class="modal fade" id="window_login" tabindex="-1" role="dialog" aria-labelledby="windowLogin">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="windowLogin">{$aLang.user_authorization}</h4>
			</div>
			<div class="modal-body">
				<script type="text/javascript">
					jQuery(function($){
						$('#login-form').bind('submit',function(){
							ls.anticipate.auth('login-form');
							return false;
						});
						$('#login-form-submit').attr('disabled',false);
					});
				</script>
				<form action="{router page='login'}" method="post" id="login-form">
					<div class="form-group validate-login">
						<label for="login">{$aLang.user_login}:</label>
						<input class="form-control" type="text" name="login" id="login">
					</div>
					<div class="form-group validate-login">
						<label for="password">{$aLang.user_password}:</label>
						<input class="form-control" type="password" name="password" id="password">
						<small class="help-block hidden validate-error-login"></small>
					</div>
					<div class="form-group">
						<div class="checkbox">
							<label><input type="checkbox" name="remember" class="input-checkbox" checked> {$aLang.user_login_remember}</label>
						</div>
					</div>

					<button name="submit_login" class="btn btn-primary" id="login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
				</form>
			</div>
		</div>
	</div>
</div>
{/if}