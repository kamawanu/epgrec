{include file='header.tpl'}

<div class="container">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form method="post" action="{$this_class->getCurrentUri()}">
			<fieldset>
				<legend>EpgRec ログイン画面</legend>
				<div class="form-group">
					<label for="login_name" class="control-label">ログイン名 :</label>
					<input type="text" name="login_name" id="login_name" value="" maxlength="32" class="form-control" />
				</div>
				<div class="form-group">
					<label for="passwd" class="control-label">パスワード :</label>
					<input type="password" name="passwd" id="passwd" value="" maxlength="16" class="form-control" />
				</div>
				<input type="submit" name="btn_action" value="ログイン" class="btn btn-primary" />
			</fieldset>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
{if $error_msg|@count > 0}
	<div class="attentionMessage">
		<ul>
{foreach from=$error_msg item=value}
			<li>{$value}</li>
{/foreach}
		</ul>
	</div>
</div>

{include file='INISet.tpl'}
{include file='footer.tpl'}
