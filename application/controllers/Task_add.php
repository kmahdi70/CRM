<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('dev_model');
    }

    public function index($did = null, $Msg=0){
        $data['Title'] = 'CRM - ایجاد وظیفه';
        $data['Msg'] = $Msg;

        $res = $this->dev_model->get_dev_info($did);
        $data['Info'] = $res;
        $this->load->view('task_add', $data);
    }

    public function index_old($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد وظیفه';
        $data['Msg'] = $Msg;

        $pid=0;
        $uid=0;
        $sid=0;
        $cid=0;
        $flg = 0;
echo $this->input->post('project');
        if($this->input->post('project')) {
            $pid = $this->input->post('project');
            $flg = 1;
        }
        if($this->input->post('user')) {
            $uid = $this->input->post('user');
            $flg = 1;
        }
        if($this->input->post('company')) {
            $cid = $this->input->post('company');
            $flg = 1;
        }
        if($this->input->post('state')) {
            $sid = $this->input->post('state');
            $flg = 1;
        }

        if($flg == 0){
            $res = $this->dev_model->get_dev_proj();
            $data['Dev_Proj'] = $res;

            $res = $this->dev_model->get_dev_state();
            $data['Dev_State'] = $res;

            $res = $this->dev_model->get_dev_user();
            $data['Dev_User'] = $res;

            $res = $this->dev_model->get_dev_company();
            $data['Dev_Company'] = $res;
        }
        else{
            $arr = array('pid' => $pid,'cid' => $cid, 'uid' => $uid, 'sid' => $sid);
            $res = $this->dev_model->get_dev_cond($arr);

        }

        $this->load->view('task_add', $data);
    }

    public function insert(){
        $res = $this->dev_model->dev_add();
        if($res == '1'){
            redirect(base_url() . 'dev_add/G_125');
        }
        else{
            redirect(base_url() . 'dev_add/R_108');
        }
    }
}