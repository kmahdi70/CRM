<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_edit extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('state_model');
        $this->load->model('task_model');
        $this->load->model('fax_model');
    }

    public function index($tid = null, $Msg=0){
        $data['Title'] = 'CRM - ایجاد وظیفه';
        $data['Msg'] = $Msg;

        $res = $this->state_model->get_task_states();
        $data['Task_State'] = $res;

        $res = $this->task_model->get_task_info($tid);
        $data['Task'] = $res;

        $this->load->view('task_edit', $data);
    }

    public function code($TID = null, $Msg=0){
        $tid = base64_decode(strtr($TID, '._-', '+/='));
        $data['Title'] = 'CRM - ایجاد وظیفه';
        $data['Msg'] = $Msg;

        $res = $this->fax_model->get_task_fax($tid);
        $data['Fax'] = $res;

        $res = $this->state_model->get_task_states();
        $data['Task_State'] = $res;

        $res = $this->task_model->get_task_info($tid);
        $data['Task'] = $res;

        $res = $this->task_model->get_task_post($tid);
        $data['Post'] = $res;

        $this->load->view('task_edit', $data);
    }

    public function update(){

        print_r($_FILES);
        print_r($_POST);
        //die();
        $res = $this->fax_model->fax_send();




        $res = $this->task_model->task_update();
        $str = strtr(base64_encode($res), '+/=', '._-');
        if($res != '-1'){
            if($this->input->post('state') == '3')
                redirect(base_url() . 'task_add/code/'.$str.'/G_128');
            else
                redirect(base_url() . 'task_dev_find/code/'.$str.'/G_128');
        }
        else{
            redirect(base_url() . 'task_edit/code/'.$str.'/R_108');
        }
    }

    public function fax(){
        echo '1';
    }
}