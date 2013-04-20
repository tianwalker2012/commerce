<?php
echo "<pre>";
$pd=$_GET['pid'];
$profile=c::t('common_member')->fetch_uid_by_user_id($pd);
var_dump($profile);