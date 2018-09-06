<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dev_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('state_model');
        $this->load->model('admin_model');
        $this->load->model('user_model');
        $this->load->model('company_model');
        $this->load->model('project_model');
        $this->load->model('dev_model');
    }
    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد کارپردازی';
        $data['Msg'] = $Msg;

        $res = $this->state_model->get_dev_states();
        $data['States'] = $res;

        $res = $this->admin_model->get_admins();
        $data['Admin'] = $res;

        $res = $this->user_model->get_users();
        $data['User'] = $res;

        $res = $this->project_model->get_projects();
        $data['Projects'] = $res;

        $res = $this->company_model->get_companies();
        $data['Company'] = $res;

        $this->load->view('dev_add', $data);
    }

    public function insert(){
        $res = $this->dev_model->dev_add();
        if($res == '1'){
            redirect(base_url() . 'dev_add/G_125');
        }
        else{
            redirect(base_url() . 'dev_add/R_108');
        }
    }

    public function fetch_company(){
        $res = $this->dev_model->fetch_company();
        echo json_encode($res);

    }
}