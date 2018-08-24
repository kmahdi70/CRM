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
print_r($Company);
print_r($Agent);
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
                        <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_CLabel(this);" id="Delete_CLabel_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <div class="position-absolute" style="left:0;display: none" onclick="Delete_CTell(this);" id="Delete_CTell_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <div class="position-absolute" style="left:0;display: none" onclick="Delete_CFax(this);" id="Delete_CFax_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <div class="position-absolute" style="left:0;display: none" onclick="Delete_ATell(this);" id="Delete_ATell_Icon">
                            <button type="button" class="btn btn-outline-danger p-0">
                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                            </button>
                        </div>
                        <!--***************************************************************************** Agent_Base -->
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
                        <!--***************************************************************************** Address_Base -->
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
                        <!--***************************************************************************** Company -->
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
                                <button type="button" onclick="Add_CLabel(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                <label for="label_0">برچسب</label>
                                <?php
                                $len = count($Label);
                                if($len == 0){
                                    $i_clabel = 0;
                                    ?>
                                    <select class="form-control p-1 mb-1" id="label_0">
                                        <option value="0">انتخاب برچسب</option>
                                        <?php
                                        foreach ($Company_Label as $row) {
                                            ?>
                                            <option value="<?php echo $row->LID; ?>"><?php echo $row->Title; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                    <?php
                                }
                                else {
                                    for ($i_clabel = 0; $i_clabel < $len; $i_clabel++) {
                                        if ($i_clabel > 0) {
                                            ?>
                                            <div class="position-absolute" style="left: 15px;display: none" onclick="Delete_CLabel(this);" id="del_label_<?php echo $i_clabel; ?>">
                                                <button type="button" class="btn btn-outline-danger p-0">
                                                    <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                </button>
                                            </div>
                                            <?php
                                        }
                                        ?>
                                        <select class="form-control p-1 mb-1" id="label_<?php echo $i_clabel; ?>" onmouseover="Show_Delete(this);">
                                            <option value="0">انتخاب برچسب</option>
                                            <?php
                                            foreach ($Company_Label as $row) {
                                                ?>
                                                <option value="<?php echo $row->LID; ?>" <?php if ($row->LID == $Label[$i_clabel]->Label_ID) echo 'selected'; ?>><?php echo $row->Title; ?></option>
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
                                        <div class="input-group ltr mb-1" onmouseover="Show_Delete_CTell(this);">
                                            <?php
                                            if($i_ctell>0){
                                                ?>
                                                <div class="position-absolute" style="top: 0px;display: none" onclick="Delete_CTell(this);" id="Delete_CTell_<?php echo $i_ctell; ?>">
                                                    <button type="button" class="btn btn-outline-danger p-0">
                                                        <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                    </button>
                                                </div>
                                                <?php
                                            }
                                            ?>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" style="border-bottom-left-radius: 4px;border-top-left-radius: 4px">
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
                                        <div class="input-group ltr mb-1" onmouseover="Show_Delete_CFax(this);">
                                            <?php
                                            if($i_cfax>0){
                                                ?>
                                                <div class="position-absolute" style="top: 0px;display: none" onclick="Delete_CFax(this);" id="Delete_CFax_<?php echo $i_cfax; ?>">
                                                    <button type="button" class="btn btn-outline-danger p-0">
                                                        <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                    </button>
                                                </div>
                                                <?php
                                            }
                                            ?>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" style="border-bottom-left-radius: 4px;border-top-left-radius: 4px">
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
                                                <div class="input-group ltr mb-1" onmouseover="Show_Delete_ATell(this);">
                                                    <?php
                                                    if($i_tell>0){
                                                        ?>
                                                        <div class="position-absolute" style="top: 0px;display: none" onclick="Delete_ATell(this);" id="Delete_ATell_<?php echo $i_tell; ?>">
                                                            <button type="button" class="btn btn-outline-danger p-0">
                                                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                            </button>
                                                        </div>
                                                        <?php
                                                    }
                                                    ?>
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" style="border-bottom-left-radius: 4px;border-top-left-radius: 4px">
                                                            <input class="input-group-text p-0 border-0" placeholder="کد" id="tcode_<?php echo $i_tell;?>" size="1" value="<?php echo $Agent[$i_agent]['Tell'][$i_tell]->Code; ?>">
                                                        </span>
                                                    </div>
                                                    <input type="text" class="form-control p-1" placeholder="تلفن" id="tell_<?php echo $i_tell;?>" value="<?php echo $Agent[$i_agent]['Tell'][$i_tell]->Tell; ?>">
                                                </div>
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="text" id="tell_count">
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
                                            echo $len;
                                            for($i_int=0; $i_int<$len_i; $i_int++) {
                                                ?>
                                                <div class="position-relative">
                                                    <?php
                                                    if($i_int>0){
                                                        ?>
                                                        <div class="position-absolute" style="top: 0px;left:0;display:none" onclick="Delete_ATell(this);" id="Delete_ATell_<?php echo $i_int; ?>">
                                                            <button type="button" class="btn btn-outline-danger p-0">
                                                                <i class="fas fa-times fa-lg fa-fw position-relative" style="top: 2px"></i>
                                                            </button>
                                                        </div>
                                                        <?php
                                                    }
                                                    ?>
                                                    <input type="text" onmouseover="Show_Delete_AInt(this);" class="form-control ltr text-left mb-1" placeholder="داخلی" id="int_<?php echo $i_int;?>" value="<?php echo $Agent[$i_agent]['Internal'][$i_int]->Internal; ?>">
                                                </div>
                                                <?php
                                            }
                                        }
                                        ?>
                                        <input type="text" id="int_count">
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
                                        <input type="text" id="fax_count">
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
                                        <input type="text" id="email_count">
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
                                        <input type="text" id="mobile_count">
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
                                <button type="button" onclick="return Submit_Legal_Form();" id="Save_Legal" class="btn btn-info">ذخیره تغییرات شرکت</button>
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

    var CTell = <?php echo json_encode($Tell); ?>;
    var i_ctell = CTell.length;

    var CFax = <?php echo json_encode($Fax); ?>;
    var i_cfax = CFax.length;

    var CLabel = <?php echo json_encode($Label); ?>;
    var i_clabel = CLabel.length;

    var Agent = <?php echo json_encode($Agent);?>;
    var i_agent = Agent.length;

    var Address = <?php echo json_encode($Address);?>;
    var i_address = Address.length;

    var Node = [{}];
    console.log(Agent);

    for(var i=0; i<i_agent; i++){
        Node[i] = {i_tell:Agent[i].Tell.length,i_int:Agent[i].Internal.length,i_fax:Agent[i].Fax.length,i_email:Agent[i].Email.length,i_mobile:Agent[i].Mobile.length};
        $('#Agent_'+i+' #tell_count').val(Agent[i].Tell.length);
        $('#Agent_'+i+' #int_count').val(Agent[i].Internal.length);
        $('#Agent_'+i+' #fax_count').val(Agent[i].Fax.length);
        $('#Agent_'+i+' #email_count').val(Agent[i].Email.length);
        $('#Agent_'+i+' #mobile_count').val(Agent[i].Mobile.length);
    }
    console.log(Node);

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
    function Add_CLabel(obj) {
        var div =$(obj).parent();
        var sel = div.children('select').first();
        var val = sel.val();
        $('#Delete_CLabel_Icon').clone().appendTo(div);

        sel.clone().appendTo(div);
        div.children('select').last().val(val);
        sel.focus();
        div.children('select').last().attr('id','label_'+i_clabel);
        div.children('select').last().prev('#Delete_CLabel_Icon').attr('id','del_label_'+i_clabel);
        i_clabel++;
    }
    function Add_Tell(obj) {
        var id = $(obj).parent().parent().attr('id');
        var res = id.split('_');
        var agent_id = res[1];

        var div =$(obj).parent();
        var sel = div.children('div').first();
        var last = div.children('div').last();
        sel.clone().insertAfter(last);
        var Del = $('#Delete_ATell_Icon').clone();
        last = div.children('div').last();
        last.find('#tcode_0').attr('id','tcode_'+Node[agent_id].i_tell);
        last.find('#tell_0').attr('id','tell_'+Node[agent_id].i_tell);
        last.prepend(Del);
        last.children().first('#Delete_ATell_Icon').attr('id','Delete_ATell_'+Node[agent_id].i_tell);
        Node[agent_id].i_tell++;
        sel.find('#tcode_0').val('');
        sel.find('#tell_0').val('');
        sel.find('#tcode_0').focus();
        $(obj).parent().find('#tell_count').val(Node[agent_id].i_tell);
    }
    function Add_CTell(obj) {
        var div =$(obj).parent();
        var sel = div.children('div').first();
        sel.clone().appendTo(div);
        var last = div.children('div').last();
        last.find('#ctcode_0').attr('id','ctcode_'+i_ctell);
        last.find('#ctell_0').attr('id','ctell_'+i_ctell);

        var Del = $('#Delete_CTell_Icon').clone();
        last.prepend(Del);
        last.children().first('#Delete_CTell_Icon').attr('id','Delete_CTell_'+i_ctell);

        $('#ctcode_0').val('');
        $('#ctell_0').val('');
        $('#ctcode_0').focus();

        var next = div.next();
        sel = next.children('input').first();
        sel.clone().appendTo(next);
        sel.val('');
        last = next.children('input').last();
        last.attr('id','ttitle_'+i_ctell);
        i_ctell++;
    }
    function Add_Int(obj) {
        var div =$(obj).parent();
        var sel = div.children('div').first();
        var val = sel.children('input').first().val();
        $(sel).clone().insertAfter(div.children('div').last());
        var Del = $('#Delete_ATell_Icon').clone();
        div.children('div').last().prepend(Del);
        i_int++;

        $(div).children('div').last().find('input').first().attr('id','int_'+i_int);
        //$('#Agent_0 #int_0').val('');
        //$('#Agent_0 #int_0').focus();
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
        var sel = div.children('div').first();
        sel.clone().appendTo(div);
        var last = div.children('div').last();
        last.find('#cfcode_0').attr('id','cfcode_'+i_cfax);
        last.find('#cfax_0').attr('id','cfax_'+i_cfax);

        var Del = $('#Delete_CFax_Icon').clone();
        $(last).prepend(Del);
        last.children().first('#Delete_CFax_Icon').attr('id','Delete_CFax_'+i_cfax);

        $('#cfcode_0').val('');
        $('#cfax_0').val('');
        $('#cfcode_0').focus();

        var next = div.next();
        sel = next.children('input').first();
        sel.clone().appendTo(next);
        sel.val('');
        last = next.children('input').last();
        last.attr('id','ftitle_'+i_cfax);
        i_cfax++;
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
        for(i=0; i<=i_clabel; i++){
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

        $('#Save_Legal').html('در حال بروز رسانی, کمی تأمل فرمایید...');
        $('#Save_Legal').addClass('disabled');
        var URL = '<?php echo base_url().'company_add/update_legal'; ?>';
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
    function Show_Delete_CTell(obj){
        $(obj).children().first().fadeIn('slow');
    }
    function Show_Delete_ATell(obj){
        $(obj).children().first().fadeIn('slow');
    }
    function Show_Delete_AInt(obj){
        $(obj).prev().fadeIn('slow');
    }
    function Show_Delete_CFax(obj){
        $(obj).children().first().fadeIn('slow');
    }
    function Delete_CLabel(obj) {
        var id = $(obj).attr('id');
        var arr = id.split('_');
        var index = parseInt(arr[2]);

        if(index === (i_clabel-1)){
            i_clabel--;
            $(obj).next().remove();
            $(obj).remove();
        }
        else{
            $(obj).next().remove();
            $(obj).remove();

            for(var i= index+1; i<i_clabel; i++){
                $('#del_label_'+i).attr('id','del_label_'+(i-1));
                $('#label_'+i).attr('id','label_'+(i-1));
            }
            i_clabel--;
        }
    }
    function Delete_CTell(obj) {
        let id = $(obj).attr('id');
        let arr = id.split('_');
        let index = parseInt(arr[2]);

        if(index === (i_ctell-1)){
            $(obj).parent().remove();
            $('#ttitle_'+index).remove();
            i_ctell--;
        }
        else{
            $(obj).parent().remove();
            $('#ttitle_'+index).remove();
            for(let i= index+1; i<i_ctell; i++){
                $('#ctell_'+i).attr('id','ctell_'+(i-1));
                $('#ctcode_'+i).attr('id','ctcode_'+(i-1));
                $('#ttitle_'+i).attr('id','ttitle_'+(i-1));
                $('#Delete_CTell_'+i).attr('id','Delete_CTell_'+(i-1));
            }
            i_ctell--;
        }
    }
    function Delete_ATell(obj) {
        var agent = $(obj).parent().parent().parent();
        var id = $(agent).attr('id');
        var arr = id.split('_');
        var agent_id = arr[1];
        var num = $(obj).attr('id');
        var arr = num.split('_');
        var num = parseInt(arr[2]);

        if((num+1) === Node[agent_id].i_tell){
            Node[agent_id].i_tell--;
            $('#Agent_'+agent_id+' #tell_count').val(Node[agent_id].i_tell);
            $(obj).parent().remove();
        }
        else{
            $(obj).parent().remove();
            for(var i=(num+1); i<Node[agent_id].i_tell; i++){
                $('#Agent_'+agent_id+' #Delete_ATell_'+(i)).attr('id','Delete_ATell_'+(i-1));
                $('#Agent_'+agent_id+' #tcode_'+(i)).attr('id','tcode_'+(i-1));
                $('#Agent_'+agent_id+' #tell_'+(i)).attr('id','tell_'+(i-1));
            }
            Node[agent_id].i_tell--;
            $('#Agent_'+agent_id+' #tell_count').val(Node[agent_id].i_tell);
        }

    }
    function Delete_CFax(obj) {
        let id = $(obj).attr('id');
        let arr = id.split('_');
        let index = parseInt(arr[2]);

        if(index === (i_cfax-1)){
            $(obj).parent().remove();
            $('#ftitle_'+index).remove();
            i_cfax--;
        }
        else{
            $(obj).parent().remove();
            $('#ftitle_'+index).remove();
            for(let i= index+1; i<i_cfax; i++){
                $('#cfax_'+i).attr('id','cfax_'+(i-1));
                $('#cfcode_'+i).attr('id','cfcode_'+(i-1));
                $('#ftitle_'+i).attr('id','ftitle_'+(i-1));
                $('#Delete_CFax_'+i).attr('id','Delete_CFax_'+(i-1));
            }
            i_cfax--;
        }
    }
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>