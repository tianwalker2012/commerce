<?php
loaducenter();
$list = array();
$filter = in_array($_GET['filter'], array('newpm', 'privatepm', 'announcepm')) ? $_GET['filter'] : 'privatepm';
$filter='privatepm';
echo $perpage = 15;  //$limit

$page = empty($_GET['page'])?0:intval($_GET['page']);
if($page<1) $page = 1;  //$start

if($filter == 'privatepm' || $filter == 'newpm') {
	$result = uc_pm_list(1, $page, $perpage, 'inbox', $filter, 0);
	//var_dump($result);
}
?>