<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct()
    {
        parent::__construct();

        if((! $this->session->userdata('UID')) OR ($this->session->userdata('PROJECT') != 'CRM') OR (! $this->session->userdata('MENU')))
            redirect(base_url() . 'login');
        $this->load->model('login_model');
    }

	public function index()
	{
        $data['Title'] = 'CRM - صفحه اصلی';
        if($this->input->get('Msg', TRUE)) {
            $data['Msg'] = $this->input->get('Msg', TRUE);
        }
        else {
            $data['Msg'] = '0';
        }

        $this->load->view('home',$data);
	}
}
