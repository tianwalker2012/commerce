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
  
$num=count($plid);
$lastpm=array();
 foreach ($plid as $k=>$v){
    $v1=$v%10;
 	 $sql ="select m.pmid,l.subject,m.authorid ,l.lastmessage,l.min_max,l.pmtype,m.plid, m.message content, m.dateline from pre_ucenter_pm_messages_"."$v1"." m ";
 	$sql.=" inner join pre_ucenter_pm_lists l on l.plid=m.plid";
    $sql.=" where m.plid=".$v."  order by m.dateline limit 1";
    $last_pm=DB::fetch_all($sql);
    $lastpm[]=$last_pm;
 }
 $lastpm=get_array_inner($lastpm);
 foreach ($lastpm as $k=>$v){
 		$lastmessage = unserialize($v['lastmessage']);
		if($lastmessage['lastauthorid']) {
			$lastpms['lastauthorid'] = $lastmessage['lastauthorid'];
			$lastpms['lastauthor'] = $lastmessage['lastauthor'];
			$lastpms['lastsummary'] = $lastmessage['lastsummary'];
		} else {
			$lastpms['lastauthorid'] = $lastmessage['firstauthorid'];
			$lastpms['lastauthor'] = $lastmessage['firstauthor'];
			$lastpms['lastsummary'] = $lastmessage['firstsummary'];
		}
	   $author=$lastpms['lastauthorid'];
		$to="";
	    $v['min_max']."<br>";
		if($v['min_max']){
	    $minmax=explode('_', $v['min_max']);
		$to=array_diff($minmax,array($author));
		$to=array_values($to);
		  $to=$to[0];
		}
		$lastpm[$k]['author']=$author;
	    $lastpm[$k]['to']=$to;
	 	 
	 	unset($lastpm[$k]['lastmessage']);
		 
 }
 if(!empty($lastpm)){
    echo json_encode(array('total_count'=>$num,'data'=>$lastpm));
 }else {
 	echo json_encode(array('total_count'=>0));
 } 