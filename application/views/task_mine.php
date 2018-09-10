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
    <link rel="stylesheet" href="<?php echo base_url().'css/jquery.dataTables.min.css';?>">
    <link rel="stylesheet" href="<?php echo base_url().'css/all.css';?>">
    <link rel="stylesheet" href="<?php echo base_url().'css/global.css';?>">
    <style scoped type="text/css">
        input[type=search]{
            border: 1px solid #b2b2b2;
        }
    </style>
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
                    <strong>کارتابل ادمین </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <table id="EditCompanyTB" class="display" width="100%" cellspacing="0" style="direction: rtl">
                                <thead>
                                <tr>
                                    <th width="50">تاریخ</th>
                                    <th>شرکت</th>
                                    <th>پروژه</th>
                                    <th>بازاریاب</th>
                                    <th>فاکتور</th>
                                    <th>دریافتی</th>
                                    <th>تاریخ</th>
                                    <th width="80">عملیات</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th width="50">تاریخ</th>
                                    <th>شرکت</th>
                                    <th>پروژه</th>
                                    <th>بازاریاب</th>
                                    <th>فاکتور</th>
                                    <th>دریافتی</th>
                                    <th>تاریخ</th>
                                    <th width="80">عملیات</th>
                                </tr>
                                </tfoot>
                            </table>
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
<script src="<?php echo base_url().'js/jquery.dataTables.min.js';?>"></script>
<script src="<?php echo base_url().'js/functions.js';?>"></script>
<script>
    $('#EditCompanyTB').DataTable( {
        "ajax":"<?php echo base_url().'task_mine/task_list'; ?>",
        "drawCallback": function() {
            $('[data-toggle="tooltip"]').tooltip();
        }
    });

    $(document).ready( function() {
        $('[id^=MsgDiv_]').fadeOut(5000);

    });
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>