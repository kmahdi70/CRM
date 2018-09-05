<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct()
    {
        parent::__construct();

        if($this->session->userdata('UID') AND $this->session->userdata('PROJECT') == 'CRM' AND $this->session->userdata('MENU'))
            redirect(base_url() . 'home');
        //$this->load->library(array('form_validation'));
        $this->load->model('login_model');
    }

	public function index()
	{
        $data['Title'] = 'CRM - فرم ورود کاربران';
        if($this->input->get('Msg', TRUE)) {
            $data['Msg'] = $this->input->get('Msg', TRUE);
        }
        else {
            $data['Msg'] = '0';
        }

        if ($this->input->post("Login")){
            $this->form_validation->set_rules("uid", "نام کاربری", "trim|required");
            $this->form_validation->set_rules("pass", "رمز عبور", "trim|required");

            if ($this->form_validation->run() == FALSE) {
                $data['Msg'] = 'R_100';
                $this->load->view('login', $data);
            } else {
                $arr = $this->login_model->get_user();
                if (count($arr) == 1) {
                    $menu = $this->input->post("type");
                    if($menu == 'admin')
                        $sess_data = array('login' => TRUE, 'UID' => $arr[0]->AID,'User_ID' => $arr[0]->User_ID, 'PROJECT' => 'CRM', 'FN' => $arr[0]->FN, 'LN' => $arr[0]->LN, 'MENU' => $menu);
                    else
                        $sess_data = array('login' => TRUE, 'UID' => $arr[0]->UID,'User_ID' => $arr[0]->User_ID, 'PROJECT' => 'CRM', 'FN' => $arr[0]->FN, 'LN' => $arr[0]->LN, 'MENU' => $menu);

                    $this->session->set_userdata($sess_data);
                    redirect(base_url() . 'home?Msg=G_103');
                } else {
                    $data['Msg'] = 'R_102';
                    $this->load->view('login', $data);
                }
            }
        }
        else
            $this->load->view('login',$data);
	}

}
