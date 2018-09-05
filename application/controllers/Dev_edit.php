<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dev_edit extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('state_model');
        $this->load->model('dev_model');
    }
    public function index($did, $Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد کارپردازی';
        $data['Msg'] = $Msg;

        $res = $this->state_model->get_dev_states();
        $data['States'] = $res;

        $res = $this->dev_model->get_dev_info($did);
        $data['Info'] = $res;

        $this->load->view('dev_edit', $data);
    }

    public function code($DID, $Msg=0)
    {
        $did = base64_decode(strtr($DID, '._-', '+/='));
        $data['Title'] = 'CRM - ایجاد کارپردازی';
        $data['Msg'] = $Msg;

        $res = $this->state_model->get_dev_states();
        $data['States'] = $res;

        $res = $this->dev_model->get_dev_info($did);
        $data['Info'] = $res;

        $this->load->view('dev_edit', $data);
    }

    public function update(){
        $res = $this->dev_model->dev_update();
        if($res != '-1'){
            redirect(base_url() . 'dev_find/G_128');
        }
        else{
            $did = strtr(base64_encode($res), '+/=', '._-');
            redirect(base_url() . 'dev_edit/code/'.$did.'/R_108');
        }
    }
}