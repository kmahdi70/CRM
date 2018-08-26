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
                    <strong>ایجاد پروژه </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'project_add/insert'; ?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-6 form-group text-right">
                                <label for="name" class="F">* نام پروژه</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" name="name" placeholder="نام پروژه">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="admin">مدیر پروژه</label>
                                <select class="form-control" id="admin" name="admin">
                                    <?php
                                    foreach ($Admin as $row){
                                        ?>
                                        <option value="<?php echo $row->AID; ?>"><?php echo $row->FN.'-'.$row->LN; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="label">وضعیت</label>
                                <select class="form-control p-1 mb-1" name="state">
                                    <?php
                                    foreach ($States as $row){
                                        ?>
                                        <option value="<?php echo $row->SID; ?>"><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label for="comp_desc">توضیحات</label>
                                <input type="text" class="form-control" autocomplete="off" name="desc" placeholder="توضیحات">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ایجاد پروژه</button>
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
        $('#name').focus();
    });
    
    function Check_Form() {
        if($('#name').val() == ''){
            $('#name').attr('placeholder','نام پروژه الزامیست');
            $('#name').focus();
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