<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark V" id="Menu">
    <a class="navbar-brand" href="#">پنل مدیریت</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse rtl" id="navbarCollapse">
        <ul class="navbar-nav text-right">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    پروژه ها
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url().'dev_find_user'; ?>">مدیریت</a>
                    <a class="dropdown-item" href="<?php echo base_url(). ''; ?>">گزارشات</a>
                    <a class="dropdown-item" href="<?php echo base_url(). ''; ?>">نمایش</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle SMenu" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    وظایف
                </a>
                <div class="dropdown-menu text-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="<?php echo base_url() . 'task_find_user'; ?>">همه وظایف</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'task_find_user'; ?>">وظایف انجام نشده</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'task_find_user'; ?>">وظایف انجام شده</a>
                    <a class="dropdown-item" href="<?php echo base_url() . 'dev_find_user'; ?>">مدیریت</a>
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
