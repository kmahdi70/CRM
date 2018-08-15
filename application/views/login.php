<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $Title;?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<?php echo base_url().'css/bootstrap.min.css';?>">
    <link rel="stylesheet" href="<?php echo base_url().'css/all.css';?>">
    <link rel="stylesheet" href="<?php echo base_url().'css/global.css';?>">
</head>
<body>
<?php
$data = array('Msg' => $Msg);
$this->load->view('fa_error', $data);
?>
<div class="container">
    <div class="row mt-4">
        <div class="col-xl-5 offset-xl-3 col-lg-6 offset-lg-3 col-sm-8 offset-sm-2">
            <div class="card Form">
                <div class="card-header text-right">
                    <strong>فرم ورود <i class="far fa-user fa-lg"></i></strong>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="<?php echo base_url().'login'; ?>">
                        <div class="form-group">
                            <div class="col-xs-12 text-right">
                                <div class="input-group pull-right">
                                    <input type="text" required autofocus class="form-control text-right" autocomplete="off" placeholder="نام کاربری" value="<?php echo set_value('uid'); ?>" name="uid" id="UID">
                                    <div class="input-group-append">
                                        <div class="input-group-text"><i class="fas fa-user fa-lg fa-fw"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 text-right">
                                <div class="input-group pull-right">
                                    <input type="password" required class="form-control text-right" placeholder="رمز عبور" autocomplete="off" name="pass" id="Pass" value="<?php echo set_value('pass'); ?>">
                                    <div class="input-group-append">
                                        <div class="input-group-text"><i class="fas fa-key fa-lg fa-fw"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12 text-right">
                                <div class="input-group pull-right">
                                    <select class="form-control" name="type" id="Type">
										<option value="0">انتخاب نوع کاربر</option>
										<option value="admin">مدیر پروژه</option>
										<option value="user">فروشنده</option>
									</select>
                                    <div class="input-group-append">
                                        <div class="input-group-text"><i class="fas fa-tag fa-lg fa-fw"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col col-xs-12 text-right">
                                <button type="submit" class="btn btn-info" name="Login" value="true" onclick="return Check();">
                                    <strong>ورود <i class="fas fa-sign-in-alt fa-lg fa-fw"></i></strong>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col col-xs-12 text-right rtl" style="color: #ff6156;">
                                <?php echo validation_errors(); ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo base_url().'js/jquery-3.3.1.min.js';?>"></script>
<script src="<?php echo base_url().'js/popper.min.js'; ?>"></script>
<script src="<?php echo base_url().'js/bootstrap.min.js'; ?>"></script>
<script>
    $(document).ready(function(){

        $('[id^=MsgDiv_]').fadeOut(5000);
    });

	function Check() {
		if($('#UID').val() == ''){
			$('#Msg_Y').html('نام کاربری خالی میباشد');
			$('#MsgDiv_Y').fadeIn('fast');
			$('#MsgDiv_Y').fadeOut(5000);
			$('#UID').focus();
			return false;
		}
		if($('#Pass').val() == ''){
			$('#Msg_Y').html('رمز عبور خالی میباشد');
			$('#MsgDiv_Y').fadeIn('fast');
			$('#MsgDiv_Y').fadeOut(5000);
			$('#Pass').focus();
			return false;
		}
		if($('#Type').val() == '0'){
			$('#Msg_Y').html('نوع کاربر را انتخاب نمایید');
			$('#MsgDiv_Y').fadeIn('fast');
			$('#MsgDiv_Y').fadeOut(5000);
			$('#Type').focus();
			return false;
		}
		return true;
	}
</script>
<?php
$this->load->view('footer');
 ?>
</body>
</html>
