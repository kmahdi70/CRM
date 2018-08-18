<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_find extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('company_model');
    }

	public function index($Msg=0)
	{
        $data['Title'] = 'CRM - ویرایش شرکت';
        $data['Msg'] = $Msg;

        $this->load->view('company_find', $data);
	}

    public function delete($Msg=0)
    {
        $data['Title'] = 'CRM - ویرایش شرکت';
        $data['Msg'] = $Msg;

        $this->load->view('edit_company', $data);
    }

}