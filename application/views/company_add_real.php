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
                    <strong>ایجاد شخص حقیقی </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="row rtl">
                        <div class="col-12 form-group Links">
                            <a href="<?php echo base_url() . 'company_add'; ?>" class="btn btn-outline-primary active">شرکت</a>
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
                    <hr>
                    <div class="rtl">
                        <div class="col-7 col-sm-4 col-md-3 col-lg-2 form-group row">
                            <form method="post" action="<?php echo base_url() . 'company_add'; ?>">
                                <label for="category">نوع شرکت</label>
                                <select class="form-control" name="category" onchange="submit();">
                                    <option value="Legal">شخص حقوقی</option>
                                    <option value="Real" selected>شخص حقیقی</option>
                                </select>
                            </form>
                        </div>
                            <!--***************************************************************************** Address_Base Start -->
                            <div class="row" id="Address_Base" style="display: none;">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="province">استان</label>
                                    <select class="form-control" onchange="FeedCounty(this.value);" id="province">
                                        <option value="0">انتخاب استان</option>
                                        <?php
                                        foreach ($Province as $row){
                                            ?>
                                            <option value="<?php echo $row->id; ?>"><?php echo $row->name; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="city">شهرستان</label>
                                    <select class="form-control" id="city">
                                        <option value="0">انتخاب شهرستان</option>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-7 form-group text-right">
                                    <label for="address">آدرس</label>
                                    <textarea cols="100%" class="form-control text-right rtl" id="address" placeholder="آدرس"></textarea>
                                </div>
                                <div class="col-md-12 col-lg-1 form-group Add_Address">
                                    <label for="desc">جدید</label>
                                    <button type="button" onclick="Add_Address();" data-toggle="tooltip" title="افزودن آدرس" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                                </div>
                            </div>
                            <!--***************************************************************************** Address_Base End -->
                            <div class="row" id="Company">
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="brand">برند</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="brand" placeholder="برند شرکت">
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <label for="site">سایت</label>
                                    <input type="text" class="form-control text-left ltr" autocomplete="off" id="site" placeholder="سایت">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="cat">انتخاب دسته</label>
                                    <select class="form-control" onchange="FeedSubCat(this.value);" id="cat">
                                        <option value="0">انتخاب دسته</option>
                                        <?php
                                        foreach ($Category as $row){
                                            ?>
                                            <option value="<?php echo $row->CID; ?>" <?php if($row->Title == 'سایر') echo 'selected'; ?>><?php echo $row->Title; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="subcat">انتخاب زیردسته</label>
                                    <select class="form-control" id="subcat">
                                        <option value="0">انتخاب زیردسته</option>
                                        <?php
                                        foreach ($SubCategory as $row){
                                            ?>
                                            <option value="<?php echo $row->SCID; ?>" <?php if($row->STitle == 'سایر') echo 'selected'; ?>><?php echo $row->STitle; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <button type="button" onclick="Add_Label(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="label_0">برچسب</label>
                                    <select class="form-control p-1 mb-1" id="label_0">
                                        <option value="0">انتخاب برچسب</option>
                                        <?php
                                        foreach ($Company_Label as $row){
                                            ?>
                                            <option value="<?php echo $row->LID; ?>"><?php echo $row->Title; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>

                                <div class="col-md-12 form-group text-right">
                                    <label for="comp_desc">توضیحات</label>
                                    <input type="text" class="form-control" autocomplete="off" id="comp_desc" placeholder="توضیحات">
                                </div>
                            </div>
                            <div class="row" id="Agent_0">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-md-12 col-lg-1 form-group text-right">
                                    <label for="title">عنوان</label>
                                    <select class="form-control p-0" id="title">
                                        <option value="آقای">آقای</option>
                                        <option value="خانم">خانم</option>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="fn">نام</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="fn" placeholder="نام">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="ln" class="F">* نام خانوادگی</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="ln" placeholder="نام خانوادگی">
                                </div>
                                <div class="col-md-12 col-lg-5 form-group text-right">
                                    <label for="post">عنوان شغلی</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" placeholder="عنوان شغلی">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="department">بخش</label>
                                    <select class="form-control" id="department">
                                        <option value="0">انتخاب دپارتمان</option>
                                        <?php
                                        foreach ($Department as $row){
                                            ?>
                                            <option value="<?php echo $row->DID; ?>" <?php if($row->Title == 'سایر') echo 'selected';?>><?php echo $row->Title; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <button type="button" onclick="Add_Tell(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="tcode">تلفن</label>
                                    <div class="input-group ltr mb-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><input class="input-group-text p-0 border-0" placeholder="کد" id="tcode_0" size="1"></span>
                                        </div>
                                        <input type="text" class="form-control p-1" placeholder="تلفن" id="tell_0">
                                    </div>
                                    <input type="hidden" id="tell_count">
                                </div>
                                <div class="col-md-12 col-lg-1 form-group text-right p-lg-0">
                                    <button type="button" onclick="Add_Int(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="int">داخلی</label>
                                    <input type="text" class="form-control ltr text-left mb-1" placeholder="داخلی" id="int_0">
                                    <input type="hidden" id="int_count">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <button type="button" onclick="Add_Fax(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="fcode">فکس</label>
                                    <div class="input-group ltr mb-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><input class="input-group-text p-0 border-0" placeholder="کد" id="fcode_0" size="1"></span>
                                        </div>
                                        <input type="text" class="form-control p-1" placeholder="فکس" id="fax_0">
                                    </div>
                                    <input type="hidden" id="fax_count">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <button type="button" onclick="Add_Email(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="a_email">ایمیل</label>
                                    <input type="text" class="form-control ltr text-left mb-1" placeholder="ایمیل" id="a_email_0">
                                    <input type="hidden" id="email_count">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <button type="button" onclick="Add_Mobile(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="mobile">همراه</label>
                                    <input type="text" class="form-control ltr text-left mb-1" placeholder="همراه" id="mobile_0">
                                    <input type="hidden" id="mobile_count">
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <label for="desc">توضیحات</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="desc" placeholder="توضیحات">
                                </div>
                            </div>
                            <div class="row" id="Address_0">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="province">استان</label>
                                    <select class="form-control" onchange="FeedCounty(this.value);" id="province">
                                        <option value="0">انتخاب استان</option>
                                        <?php
                                        foreach ($Province as $row){
                                            ?>
                                            <option value="<?php echo $row->id; ?>"><?php echo $row->name; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="city">شهرستان</label>
                                    <select class="form-control" id="city">
                                        <option value="0">انتخاب شهرستان</option>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-7 form-group text-right">
                                    <label for="address">آدرس</label>
                                    <textarea cols="100%" class="form-control text-right rtl" id="address" placeholder="آدرس"></textarea>
                                </div>
                                <div class="col-md-12 col-lg-1 form-group Add_Address">
                                    <label for="desc">جدید</label>
                                    <button type="button" onclick="Add_Address();" data-toggle="tooltip" title="افزودن آدرس" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12 form-group text-right">
                                    <button type="button" onclick="return Submit_Real_Form();" id="Save_Real" class="btn btn-info">ایجاد شخص حقیقی</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="DellID">
<div class="modal fade" id="ConfirmDellAgent" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header rtl">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">حذف پرسنل</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن پرسنل اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <a class="btn btn-danger btn-ok" onclick="Dell_Agent();">حذف</a>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ConfirmDellAddress" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header rtl">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">حذف آدرس</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن آدرس اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <a class="btn btn-danger btn-ok" onclick="Dell_Address();">حذف</a>
            </div>
        </div>
    </div>
</div>
<script src="<?php echo base_url().'js/jquery-3.3.1.min.js';?>"></script>
<script src="<?php echo base_url().'js/popper.min.js'; ?>"></script>
<script src="<?php echo base_url().'js/bootstrap.min.js'; ?>"></script>
<script src="<?php echo base_url().'js/functions.js';?>"></script>
<script>
    var i_agent=0;
    var i_label=0;
    var i_tell=0;
    var i_ctell=0;
    var i_fax=0;
    var i_cfax=0;
    var i_int=0;
    var i_email=0;
    var i_mobile=0;
    var i_address=0;

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#Real').hide();
        $('#ln').focus();
    });

    function ConfirmDelete(id){
        $('#DellID').val(id);
    }
    function FeedSubCat(val) {
        var URL = '<?php print(base_url().'category/get_subcat');?>';
        $.post(URL, {CID:val}, function (res, ret) {
            if(ret == 'success'){
                $('#subcat').html('<option value="0">انتخاب زیردسته</option>');
                var Json = $.parseJSON(res);
                $(Json).each(function(k,v){
                    if(v['STitle'] == 'سایر')
                        $('#subcat').append('<option value="'+v['SCID']+'" selected>'+v['STitle']+'</option>');
                    else
                        $('#subcat').append('<option value="'+v['SCID']+'">'+v['STitle']+'</option>');
                });

            }
        });
    }
    function FeedCounty(val) {
        var URL = '<?php print(base_url().'company_details/get_county');?>';
        $.post(URL, {PID:val}, function (res, ret) {
            if(ret == 'success'){
                $('#Address_0 #city').html('<option value="0">انتخاب شهرستان</option>');
                if(res){
                    var Json = $.parseJSON(res);
                    $(Json).each(function(k,v){
                        $('#Address_0 #city').append('<option value="'+v['id']+'">'+v['name']+'</option>');
                    });
                }
            }
        });
    }
    function Add_Label(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('select').first();
        var val = sel.val();
        $(sel).clone().appendTo(div);
        $(div).children('select').last().val(val);
        $(sel).focus();
        i_label++;
        $(sel).attr('id','label_'+i_label);
    }
    function Add_Tell(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('div').first();
        $(sel).clone().appendTo(div);
        i_tell++;
        var last = $(div).children('div').last();
        $(last).find('#tcode_0').attr('id','tcode_'+i_tell);
        $(last).find('#tell_0').attr('id','tell_'+i_tell);

        $('#Agent_0 #tcode_0').val('');
        $('#Agent_0 #tell_0').val('');
        $('#Agent_0 #tcode_0').focus();
    }
    function Add_Int(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('input').first();
        var val = sel.val();
        $(sel).clone().appendTo(div);
        $(div).children('input').last().val(val);
        i_int++;
        $(div).children('input').last().attr('id','int_'+i_int);
        $('#Agent_0 #int_0').val('');
        $('#Agent_0 #int_0').focus();
    }
    function Add_Fax(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('div').first();
        $(sel).clone().appendTo(div);
        i_fax++;
        var last = $(div).children('div').last();
        $(last).find('#fcode_0').attr('id','fcode_'+i_fax);
        $(last).find('#fax_0').attr('id','fax_'+i_fax);

        $('#Agent_0 #fcode_0').val('');
        $('#Agent_0 #fax_0').val('');
        $('#Agent_0 #fcode_0').focus();
    }
    function Add_Email(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('input').first();
        var val = sel.val();
        $(sel).clone().appendTo(div);
        $(div).children('input').last().val(val);
        i_email++;
        $(div).children('input').last().attr('id','a_email_'+i_email);
        $('#Agent_0 #a_email_0').val('');
        $('#Agent_0 #a_email_0').focus();
    }
    function Add_Mobile(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('input').first();
        var val = sel.val();
        $(sel).clone().appendTo(div);
        $(div).children('input').last().val(val);
        i_mobile++;
        $(div).children('input').last().attr('id','mobile_'+i_mobile);
        $('#Agent_0 #mobile_0').val('');
        $('#Agent_0 #mobile_0').focus();
    }
    function Dell_Address(){
        $('#ConfirmDellAddress').modal('hide');
        var i = $('#DellID').val();
        $('#Address_'+i).remove();
    }
    function Add_Address() {
        $('[data-toggle="tooltip"]').tooltip("hide");
        var Current = $('#Address_0').children().clone();
        i_address++;
        $('<div class="row" id="Address_'+i_address+'"></div>').insertAfter('#Address_0');
        $('#Address_'+i_address).append(Current);
        $('#Address_'+i_address+' .Add_Address').html('<label for="desc">حذف</label><span data-toggle="modal" data-target="#ConfirmDellAddress"><button type="button" onclick="ConfirmDelete(\''+i_address+'\');" data-toggle="tooltip" title="حذف آدرس" class="btn btn-outline-danger"><i class="far fa-trash-alt fa-lg fa-fw" style="top: 2px;position: relative"></i></button></span>');
        $('#Address_'+i_address+' #province').val($('#Address_0 #province').val());
        $('#Address_'+i_address+' #city').val($('#Address_0 #city').val());
        var AddBase = $('#Address_Base').children().clone();
        $('#Address_0').html(AddBase);
        $('[data-toggle="tooltip"]').tooltip();
    }
    function Submit_Real_Form() {
        if($.trim($('#ln').val()) == ''){
            $('#Msg_R').html('نام خانوادگی را وارد نمایید');
            $('#MsgDiv_R').slideDown('slow');
            $('#MsgDiv_R').slideUp(5000);
            Scroll();
            $('#ln').focus();
            return false;
        }

        $('#Agent_0 #tell_count').val(i_tell+1);
        $('#Agent_0 #int_count').val(i_int+1);
        $('#Agent_0 #fax_count').val(i_fax+1);
        $('#Agent_0 #email_count').val(i_email+1);
        $('#Agent_0 #mobile_count').val(i_mobile+1);

        var i,j,len;
        var labels = [];
        for(i=0; i<=i_label; i++){
            if($('#label_'+i).val() != '0')
                labels[i] = $('#label_'+i).val();
        }

        var Agents = [];
        var tell = [];
        var int = [];
        var fax = [];
        var email = [];
        var mobile = [];

        for(i=0; i<=i_agent; i++){
            if($('#Agent_'+i+' #fn').val() != '' ||
                $('#Agent_'+i+' #ln').val() != '' ||
                $('#Agent_'+i+' #post').val() != '' ||
                $('#Agent_'+i+' #tell_0').val() != '' ||
                $('#Agent_'+i+' #int_0').val() != '' ||
                $('#Agent_'+i+' #fax_0').val() != '' ||
                $('#Agent_'+i+' #a_email_0').val() != '' ||
                $('#Agent_'+i+' #mobile_0').val() != ''){

                tell[i] = [];
                if($('#Agent_'+i+' #tell_count').val() != ""){
                    len = $('#Agent_'+i+' #tell_count').val();
                    for(j=0; j<len; j++){
                        if($('#Agent_'+i+' #tell_'+j).val() != '')
                            tell[i][j] = {Code:$('#Agent_'+i+' #tcode_'+j).val(),Tell:$('#Agent_'+i+' #tell_'+j).val()};
                    }
                }
                int[i] = [];
                if($('#Agent_'+i+' #int_count').val() != ""){
                    len = $('#Agent_'+i+' #int_count').val();
                    for(j=0; j<len; j++){
                        if($('#Agent_'+i+' #int_'+j).val() != '')
                            int[i].push($('#Agent_'+i+' #int_'+j).val());
                    }
                }
                fax[i] = [];
                if($('#Agent_'+i+' #fax_count').val() != ""){
                    len = $('#Agent_'+i+' #fax_count').val();
                    for(j=0; j<len; j++){
                        if($('#Agent_'+i+' #fax_'+j).val() != '')
                            fax[i][j] = {Code:$('#Agent_'+i+' #fcode_'+j).val(),Fax:$('#Agent_'+i+' #fax_'+j).val()};
                    }
                }
                email[i] = [];
                if($('#Agent_'+i+' #email_count').val() != ""){
                    len = $('#Agent_'+i+' #email_count').val();
                    for(j=0; j<len; j++){
                        if($('#Agent_'+i+' #a_email_'+j).val() != '')
                            email[i].push($('#Agent_'+i+' #a_email_'+j).val());
                    }
                }
                mobile[i] = [];
                if($('#Agent_'+i+' #mobile_count').val() != ""){
                    len = $('#Agent_'+i+' #mobile_count').val();
                    for(j=0; j<len; j++){
                        if($('#Agent_'+i+' #mobile_'+j).val() != '')
                            mobile[i].push($('#Agent_'+i+' #mobile_'+j).val());
                    }
                }

                Agents[i] = {
                    Title:$('#Agent_'+i+' #title').val(),
                    FN:$('#Agent_'+i+' #fn').val(),
                    LN:$('#Agent_'+i+' #ln').val(),
                    Post:$('#Agent_'+i+' #post').val(),
                    Department:$('#Agent_'+i+' #department').val(),
                    Desc:$('#Agent_'+i+' #desc').val(),
                    Tell:tell[i],
                    Int:int[i],
                    Fax:fax[i],
                    Email:email[i],
                    Mobile:mobile[i]
                };
            }
        }

        var Addresses = [];
        for(i=0; i<=i_address; i++){
            if($('#Address_'+i+' #province').val() != '0' && $('#Address_'+i+' #city').val() != '0'){
                Addresses[i] = {
                    Province:$('#Address_'+i+' #province').val(),
                    City:$('#Address_'+i+' #city').val(),
                    Address:$('#Address_'+i+' #address').val()
                }
            }
        }

        var Parameters = {
            Name:$('#name').val(),
            Brand:$('#brand').val(),
            Site:$('#site').val(),
            SubCat:$('#subcat').val(),
            Desc:$('#comp_desc').val(),
            Label:labels,
            Agent:Agents,
            Address:Addresses
        };

        $('#Save_Real').html('در حال ذخیره, کمی تأمل فرمایید...');
        $('#Save_Real').addClass('disabled');
        var URL = '<?php echo base_url().'company_add/insert_real'; ?>';
        $.post(URL, Parameters, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    var url = '<?php echo base_url().'company_add/G_124'; ?>';
                    $(location).attr('href',url);
                }
                else{
                    $('#Msg_R').html('خطا در ایجاد شرکت');
                    $('#MsgDiv_R').slideDown('slow',function(){
                        Scroll();
                        $('#MsgDiv_R').slideUp(5000);
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