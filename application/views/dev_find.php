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

//echo urlencode('22');
//echo base64_encode('12');
//echo base64_decode('MTI=');
//$a =  urlencode(base_url().'task_add/'.'12');
//echo urldecode($a);
//print_r(parse_url(base_url().'/12'));

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
                    <strong>مدیریت کارپردازی </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="row rtl">
                        <div class="col-md-12 col-lg-3 form-group text-right">
                            <label for="company">شرکت</label>
                            <select class="form-control" id="company" name="company">
                                <?php
                                foreach ($dev_company as $row){
                                    ?>
                                    <option value="<?php echo $row->DID; ?>"><?php echo $row->Name.' - '.$row->Brand; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <label for="proj">پروژه</label>
                            <select class="form-control" id="proj" name="proj">
                                <?php
                                foreach ($dev_proj as $row){
                                    ?>
                                    <option value="<?php echo $row->DID; ?>"><?php echo $row->Name; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <label for="user">بازاریاب</label>
                            <select class="form-control" id="user" name="user">
                                <?php
                                foreach ($dev_user as $row){
                                    ?>
                                    <option value="<?php echo $row->DID; ?>"><?php echo $row->FN.' - '.$row->LN; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <label for="state">وضعیت پروژه</label>
                            <select class="form-control" id="state" name="state">
                                <?php
                                foreach ($dev_state as $row){
                                    ?>
                                    <option value="<?php echo $row->DID; ?>"><?php echo $row->Title; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <label for="state">مرحله وظیفه</label>
                            <select class="form-control" id="state" name="state">
                                <?php
                                foreach ($task_state as $row){
                                    ?>
                                    <option value="<?php echo $row->SID; ?>"><?php echo $row->Title; ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-1 form-group">
                            <label for="">وظیفه</label>
                            <button type="submit" class="form-control btn btn-info">ایجاد</button>
                        </div>
                    </div>
                    <hr>
                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <table id="EditCompanyTB" class="display" width="100%" cellspacing="0" style="direction: rtl">
                                <thead>
                                <tr>
                                    <th width="30">ایجاد</th>
                                    <th>پروژه</th>
                                    <th>شرکت</th>
                                    <th>بازاریاب</th>
                                    <th>وضعیت</th>
                                    <th>توضیحات</th>
                                    <th width="80">عملیات</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th width="30">ایجاد</th>
                                    <th>پروژه</th>
                                    <th>شرکت</th>
                                    <th>بازاریاب</th>
                                    <th>وضعیت</th>
                                    <th>توضیحات</th>
                                    <th>عملیات</th>
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
<div class="modal fade" id="ConfirmDell" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header rtl">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" style="">حذف کارپردازی</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن کارپردازی اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <a class="btn btn-danger" id="DellCompany">حذف</a>
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
        "ajax":"<?php echo base_url().'dev_find/dev_list'; ?>",
        "drawCallback": function() {
            $('[data-toggle="tooltip"]').tooltip();
        }
    });
    function ConfirmDelete(cid){
        //$('#DellCompany').attr('href','<?php echo base_url().'dell_/dell_cid/'; ?>'+cid);
    }

    function DeleteCompany() {
        var URL = '<?php print(base_url().'dell_/delete');?>';
        var cid = $('#DellID').val();
        $.post(URL, {CID:cid}, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    $('#ConfirmDell').modal('hide');
                    $('#Row_'+cid).fadeOut('slow',function(){$('#Row_'+cid).remove();});
                    $('#Msg_G').html('شرکت با موفقیت حذف گردید');
                    $('#MsgDiv_G').fadeIn('slow',function(){
                        Scroll();
                        $('#MsgDiv_G').fadeOut(5000);
                    });
                }
            }
        });
    }

    $(document).ready( function() {
        $('[id^=MsgDiv_]').fadeOut(5000);

    });
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>