<?php
 $start=$_GET['start'];
$limit=$_GET['limit'];

$result=c::t('forum_forum')->fetch_all_grouptype(0,$start,$limit);

/*$fid=array();
echo "<pre>";
foreach ($result as $k=>$v){
array_push($fid, $v['fid']);
}
$fid=implode(',', $fid);
$result=c::t('forum_forum')->fetch_all_fup($fid);
$fup=array();
foreach ($result as $k=>$v){
array_push($fup, $v['fid']);
}
 
var_dump($fup);*/
echo json_encode(array('data'=>$result));