<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark V" id="Menu">
    <a class="navbar-brand" href="#">پنل مدیریت</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse rtl" id="navbarCollapse">
        <ul class="navbar-nav text-right">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    مدیریت اطلاعات
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url().'data_add'; ?>">ورود اطلاعات</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'data_edit'; ?>">ویرایش اطلاعات</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'data_delete'; ?>">حذف اطلاعات</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    کاربران
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url() . 'user_add'; ?>">ایجاد بازاریاب</a>
                    <a class="dropdown-item" href="#">ویرایش کاربران</a>
                    <a class="dropdown-item" href="#">حذف کاربران</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    کارپردازی
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url() . 'dev_add'; ?>">ایجاد کارپردازی</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'dev_find'; ?>">مدیریت کارپردازی</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    وظایف
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url() . 'dev_find'; ?>">ایجاد</a>
                    <a class="dropdown-item" href="#">ویرایش</a>
                    <a class="dropdown-item" href="#">حذف</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    پروژه ها
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url(). 'project_add'; ?>">ایجاد</a>
                    <a class="dropdown-item" href="<?php echo base_url(). 'Companyadd'; ?>">گزارشات</a>
                    <a class="dropdown-item" href="<?php echo base_url(). 'Companyadd'; ?>">نمایش</a>
                    <a class="dropdown-item" href="<?php echo base_url().'dell_company'; ?>">مدیریت</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    دسترسی ها
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url().'category'; ?>">دسترسی کاربران</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    بایگانی
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url().'category'; ?>">فکس</a>
                    <a class="dropdown-item" href="<?php echo base_url().'category'; ?>">ایمیل</a>
                    <a class="dropdown-item" href="<?php echo base_url().'category'; ?>">وظایف</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link SMenu" href="<?php echo base_url().'logoff'; ?>">خروج <?php echo $this->session->userdata('FN').' '.$this->session->userdata('LN');?></a>
            </li>
        </ul>
    </div>
</nav>
