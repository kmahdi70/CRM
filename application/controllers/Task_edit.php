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
    public function update(){
        $res = $this->task_model->task_update();
        if($res != '-1'){
            redirect(base_url() . 'task_dev_find/'.$res.'/G_128');
        }
        else{
            redirect(base_url() . 'task_add/'.$res.'/R_108');
        }
    }

}