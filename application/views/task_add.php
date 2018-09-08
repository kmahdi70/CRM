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
    <link rel="stylesheet" href="<?php echo base_url().'css/persian-datepicker.css';?>">

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
                    <form method="post" action="<?php echo base_url() . 'task_add/insert'; ?>">
                        <input type="hidden" name="did" value="<?php echo $Info->DID;?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>بازاریاب</label>
                                <input type="text" readonly class="form-control text-danger" value="<?php echo $Info->FN.' - '.$Info->LN;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>پروژه</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Info->proj;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>شرکت - برند</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Info->company.' - '.$Info->Brand;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>مرحله</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Info->Title;?>">
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label>توضیحات</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Info->desc;?>">
                            </div>
                            <div class="col-md-12 col-lg-8 form-group text-right">
                                <label for="task">عنوان وظیفه</label>
                                <input type="text" class="form-control" autocomplete="off" name="task" id="task" placeholder="شرح وظیفه">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="priority">اولویت</label>
                                <select class="form-control" id="priority" name="priority">
                                    <?php
                                    foreach ($Priority as $row){
                                        ?>
                                        <option value="<?php echo $row->PID; ?>"><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="state">وضعیت</label>
                                <select class="form-control" id="state" name="state" disabled="disabled">
                                    <?php
                                    foreach ($Task_State as $row){
                                        ?>
                                        <option value="<?php echo $row->SID; ?>"><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="type">نوع وظیفه</label>
                                <select class="form-control" id="type" name="type">
                                    <?php
                                    foreach ($Task_Type as $row){
                                        ?>
                                        <option value="<?php echo $row->TID; ?>"><?php echo $row->Type; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="Date">مهلت انجام</label>
                                <input type="text" class="form-control" autocomplete="off" id="Date">
                                <input type="hidden" class="unix" name="date_stamp" id="date_stamp" >
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="Alarm">هشدار</label>
                                <input type="text" class="Date form-control" autocomplete="off" id="Alarm">
                                <input type="hidden" class="unix" name="alarm_stamp" id="alarm_stamp">

                            </div>
                            <div class="col-md-12 col-lg-6 form-group text-right">
                                <label for="alarm_desc">عنوان هشدار</label>
                                <input type="text" class="form-control" autocomplete="off" name="alarm_desc" id="alarm_desc" placeholder="عنوان هشدار">
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label for="task_desc">توضیحات</label>
                                <textarea class="form-control" id="task_desc" name="task_desc"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ایجاد وظیفه</button>
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
<script src="<?php echo base_url().'js/persian-date.js';?>"></script>
<script src="<?php echo base_url().'js/persian-datepicker.js';?>"></script>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#name').focus();
        $("#Date").persianDatepicker({
            format: 'YYYY/MM/DD',
            altField: '#date_stamp',
            autoClose: true,
            minDate: new persianDate()
        });
        $("#Alarm").persianDatepicker({
            format: 'YYYY/MM/DD',
            initialValue: false,
            altField: '#alarm_stamp',
            autoClose: true,
            minDate:new persianDate()
        });
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