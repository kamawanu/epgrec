{include file='header.tpl'}

<div class="container">
<h2>{$sitetitle}</h2>
<a href="{$home_url}index">番組表に戻る</a>
</div>

<div class="container">
絞り込み：
<form method="post" action="{$this_class->getCurrentUri()}">
<input type="hidden" name="do_search" value="1" />
検索語句<input type="text" size="20" name="search" value="{$search}" />
局<select name="station">
  {foreach from=$stations item=st}
    <option value="{$st.id}" {$st.selected}>{$st.name}</option>
  {/foreach}
  </select>
カテゴリ<select name="category_id">
  {foreach from=$cats item=cat}
  <option value="{$cat.id}" {$cat.selected}>{$cat.name}</option>
  {/foreach}
</select>
<input type="submit" value="絞り込む" />
</form>
</div>

<div class="container">
<p>タイトルや内容をクリックすると視聴できます（ブラウザの設定でASFとVLCを関連付けている必要があります）</p>
{if count($records)}
<table id="reservation_table" class="table">
<thead>
 <tr>
  <th>録画日時</th>
  <th>ch</th>
  <th>モード</th>
  {if $use_thumbs == 1}<th>サムネール</th>{/if}
  <th>タイトル</th>
  <th>内容</th>
  <th>ファイルサイズ</th>
  <th>変更</th>
  <th>削除</th>
 </tr>
</thead>
<tbody>
{foreach from=$records item=rec}
 <tr id="resid_{$rec.id}" class="ctg_{$rec.cat}">
  <td>{$rec.starttime}</td>
  <td>{$rec.station_name}</td>
  <td>{$rec.mode}</td>
  {if $use_thumbs == 1}<td><a href="{$rec.asf}">{$rec.thumb}</a></td>{/if}
  <td><a href="{$rec.asf}" id="tid_{$rec.id}">{$rec.title}</a></td>
  <td><a href="{$rec.asf}" id="did_{$rec.id}">{$rec.description}</a></td>
  <td>{$rec.fsize}</td>
  <td><input type="button" value="変更" onClick="javascript:PRG.editdialog('{$rec.id}')" /></td>
  <td><input type="button" value="削除" onClick="javascript:PRG.dialog('{$rec.id}','{$rec.title|escape}')" /></td>
 </tr>
{/foreach}
<tbody>
</table>
{else}
<p>現在、録画済データはありません</p>
{/if}
</div>

{include file='INISet.tpl'}
<script type="text/javascript" src="{$home_url}js/recorded.js"></script>
{include file='footer.tpl'}