<?php
 
/*echo $forumname="今天天气不错呀！ ";
	$introduction="这是我们创建的创建群借口";
	$authorid='1';
	$authorname='admin';
	$rank='110';
	$category='又下雨了';*/

//http://www.enjoyxue.com/commerce/mobile.php?mod=cyclecreate&name=mycycle&introduction=insjhasbdjasdasd&authorid=1&authorname=admin&rank=110&category=asdasdasd
    $forumname=$_GET['name'];
	$introduction=$_GET['introduction'];
	$authorid=$_GET['authorid'];
	$authorname=$_GET['authorname'];
	$rank=$_GET['rank'];
	$category=$_GET['category'];
  

	 $fid = C::t('forum_forum')->insert(array('fup'=>'37','type' => 'sub', 'name' => $forumname, 'status' => 3, 'displayorder' => 0), 1);
	 C::t('forum_forumfield')->insert(array('fid' => $fid,'description'=>$introduction,
	                                        'rank'=>$rank,'category'=>$category,
                                            'founderuid'=>$authorid,'foundername'=>$authorname,
	                                        'membernum'=>1, 'dateline'=>time()
	                                         ));
	  $index=c::t('forum_groupuser')->insert($fid,$authorid,$authorname,time());
   echo json_encode(array('cycleid'=>$fid));