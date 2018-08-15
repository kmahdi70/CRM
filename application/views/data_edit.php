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
                    <strong>ورود اطلاعات </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="row rtl">
                        <div class="col-12 form-group">
                            <a href="<?php echo base_url() . 'company_edit'; ?>" class="btn btn-outline-primary">شرکت</a>
                            <a href="" class="btn btn-outline-primary">گروه</a>
                            <a href="" class="btn btn-outline-primary">زیرگروه</a>
                            <a href="" class="btn btn-outline-primary">دپارتمان</a>
                            <a href="" class="btn btn-outline-primary">اولویت</a>
                            <a href="" class="btn btn-outline-primary">نوع وظایف</a>
                            <a href="" class="btn btn-outline-primary">وضعیت وظایف</a>
                            <a href="" class="btn btn-outline-primary">برچسب</a>
                            <a href="" class="btn btn-outline-primary">وضعیت توسعه</a>
                            <a href="" class="btn btn-outline-primary">وضعیت پروژه</a>
                        </div>
                    </div>
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
    });

</script>
<?php
$this->load->view('footer');
?>
</body>
</html>