<?php 
echo "132";
$newthread = array( 
		'fid' => 2,      //fid 就是forum_post 中id 
		'posttableid' => 0,
		'readperm' => 0,  //阅读权限
		'price' => 0,        //价格
		'typeid' => 0,  //主题分类id
		'sortid' => 0,   //分类信息id
		'author' => admin2,  //会员名
		'authorid' => 3,    //会员id
		'subject' => '主题',  //主题
		'dateline' => time(), //发表时间
		'lastpost' => time(),  //最后发表
		'lastposter' => 'admin2', //最后回复人
		'displayorder' => 0,      //显示顺序
		'digest' => 0,       //是否精华
		'special' => 0,  // 特殊主题,1:投票;2:商品;3:悬赏;4:活动;5:辩论贴;127:插件相关
		'attachment' => 0,
		'moderated' => 0,  //是否被管理员改动
		'status' => 0,     //二进制位存储，对应十进制值为 #D 后的值，存储在数据库中
		'isgroup' => 0,    //是否为群组帖子
		'replycredit' => 0,  //回帖奖励积分主题记录积分值
		'closed' => isset($closed) ? 1 : 0  //是否关闭
	);
	$tid = C::t('forum_thread')->insert($newthread, true);
	
	$pid = insertpost(array(
			'fid' => 2,     
			'tid' => $tid,
			'first' => '1',
			'author' => 'admin2',
			'authorid' => 3,
			'subject' => '主题',
			'dateline' => time(),
			'message' => '这只不过是一个测试而已，有什么好看的！',
			'useip' => '::1',
			'invisible' => 0,
			'anonymous' => 0,
			'usesig' => 1,
			'htmlon' => 0,
			'bbcodeoff' => -1,
			'smileyoff' => -1,
			'parseurloff' => -1,
			'attachment' => '0',
			'tags' => 0,
			'replycredit' => 0,
			'status' => (defined('IN_MOBILE') ? 8 : 0)
	));
	
	
?>