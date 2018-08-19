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
                    <div class="row rtl">
                        <div class="col-12 form-group Links">
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
                    <hr>
                    <div class="rtl">
                        <div class="col-7 col-sm-4 col-md-3 col-lg-2 form-group row">
                            <label for="category">نوع شرکت</label>
                            <input type="text" id="category" class="form-control" readonly value="<?php echo $Company->Category; ?>">
                        </div>
                        <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_Label(this);" id="Delete_Label_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_Tell(this);" id="Delete_Tell_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <!--***************************************************************************** Agent_Base Start -->
                        <div class="row" id="Agent_Base" style="display: none;">
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
                                <label for="ln">نام خانوادگی</label>
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
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="desc">توضیحات</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="desc" placeholder="توضیحات">
                            </div>
                            <div class="col-md-12 col-lg-1 form-group Add_Agent">
                                <label for="desc">جدید</label>
                                <button type="button" onclick="Add_Agent();" data-toggle="tooltip" title="افزودن پرسنل" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                            </div>
                        </div>
                        <!--***************************************************************************** Agent_Base End -->
                        <div class="row" id="Address_Base" style="display: none;">
                            <div class="col-12">
                                <hr>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="province">استان</label>
                                <select class="form-control" onchange="FeedCounty(this.value,this);" id="province">
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
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="name" class="F">* نام شرکت</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" placeholder="نام شرکت" value="<?php echo $Company->Name; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="register">شماره ثبت</label>
                                <input type="number" class="form-control text-right rtl" autocomplete="off" id="register" placeholder="شماره ثبت" value="<?php echo $Company->Register; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="type">نوع شرکت</label>
                                <select class="form-control" id="type">
                                    <option value="نا مشخص" <?php if($Company->Type == 'نا مشخص')echo 'selected'; ?>>نا مشخص</option>
                                    <option value="با مسئولیت محدود" <?php if($Company->Type == 'با مسئولیت محدود')echo 'selected'; ?>>با مسئولیت محدود</option>
                                    <option value="سهامی خاص" <?php if($Company->Type == 'سهامی خاص')echo 'selected'; ?>>سهامی خاص</option>
                                    <option value="سهامی عام" <?php if($Company->Type == 'سهامی عام')echo 'selected'; ?>>سهامی عام</option>
                                    <option value="تضامنی" <?php if($Company->Type == 'تضامنی')echo 'selected'; ?>>تضامنی</option>
                                    <option value="مختلط غیرسهامی" <?php if($Company->Type == 'مختلط غیرسهامی')echo 'selected'; ?>>مختلط غیرسهامی</option>
                                    <option value="مختلط سهامی" <?php if($Company->Type == 'مختلط سهامی')echo 'selected'; ?>>مختلط سهامی</option>
                                    <option value="تعاونی" <?php if($Company->Type == 'تعاونی')echo 'selected'; ?>>تعاونی</option>
                                    <option value="نسبی" <?php if($Company->Type == 'نسبی')echo 'selected'; ?>>نسبی</option>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="brand">برند</label>
                                <input type="text" class="form-control text-right rtl" autocomplete="off" id="brand" placeholder="برند شرکت" value="<?php echo $Company->Brand; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="site">سایت</label>
                                <input type="text" class="form-control text-left ltr" autocomplete="off" id="site" placeholder="سایت" value="<?php echo $Company->Site; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="email">ایمیل</label>
                                <input type="text" class="form-control text-left ltr" autocomplete="off" id="email" placeholder="ایمیل" value="<?php echo $Company->Email; ?>">
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="cat">انتخاب دسته</label>
                                <select class="form-control" onchange="FeedSubCat(this.value);" id="cat">
                                    <option value="0">انتخاب دسته</option>
                                    <?php
                                    foreach ($Category as $row){
                                        ?>
                                        <option value="<?php echo $row->CID; ?>" <?php if($Company->cat == $row->CID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
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
                                        <option value="<?php echo $row->SCID; ?>" <?php if($Company->SubCategory_ID == $row->SCID) echo 'selected'; ?>><?php echo $row->STitle; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-5 form-group text-right">
                                <label for="comp_desc">توضیحات</label>
                                <input type="text" class="form-control" autocomplete="off" id="comp_desc" placeholder="توضیحات" value="<?php echo $Company->Description; ?>">
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <button type="button" onclick="Add_Label(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                <label for="label_0">برچسب</label>
                                <?php
                                $len = count($Label);
                                if($len == 0){
                                    $i_label = 0;
                                    ?>
                                    <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_Label(this);" id="del_label_0">
                                        <button type="button" class="btn btn-outline-danger p-0">
                                            <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                    </div>

                                    <?php
                                }
                                else {
                                    for ($i_label = 0; $i_label < $len; $i_label++) {
                                        if ($i_label > 0) {
                                            ?>
                                            <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_Label(this);" id="del_label_<?php echo $i_label; ?>">
                                                <button type="button" class="btn btn-outline-danger p-0">
                                                    <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                </button>
                                            </div>
                                            <?php
                                        }
                                        ?>
                                        <select class="form-control p-1 mb-1" id="label_<?php echo $i_label; ?>" onmouseover="Show_Delete(this);">
                                            <option value="0">انتخاب برچسب</option>
                                            <?php
                                            foreach ($Company_Label as $row) {
                                                ?>
                                                <option value="<?php echo $row->LID; ?>" <?php if ($row->LID == $Label[$i_label]->Label_ID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <button type="button" onclick="Add_CTell(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                <label for="ctcode_0">تلفن</label>
                                <?php
                                $len = count($Tell);
                                if($len == 0){
                                    $i_ctell = 0;
                                    ?>
                                    <div class="input-group ltr mb-1">
                                        <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <input class="input-group-text p-0 border-0" placeholder="کد" id="ctcode_0" size="1">
                                                </span>
                                        </div>
                                        <input type="text" class="form-control p-1" placeholder="تلفن" id="ctell_0">
                                    </div>
                                    <?php
                                }
                                else {
                                    for ($i_ctell = 0; $i_ctell < $len; $i_ctell++) {
                                        ?>
                                        <div class="input-group ltr mb-1">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <input class="input-group-text p-0 border-0" placeholder="کد" id="ctcode_<?php echo $i_ctell; ?>" size="1" value="<?php echo $Tell[$i_ctell]->Code; ?>">
                                                </span>
                                            </div>
                                            <input type="text" class="form-control p-1" placeholder="تلفن" id="ctell_<?php echo $i_ctell; ?>" value="<?php echo $Tell[$i_ctell]->Tell; ?>">
                                        </div>
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="ttitle_0">توضیحات</label>
                                <?php
                                if($len == 0){
                                    ?>
                                    <input type="text" class="form-control text-right rtl mb-1" autocomplete="off" id="ttitle_0" placeholder="توضیحات">
                                    <?php
                                }
                                else {
                                    for ($i_ctell = 0; $i_ctell < $len; $i_ctell++) {
                                        ?>
                                        <input type="text" class="form-control text-right rtl mb-1" autocomplete="off" id="ttitle_<?php echo $i_ctell; ?>" placeholder="توضیحات" value="<?php echo $Tell[$i_ctell]->Title; ?>">
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <button type="button" onclick="Add_CFax(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                <label for="cfcode_0">فکس</label>
                                <?php
                                $len = count($Fax);
                                if($len == 0){
                                    $i_cfax = 0;
                                    ?>
                                    <div class="input-group ltr mb-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><input class="input-group-text p-0 border-0" placeholder="کد" id="cfcode_0" size="1"></span>
                                        </div>
                                        <input type="text" class="form-control p-1" placeholder="فکس" id="cfax_0">
                                    </div>
                                    <?php
                                }
                                else {
                                    for ($i_cfax = 0; $i_cfax < $len; $i_cfax++) {
                                        ?>
                                        <div class="input-group ltr mb-1">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <input class="input-group-text p-0 border-0" placeholder="کد" id="cfcode_<?php echo $i_cfax; ?>" size="1" value="<?php echo $Fax[$i_cfax]->Code; ?>">
                                                </span>
                                            </div>
                                            <input type="text" class="form-control p-1" placeholder="فکس" id="cfax_<?php echo $i_cfax; ?>" value="<?php echo $Fax[$i_cfax]->Fax; ?>">
                                        </div>
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                            <div class="col-md-12 col-lg-2 form-group text-right">
                                <label for="ftitle_0">توضیحات</label>
                                <?php
                                if($len == 0){
                                    ?>
                                    <input type="text" class="form-control text-right rtl mb-1" autocomplete="off" id="ftitle_0" placeholder="توضیحات">
                                    <?php
                                }
                                else {
                                    for ($i_cfax = 0; $i_cfax < $len; $i_cfax++) {
                                        ?>
                                        <input type="text" class="form-control text-right rtl mb-1" autocomplete="off"
                                               id="ftitle_<?php echo $i_cfax; ?>" placeholder="توضیحات"
                                               value="<?php echo $Fax[$i_cfax]->Title; ?>">
                                        <?php
                                    }
                                }
                                ?>
                            </div>
                        </div>
                        <?php
                        $len = count($Agent);
                        if($len == 0){
                            $i_agent = 0;
                            ?>
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
                                    <label for="ln">نام خانوادگی</label>
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
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="desc">توضیحات</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="desc" placeholder="توضیحات">
                                </div>
                                <div class="col-md-12 col-lg-1 form-group Add_Agent">
                                    <label for="desc">جدید</label>
                                    <button type="button" onclick="Add_Agent();" data-toggle="tooltip" title="افزودن پرسنل" class="btn btn-outline-success"><i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i></button>
                                </div>
                            </div>
                            <?php
                        }
                        else {
                            for ($i_agent = 0; $i_agent < $len; $i_agent++) {
                                ?>
                                <div class="row" id="Agent_<?php echo $i_agent;?>">
                                    <div class="col-12">
                                        <hr>
                                    </div>
                                    <div class="col-md-12 col-lg-1 form-group text-right">
                                        <label for="title">عنوان</label>
                                        <select class="form-control p-0" id="title">
                                            <option value="آقای" <?php if($Agent[$i_agent]['Agent']->Prefix == "آقای") echo 'selected';?>>آقای</option>
                                            <option value="خانم" <?php if($Agent[$i_agent]['Agent']->Prefix == "خانم") echo 'selected';?>>خانم</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="fn">نام</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="fn" placeholder="نام" value="<?php echo $Agent[$i_agent]['Agent']->FN;?>">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="ln">نام خانوادگی</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="ln" placeholder="نام خانوادگی" value="<?php echo $Agent[$i_agent]['Agent']->LN;?>">
                                    </div>
                                    <div class="col-md-12 col-lg-5 form-group text-right">
                                        <label for="post">عنوان شغلی</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" placeholder="عنوان شغلی" value="<?php echo $Agent[$i_agent]['Agent']->Post;?>">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="department">بخش</label>
                                        <select class="form-control" id="department">
                                            <option value="0">انتخاب دپارتمان</option>
                                            <?php
                                            foreach ($Department as $row) {
                                                ?>
                                                <option value="<?php echo $row->DID; ?>" <?php if ($row->DID == $Agent[$i_agent]['Agent']->Department_ID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="Add_Tell(this);" class="btn btn-outline-info p-0">
                                            <i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                        <label for="tcode">تلفن</label>
                                        <?php
                                        $len_t = count($Agent[$i_agent]['Tell']);
                                        if($len_t == 0){
                                            $i_tell = 0;
                                            ?>
                                            <div class="input-group ltr mb-1">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <input class="input-group-text p-0 border-0" placeholder="کد" id="tcode_0" size="1">
                                                </span>
                                                </div>
                                                <input type="text" class="form-control p-1" placeholder="تلفن" id="tell_0">
                                            </div>
                                            <?php
                                        }
                                        else{
                                            for($i_tell=0; $i_tell<$len_t; $i_tell++){
                                                ?>
                                                <div class="input-group ltr mb-1">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <input class="input-group-text p-0 border-0" placeholder="کد" id="tcode_<?php echo $i_tell;?>" size="1" value="<?php echo $Agent[$i_agent]['Tell'][$i_tell]->Code; ?>">
                                                        </span>
                                                    </div>
                                                    <input type="text" class="form-control p-1" placeholder="تلفن" id="tell_<?php echo $i_tell;?>" value="<?php echo $Agent[$i_agent]['Tell'][$i_tell]->Tell; ?>">
                                                </div>
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="hidden" id="tell_count">
                                    </div>
                                    <div class="col-md-12 col-lg-1 form-group text-right p-lg-0">
                                        <button type="button" onclick="Add_Int(this);" class="btn btn-outline-info p-0">
                                            <i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                        <label for="int">داخلی</label>
                                        <?php
                                        $len_i = count($Agent[$i_agent]['Internal']);
                                        if($len_i == 0){
                                            $i_int = 0;
                                            ?>
                                            <input type="text" class="form-control ltr text-left mb-1" placeholder="داخلی" id="int_0">
                                            <?php
                                        }
                                        else{
                                            for($i_int=0; $i_int<$len_i; $i_int++) {
                                                ?>
                                                <input type="text" class="form-control ltr text-left mb-1" placeholder="داخلی" id="int_<?php echo $i_int;?>" value="<?php echo $Agent[$i_agent]['Internal'][$i_int]->Internal; ?>">
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="hidden" id="int_count">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="Add_Fax(this);" class="btn btn-outline-info p-0">
                                            <i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                        <label for="fcode">فکس</label>
                                        <?php
                                        $len_f = count($Agent[$i_agent]['Fax']);
                                        if($len_f == 0){
                                            $i_fax = 0;
                                            ?>
                                            <div class="input-group ltr mb-1">
                                                <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <input class="input-group-text p-0 border-0" placeholder="کد" id="fcode_0" size="1">
                                                </span>
                                                </div>
                                                <input type="text" class="form-control p-1" placeholder="فکس" id="fax_0">
                                            </div>
                                            <?php
                                        }
                                        else{
                                            for($i_fax=0; $i_fax<$len_f; $i_fax++){
                                                ?>
                                                <div class="input-group ltr mb-1">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">
                                                            <input class="input-group-text p-0 border-0" placeholder="کد" id="fcode_<?php echo $i_fax;?>" size="1" value="<?php echo $Agent[$i_agent]['Fax'][$i_fax]->Code; ?>">
                                                        </span>
                                                    </div>
                                                    <input type="text" class="form-control p-1" placeholder="فکس" id="fax_<?php echo $i_fax;?>" value="<?php echo $Agent[$i_agent]['Fax'][$i_fax]->Fax; ?>">
                                                </div>
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="hidden" id="fax_count">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="Add_Email(this);" class="btn btn-outline-info p-0">
                                            <i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                        <label for="a_email">ایمیل</label>
                                        <?php
                                        $len_e = count($Agent[$i_agent]['Email']);
                                        if($len_e == 0) {
                                            $i_email = 0;
                                            ?>
                                            <input type="text" class="form-control ltr text-left mb-1" placeholder="ایمیل" id="a_email_0">
                                            <?php
                                        }
                                        else{
                                            for($i_email=0; $i_email<$len_e; $i_email++){
                                                ?>
                                                <input type="text" class="form-control ltr text-left mb-1" placeholder="ایمیل" id="a_email_<?php echo $i_email;?>" value="<?php echo $Agent[$i_agent]['Email'][$i_email]->Email; ?>">
                                            <?php
                                            }
                                        }
                                        ?>
                                        <input type="hidden" id="email_count">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="Add_Mobile(this);" class="btn btn-outline-info p-0">
                                            <i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i>
                                        </button>
                                        <label for="mobile">همراه</label>
                                        <?php
                                        $len_m = count($Agent[$i_agent]['Mobile']);
                                        if($len_m == 0) {
                                            $i_mobile = 0;
                                            ?>
                                            <input type="text" class="form-control ltr text-left mb-1" placeholder="همراه" id="mobile_0">
                                            <?php
                                        }
                                        else{
                                            for($i_mobile=0; $i_mobile<$len_m; $i_mobile++){
                                                ?>
                                                <input type="text" class="form-control ltr text-left mb-1" placeholder="همراه" id="mobile_<?php echo $i_mobile;?>" value="<?php echo $Agent[$i_agent]['Mobile'][$i_mobile]->Mobile; ?>">
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="hidden" id="mobile_count">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="desc">توضیحات</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="desc" placeholder="توضیحات" value="<?php echo $Agent[$i_agent]['Agent']->Description;?>">
                                    </div>
                                    <div class="col-md-12 col-lg-1 form-group Add_Agent">
                                        <?php
                                        if($i_agent == 0){
                                            ?>
                                            <label for="desc">جدید</label>
                                            <button type="button" onclick="Add_Agent();" data-toggle="tooltip" title="افزودن پرسنل" class="btn btn-outline-success">
                                                <i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i>
                                            </button>
                                            <?php
                                        }
                                        else{
                                            ?>
                                            <label for="desc">حذف</label>
                                            <span data-toggle="modal" data-target="#ConfirmDellAgent">
                                                <button type="button" onclick="ConfirmDelete('<?php echo $i_agent;?>');" data-toggle="tooltip" title="حذف پرسنل" class="btn btn-outline-danger">
                                                    <i class="far fa-trash-alt fa-lg fa-fw" style="top: 2px;position: relative"></i>
                                                </button>
                                            </span>
                                            <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                                <?php
                            }
                        }
                        $len = count($Address);
                        if($len == 0){
                            $i_add = 0;
                            ?>
                            <div class="row" id="Address_0">
                                <div class="col-12">
                                    <hr>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="province">استان</label>
                                    <select class="form-control" onchange="FeedCounty(this.value,this);"
                                            id="province">
                                        <option value="0">انتخاب استان</option>
                                        <?php
                                        foreach ($Province as $row) {
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
                                        <?php
                                        foreach ($City[$i_add] as $county) {
                                            ?>
                                            <option value="<?php echo $county->id; ?>"><?php echo $county->name; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-7 form-group text-right">
                                    <label for="address">آدرس</label>
                                    <textarea cols="100%" class="form-control text-right rtl" id="address" placeholder="آدرس"></textarea>
                                </div>
                                <div class="col-md-12 col-lg-1 form-group Add_Address">
                                    <label for="desc">جدید</label>
                                    <button type="button" onclick="Add_Address();" data-toggle="tooltip" title="افزودن آدرس" class="btn btn-outline-success">
                                        <i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i>
                                    </button>
                                </div>
                            </div>
                            <?php
                        }
                        else {
                            for ($i_add = 0; $i_add < $len; $i_add++) {
                                ?>
                                <div class="row" id="Address_<?php echo $i_add; ?>">
                                    <div class="col-12">
                                        <hr>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="province">استان</label>
                                        <select class="form-control" onchange="FeedCounty(this.value,this);"
                                                id="province">
                                            <option value="0">انتخاب استان</option>
                                            <?php
                                            foreach ($Province as $row) {
                                                ?>
                                                <option value="<?php echo $row->id; ?>" <?php if ($Address[$i_add]->province_id == $row->id) echo 'selected'; ?>><?php echo $row->name; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="city">شهرستان</label>
                                        <select class="form-control" id="city">
                                            <option value="0">انتخاب شهرستان</option>
                                            <?php
                                            foreach ($City[$i_add] as $county) {
                                                ?>
                                                <option value="<?php echo $county->id; ?>" <?php if ($Address[$i_add]->id == $county->id) echo 'selected'; ?>><?php echo $county->name; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-7 form-group text-right">
                                        <label for="address">آدرس</label>
                                        <textarea cols="100%" class="form-control text-right rtl" id="address" placeholder="آدرس"><?php echo $Address[$i_add]->Address; ?></textarea>
                                    </div>
                                    <?php
                                    if ($i_add == 0) {
                                        ?>
                                        <div class="col-md-12 col-lg-1 form-group Add_Address">
                                            <label for="desc">جدید</label>
                                            <button type="button" onclick="Add_Address();" data-toggle="tooltip" title="افزودن آدرس" class="btn btn-outline-success">
                                                <i class="fas fa-plus fa-lg fa-fw" style="top: 2px;position: relative"></i>
                                            </button>
                                        </div>
                                        <?php
                                    } else {
                                        ?>
                                        <div class="col-md-12 col-lg-1 form-group Add_Address">
                                            <label for="desc">حذف</label>
                                            <span data-toggle="modal" data-target="#ConfirmDellAddress">
                                                <button type="button" onclick="ConfirmDelete('<?php echo $i_add; ?>');" data-toggle="tooltip" title="حذف آدرس" class="btn btn-outline-danger">
                                                    <i class="far fa-trash-alt fa-lg fa-fw" style="top: 2px;position: relative"></i>
                                                </button>
                                            </span>
                                        </div>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <?php
                            }
                        }
                        ?>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="button" onclick="return Submit_Legal_Form();" id="Save_Legal" class="btn btn-info">ایجاد شرکت و ثبت جزئیات</button>
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
    var i_agent=parseInt('<?php echo ($i_agent == 0)?(0):($i_agent-1)?>');
    var i_label=parseInt('<?php echo ($i_label == 0)?(0):($i_label-1)?>');
    var i_tell=parseInt('<?php echo ($i_tell == 0)?(0):($i_tell-1)?>');
    var i_ctell=parseInt('<?php echo ($i_ctell == 0)?(0):($i_ctell-1);?>');
    var i_fax=parseInt('<?php echo ($i_fax == 0)?(0):($i_fax-1)?>');
    var i_cfax=parseInt('<?php echo ($i_cfax == 0)?(0):($i_cfax-1);?>');
    var i_int=parseInt('<?php echo ($i_int == 0)?(0):($i_int-1)?>');
    var i_email=parseInt('<?php echo ($i_email == 0)?(0):($i_email-1)?>');
    var i_mobile=parseInt('<?php echo ($i_mobile == 0)?(0):($i_mobile-1)?>');
    var i_address=parseInt('<?php echo ($i_add == 0)?(0):($i_add-1)?>');

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#Real').hide();
        $('#name').focus();
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
                    $('#subcat').append('<option value="'+v['SCID']+'">'+v['STitle']+'</option>');
                });

            }
        });
    }
    function FeedCounty(val,obj) {
        var Add = $(obj).parent().parent();
        var URL = '<?php print(base_url().'company_details/get_county');?>';
        $.post(URL, {PID:val}, function (res, ret) {
            if(ret == 'success'){
                $(Add).find('#city').html('<option value="0">انتخاب شهرستان</option>');
                if(res){
                    var Json = $.parseJSON(res);
                    $(Json).each(function(k,v){
                        $(Add).find('#city').append('<option value="'+v['id']+'">'+v['name']+'</option>');
                    });
                }
            }
        });
    }
    function Add_Label(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('select').first();
        var val = sel.val();
        $('#Delete_Label_Icon').clone().appendTo(div);

        $(sel).clone().appendTo(div);
        $(div).children('select').last().val(val);
        $(sel).focus();
        i_label++;
        $(div).children('select').last().attr('id','label_'+i_label);
        $(div).children('select').last().prev('#Delete_Label_Icon').attr('id','del_label_'+i_label);
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
    function Add_CTell(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('div').first();
        $(sel).clone().appendTo(div);
        i_ctell++;
        var last = $(div).children('div').last();
        $(last).find('#ctcode_0').attr('id','ctcode_'+i_ctell);
        $(last).find('#ctell_0').attr('id','ctell_'+i_ctell);

        $('#ctcode_0').val('');
        $('#ctell_0').val('');
        $('#ctcode_0').focus();

        var next = $(div).next();
        sel = $(next).children('input').first();
        $(sel).clone().appendTo(next);
        $(sel).val('');
        last = $(next).children('input').last();
        $(last).attr('id','ttitle_'+i_ctell);

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
    function Add_CFax(obj) {
        var div =$(obj).parent();
        var sel = $(div).children('div').first();
        $(sel).clone().appendTo(div);
        i_cfax++;
        var last = $(div).children('div').last();
        $(last).find('#cfcode_0').attr('id','cfcode_'+i_cfax);
        $(last).find('#cfax_0').attr('id','cfax_'+i_cfax);

        $('#cfcode_0').val('');
        $('#cfax_0').val('');
        $('#cfcode_0').focus();

        var next = $(div).next();
        sel = $(next).children('input').first();
        $(sel).clone().appendTo(next);
        $(sel).val('');
        last = $(next).children('input').last();
        $(last).attr('id','ftitle_'+i_cfax);
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
    function Add_Agent() {
        $('[data-toggle="tooltip"]').tooltip("hide");
        i_agent++;

        $('#Agent_0 #tell_count').val(i_tell+1);
        i_tell=0;

        $('#Agent_0 #int_count').val(i_int+1);
        i_int=0;

        $('#Agent_0 #fax_count').val(i_fax+1);
        i_fax=0;

        $('#Agent_0 #email_count').val(i_email+1);
        i_email=0;

        $('#Agent_0 #mobile_count').val(i_mobile+1);
        i_mobile=0;

        var Current = $('#Agent_0').children().clone();
        $('<div class="row" id="Agent_'+i_agent+'"></div>').insertAfter('#Agent_0');
        $('#Agent_'+i_agent).append(Current);
        $('#Agent_'+i_agent+' .Add_Agent').html('<label for="desc">حذف</label><span data-toggle="modal" data-target="#ConfirmDellAgent" ><button type="button" onclick="ConfirmDelete(\''+i_agent+'\');" data-toggle="tooltip" title="حذف پرسنل" class="btn btn-outline-danger"><i class="far fa-trash-alt fa-lg fa-fw" style="top: 2px;position: relative"></i></button></span>');
        $('#Agent_'+i_agent+' #department').val($('#Agent_0 #department').val());
        var Agent = $('#Agent_Base').children().clone();
        $('#Agent_0').html(Agent);
        $('[data-toggle="tooltip"]').tooltip();
    }
    function Dell_Agent(){
        $('#ConfirmDellAgent').modal('hide');
        var i = $('#DellID').val();
        $('#Agent_'+i).remove();
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
    function Submit_Legal_Form() {
        if($.trim($('#name').val()) == ''){
            $('#Msg_R').html('نام شرکت را وارد نمایید');
            $('#MsgDiv_R').slideDown('slow');
            $('#MsgDiv_R').slideUp(5000);
            Scroll();
            $('#name').focus();
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

        var ctell = [];
        for(i=0; i<=i_ctell; i++){
            if($('#ctell_'+i).val() != '')
                ctell[i] = {Code:$('#ctcode_'+i).val(),Tell:$('#ctell_'+i).val(),Title:$('#ttitle_'+i).val()};
        }
        var cfax = [];
        for(i=0; i<=i_cfax; i++){
            if($('#cfax_'+i).val() != '')
                cfax[i] = {Code:$('#cfcode_'+i).val(),Fax:$('#cfax_'+i).val(),Title:$('#ftitle_'+i).val()};
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
            Reg:$('#register').val(),
            Type:$('#type').val(),
            Brand:$('#brand').val(),
            Site:$('#site').val(),
            Email:$('#email').val(),
            SubCat:$('#subcat').val(),
            Category:$('#category').val(),
            Desc:$('#comp_desc').val(),
            CTell:ctell,
            CFax:cfax,
            Label:labels,
            Agent:Agents,
            Address:Addresses
        };

        $('#Save_Legal').html('در حال ذخیره, کمی تأمل فرمایید...');
        $('#Save_Legal').addClass('disabled');
        var URL = '<?php echo base_url().'company_add/insert_legal'; ?>';
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
    function Show_Delete(obj){
        $(obj).prev().fadeIn('slow');
    }
    function Delete_Label(obj) {
        $(obj).next().remove();
        $(obj).remove();
    }
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>