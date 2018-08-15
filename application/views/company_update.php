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
                    <strong>ویرایش شرکت </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <form method="post" action="<?php echo base_url().'company_details/update/'.$CID; ?>" onsubmit="return Check();">
                        <div class="row rtl">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="name" class="F rtl">* نام شرکت</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" name="name" value="<?php echo $Company->Name; ?>" placeholder="نام شرکت">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="register">شماره ثبت</label>
                                <input type="number" class="form-control text-right rtl" autocomplete="off" id="register" name="register" value="<?php echo $Company->Register; ?>" placeholder="شماره ثبت">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="type">نوع شرکت</label>
                                <select name="type" class="form-control" id="type">
                                    <option value="نا مشخص" <?php if($Company->Type == 'نا مشخص') echo 'selected'; ?>>نا مشخص</option>
                                    <option value="با مسئولیت محدود" <?php if($Company->Type == 'با مسئولیت محدود') echo 'selected'; ?>>با مسئولیت محدود</option>
                                    <option value="سهامی خاص" <?php if($Company->Type == 'سهامی خاص') echo 'selected'; ?>>سهامی خاص</option>
                                    <option value="سهامی عام" <?php if($Company->Type == 'سهامی عام') echo 'selected'; ?>>سهامی عام</option>
                                    <option value="تضامنی" <?php if($Company->Type == 'تضامنی') echo 'selected'; ?>>تضامنی</option>
                                    <option value="مختلط غیرسهامی" <?php if($Company->Type == 'مختلط غیرسهامی') echo 'selected'; ?>>مختلط غیرسهامی</option>
                                    <option value="مختلط سهامی" <?php if($Company->Type == 'مختلط سهامی') echo 'selected'; ?>>مختلط سهامی</option>
                                    <option value="تعاونی" <?php if($Company->Type == 'تعاونی') echo 'selected'; ?>>تعاونی</option>
                                    <option value="نسبی" <?php if($Company->Type == 'نسبی') echo 'selected'; ?>>نسبی</option>
                                </select>

                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="name" class="rtl">برند</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="brand" name="brand" value="<?php echo $Company->Brand; ?>" placeholder="برند شرکت">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="ceo">مدیر عامل</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="ceo" name="ceo" value="<?php echo $Company->CEO; ?>" placeholder="مدیر عامل">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="mobile" class="rtl">همراه</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="mobile" name="mobile" value="<?php echo $Company->Mobile; ?>" placeholder="تلفن همراه">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="tell" class="rtl">تلفن</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="tell" name="tell" value="<?php echo $Company->Tell; ?>" placeholder="تلفن">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="fax" class="rtl">فکس</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="fax" name="fax" value="<?php echo $Company->Fax; ?>" placeholder="فکس">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="site" class="rtl">سایت</label>
                                <input type="text" class="form-control text-left ltr" autocomplete="off" id="site" name="site" value="<?php echo $Company->Site; ?>" placeholder="سایت">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="email" class="rtl">ایمیل</label>
                                <input type="text" class="form-control text-left ltr" autocomplete="off" id="email" name="email" value="<?php echo $Company->Email; ?>" placeholder="ایمیل">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="cat">دسته</label>
                                <select name="category" class="form-control" onchange="FeedSubCat(this.value);" id="cat">
                                    <option value="0">انتخاب دسته</option>
                                    <?php
                                    foreach ($Category as $row){
                                        ?>
                                        <option value="<?php echo $row->CID; ?>" <?php if($Company->Category_ID == $row->CID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="subcat">زیردسته</label>
                                <select name="subcategory" class="form-control" id="subcat">
                                    <option value="0">انتخاب زیردسته</option>
                                    <?php
                                    foreach ($SubCategory as $row){
                                        ?>
                                        <option value="<?php echo $row->SCID; ?>" <?php if($Company->SubCategory_ID == $row->SCID) echo 'selected'; ?>><?php echo $row->STitle; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-8 form-group text-right">
                                <label for="address" class="rtl">آدرس</label>
                                <textarea cols="100%" class="form-control text-right rtl" id="address" name="address" placeholder="آدرس"><?php echo $Company->Address; ?></textarea>
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" name="UpdateCompany" value="true" class="btn btn-primary">بروز رسانی شرکت</button>
                            </div>
                            <div class="col-md-12 col-lg-12 form-group text-right rtl" style="color: #ff6156;">
                                <?php echo validation_errors(); ?>
                            </div>
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
                <h4 class="modal-title" style="">حذف نماینده</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن نماینده اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <button type="button" class="btn btn-danger" onclick="DeleteAgent();">حذف</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ConfirmDellAdd" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header rtl">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" style="">حذف آدرس</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن آدرس شرکت اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <button type="button" class="btn btn-danger" onclick="DeleteAddress();">حذف</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ConfirmDellTell" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header rtl">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" style="">حذف تلفن</h4>
            </div>
            <div class="modal-body text-right">
                <p>آیا از پاک کردن تلفن آدرس شرکت اطمینان دارید؟</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">انصراف</button>
                <button type="button" class="btn btn-danger" onclick="DeleteTell();">حذف</button>
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

    function FeedSubCat(val) {
        var URL = '<?php print(base_url().'category/get_subcat');?>';
        $.post(URL, {CID:val}, function (res, ret) {
            if(ret == 'success'){
                $('#subcat').html('<option value="0">انتخاب زیردسته</option>');
                var Json = $.parseJSON(res);
                $(Json).each(function(k,v){
                    $('#subcat').append('<option value="'+v['SCID']+'">'+v['STitle']+'</option>');
                });

            }
        });
    }

    function ConfirmDelete(aid){
        $('#DellID').val(aid);
    }

    function DeleteAgent() {
        var URL = '<?php print(base_url().'company_details/delete_agent');?>';
        var aid = $('#DellID').val();
        $.post(URL, {AID:aid}, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    $('#ConfirmDell').modal('hide');
                    $('#Agent_'+aid).slideUp('slow',function(){$('#Agent_'+aid).remove();});
                    $('#Msg_G').html('نماینده با موفقیت حذف گردید');
                    $('#MsgDiv_G').fadeIn('slow',function(){
                        Scroll();
                        $('#MsgDiv_G').fadeOut(5000);
                    });
                }
            }
        });
    }

    function DeleteAddress() {
        var URL = '<?php print(base_url().'company_details/delete_address');?>';
        var aid = $('#DellID').val();
        $.post(URL, {AID:aid}, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    $('#ConfirmDellAdd').modal('hide');
                    $('#Address_'+aid).slideUp('slow',function(){
                        $('#Address_'+aid).remove();
                    });
                    $('#Tells_'+aid).slideUp('slow',function(){
                        $('#Tells_'+aid).remove();
                    });

                    $('#TellDiv_'+aid).slideUp('slow',function(){
                        $('#TellDiv_'+aid).remove();
                    });


                    $('#Msg_G').html('آدرس شرکت با موفقیت حذف گردید');
                    $('#MsgDiv_G').fadeIn('slow',function(){
                        Scroll();
                        $('#MsgDiv_G').fadeOut(5000);
                    });
                }
            }
        });
    }

    function DeleteTell() {
        var URL = '<?php print(base_url().'company_details/delete_tell');?>';
        var tid = $('#DellID').val();
        $.post(URL, {TID:tid}, function (res, ret) {
            if(ret == 'success'){
                if(res == '1'){
                    $('#ConfirmDellTell').modal('hide');
                    $('#Tell_'+tid).slideUp('slow',function(){$('#Tell_'+tid).remove();});
                    $('#Msg_G').html('تلفن آدرس شرکت با موفقیت حذف گردید');
                    $('#MsgDiv_G').fadeIn('slow',function(){
                        Scroll();
                        $('#MsgDiv_G').fadeOut(5000);
                    });
                }
            }
        });
    }

    function AddAgent() {
        var cid = '<?php echo $Company->CID ?>';
        var fn = $.trim($('#fn').val());
        var ln = $.trim($('#ln').val());
        var section = $.trim($('#section').val());
        var post = $.trim($('#post').val());
        var tell = $.trim($('#tell').val());
        var mobile = $.trim($('#mobile').val());
        var email = $.trim($('#email').val());
        var snid = $.trim($('#snid').val());

        if(fn == ''){
            $('#Msg_R').html('نام خالی میباشد');
            $('#MsgDiv_R').fadeIn('slow',function(){
                Scroll();
                $('#MsgDiv_R').fadeOut(5000);
            });
            $('#fn').focus();
            return false;
        }
        if(ln == ''){
            $('#Msg_R').html('نام خانوادگی خالی میباشد');
            $('#MsgDiv_R').fadeIn('slow',function(){
                Scroll();
                $('#MsgDiv_R').fadeOut(5000);
            });
            $('#ln').focus();
            return false;
        }
        else{
            var URL = '<?php print(base_url().'add_company/add_agent');?>';

            $.post(URL, {CID:cid, FN:fn, LN:ln, Section:section, Post:post, Tell:tell, Mobile:mobile, Email:email, SNID:snid}, function (res, ret) {
                if(ret == 'success'){
                    if(res != '-1'){
                        $('#Agents').after('<div class="row rtl" id="Agent_'+res+'"></div>');
                        $.get('<?php print(base_url().'htm/agent.html');?>', function(data) {
                            $('#Agent_'+res).append(data);
                            $('#Agent_'+res+' #FN').html(fn);
                            $('#Agent_'+res+' #LN').html(ln);
                            $('#Agent_'+res+' #Section').html(section);
                            $('#Agent_'+res+' #Post').html(post);
                            $('#Agent_'+res+' #Tell').html(tell);
                            $('#Agent_'+res+' #Mobile').html(mobile);
                            $('#Agent_'+res+' #Email').html(email);
                            $('#Agent_'+res+' #SNID').html(snid);
                            $('#Agent_'+res+' #DeleteButton').attr('onclick','ConfirmDelete(\''+res+'\')');
                            $('#Msg_G').html('نماینده با موفقیت ایجاد گردید');
                            $('#MsgDiv_G').fadeIn('slow',function(){
                                Scroll();
                                $('#MsgDiv_G').fadeOut(5000);
                            });
                            $('#fn').val('');
                            $('#ln').val('');
                            $('#section').val('');
                            $('#post').val('');
                            $('#tell').val('');
                            $('#mobile').val('');
                            $('#email').val('');
                            $('#snid').val('');
                        });
                    }
                }
            });
        }
    }

    function AddAddress() {
        var cid = '<?php echo $Company->CID ?>';
        var province = $.trim($('#province').val());
        var prov_text = $('#province option:selected').text();
        var county = $.trim($('#county').val());
        var coun_text = $('#county option:selected').text();
        var title = $.trim($('#title').val());
        var address = $.trim($('#address').val());

        if(province == '0'){
            $('#Msg_R').html('استان خالی میباشد');
            $('#MsgDiv_R').fadeIn('slow',function(){
                Scroll();
                $('#MsgDiv_R').fadeOut(5000);
            });
            $('#province').focus();
            return false;
        }
        if(county == '0'){
            $('#Msg_R').html('شهرستان خالی میباشد');
            $('#MsgDiv_R').fadeIn('slow',function(){
                Scroll();
                $('#MsgDiv_R').fadeOut(5000);
            });
            $('#county').focus();
            return false;
        }
        else{
            var URL = '<?php print(base_url().'add_company/add_address');?>';

            $.post(URL, {CID:cid, Province:province, County:county, Title:title, Address:address}, function (res, ret) {
                if(ret == 'success'){
                    if(res != '-1'){
                        $('#Addresses').after('<div class="row rtl" id="Address_'+res+'"></div>');
                        $.get('<?php print(base_url().'htm/address.html');?>', function(data) {
                            $('#Address_'+res).append(data);
                            $('#Address_'+res+' #Province').html(prov_text);
                            $('#Address_'+res+' #County').html(coun_text);
                            $('#Address_'+res+' #Title').html(title);
                            $('#Address_'+res+' #Address').html(address);
                            $('#Address_'+res+' #DeleteButton').attr('onclick','ConfirmDelete(\''+res+'\')');
                            $('#Msg_G').html('آدرس با موفقیت ایجاد گردید');
                            $('#MsgDiv_G').fadeIn('slow',function(){
                                Scroll();
                                $('#MsgDiv_G').fadeOut(5000);
                            });
                            $('#province').val('0');
                            $('#county').html('<option value="0">انتخاب شهرستان</option>');
                            $('#county').val('0');
                            $('#title').val('');
                            $('#address').val('');
                        });

                        $('#Address_'+res).after('<div class="row rtl" id="Tells_'+res+'"></div>');
                        $.get('<?php print(base_url().'htm/tell.html');?>', function(data) {
                            $('#Tells_'+res).append(data);
                            $('#Tells_'+res+' #AddTellButton').attr('onclick','AddTell(\''+res+'\')');
                        });
                        $('#Tells_'+res).after('<div id="TellDiv_'+res+'"></div>');
                    }
                }
            });
        }
    }

    function AddTell(aid) {
        var title = $.trim($('#Tells_'+aid+' #title').val());
        var tell = $.trim($('#Tells_'+aid+' #tell').val());
        var fax = $.trim($('#Tells_'+aid+' #fax').val());

        if(tell == ''){
            $('#Msg_R').html('تلفن خالی میباشد');
            $('#MsgDiv_R').fadeIn('slow',function(){
                Scroll();
                $('#MsgDiv_R').fadeOut(5000);
            });
            $('#Tells_'+aid+' #tell').focus();
            return false;
        }
        else{
            var URL = '<?php print(base_url().'add_company/add_tell');?>';

            $.post(URL, {AID:aid, Title:title, Tell:tell, Fax:fax}, function (res, ret) {
                if(ret == 'success'){
                    if(res != '-1'){
                        $('#TellDiv_'+aid).prepend('<div class="row rtl" id="Tell_'+res+'">');
                        $.get('<?php print(base_url().'htm/add_tell.html');?>', function(data) {
                            $('#Tell_'+res).append(data);
                            $('#Tell_'+res+' #Title').html(title);
                            $('#Tell_'+res+' #Tell').html(tell);
                            $('#Tell_'+res+' #Fax').html(fax);
                            $('#Tell_'+res+' #DeleteTellButton').attr('onclick','ConfirmDelete(\''+res+'\')');
                            $('#Msg_G').html('تلفن با موفقیت ایجاد گردید');
                            $('#MsgDiv_G').fadeIn('slow',function(){
                                Scroll();
                                $('#MsgDiv_G').fadeOut(5000);
                            });
                            $('#Tells_'+aid+' #title').val('');
                            $('#Tells_'+aid+' #tell').val('');
                            $('#Tells_'+aid+' #fax').val('');
                        });
                    }
                }
            });
        }
    }

    function FeedCounty(val) {
        var URL = '<?php print(base_url().'company_details/get_county');?>';
        $.post(URL, {PID:val}, function (res, ret) {
            if(ret == 'success'){
                $('#county').html('<option value="0">انتخاب شهرستان</option>');
                if(res){
                    var Json = $.parseJSON(res);
                    $(Json).each(function(k,v){
                        $('#county').append('<option value="'+v['id']+'">'+v['name']+'</option>');
                    });
                }
            }
        });
    }

    function Check() {
        if($.trim($('#name').val()) == ''){
            $('#Msg_R').html('نام شرکت را وارد نمایید');
            $('#MsgDiv_R').fadeIn('slow');
            $('#MsgDiv_R').fadeOut(5000);
            $('#name').focus();
            return false;
        }
        if($('#cat').val() == '0'){
            $('#Msg_R').html('دسته را انتخاب نمایید');
            $('#MsgDiv_R').fadeIn('slow');
            $('#MsgDiv_R').fadeOut(5000);
            $('#cat').focus();
            return false;
        }
        if($('#subcat').val() == '0'){
            $('#Msg_R').html('زیردسته را انتخاب نمایید');
            $('#MsgDiv_R').fadeIn('slow');
            $('#MsgDiv_R').fadeOut(5000);
            $('#subcat').focus();
            return false;
        }

        return true;
    }

</script>
<?php
$this->load->view('footer');
?>
</body>
</html>