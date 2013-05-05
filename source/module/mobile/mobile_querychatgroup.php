<?php
$plid=$_GET['plid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$lastint=$plid % 10;
  $sql="select m.pmid,l.plid,l.subject,m.message,l.pmtype,m.authorid author,m.dateline s from pre_ucenter_pm_messages_$lastint m inner join pre_ucenter_pm_lists l on m.plid=l.plid where l.plid=$plid  order by m.dateline desc limit $start,$limit ";
$result=DB::fetch_all($sql);
$num=count($result);
if($result){
	echo json_encode(array('total_count'=>$num,'data'=>$result));
}else {
	echo json_encode(array('total_count'=>0));
}