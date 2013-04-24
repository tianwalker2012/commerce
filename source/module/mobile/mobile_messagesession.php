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
  $sql="select * from pre_ucenter_pm_lists where plid =" .$v;
  $last_pm=DB::fetch_all($sql);
  $lastpm[]=$last_pm;
 }
 $lastpm=get_array_inner($lastpm);
echo json_encode($lastpm);