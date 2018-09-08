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
        $data['SID'] = '';

        $this->load->view('task_find_user', $data);
	}

	public function code($sid=null, $Msg=0)
	{
        $data['Title'] = 'CRM - جستجوی وظایف';
        $data['Msg'] = $Msg;
        $data['SID'] = $sid;

        $this->load->view('task_find_user', $data);
	}

    public function task_list($sid=null)
    {
        $this->load->model('task_model');
        print($this->task_model->task_list_user($sid));

    }

}