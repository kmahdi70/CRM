<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_find_user extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
    }

	public function index($Msg=0)
	{
        $data['Title'] = 'CRM - جستجوی وظایف';
        $data['Msg'] = $Msg;

        $this->load->view('task_find_user', $data);
	}

    public function task_list()
    {
        $this->load->model('task_model');
        print($this->task_model->task_list_user());

    }

}