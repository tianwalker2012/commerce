<?php
$p1=$_GET['p1'];
$p2=$_GET['p2'];
$plid=$_GET['plid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
if($p1>$p2)
{
$min_max=$p2."_".$p1;
}
else
{
	$min_max=$p1."_".$p2;
}
$sql="select * from pre_ucenter_pm_lists where min_max= '".$min_max."'";
$result=DB::fetch_all($sql);
 
if($result)
{
$plid=$result[0]['plid'];
$lastint=$plid % 10;
$sql="select pmid,plid,authorid ,message,dateline from pre_ucenter_pm_messages_$lastint order by dateline desc limit $start,$limit ";
$result=DB::fetch_all($sql);
foreach ($result as $k=>$v){
	$result[$k]['to']=$v['authorid']==$p1?$p2:$p1;
}
echo json_encode(array('total_count'=>count($result),'data'=>$result));
}
else 
{
echo   json_encode(array('total_count'=>0));
}