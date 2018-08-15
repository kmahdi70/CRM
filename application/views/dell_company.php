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
                    <strong>شرکت ها </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <form method="post" action="<?php echo base_url().'dell_company'; ?>">
                        <div class="form-group text-right">
                            <table class="table table-striped table-hover rtl">
                                <tr>
                                    <th width="30">#</th>
                                    <th>نام شرکت</th>
                                    <th>برند</th>
                                    <th>دسته</th>
                                    <th>زیردسته</th>
                                    <th>مدیر عامل</th>
                                    <th width="90">عملیات</th>
                                </tr>
                                <?php
                                $i=1;
                                foreach ($Company as $item) {
                                    ?>
                                    <tr id="Row_<?php echo $item->CID; ?>">
                                        <th><?php echo $i++; ?>.</th>
                                        <td><?php echo $item->Name; ?></td>
                                        <td><?php echo $item->Brand; ?></td>
                                        <td><?php echo $item->Cat; ?></td>
                                        <td><?php echo $item->Sub; ?></td>
                                        <td><?php echo $item->CEO; ?></td>
                                        <td>
                                            <span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                                                <a href="<?php echo base_url().'company_details/edit/'.$item->CID; ?>"><i class="far fa-edit fa-fw fa-2x"></i></a>
                                            </span>
                                            <span class="btn" data-toggle="tooltip" title="حذف" id="DellSpan" onclick="ConfirmDelete('<?php echo $item->CID; ?>');" style="padding: 0;">
                                                <i class="far fa-trash-alt fa-fw fa-2x text-danger" data-toggle="modal" data-target="#ConfirmDell"></i>
                                            </span>
                                        </td>
                                    </tr>
                                <?php
                                }
                                ?>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="DellID">
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
                <!--<a class="btn btn-danger" onclick="DeleteCompany();">حذف</a>-->
                <a class="btn btn-danger" id="DellCompany">حذف</a>
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

    function ConfirmDelete(cid){
        //$('#DellID').val(cid);
        $('#DellCompany').attr('href','<?php echo base_url().'dell_company/dell_company/'; ?>'+cid);
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
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>