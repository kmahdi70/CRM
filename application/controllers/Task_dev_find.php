<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_dev_find extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
        $this->load->model('dev_model');
    }

	public function index($did, $Msg=0)
	{
        $data['Title'] = 'CRM - ویرایش وظایف';
        $data['Msg'] = $Msg;

        $res = $this->dev_model->get_dev_info($did);
        $data['dev_info'] = $res;

        $data['DID'] = $did;
        $this->load->view('task_dev_find', $data);
	}

    public function task_dev_list($did)
    {
        $this->load->model('task_model');
        print($this->task_model->task_dev_list($did));

    }

}