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
                    <strong>ثبت پرداخت </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'task_mine/update'; ?>">
                        <input type="hidden" name="fid" value="<?php echo $FID;?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-4 form-group text-right">
                                <label>شرکت - برند</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Fin->Company.' - '.$Fin->Brand;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>پروژه</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Fin->Project;?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label>بازاریاب</label>
                                <input type="text" readonly class="form-control" value="<?php echo $Fin->FN.' - '.$Fin->LN;?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="Date">تاریخ پرداخت</label>
                                <input type="text" class="form-control" autocomplete="off" id="Date" value="<?php echo $Fin->Date; ?>">
                                <input type="hidden" class="unix" name="date_stamp" id="date_stamp" >
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label>مبلغ فاکتور</label>
                                <input type="text" class="form-control" value="<?php echo $Fin->Price;?>" name="price">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label>مبلغ دریافتی</label>
                                <input type="text" class="form-control" value="<?php echo $Fin->Cash;?>" name="cash">
                            </div>
                            <div class="col-md-12 col-lg-8 form-group text-right">
                                <label>توضیحات</label>
                                <input type="text" class="form-control" value="<?php echo $Fin->Description;?>" name="desc">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" class="btn btn-info">ثبت پرداخت</button>
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
    });
    
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>