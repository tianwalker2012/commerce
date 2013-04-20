<?php

//查询 pre_forum_post 和pre_forum_thread 在某个模块下所有的收发信息
//select   distinct p.*,t.* from pre_forum_post p inner join pre_forum_thread t on p.tid=t.tid  where p.fid=2  and  p.subject !='' and p.first=1  order by p.pid desc



//查询某一个帖子下的所有的回复 即原帖
//select   *  from pre_forum_post p inner join pre_forum_thread t on p.tid=t.tid  where p.tid=11  order by p.pid desc
 
$data=DB::fetch_all('select   *  from pre_forum_post p inner join pre_forum_thread t on p.tid=t.tid  where p.tid=10  order by p.pid desc');
echo "<br>";
 //var_dump($data);
foreach ($data as $k=>$v)
{
	echo "<pre>";
	if($v['attachment'])
	{ 
		$a_id=$v['tid']%10;
		$attachment=DB::fetch_all("select * from pre_forum_attachment_".$a_id." as a where  a.pid=".$v['pid'] );
        var_dump($attachment);
		echo $attachment[0]['aid']."<br>";
        echo $attachment[0]['filename']."<br>";
	}
   
  	echo 'tid.....'.$v['tid'].'-------attachment.....'.$v['attachment']."<br>";
}