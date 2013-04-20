<?php if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('trade_displayorder');?><?php include template('common/header'); if(empty($_GET['infloat'])) { ?>
<div id="pt" class="bm cl">
<div class="z"><a href="./" class="nvhm" title="首页"><?php echo $_G['setting']['bbname'];?></a> <em>&rsaquo;</em> <?php echo $navigation;?></div>
</div>
<div id="ct" class="wp cl">
<div class="mn">
<div class="bm bw0">
<?php } ?>

<script type="text/javascript" reload="1">
var max_obj = <?php echo $_G['group']['tradestick'];?>;
var p = <?php echo $stickcount;?>;
function checkbox(obj) {
if(obj.checked) {
p++;
for (var i = 0; i < $('tradeform').elements.length; i++) {
var e = tradeform.elements[i];
if(p == max_obj) {
if(e.name.match('stick') && !e.checked) {
e.disabled = true;
}
}
}
} else {
p--;
for (var i = 0; i < $('tradeform').elements.length; i++) {
var e = tradeform.elements[i];
if(e.name.match('stick') && e.disabled) {
e.disabled = false;
}
}
}
}
</script>

<form id="tradeform" method="post" autocomplete="off" action="forum.php?mod=misc&amp;action=tradeorder&amp;tid=<?php echo $_G['tid'];?>&amp;tradesubmit=yes&amp;infloat=yes<?php if(!empty($_GET['from'])) { ?>&amp;from=<?php echo $_GET['from'];?><?php } ?>"<?php if(!empty($_GET['infloat'])) { ?> onsubmit="ajaxpost('tradeform', 'return_<?php echo $_GET['handlekey'];?>', 'return_<?php echo $_GET['handlekey'];?>', 'onerror');return false;"<?php } ?>>
<div class="f_c">
<h3 class="flb">
<em id="return_<?php echo $_GET['handlekey'];?>">柜台商品管理</em>
<span>
<?php if(!empty($_GET['infloat'])) { ?><a href="javascript:;" class="flbc" onclick="hideWindow('<?php echo $_GET['handlekey'];?>')" title="关闭">关闭</a><?php } ?>
</span>
</h3>
<input type="hidden" name="formhash" value="<?php echo FORMHASH;?>" />
<?php if(!empty($_GET['infloat'])) { ?><input type="hidden" name="handlekey" value="<?php echo $_GET['handlekey'];?>" /><?php } ?>
<div class="c">
<table class="list" cellspacing="0" cellpadding="0" style="width: 700px">
<thead class="th">
<tr>
<td>显示顺序</td>
<td style="width: 30px;">推荐</td>
<th>商品名称</th>
<td>商品价格</td>
<td style="width: 80px;">剩余时间</td>
<td style="width: 40px;"></td>
</tr>
</thead><?php if(is_array($trades)) foreach($trades as $trade) { ?><tr>
<td><input size="1" name="displayorder[<?php echo $trade['pid'];?>]" value="<?php echo $trade['displayorderview'];?>" class="px pxs" /></td>
<td><input class="pc" type="checkbox" onclick="checkbox(this)" name="stick[<?php echo $trade['pid'];?>]" value="yes" <?php if($trade['displayorder'] > 0) { ?>checked="checked"<?php } elseif($_G['group']['tradestick'] <= $stickcount) { ?>disabled="disabled"<?php } ?> /></td>
<th><?php echo $trade['subject'];?></th>
<td>
<?php if($trade['price'] > 0) { ?>
<?php echo $trade['price'];?> 元
<?php } if($trade['credit'] > 0) { ?>
<?php echo $_G['setting']['extcredits'][$_G['setting']['creditstransextra']['5']]['title'];?> <?php echo $trade['credit'];?> <?php echo $_G['setting']['extcredits'][$_G['setting']['creditstransextra']['5']]['unit'];?>
<?php } ?>
</td>
<td>
<?php if($trade['closed']) { ?>
成交结束
<?php } elseif($trade['expiration'] > 0) { ?>
<?php echo $trade['expiration'];?>天<?php echo $trade['expirationhour'];?>小时
<?php } elseif($trade['expiration'] == -1) { ?>
成交结束
<?php } ?>
</td>
<td><a href="forum.php?mod=post&amp;action=edit&amp;fid=<?php echo $thread['fid'];?>&amp;tid=<?php echo $_G['tid'];?>&amp;pid=<?php echo $trade['pid'];?>" target="_blank">编辑</a></td>
</tr>
<?php } ?>
</table>
</div>
</div>
<?php if(empty($_GET['infloat'])) { ?><div class="m_c"><?php } ?>
<div class="o pns">
<span class="z">您最多可推荐的商品数: <?php echo $_G['group']['tradestick'];?></span>
<button tabindex="1" class="pn pnc" type="submit" name="tradesubmit" value="true"><span>保存</span></button>
</div>
<?php if(empty($_GET['infloat'])) { ?></div><?php } ?>
</form>

<script type="text/javascript" reload="1">
function succeedhandle_<?php echo $_GET['handlekey'];?>(locationhref) {
location.href = locationhref;
}
</script>

<?php if(empty($_GET['infloat'])) { ?>
</div>
</div>
</div>
<?php } include template('common/footer'); ?>