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
                    <strong>ایجاد زیردسته </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <form method="post" action="<?php echo base_url().'subcategory'; ?>">
                        <div class="form-group text-right">
                            <label for="newcat">انتخاب دسته</label>
                            <select name="category" class="form-control" onchange="submit();">
                                <option value="0" <?php if($sel_cat == 0) echo 'selected';?>>انتخاب دسته</option>
                                <?php
                                foreach ($Category as $row){
                                    ?>
                                    <option value="<?php echo $row->CID; ?>" <?php if($sel_cat == $row->CID) echo 'selected';?>><?php echo $row->Title; ?></option>
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="form-group text-right">
                            <label for="newcat" class="F">* نام زیردسته</label>
                            <input type="text" class="form-control text-right rtl" id="newsubcat" autocomplete="off" name="title" value="<?php echo set_value('title'); ?>" placeholder="زیردسته جدید">
                        </div>
                        <div class="text-right">
                            <button type="submit" name="AddSubCategory" value="true" class="btn btn-primary">ایجاد زیردسته</button>
                        </div>
                        <div class="form-group">
                            <div class="col-12 text-right rtl" style="color: #ff6156;">
                                <?php echo validation_errors(); ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-center mt-5">
            <div class="card Form">
                <div class="card-header text-right Panel_Title">
                    <strong>زیردسته ها </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <form method="post" action="<?php echo base_url().'category'; ?>">
                        <div class="form-group text-right">
                            <table class="table table-striped table-hover rtl">
                                <tr>
                                    <th width="30">#</th>
                                    <th>نام زیردسته</th>
                                    <th>نام دسته</th>
                                    <th width="80">حذف</th>
                                </tr>
                                <?php
                                $i=1;
                                foreach ($SubCat as $item) {
                                    ?>
                                    <tr id="Row_<?php echo $item->SCID; ?>">
                                        <th><?php echo $i++; ?>.</th>
                                        <td><?php echo $item->STitle; ?></td>
                                        <td><?php echo $item->CTitle?></td>
                                        <td>
                                            <a href="javascript:void(0);" onclick="ConfirmDelete('<?php echo $item->SCID; ?>');" data-toggle="modal" data-target="#ConfirmDell" class="text-danger fa-lg fa-fw"><i class="fas fa-trash-alt fa-2x fa-fw"></i></a>
                                            <!--<span data-toggle="tooltip" title="Delete" id="DellSpan">
                                                <i class="far fa-fw fa-times-circle fa-2x text-danger" data-toggle="modal" data-target="#ConfirmDell" onclick="ConfirmDelete('<?php /*echo $item->SCID; */?>');"></i>
                                            </span>-->
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
                <h4 class="modal-title" style="">حذف زیردسته</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن زیردسته اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <a class="btn btn-danger btn-ok" onclick="DeleteSubCategory();">حذف</a>
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
        $('#newsubcat').focus();
    });

    function ConfirmDelete(cid){
        $('#DellID').val(cid);
    }

    function DeleteSubCategory() {
        var URL = '<?php print(base_url().'category/delete_subcat');?>';
        var scid = $('#DellID').val();
        $.post(URL, {SCID:scid}, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    $('#ConfirmDell').modal('hide');
                    $('#Row_'+scid).remove();
                    $('#Msg_G').html('زیردسته با موفقیت حذف گردید');
                    $('#MsgDiv_G').fadeIn('slow');
                    $('#MsgDiv_G').fadeOut(5000);
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