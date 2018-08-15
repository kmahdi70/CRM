<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dell_company extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('company_model');
    }

	public function index($Msg=0)
	{
        $data['Title'] = 'CRM - حذف شرکت';
        $data['Msg'] = $Msg;

        $res = $this->company_model->get_company();
        $data['Company'] = $res;

        $this->load->view('dell_company', $data);
	}

    public function delete(){
        $this->load->model('company_model');
        print($this->company_model->dell_company());
    }

    public function dell_cid($cid){
        $this->load->model('company_model');

        if($this->company_model->dell_company($cid) == '1')
            redirect(base_url() . 'edit_company/delete/G_127');
        else
            redirect(base_url() . 'edit_company/delete/R_108');
    }

    public function dell_company($cid){
        $this->load->model('company_model');

        if($this->company_model->dell_company($cid) == '1')
            redirect(base_url() . 'dell_company/index/G_127');
        else
            redirect(base_url() . 'dell_company/index/R_108');
    }

}