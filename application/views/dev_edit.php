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
    <link rel="stylesheet" href="<?php echo base_url().'css/jquery.multiselect.css';?>">
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
                    <strong>ویرایش کارپردازی </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'dev_edit/update'; ?>">
                        <input type="hidden" name="did" value="<?php echo $Info->DID; ?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="company">شرکت</label>
                                <input class="form-control" readonly value="<?php echo $Info->company.' - '.$Info->Brand; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="proj">پروژه</label>
                                <input class="form-control" readonly value="<?php echo $Info->proj; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="user">بازاریاب</label>
                                <input class="form-control" readonly value="<?php echo $Info->FN.' - '.$Info->LN; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="state">مرحله</label>
                                <select class="form-control" id="state" name="state">
                                    <?php
                                    foreach ($States as $row){
                                        ?>
                                        <option value="<?php echo $row->SID; ?>" <?php if($row->SID == $Info->SID) echo 'selected';?>><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <label for="comp_desc">توضیحات</label>
                                <input type="text" class="form-control" autocomplete="off" name="desc" placeholder="توضیحات" value="<?php echo $Info->desc; ?>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">بروزرسانی کارپردازی</button>
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
<script src="<?php echo base_url().'js/jquery.multiselect.js';?>"></script>
<script src="<?php echo base_url().'js/functions.js';?>"></script>
<script>
    let Sel_Comp = 0;
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#name').focus();

        $('#Sel_Company tr:not("#THead")').click(function(event) {
            if (event.target.type !== 'checkbox') {
                $(':checkbox', this).trigger('click');
            }
            else{
                if($(this).find('input[type="checkbox"]').prop('checked') == true){
                    Sel_Comp++;
                    $('#Selected').val(Sel_Comp +' شرکت انتخاب شده');
                }
                else{
                    Sel_Comp--;
                    $('#Selected').val(Sel_Comp +' شرکت انتخاب شده');

                }
            }
        });

        $(function () {
            $('select[multiple].active').multiselect({
                columns: 1,
                search: true,
                searchOptions: {
                    showOptGroups: true,
                },
                selectAll: true,
                selectGroup : true
            });
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
    
    function Show_Company() {
        $('#Sel_Comp_TB').fadeToggle('slow');
    }
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>