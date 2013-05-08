<?php

$uid=$_GET['uid'];
$sql  ="select plid from pre_ucenter_pm_members";
$sql.=" where uid=".$uid; 
$sql.=" group by plid order by lastupdate desc";
$result=DB::fetch_all($sql);
 $plid=array();
foreach ($result as $k=>$v) {
  
     array_push($plid, $v['plid']);
} 
  
$lastpm=array();
 foreach ($plid as $k=>$v){
    $v1=$v%10;
    $sql ="select m.pmid,l.subject,m.authorid ,l.lastmessage,l.min_max,l.pmtype,m.plid, m.message content, m.dateline,m.pmtype,m.resource_url from pre_ucenter_pm_messages_"."$v1"." m ";
 	$sql.=" inner join pre_ucenter_pm_lists l on l.plid=m.plid";
    $sql.=" where m.plid=".$v."  order by m.dateline desc limit 1";
    $last_pm=DB::fetch_all($sql);
    $lastpm[]=$last_pm;
 }
 $lastpm=get_array_inner($lastpm);
 foreach ($lastpm as $k=>$v){
 	 
	    $author=$v['authorid'];
		$to="";
		if($v['min_max']){
	    $minmax=explode('_', $v['min_max']);
		$to=array_diff($minmax,array($author));
		$to=array_values($to);
	    $to=$to[0];
		}
		$lastpm[$k]['author']=$author;
	    $lastpm[$k]['to']=$to;
		unset($lastpm[$k]['min_max']);
	 	unset($lastpm[$k]['lastmessage']);
		 
 }
 
 if(!empty($lastpm)){
    echo json_encode(array('total_count'=>count($plid),'data'=>$lastpm));
 }else {
 	echo json_encode(array('total_count'=>0));
 } 