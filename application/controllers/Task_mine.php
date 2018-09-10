<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_mine extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('task_model');
    }

    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - جستجوی وظایف';
        $data['Msg'] = $Msg;

        $this->load->view('task_mine', $data);
    }

    public function code($FID, $Msg=0)
    {
        $fid = base64_decode(strtr($FID, '._-', '+/='));
        $data['Title'] = 'CRM - ثبت پرداخت';
        $data['Msg'] = $Msg;
        $data['FID'] = $fid;

        $res = $this->task_model->get_task_finance($FID);
        $data['Fin'] = $res;

        $this->load->view('task_mine_edit', $data);
    }


    public function task_list()
    {
        $this->load->model('task_model');
        print($this->task_model->task_mine());

    }

    public function update(){
        $res = $this->task_model->task_mine_update();
        $str = strtr(base64_encode($res), '+/=', '._-');
        if($res != '-1'){
            redirect(base_url() . 'task_mine/G_128');
        }
        else{
            redirect(base_url() . 'task_mine/code/'.$str.'/R_108');
        }

    }
}