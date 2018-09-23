<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_find extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('user_model');
        $this->load->model('admin_model');
    }

    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - جستجوی کاربران';
        $data['Msg'] = $Msg;

        $this->load->view('user_find', $data);
    }

    public function code($FID, $Msg=0)
    {
        $fid = base64_decode(strtr($FID, '._-', '+/='));
        $data['Title'] = 'CRM - ثبت پرداخت';
        $data['Msg'] = $Msg;
        $data['FID'] = $fid;

        $res = $this->task_model->get_task_finance($FID);
        $data['Fin'] = $res;

        $this->load->view('task_mine_edit', $data);
    }


    public function user_list()
    {
        $this->load->model('user_model');
        $a = $this->user_model->users_list();

        //$this->load->model('admin_model');
        //$b = $this->admin_model->admins_list();

        print($a);

    }

    public function dell_user($uid){
        $UID = base64_decode(strtr($uid, '._-', '+/='));
        $this->load->model('user_model');

        if($this->user_model->dell_user($UID) == '1')
            redirect(base_url() . 'user_find/G_138');
        else
            redirect(base_url() . 'user_find/R_108');
    }

    public function dell_admin($aid){
        $AID = base64_decode(strtr($aid, '._-', '+/='));
        $this->load->model('admin_model');

        if($this->admin_model->dell_admin($AID) == '1')
            redirect(base_url() . 'user_find/G_138');
        else
            redirect(base_url() . 'user_find/R_108');
    }


    public function update(){
        $res = $this->task_model->task_mine_update();
        $str = strtr(base64_encode($res), '+/=', '._-');
        if($res != '-1'){
            redirect(base_url() . 'task_mine/G_128');
        }
        else{
            redirect(base_url() . 'task_mine/code/'.$str.'/R_108');
        }

    }
}