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
                    <strong>ایجاد شرکت </strong><i class="far fa-folder-open Panel_Icon"></i>
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
                        <div class="col-md-12 col-lg-2 form-group row">
                            <label for="category">نوع شرکت</label>
                            <select class="form-control" id="category" onchange="Filter(this.value);">
                                <option value="Legal">شخص حقوقی</option>
                                <option value="Real">شخص حقیقی</option>
                            </select>
                        </div>
                        <div id="Legal">
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
                                    <label for="post">سمت</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" placeholder="سمت">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="department">بخش</label>
                                    <select class="form-control" id="department">
                                        <option value="0">انتخاب دپارتمان</option>
                                        <?php
                                        foreach ($Department as $row){
                                            ?>
                                            <option value="<?php echo $row->DID; ?>"><?php echo $row->Title; ?></option>
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
                            <div class="row">
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <label for="name" class="F">* نام شرکت</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="name" placeholder="نام شرکت">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="register">شماره ثبت</label>
                                    <input type="number" class="form-control text-right rtl" autocomplete="off" id="register" placeholder="شماره ثبت">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="type">نوع شرکت</label>
                                    <select class="form-control" id="type">
                                        <option value="نا مشخص">نا مشخص</option>
                                        <option value="با مسئولیت محدود">با مسئولیت محدود</option>
                                        <option value="سهامی خاص">سهامی خاص</option>
                                        <option value="سهامی عام">سهامی عام</option>
                                        <option value="تضامنی">تضامنی</option>
                                        <option value="مختلط غیرسهامی">مختلط غیرسهامی</option>
                                        <option value="مختلط سهامی">مختلط سهامی</option>
                                        <option value="تعاونی">تعاونی</option>
                                        <option value="نسبی">نسبی</option>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="brand">برند</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="brand" placeholder="برند شرکت">
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <label for="site">سایت</label>
                                    <input type="text" class="form-control text-left ltr" autocomplete="off" id="site" placeholder="سایت">
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
                                    <label for="email">ایمیل</label>
                                    <input type="text" class="form-control text-left ltr" autocomplete="off" id="email" placeholder="ایمیل">
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
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <button type="button" onclick="Add_Label(this);" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                    <label for="label_0">برچسب</label>
                                    <select class="form-control p-1 mb-1" id="label_0">
                                        <?php
                                        foreach ($Company_Label as $row){
                                            ?>
                                            <option value="<?php echo $row->LID; ?>"><?php echo $row->Title; ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-12 col-lg-3 form-group text-right">
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
                                    <label for="ln">نام خانوادگی</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="ln" placeholder="نام خانوادگی">
                                </div>
                                <div class="col-md-12 col-lg-5 form-group text-right">
                                    <label for="post">سمت</label>
                                    <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" placeholder="سمت">
                                </div>
                                <div class="col-md-12 col-lg-2 form-group text-right">
                                    <label for="department">بخش</label>
                                    <select class="form-control" id="department">
                                        <option value="0">انتخاب دپارتمان</option>
                                        <?php
                                        foreach ($Department as $row){
                                            ?>
                                            <option value="<?php echo $row->DID; ?>"><?php echo $row->Title; ?></option>
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
                                    <button type="button" onclick="return Submit_Legal_Form();" value="true" class="btn btn-info">ایجاد و ثبت جزئیات شرکت</button>
                                </div>
                            </div>
                        </div>
                        <div id="Real">
                            <form method="post" action="<?php echo base_url(). 'Company_add'; ?>" onsubmit="return Check();">
                                <div class="row">
                                    <div class="col-md-12 col-lg-3 form-group text-right">
                                        <label for="site">سایت</label>
                                        <input type="text" class="form-control text-left ltr" autocomplete="off" id="site" name="site" value="<?php echo set_value('site'); ?>" placeholder="سایت">
                                    </div>
                                    <div class="col-md-12 col-lg-3 form-group text-right">
                                        <label for="brand">برند</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="brand" name="brand" value="<?php echo set_value('brand'); ?>" placeholder="برند">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="cat">انتخاب دسته</label>
                                        <select name="category" class="form-control" onchange="FeedSubCat(this.value);" id="cat">
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
                                        <select name="subcategory" class="form-control" id="subcat">
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
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                        <label for="label">برچسب</label>
                                        <select class="form-control p-1">
                                            <?php
                                            foreach ($Company_Label as $row){
                                                ?>
                                                <option value="<?php echo $row->LID; ?>"><?php echo $row->Title; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <hr>
                                    </div>
                                    <div class="col-md-12 col-lg-1 form-group text-right">
                                        <label for="title">عنوان</label>
                                        <select class="form-control p-1">
                                            <option value="">آقای</option>
                                            <option value="">خانم</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="fn">نام</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="fn" name="fn" value="<?php echo set_value('fn'); ?>" placeholder="نام">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="ln">نام خانوادگی</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="ln" name="ln" value="<?php echo set_value('ln'); ?>" placeholder="نام خانوادگی">
                                    </div>
                                    <div class="col-md-12 col-lg-5 form-group text-right">
                                        <label for="post">سمت</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="post" name="post" value="<?php echo set_value('post'); ?>" placeholder="سمت">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="department">بخش</label>
                                        <select class="form-control">
                                            <option value="0">انتخاب دپارتمان</option>
                                            <?php
                                            foreach ($Department as $row){
                                                ?>
                                                <option value="<?php echo $row->DID; ?>"><?php echo $row->Title; ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                        <label for="code">تلفن</label>
                                        <div class="input-group ltr">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1"><input class="input-group-text p-0 border-0" placeholder="کد" id="code" name="code" size="1"></span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="تلفن" id="tell" name="tell">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                        <label for="code">فکس</label>
                                        <div class="input-group ltr">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon1"><input class="input-group-text p-0 border-0" placeholder="کد" id="code" name="code" size="1"></span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="فکس" id="tell" name="tell">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                        <label for="code">ایمیل</label>
                                        <input type="text" class="form-control ltr text-left " placeholder="ایمیل" id="tell" name="tell">
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <button type="button" onclick="" class="btn btn-outline-info p-0"><i class="fas fa-plus fa-lg fa-fw position-relative" style="top: 2px"></i></button>
                                        <label for="code">همراه</label>
                                        <input type="text" class="form-control ltr text-left " placeholder="همراه" id="tell" name="tell">
                                    </div>
                                    <div class="col-md-12 col-lg-4 form-group text-right">
                                        <label for="desc">توضیحات</label>
                                        <input type="text" class="form-control text-right rtl" autocomplete="off" id="desc" name="desc" value="<?php echo set_value('desc'); ?>" placeholder="توضیحات">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <hr>
                                    </div>
                                    <div class="col-md-12 col-lg-2 form-group text-right">
                                        <label for="province">استان</label>
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
                                        <label for="county">شهرستان</label>
                                        <select name="county" class="form-control" id="county">
                                            <option value="0">انتخاب شهرستان</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-8 form-group text-right">
                                        <label for="address">آدرس</label>
                                        <textarea cols="100%" class="form-control text-right rtl" id="address" name="address" value="<?php echo set_value('address'); ?>" placeholder="آدرس"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12 form-group text-right">
                                        <button type="submit" name="AddRealCompany" value="true" class="btn btn-info">ایجاد شخص حقیقی</button>
                                    </div>
                                </div>
                            </form>
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
    var i_fax=0;
    var i_int=0;
    var i_email=0;
    var i_mobile=0;
    var i_address=0;

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#Real').hide();
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
            //return false;
        }
        if($('#subcat').val() == '0'){
            $('#Msg_R').html('زیردسته را انتخاب نمایید');
            $('#MsgDiv_R').fadeIn('slow');
            $('#MsgDiv_R').fadeOut(5000);
            $('#subcat').focus();
            //return false;
        }

        return true;
    }
    function Filter(val) {
        if(val == 'Real'){
            $('#Legal').slideUp('slow');
            $('#Real').slideDown('slow');
        }
        else if(val == 'Legal'){
            $('#Real').slideUp('slow');
            $('#Legal').slideDown('slow');
        }
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
        i_tell=0;

        $('#Agent_0 #int_count').val(i_int+1);
        i_int=0;

        $('#Agent_0 #fax_count').val(i_fax+1);
        i_fax=0;

        $('#Agent_0 #email_count').val(i_email+1);
        i_email=0;

        $('#Agent_0 #mobile_count').val(i_mobile+1);
        i_mobile=0;

        var Parameters = {
            Name:$('#name').val(),
            Reg:$('#register').val(),
            Type:$('#type').val(),
            Brand:$('#brand').val(),
            Site:$('#site').val(),
            Email:$('#email').val(),
            SubCat:$('#subcat').val(),
            Category:$('#category').val(),
            Desc:$('#comp_desc').val()
        };

        var labels = [],i,j,len;
        for(i=0; i<=i_label; i++){
            labels[i] = $('#label_'+i).val();
        }

        var Agents = [];
        var tell = [];
        var int = [];
        var fax = [];
        var email = [];
        var mobile = [];

        for(i=0; i<=i_agent; i++){
            tell[i] = [];
            if($('#Agent_'+i+' #tell_count').val() != ""){
                len = $('#Agent_'+i+' #tell_count').val();
                for(j=0; j<len; j++){
                    tell[i].push($('#Agent_'+i+' #tell_'+j).val());
                }
            }
            int[i] = [];
            if($('#Agent_'+i+' #int_count').val() != ""){
                len = $('#Agent_'+i+' #int_count').val();
                for(j=0; j<len; j++){
                    int[i].push($('#Agent_'+i+' #int_'+j).val());
                }
            }
            fax[i] = [];
            if($('#Agent_'+i+' #fax_count').val() != ""){
                len = $('#Agent_'+i+' #fax_count').val();
                for(j=0; j<len; j++){
                    fax[i].push($('#Agent_'+i+' #fax_'+j).val());
                }
            }
            email[i] = [];
            if($('#Agent_'+i+' #email_count').val() != ""){
                len = $('#Agent_'+i+' #email_count').val();
                for(j=0; j<len; j++){
                    email[i].push($('#Agent_'+i+' #a_email_'+j).val());
                }
            }
            mobile[i] = [];
            if($('#Agent_'+i+' #mobile_count').val() != ""){
                len = $('#Agent_'+i+' #mobile_count').val();
                for(j=0; j<len; j++){
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

        console.log(Agents);

        var URL = '<?php echo base_url().'company_add/insert_legal'; ?>';
        $.post(URL, Parameters, function (res, ret) {
            if(ret == 'success'){
                if(res != '-1'){
                    var cid = res;
                    var flag = 0;

                    var URL = '<?php echo base_url().'company_add/insert_lebel'; ?>';
                    $.post(URL, {CID:cid,Labels:labels}, function (res, ret){
                        if(ret == 'success'){
                            if(res == '-1')
                                flag= 1;
                        }
                    });

                    var URL = '<?php echo base_url().'company_add/insert_agent'; ?>';
                    $.post(URL, {CID:cid,Agent:Agents}, function (res, ret){
                        if(ret == 'success'){alert(res);
                            if(res == '-1')
                                flag= 1;
                        }
                    });


                    $('#Msg_G').html('شرکت با موفقیت ایجاد گردید');
                    $('#MsgDiv_G').slideDown('slow',function(){
                        Scroll();
                        $('#MsgDiv_G').slideUp(5000);
                    });
                }
            }
        });




        var url = '<?php echo base_url().'company_add'; ?>';
        //$(location).attr('href',url);
    }
</script>
<?php
$this->load->view('footer');
?>
</body>
</html>