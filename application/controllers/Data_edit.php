<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_edit extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');
    }

    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ورود اطلاعات';
        $data['Msg'] = $Msg;
        $this->load->view('data_edit', $data);
	}
}