<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
        $this->load->model('user_model');
    }
    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد کاربر';
        $data['Msg'] = $Msg;
        $this->load->view('user_add', $data);
    }

    public function insert(){
        $res = $this->user_model->user_add();
        if($res == '1'){
            redirect(base_url() . 'user_add/G_136');
        }
        else{
            redirect(base_url() . 'user_add/R_108');
        }
    }
}