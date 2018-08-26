<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dev_find extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
    }

	public function index($Msg=0)
	{
        $data['Title'] = 'CRM - ویرایش وظایف';
        $data['Msg'] = $Msg;

        $this->load->view('dev_find', $data);
	}

    public function dev_list()
    {
        $this->load->model('dev_model');
        print($this->dev_model->dev_list());

    }

}