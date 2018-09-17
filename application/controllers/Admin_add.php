<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
        $this->load->model('admin_model');
    }
    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد ادمین';
        $data['Msg'] = $Msg;
        $this->load->view('admin_add', $data);
    }

    public function insert(){
        $res = $this->admin_model->admin_add();
        if($res == '1'){
            redirect(base_url() . 'admin_add/G_136');
        }
        else{
            redirect(base_url() . 'admin_add/R_108');
        }
    }
}