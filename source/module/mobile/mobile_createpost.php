<?php 
 
 /*

echo "<pre>";
$authorid=1;
$result=c::t('common_member')->fetch_all_username_by_uid(array('uid'=>$authorid));
$subject='test creatpost123';
$message='ok let us go right now i begin to test the creatpost interferce';
$longitude='110';
$latitude='123';
 $tid='123';
$location="上海市！";
*/
$authorid=$_GET['authorid'];
$result=c::t('common_member')->fetch_all_username_by_uid(array('uid'=>$authorid));
$subject=$_GET['subject'];
$message=$_GET['message'];
$longitude=$_GET['longitude'];
$latitude=$_GET['latitude'];
$tid=$_GET['tid'];
$location=$_GET['location'];
$first=0;
         
if(empty($tid)){
$newthread = array( 
		'fid' => 2,      //fid 就是forum_post 中id 
		'posttableid' => 0,
		'readperm' => 0,  //阅读权限
		'price' => 0,        //价格
		'typeid' => 0,  //主题分类id
		'sortid' => 0,   //分类信息id
		'author' => $result[1],  //会员名
		'authorid' => $authorid,    //会员id
		'subject' => $subject,  //主题
		'dateline' => time(), //发表时间
		'lastpost' => time(),  //最后发表
		'lastposter' => $result[1], //最后回复人
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
	 $first=1;
	 $tid = C::t('forum_thread')->insert($newthread, true);
} 
	$pid = insertpost(array(
			'fid' => 2,     
			'tid' => $tid,
			'first' => $first,
			'author' => $result[1],
			'authorid' => 3,
			'subject' => $subject,
			'dateline' => time(),
			'message' => $message,
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
	
    C::t('forum_thread')->insert($pid, false);
    $result=C::t('forum_post')->count_post();
if(!empty($latitude)&&!empty($location)){
    C::t('forum_post_location')->insert(array(
				'pid' => $result[0]['num'],
				'tid' => $tid,
				'uid' => $authorid,
				'mapx' => $longitude,
				'mapy' => $latitude,
				'location' => $location,
			));
}
$pid=DB::fetch_all("select max(pid) pid from pre_forum_post ");
  echo json_encode(array('pid'=>$pid[0]['pid']));   
	   
?>