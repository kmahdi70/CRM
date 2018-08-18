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
                    <strong>ویرایش شرکت ها </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="row rtl">
                        <div class="col-12 form-group">
                            <a href="<?php echo base_url() . 'company_find'; ?>" class="btn btn-outline-primary active">شرکت</a>
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

                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <table id="EditCompanyTB" class="display" width="100%" cellspacing="0" style="direction: rtl">
                                <thead>
                                <tr>
                                    <th width="30">ایجاد</th>
                                    <th>نام شرکت</th>
                                    <th>برند</th>
                                    <th>دسته</th>
                                    <th>زیردسته</th>
                                    <th>نوع شرکت</th>
                                    <th width="80">عملیات</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ایجاد</th>
                                    <th>نام شرکت</th>
                                    <th>برند</th>
                                    <th>دسته</th>
                                    <th>زیردسته</th>
                                    <th>نوع شرکت</th>
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
                <h4 class="modal-title" style="">حذف شرکت، نمایندگان، آدرسها و تلفنها</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن شرکت و کلیه متعلقات آن اطمینان دارید؟</p>
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
        "ajax":"<?php echo base_url().'company_details/list_company'; ?>",
        "drawCallback": function() {
            $('[data-toggle="tooltip"]').tooltip();
        }
    });
    function ConfirmDelete(cid){
        $('#DellCompany').attr('href','<?php echo base_url().'dell_company/dell_cid/'; ?>'+cid);
    }

    function DeleteCompany() {
        var URL = '<?php print(base_url().'dell_company/delete');?>';
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