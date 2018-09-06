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
//print_r($Company);
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
                    <strong>ایجاد کارپردازی </strong><i class="far fa-folder-open Panel_Icon"></i>
                </div>
                <div class="card-body Panel_Body rtl">
                    <form method="post" action="<?php echo base_url() . 'dev_add/insert'; ?>">
                        <div class="row">
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="project">پروژه</label>
                                <select class="form-control" id="project" name="project" onchange="Feed_Company_Proj(this.value);">
                                    <option value="0">انتخاب پروژه</option>
                                    <?php
                                    foreach ($Projects as $row){
                                        ?>
                                        <option value="<?php echo $row->PID; ?>"><?php echo $row->Name; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="user">بازاریاب</label>
                                <select class="form-control" id="user" name="user">
                                    <?php
                                    foreach ($User as $row){
                                        ?>
                                        <option value="<?php echo $row->UID; ?>"><?php echo $row->FN.' - '.$row->LN; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <!--<div class="col-md-12 col-lg-6 form-group text-right">
                                <div onclick="Show_Company();">
                                    <label>شرکت</label>
                                    <i class="far fa-address-card fa-lg fa-fw text-primary" id="Choose_Company"></i>
                                </div>
                                <input type="text" class="form-control" id="Selected" readonly value="هیچ شرکتی انتخاب نشده">
                            </div>-->
                            <!--<div class="col-md-12 col-lg-12 form-group text-right" id="Sel_Comp_TB" style="display: none">
                                <div class="form-control">
                                    <table class="table table-hover table-striped" id="Sel_Company">
                                        <thead>
                                            <tr>
                                                <th colspan="7"><input type="checkbox"> انتخاب همه شرکتها </th>
                                            </tr>
                                        </thead>
                                        <thead>
                                        <tr id="THead">
                                            <th>نام</th>
                                            <th>نام خانوادگی</th>
                                            <th>شرکت</th>
                                            <th>برند</th>
                                            <th>گروه</th>
                                            <th>زیر گروه</th>
                                            <th width="40"><input type="checkbox"></th>
                                        </tr>
                                        </thead>
                                        <?php
/*                                        $NA = $Company['NA'];
                                        foreach ($NA as $row){
                                            */?>
                                            <tr>
                                                <td>-</td>
                                                <td>-</td>
                                                <td><?php /*echo $row->Name; */?></td>
                                                <td><?php /*echo $row->Brand; */?></td>
                                                <td><?php /*echo $row->Cat; */?></td>
                                                <td><?php /*echo $row->Sub; */?></td>
                                                <td><input type="checkbox" class="form-control"></td>
                                            </tr>
                                        <?php
/*                                        }
                                        */?>
                                        <thead>
                                        <tr id="THead">
                                            <th>نام</th>
                                            <th>نام خانوادگی</th>
                                            <th>شرکت</th>
                                            <th>برند</th>
                                            <th>گروه</th>
                                            <th>زیر گروه</th>
                                            <th width="40"><input type="checkbox"></th>
                                        </tr>
                                        </thead>

                                        <?php
/*                                        $A = $Company['A'];
                                        foreach ($A as $row){
                                            */?>
                                            <tr>
                                                <td><?php /*echo $row->FN; */?></td>
                                                <td><?php /*echo $row->LN; */?></td>
                                                <td><?php /*echo $row->Name; */?></td>
                                                <td><?php /*echo $row->Brand; */?></td>
                                                <td><?php /*echo $row->Cat; */?></td>
                                                <td><?php /*echo $row->Sub; */?></td>
                                                <td><input type="checkbox" class="form-control"></td>
                                            </tr>
                                        <?php
/*                                        }
                                        */?>
                                    </table>

                                </div>
                            </div>-->
                            <div class="col-md-12 col-lg-6 form-group text-right">
                                <?php
                                $NA = array();
                                $A = array();

                                foreach ($Company as $row){
                                    if($row->LN == '')
                                        $NA[] = $row;
                                    else
                                        $A[] = $row;
                                }
                                ?>
                                <label for="company">شرکت</label>
                                <select class="form-control active" id="company" name="company[]" multiple="multiple">
                                    <optgroup label="بدون Account Manager">
                                    <?php
                                    foreach ($NA as $row){
                                        ?>
                                        <option value="<?php echo $row->CID; ?>"><?php echo $row->Name.(($row->Brand != '')?(' - '.$row->Brand):('')).' ,'.$row->Cat.', '.$row->Sub; ?></option>
                                        <?php
                                    }
                                    ?>
                                    </optgroup>
                                    <optgroup label="دارای Account Manager">
                                    <?php
                                    foreach ($A as $row){
                                        ?>
                                        <option value="<?php echo $row->CID; ?>"><?php echo $row->FN.' ,'.$row->LN.' ,'.$row->Name.(($row->Brand != '')?(' - '.$row->Brand):('')).' ,'.$row->Cat.', '.$row->Sub; ?></option>
                                        <?php
                                    }
                                    ?>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-3 form-group text-right">
                                <label for="state">مرحله</label>
                                <select class="form-control" id="state" name="state">
                                    <?php
                                    foreach ($States as $row){
                                        ?>
                                        <option value="<?php echo $row->SID; ?>"><?php echo $row->Title; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-md-12 col-lg-9 form-group text-right">
                                <label for="comp_desc">توضیحات</label>
                                <input type="text" class="form-control" autocomplete="off" name="desc" placeholder="توضیحات">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 form-group text-right">
                                <button type="submit" onclick="return Check_Form();" class="btn btn-info">ایجاد کارپردازی</button>
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
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('[id^=MsgDiv_]').fadeOut(5000);
        $('#name').focus();

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
    
    function Feed_Company_Proj(pid) {
        var URL = '<?php print(base_url().'dev_add/fetch_company');?>';
        $.post(URL, {PID:pid}, function (res, ret) {
            if(ret == 'success'){alert(res);
                $('#company').html('');
                var Json = $.parseJSON(res);
                $(Json).each(function(k,v){
                    if(v['LN'] == '')

                    //$('#company').append('<option value="'+v['CID']+'">'+v['Company']+' - '+v['Brand']+', '+v['Cat']+', '+v['Sub']+'</option>');
                });
                $('select[multiple].active').multiselect('reload');
            }
        },'text');
    }

</script>
<?php
$this->load->view('footer');
?>
</body>
</html>