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
                    <strong>مشخصات شرکت </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body">
                    <div class="form-group text-right">
                        <label for="name">نام شرکت</label>
                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" name="name" value="<?php echo $Company->Name; ?>" placeholder="نام شرکت" readonly>
                    </div>
                    <div class="form-group text-right">
                        <label for="register">شماره ثبت</label>
                        <input type="number" class="form-control text-right rtl" autocomplete="off" id="register" name="register" value="<?php echo $Company->Register; ?>" placeholder="شماره ثبت" readonly>
                    </div>
                    <div class="form-group text-right">
                        <label for="type">نوع شرکت</label>
                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" name="name" value="<?php echo $Company->Type; ?>" placeholder="نام شرکت" readonly>
                    </div>
                    <div class="form-group text-right">
                        <label for="ceo">مدیر عامل</label>
                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="ceo" name="ceo" value="<?php echo $Company->CEO; ?>" placeholder="مدیر عامل" readonly>
                    </div>
                    <div class="form-group text-right">
                        <label for="cat">دسته</label>
                        <select name="category" class="form-control" onchange="FeedSubCat(this.value);" id="cat" disabled>
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
                    <div class="form-group text-right">
                        <label for="subcat">زیردسته</label>
                        <select name="subcategory" class="form-control" id="subcat" disabled>
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
                    <!-- ******************************************************************************************************************** -->
                    <div class="form-group text-right">
                        <strong>نماینده</strong>
                    </div>
                    <div class="row rtl" id="Agents">
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            <span>عنوان</span>
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="add" name="add" value="<?php echo set_value('add'); ?>" placeholder="عنوان">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            <span>نام</span>
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="fn" name="fn" value="<?php echo set_value('fn'); ?>" placeholder="نام">
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <span class="F">* نام خانوادگی</span>
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="ln" name="ln" value="<?php echo set_value('ln'); ?>" placeholder="نام خانوادگی">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            دپارتمان
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="section" name="section" value="<?php echo set_value('section'); ?>" placeholder="دپارتمان">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            سمت
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" name="post" value="<?php echo set_value('post'); ?>" placeholder="سمت">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            تلفن
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="tell" name="tell" value="<?php echo set_value('tell'); ?>" placeholder="تلفن">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            همراه
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="mobile" name="mobile" value="<?php echo set_value('mobile'); ?>" placeholder="همراه">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group text-right">
                            ایمیل
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="email" name="email" value="<?php echo set_value('email'); ?>" placeholder="ایمیل">
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            توضیحات
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="snid" name="snid" value="<?php echo set_value('snid'); ?>" placeholder="توضیحات">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group">
                            افزودن
                            <button type="button" onclick="AddAgent();" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                        </div>
                    </div>
                    <?php
                    foreach ($Agents as $row){
                        ?>
                        <div class="row rtl" id="Agent_<?php echo $row->AID; ?>">
                            <div class="col-12"><hr></div>
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <label><?php echo $row->FN; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->LN; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <label><?php echo $row->Section; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <label><?php echo $row->Post; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <label><?php echo $row->Tell; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <label><?php echo $row->Mobile; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->Email; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->SocialNID; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group">
                                <button type="button" onclick="ConfirmDelete('<?php echo $row->AID; ?>');" data-toggle="modal" data-target="#ConfirmDell" class="btn btn-outline-danger"><i class="fas fa-times fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                    <!-- ******************************************************************************************************************** -->
                    <hr>
                    <div class="form-group text-right">
                        <strong>آدرس</strong>
                    </div>
                    <div class="row rtl" id="Addresses">
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            <span class="F">* استان</span>
                            <select name="province" class="form-control" onchange="FeedCounty(this.value);" id="province">
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
                            <span class="F">* شهرستان</span>
                            <select name="county" class="form-control" id="county">
                                <option value="0">انتخاب شهرستان</option>
                            </select>
                        </div>
                        <div class="col-md-12 col-lg-2 form-group text-right">
                            عنوان
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="title" name="title" value="<?php echo set_value('title'); ?>" placeholder="دفتر مرکزی، کارخانه">
                        </div>
                        <div class="col-md-12 col-lg-5 form-group text-right">
                            آدرس
                            <input type="text" class="form-control text-right rtl" autocomplete="off" id="address" name="address" value="<?php echo set_value('address'); ?>" placeholder="آدرس">
                        </div>
                        <div class="col-md-12 col-lg-1 form-group">
                            افزودن
                            <button type="button" onclick="AddAddress();" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                        </div>
                    </div>
                    <?php
                    foreach ($Addresses as $row){
                        ?>
                        <div class="row rtl" id="Address_<?php echo $row->AID; ?>">
                            <div class="col-12"><hr></div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->Province; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->County; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label><?php echo $row->Title; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-5 form-group text-right">
                                <label><?php echo $row->Address; ?></label>
                            </div>
                            <div class="col-md-12 col-lg-1 form-group">
                                <button type="button" onclick="ConfirmDelete('<?php echo $row->AID; ?>');" data-toggle="modal" data-target="#ConfirmDellAdd" class="btn btn-outline-danger"><i class="fas fa-times fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                            </div>
                        </div>
                        <div class="row rtl" id="Tells_<?php echo $row->AID; ?>">
                            <div class="col-md-12 col-lg-1 form-group text-right">
                                <strong>تلفن</strong>
                            </div>
                            <div class="col-md-12 col-lg-4 form-group text-right">
                                عنوان
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="title" placeholder="دبیرخانه">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <span class="F">* تلفن</span>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="tell" placeholder="تلفن">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                فکس
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="fax" placeholder="فکس">
                            </div>
                            <div class="col-md-12 col-lg-1 form-group">
                                افزودن
                                <button type="button" onclick="AddTell('<?php echo $row->AID; ?>');" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                            </div>
                        </div>
                        <div id="TellDiv_<?php echo $row->AID; ?>"><?php
                            $i=1;
                            foreach ($Tells as $tell){
                                if($tell->AID == $row->AID){
                                    ?>
                                    <div class="row rtl" id="Tell_<?php echo $tell->TID; ?>">
                                        <div class="col-md-12 col-lg-1 form-group text-right">
                                            <?php echo $i++; ?>.
                                        </div>
                                        <div class="col-md-12 col-lg-4 form-group text-right">
                                            <label><?php echo $tell->Title; ?></label>
                                        </div>
                                        <div class="col-md-12 col-lg-3 form-group text-right">
                                            <label><?php echo $tell->Tell; ?></label>
                                        </div>
                                        <div class="col-md-12 col-lg-3 form-group text-right">
                                            <label><?php echo $tell->Fax; ?></label>
                                        </div>
                                        <div class="col-md-12 col-lg-1 form-group">
                                            <button type="button" onclick="ConfirmDelete('<?php echo $tell->TID; ?>');" data-toggle="modal" data-target="#ConfirmDellTell" class="btn btn-outline-danger"><i class="fas fa-times fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                                        </div>
                                    </div>
                                <?php
                                }
                            }
                        ?></div>
                    <?php
                    }
                    ?>
                    <!-- ******************************************************************************************************************** -->
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
        var add = $.trim($('#add').val());
        var fn = $.trim($('#fn').val());
        var ln = $.trim($('#ln').val());
        var section = $.trim($('#section').val());
        var post = $.trim($('#post').val());
        var tell = $.trim($('#tell').val());
        var mobile = $.trim($('#mobile').val());
        var email = $.trim($('#email').val());
        var snid = $.trim($('#snid').val());

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
                            $('#Agent_'+res+' #ADD').html(add);
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
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>