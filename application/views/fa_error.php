<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

define("ErrNum_100","ورودی نا معتبر است");
define("ErrNum_101","No Database");
define("ErrNum_102","نام کاربری یا رمز عبور اشتباه است");
define("ErrNum_103","با موفقیت وارد شدید");
define("ErrNum_104","Restricted Access to this page");
define("ErrNum_105","Table does not exist");
define("ErrNum_106","No Database Connection");
define("ErrNum_107","No Database found");
define("ErrNum_108","خطا در اجرای پرس و جو");
define("ErrNum_118","با موفقیت خارج شدید");
define("ErrNum_121","دسته با موفقیت افزوده گردید");
define("ErrNum_122","خطا در آپلود فایل");
define("ErrNum_123","زیردسته با موفقیت افزوده گردید");
define("ErrNum_124","شرکت با موفقیت افزوده گردید");
define("ErrNum_125","تکنولوژی با موفقیت افزوده گردید");
define("ErrNum_126","دسته با موفقیت افزوده گردید");
define("ErrNum_127","شرکت با موفقیت حذف گردید");
define("ErrNum_128","اطلاعات با موفقیت بروزرسانی گردید");
define("ErrNum_129","تورنمنت با موفقیت بروزرسانی گردید");
define("ErrNum_130","کاربر با موفقیت بروزرسانی گردید");
define("ErrNum_131","نشان با موفقیت بروزرسانی گردید");
define("ErrNum_132","تکنولوژی با موفقیت بروزرسانی گردید");
define("ErrNum_133","دسته با موفقیت بروزرسانی گردید");
define("ErrNum_134","لیدربرد با موفقیت بروزرسانی گردید");
define("ErrNum_135","پلی لیست با موفقیت بروزرسانی گردید");

function Show_Msg($Str){
    if($Str != '') {
        if (defined("ErrNum_" . $Str))
            eval("print(ErrNum_" . htmlentities($Str) . ");");
        else
            print("خطای شماره " . htmlentities($Str));
    }
}

$Str = '';
$Col = '0';

if($Msg != '0' && preg_match('/^[gGyYrR]{1}_[0-9]{1,}$/',$Msg)) {
    $msg_arr = explode('_', $Msg);
    $Col = strtolower($msg_arr[0]);
    $Str = $msg_arr[1];
}
$ShowDiv = array('0' => array('g' => 'none','r' => 'none','y' => 'none'),
                 'g' => array('g' => 'block','r' => 'none','y' => 'none'),
                 'r' => array('g' => 'none','r' => 'block','y' => 'none'),
                 'y' => array('g' => 'none','r' => 'none','y' => 'block'));

?>
<div class="container" id="System_Message" style="margin-top: 10px">
    <div class="alert alert-success alert-dismissable" id="MsgDiv_G" style="display:<?php echo $ShowDiv[$Col]['g'];?>;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 14px">×</a>
        <strong>Success!</strong> <span id="Msg_G"><?php Show_Msg($Str);?></span>
    </div>
    <div class="alert alert-danger alert-dismissable" id="MsgDiv_R" style="display:<?php echo $ShowDiv[$Col]['r'];?>;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 14px">×</a>
        <strong>Failed!</strong> <span id="Msg_R"><?php Show_Msg($Str);?></span>
    </div>
    <div class="alert alert-warning alert-dismissable" id="MsgDiv_Y" style="display:<?php echo $ShowDiv[$Col]['y'];?>;">
        <a href="#" class="close" data-dismiss="alert" aria-label="close" style="font-size: 14px">×</a>
        <strong>Warning!</strong> <span id="Msg_Y"><?php Show_Msg($Str);?></span>
    </div>
</div>