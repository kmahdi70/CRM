<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Project_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('state_model');
        $this->load->model('admin_model');
        $this->load->model('project_model');
    }
    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد پروژه';
        $data['Msg'] = $Msg;

        $res = $this->state_model->get_project_states();
        $data['States'] = $res;

        $res = $this->admin_model->get_admins();
        $data['Admin'] = $res;

        $this->load->view('project_add', $data);
    }

    public function insert(){
        $res = $this->project_model->project_add();
        if($res == '1'){
            redirect(base_url() . 'project_add/G_125');
        }
        else{
            redirect(base_url() . 'project_add/R_108');
        }
    }
}