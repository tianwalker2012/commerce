<?php if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('modcp');
0
|| checktplrefresh('./template/default/forum/modcp.htm', './template/default/common/footer.htm', 1363925611, '1', './data/template/1_1_forum_modcp.tpl.php', './template/default', 'forum/modcp')
;?><?php include template('common/header'); ?><div id="pt" class="bm cl">
<div class="z"><a href="./" class="nvhm" title="首页"><?php echo $_G['setting']['bbname'];?></a> <em>&rsaquo;</em>
<a href="<?php echo $_G['setting']['navs']['2']['filename'];?>"><?php echo $_G['setting']['navs']['2']['navname'];?></a> <em>&rsaquo;</em>
<a href="forum.php?mod=modcp"><?php echo $_G['setting']['navs']['2']['navname'];?>管理</a>
</div>
</div>
<div id="ct" class="ct2_a wp cl">
<div class="mn">
<?php if($script == 'noperm') { ?>
<div class="bm bw0">
<h1 class="mt">系统错误</h1>
<p>抱歉，您无此权限</p>
<p class="notice">论坛管理员在“管理面板”中权限和超级版主基本相同，如果需要更多功能，请进入 <a href="admin.php?mod=forum" target="_blank"><u>管理中心</u></a> </p>
</div>
<?php } elseif(!empty($modtpl)) { ?><?php include(template($modtpl));?><?php } ?>
</div>
<div class="appl">
<div class="tbn">
<h2 class="mt bbda"><?php echo $_G['setting']['navs']['2']['navname'];?>管理</h2>
<ul>
<li<?php if($_GET['action'] == 'home') { ?> class="a cl"<?php } else { ?> class="cl"<?php } ?>><span class="y mtn"><?php echo $notenum;?></span><a href="<?php echo $cpscript;?>?mod=modcp&action=home<?php echo $forcefid;?>">内部留言</a></li>
<?php if($modforums['fids']) { if($_G['group']['allowmodpost'] || $_G['group']['allowmoduser']) { ?>
<li<?php if($_GET['action'] == 'moderate') { ?> class="a cl"<?php } else { ?> class="cl"<?php } ?>><span class="y mtn"><?php echo $modnum;?></span><a href="<?php echo $cpscript;?>?mod=modcp&action=moderate&op=<?php if($_G['group']['allowmodpost']) { ?>threads<?php echo $forcefid;?><?php } else { ?>members<?php } ?>">审核</a></li>
<?php } } if(!empty($_G['setting']['plugins']['modcp_base'])) { if(is_array($_G['setting']['plugins']['modcp_base'])) foreach($_G['setting']['plugins']['modcp_base'] as $id => $module) { ?><li<?php if($_GET['id'] == $id) { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=plugin&op=base&id=<?php echo $id;?><?php echo $forcefid;?>"><?php echo $module['name'];?></a></li>
<?php } } if($_G['group']['allowedituser'] || $_G['group']['allowbanuser'] || $_G['group']['allowbanvisituser'] || $_G['group']['allowbanip']) { if($_G['group']['allowbanuser'] || $_G['group']['allowbanvisituser']) { ?><li<?php if($_GET['action'] == 'member' && $op == 'ban') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=member&op=ban<?php echo $forcefid;?>">禁止用户</a></li><?php } if($_G['group']['allowbanip']) { ?><li<?php if($_GET['action'] == 'member' && $op == 'ipban') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=member&op=ipban<?php echo $forcefid;?>">禁止 IP</a></li><?php } if($modforums['fids']) { ?><li<?php if($_GET['action'] == 'forumaccess') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=forumaccess<?php echo $forcefid;?>">用户权限</a></li><?php } if($_G['group']['allowedituser']) { ?><li<?php if($_GET['action'] == 'member' && $op == 'edit') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=member&op=edit<?php echo $forcefid;?>">编辑用户</a></li><?php } } if($modforums['fids']) { ?>
<li<?php if($_GET['action'] == 'thread' || $_GET['action'] == 'recyclebin') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=thread&op=thread<?php echo $forcefid;?>">主题管理</a></li>
<?php if($_G['group']['allowrecommendthread']) { ?><li<?php if($_GET['action'] == 'forum' && $op == 'recommend') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=forum&op=recommend&show=all<?php echo $forcefid;?>">推荐主题</a></li><?php } if($_G['group']['alloweditforum']) { ?><li<?php if($_GET['action'] == 'forum' && $op == 'editforum') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=forum&op=editforum<?php echo $forcefid;?>">版块编辑</a></li><?php } } if($_G['group']['allowpostannounce'] || $_G['group']['allowviewlog']) { if($_G['group']['allowpostannounce']) { ?><li<?php if($_GET['action'] == 'announcement') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=announcement<?php echo $forcefid;?>">公告</a></li><?php } if($_G['group']['allowviewlog']) { ?><li<?php if($_GET['action'] == 'log') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=log<?php echo $forcefid;?>">管理日志</a></li><?php } } if(!empty($_G['setting']['plugins']['modcp_tools'])) { if(is_array($_G['setting']['plugins']['modcp_tools'])) foreach($_G['setting']['plugins']['modcp_tools'] as $id => $module) { ?><li<?php if($_GET['id'] == $id) { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=plugin&op=tools&id=<?php echo $id;?>"><?php echo $module['name'];?></a></li>
<?php } } ?>
<li<?php if($_GET['action'] == 'report') { ?> class="a"<?php } ?>><a href="<?php echo $cpscript;?>?mod=modcp&action=report<?php echo $forcefid;?>">管理举报</a></li>
<li><a href="<?php if($forcefid) { ?>forum.php?mod=forumdisplay<?php echo $forcefid;?><?php } else { ?>forum.php<?php } ?>">返回论坛</a></li>
<li><a href="<?php echo $cpscript;?>?mod=modcp&action=logout">退出</a></li>
</ul>
</div>
</div>
</div>	</div>
<?php if(empty($topic) || ($topic['usefooter'])) { ?><?php $focusid = getfocus_rand($_G[basescript]);?><?php if($focusid !== null) { ?><?php $focus = $_G['cache']['focus']['data'][$focusid];?><?php $focusnum = count($_G['setting']['focus'][$_G[basescript]]);?><div class="focus" id="sitefocus">
<div class="bm">
<div class="bm_h cl">
<a href="javascript:;" onclick="setcookie('nofocus_<?php echo $_G['basescript'];?>', 1, <?php echo $_G['cache']['focus']['cookie'];?>*3600);$('sitefocus').style.display='none'" class="y" title="关闭">关闭</a>
<h2>
<?php if($_G['cache']['focus']['title']) { ?><?php echo $_G['cache']['focus']['title'];?><?php } else { ?>站长推荐<?php } ?>
<span id="focus_ctrl" class="fctrl"><img src="<?php echo IMGDIR;?>/pic_nv_prev.gif" alt="上一条" title="上一条" id="focusprev" class="cur1" onclick="showfocus('prev');" /> <em><span id="focuscur"></span>/<?php echo $focusnum;?></em> <img src="<?php echo IMGDIR;?>/pic_nv_next.gif" alt="下一条" title="下一条" id="focusnext" class="cur1" onclick="showfocus('next')" /></span>
</h2>
</div>
<div class="bm_c" id="focus_con">
</div>
</div>
</div><?php $focusi = 0;?><?php if(is_array($_G['setting']['focus'][$_G['basescript']])) foreach($_G['setting']['focus'][$_G['basescript']] as $id) { ?><div class="bm_c" style="display: none" id="focus_<?php echo $focusi;?>">
<dl class="xld cl bbda">
<dt><a href="<?php echo $_G['cache']['focus']['data'][$id]['url'];?>" class="xi2" target="_blank"><?php echo $_G['cache']['focus']['data'][$id]['subject'];?></a></dt>
<?php if($_G['cache']['focus']['data'][$id]['image']) { ?>
<dd class="m"><a href="<?php echo $_G['cache']['focus']['data'][$id]['url'];?>" target="_blank"><img src="<?php echo $_G['cache']['focus']['data'][$id]['image'];?>" alt="<?php echo $_G['cache']['focus']['data'][$id]['subject'];?>" /></a></dd>
<?php } ?>
<dd><?php echo $_G['cache']['focus']['data'][$id]['summary'];?></dd>
</dl>
<p class="ptn cl"><a href="<?php echo $_G['cache']['focus']['data'][$id]['url'];?>" class="xi2 y" target="_blank">查看 &raquo;</a></p>
</div><?php $focusi ++;?><?php } ?>
<script type="text/javascript">
var focusnum = <?php echo $focusnum;?>;
if(focusnum < 2) {
$('focus_ctrl').style.display = 'none';
}
if(!$('focuscur').innerHTML) {
var randomnum = parseInt(Math.round(Math.random() * focusnum));
$('focuscur').innerHTML = Math.max(1, randomnum);
}
showfocus();
var focusautoshow = window.setInterval('showfocus(\'next\', 1);', 5000);
</script>
<?php } if($_G['uid'] && $_G['member']['allowadmincp'] == 1 && $_G['setting']['showpatchnotice'] == 1) { ?>
<div class="focus patch" id="patch_notice"></div>
<?php } ?><?php echo adshow("footerbanner/wp a_f/1");?><?php echo adshow("footerbanner/wp a_f/2");?><?php echo adshow("footerbanner/wp a_f/3");?><?php echo adshow("float/a_fl/1");?><?php echo adshow("float/a_fr/2");?><?php echo adshow("couplebanner/a_fl a_cb/1");?><?php echo adshow("couplebanner/a_fr a_cb/2");?><?php echo adshow("cornerbanner/a_cn");?><?php if(!empty($_G['setting']['pluginhooks']['global_footer'])) echo $_G['setting']['pluginhooks']['global_footer'];?>
<div id="ft" class="wp cl">
<div id="flk" class="y">
<p>
<?php if($_G['setting']['site_qq']) { ?><a href="http://wpa.qq.com/msgrd?V=3&amp;Uin=<?php echo $_G['setting']['site_qq'];?>&amp;Site=<?php echo $_G['setting']['bbname'];?>&amp;Menu=yes&amp;from=discuz" target="_blank" title="QQ"><img src="<?php echo IMGDIR;?>/site_qq.jpg" alt="QQ" /></a><span class="pipe">|</span><?php } if(is_array($_G['setting']['footernavs'])) foreach($_G['setting']['footernavs'] as $nav) { if($nav['available'] && ($nav['type'] && (!$nav['level'] || ($nav['level'] == 1 && $_G['uid']) || ($nav['level'] == 2 && $_G['adminid'] > 0) || ($nav['level'] == 3 && $_G['adminid'] == 1)) ||
!$nav['type'] && ($nav['id'] == 'stat' && $_G['group']['allowstatdata'] || $nav['id'] == 'report' && $_G['uid'] || $nav['id'] == 'archiver' || $nav['id'] == 'mobile'))) { ?><?php echo $nav['code'];?><span class="pipe">|</span><?php } } ?>
<strong><a href="<?php echo $_G['setting']['siteurl'];?>" target="_blank"><?php echo $_G['setting']['sitename'];?></a></strong>
<?php if($_G['setting']['icp']) { ?>( <a href="http://www.miitbeian.gov.cn/" target="_blank"><?php echo $_G['setting']['icp'];?></a> )<?php } ?>
<?php if(!empty($_G['setting']['pluginhooks']['global_footerlink'])) echo $_G['setting']['pluginhooks']['global_footerlink'];?>
<?php if($_G['setting']['statcode']) { ?><?php echo $_G['setting']['statcode'];?><?php } ?>
</p>
<p class="xs0">
GMT<?php echo $_G['timenow']['offset'];?>, <?php echo $_G['timenow']['time'];?>
<span id="debuginfo">
<?php if(debuginfo()) { ?>, Processed in <?php echo $_G['debuginfo']['time'];?> second(s), <?php echo $_G['debuginfo']['queries'];?> queries
<?php if($_G['gzipcompress']) { ?>, Gzip On<?php } if(C::memory()->type) { ?>, <?php echo ucwords(C::memory()->type); ?> On<?php } ?>.
<?php } ?>
</span>
</p>
</div>
<div id="frt">
<p>Powered by <strong><a href="http://www.discuz.net" target="_blank">Discuz!</a></strong> <em><?php echo $_G['setting']['version'];?></em><?php if(!empty($_G['setting']['boardlicensed'])) { ?> <a href="http://license.comsenz.com/?pid=1&amp;host=<?php echo $_SERVER['HTTP_HOST'];?>" target="_blank">Licensed</a><?php } ?></p>
<p class="xs0">&copy; 2001-2012 <a href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a></p>
</div><?php updatesession();?><?php if($_G['uid'] && $_G['group']['allowinvisible']) { ?>
<script type="text/javascript">
var invisiblestatus = '<?php if($_G['session']['invisible']) { ?>隐身<?php } else { ?>在线<?php } ?>';
var loginstatusobj = $('loginstatusid');
if(loginstatusobj != undefined && loginstatusobj != null) loginstatusobj.innerHTML = invisiblestatus;
</script>
<?php } ?>
</div>

<?php if($upgradecredit !== false) { ?>
<div id="g_upmine_menu" class="tip tip_3" style="display:none;">
<div class="tip_c">
积分 <?php echo $_G['member']['credits'];?>, 距离下一级还需 <?php echo $upgradecredit;?> 积分
</div>
<div class="tip_horn"></div>
</div>
<?php } } if(!$_G['setting']['bbclosed']) { if($_G['uid'] && !isset($_G['cookie']['checkpm'])) { ?>
<script src="home.php?mod=spacecp&ac=pm&op=checknewpm&rand=<?php echo $_G['timestamp'];?>" type="text/javascript"></script>
<?php } if($_G['uid'] && helper_access::check_module('follow') && !isset($_G['cookie']['checkfollow'])) { ?>
<script src="home.php?mod=spacecp&ac=follow&op=checkfeed&rand=<?php echo $_G['timestamp'];?>" type="text/javascript"></script>
<?php } if(!isset($_G['cookie']['sendmail'])) { ?>
<script src="home.php?mod=misc&ac=sendmail&rand=<?php echo $_G['timestamp'];?>" type="text/javascript"></script>
<?php } if($_G['uid'] && $_G['member']['allowadmincp'] == 1 && !isset($_G['cookie']['checkpatch'])) { ?>
<script src="misc.php?mod=patch&action=checkpatch&rand=<?php echo $_G['timestamp'];?>" type="text/javascript"></script>
<?php } } if($_GET['diy'] == 'yes') { if(check_diy_perm($topic) && (empty($do) || $do != 'index')) { ?>
<script src="<?php echo $_G['setting']['jspath'];?>common_diy.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<script src="<?php echo $_G['setting']['jspath'];?>portal_diy<?php if(!check_diy_perm($topic, 'layout')) { ?>_data<?php } ?>.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } if($space['self'] && CURMODULE == 'space' && $do == 'index') { ?>
<script src="<?php echo $_G['setting']['jspath'];?>common_diy.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<script src="<?php echo $_G['setting']['jspath'];?>space_diy.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } } if($_G['uid'] && $_G['member']['allowadmincp'] == 1 && $_G['setting']['showpatchnotice'] == 1) { ?>
<script type="text/javascript">patchNotice();</script>
<?php } if($_G['uid'] && $_G['member']['allowadmincp'] == 1 && empty($_G['cookie']['pluginnotice'])) { ?>
<div class="focus plugin" id="plugin_notice"></div>
<script type="text/javascript">pluginNotice();</script>
<?php } if($_G['member']['newprompt'] && (empty($_G['cookie']['promptstate_'.$_G['uid']]) || $_G['cookie']['promptstate_'.$_G['uid']] != $_G['member']['newprompt']) && $_GET['do'] != 'notice') { ?>
<script type="text/javascript">noticeTitle();</script>
<?php } ?><?php userappprompt();?><?php if($_G['basescript'] != 'userapp') { ?>
<span id="scrolltop" onclick="window.scrollTo('0','0')">回顶部</span>
<script type="text/javascript">_attachEvent(window, 'scroll', function(){showTopLink();});checkBlind();</script>
<?php } ?><?php output();?></body>
</html>
