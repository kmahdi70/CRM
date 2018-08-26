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
                    <strong>ایجاد وظیفه </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'task_add'; ?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="project">پروژه</label>
                                <select class="form-control" id="project" name="project" onchange="submit();">
                                    <option value="0">همه</option>
                                    <?php
                                    foreach ($Dev_Proj as $row){
                                        ?>
                                        <option value="<?php echo $row->DID; ?>"><?php echo $row->Name; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="user">بازاریاب</label>
                                <select class="form-control" id="user" name="user" onchange="submit();">
                                    <option value="0">همه</option>
                                    <?php
                                    foreach ($Dev_User as $row){
                                        ?>
                                        <option value="<?php echo $row->DID; ?>"><?php echo $row->FN.' - '.$row->LN; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="company">شرکت</label>
                                <select class="form-control" id="company" name="company" onchange="submit();">
                                    <option value="0">همه</option>
                                    <?php
                                    foreach ($Dev_Company as $row){
                                        ?>
                                        <option value="<?php echo $row->DID; ?>"><?php echo $row->Name.(($row->Brand != '')?(' - '.$row->Brand):('')); ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="state">مرحله</label>
                                <select class="form-control" id="state" name="state" onchange="submit();">
                                    <option value="0">همه</option>
                                    <?php
                                    foreach ($Dev_State as $row){
                                        ?>
                                        <option value="<?php echo $row->DID; ?>"><?php echo $row->Title; ?></option>
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
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ایجاد کارپردازی</button>
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