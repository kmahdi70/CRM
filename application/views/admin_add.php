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
$menu = $this->session->userdata('MENU');
$this->load->view($menu.'_menu');
?>
<div class="container">
    <div class="row">
        <div class="col-12 text-center">
            <div class="card Form">
                <div class="card-header text-right Panel_Title">
                    <strong>ایجاد کاربر </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'admin_add/insert'; ?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="user_id" class="F">* نام کاربری</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="user_id" name="user_id" placeholder="نام کاربری">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="pw1" class="F">* رمز عبور</label>
                                <input type="password" class="form-control" autocomplete="off" name="pw1" id="pw1" placeholder="رمز عبور">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="pw2" class="F">* تکرار رمز عبور</label>
                                <input type="password" class="form-control" autocomplete="off" name="pw2" id="pw2" placeholder="رمز عبور">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="fn">نام</label>
                                <input type="text" class="form-control" autocomplete="off" name="fn" placeholder="نام">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="ln">نام خانوادگی</label>
                                <input type="text" class="form-control" autocomplete="off" name="ln" placeholder="نام خانوادگی">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ایجاد کاربر</button>
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
<script src="<?php echo base_url().'js/functions.js';?>"></script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#user_id').focus();
    });
    
    function Check_Form() {
        if($('#user_id').val() === ''){
            $('#user_id').attr('placeholder','نام کاربری الزامیست');
            $('#user_id').focus();
            return false;
        }
        if($('#pw1').val() === '' || $('#pw2').val() === ''){
            $('#pw1').attr('placeholder','رمز عبور الزامیست');
            $('#pw1').focus();
            return false;
        }
        if($('#pw1').val() !== $('#pw2').val()){
            $('#pw1').val('');
            $('#pw2').val('');
            $('#pw1').attr('placeholder','رمزها یکسان نیستند');
            $('#pw1').focus();
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