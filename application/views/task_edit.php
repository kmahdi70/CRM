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
$this->load->library('j_date_time');
?>
<div class="container">
    <div class="row">
        <div class="col-12 text-center">
            <div class="card Form">
                <div class="card-header text-right Panel_Title">
                    <strong>ویرایش وظیفه </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'task_edit/update'; ?>">
                        <input type="hidden" name="tid" value="<?php echo $Task->TID;?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>پروژه</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Task->Proj;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>شرکت - برند</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Task->Company.' - '.$Task->Brand;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>مرحله</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Task->Dev_State;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>بازاریاب</label>
                                <input type="text" readonly class="form-control" value="<?php echo $this->session->userdata('FN').' - '.$this->session->userdata('LN');?>">
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label>توضیحات</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Task->Dev_Desc;?>">
                            </div>
                            <div class="col-md-12 col-lg-8 form-group text-right">
                                <label for="task">شرح وظیفه</label>
                                <input type="text" readonly class="form-control text-right" autocomplete="off" name="task" id="task" placeholder="شرح وظیفه" value="<?php echo $Task->Task; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="priority">اولویت</label>
                                <input type="text" class="form-control" readonly value="<?php echo $Task->Pri; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="state">وضعیت</label>
                                <select class="form-control" id="state" name="state" onchange="Postpone(this.value);">
                                    <?php
                                    foreach ($Task_State as $row){
                                        ?>
                                        <option value="<?php echo $row->SID; ?>" <?php if($Task->State_ID == $row->SID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div id="Postpone" class="col-lg-12" style="display: none">
                                <div class="row">
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="Post">تاریخ جدید</label>
                                        <input type="text" class="form-control" autocomplete="off" id="Post">
                                        <input type="hidden" class="unix" name="post_stamp" id="post_stamp" >
                                    </div>
                                    <div class="col-md-12 col-lg-10 form-group text-right">
                                        <label for="task_desc">توضیحات</label>
                                        <textarea class="form-control" id="post_desc" name="post_desc" rows="1"></textarea>
                                    </div>
                                </div>
                            </div>
                            <?php
                            foreach($Post as $postpone){
                                ?>
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-2 form-group text-right">
                                            <label>تاریخ سررسید</label>
                                            <input type="text" disabled="disabled" class="form-control Post" autocomplete="off" value="<?php echo $postpone->Date;?>">
                                        </div>
                                        <div class="col-md-12 col-lg-10 form-group text-right">
                                            <label>توضیحات</label>
                                            <textarea class="form-control" readonly rows="1"><?php echo $postpone->Description;?></textarea>
                                        </div>
                                    </div>
                                </div>
                            <?php
                            }
                            ?>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="type">نوع وظیفه</label>
                                <input type="text" class="form-control" readonly value="<?php echo $Task->Type; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="Date">تاریخ انجام</label>
                                <input type="text" disabled="disabled" class="form-control" autocomplete="off" id="Date" value="<?php echo $Task->Date; ?>">
                                <input type="hidden" class="unix" name="date_stamp" id="date_stamp" >
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="Alarm">هشدار</label>
                                <input type="text" disabled="disabled" class="form-control" autocomplete="off" id="Alarm" value="<?php echo $Task->Alarm; ?>">
                                <input type="hidden" class="unix" name="alarm_stamp" id="alarm_stamp">

                            </div>
                            <div class="col-md-12 col-lg-6 form-group text-right">
                                <label for="alarm_desc">عنوان هشدار</label>
                                <input type="text" readonly class="form-control text-right" autocomplete="off" name="alarm_desc" id="alarm_desc" placeholder="عنوان هشدار" value="<?php echo $Task->Alarm_Desc; ?>">
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label for="task_desc">توضیحات</label>
                                <textarea class="form-control" id="task_desc" name="task_desc"><?php echo $Task->Description; ?></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ذخیره تغییرات</button>
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
        alert('<?php echo gmdate('Y-m-d h:m:s',time());?>');
        alert('<?php echo $Post[0]->Date;?>');
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#name').focus();

        $(".Post").persianDatepicker({
            format: 'YYYY/MM/DD',
            altField: '#date_stamp',
            autoClose: true,
            minDate: new persianDate()
        });
        $("#Date").persianDatepicker({
            format: 'YYYY/MM/DD',
            altField: '#date_stamp',
            autoClose: true,
            minDate: new persianDate()
        });
        $("#Post").persianDatepicker({
            format: 'YYYY/MM/DD',
            altField: '#post_stamp',
            autoClose: true,
            initialValue:false,
            minDate: new persianDate()
        });
        $("#Alarm").persianDatepicker({
            format: 'YYYY/MM/DD',
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

    function Postpone(val) {
        if(val == '2')
            $('#Postpone').slideDown('slow');
        else
            $('#Postpone').slideUp('slow');

    }
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>