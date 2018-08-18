<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_edit extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('company_model');
    }
    public function index($cid,$Msg=0)
    {
        $data['Title'] = 'CRM - ویرایش شرکت';
        $data['Msg'] = $Msg;

        $res = $this->company_model->get_company_details($cid);

        $this->load->view('company_edit', $data);
    }
}