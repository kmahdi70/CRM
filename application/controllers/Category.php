<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('category_model');
    }

	public function index()
	{
        $data['Title'] = 'CRM - مدیریت دسته ها';
        if($this->input->get('Msg', TRUE))
            $data['Msg'] = $this->input->get('Msg', TRUE);
        else
            $data['Msg'] = '0';

        $res = $this->category_model->get_category();
        $data['Category'] = $res;

        if ($this->input->post("AddCategory") != 'true')
            $this->load->view('category', $data);
        else {
            $this->form_validation->set_rules("title", "نام دسته", "trim|required");

            if ($this->form_validation->run() == FALSE) {
                $data['Msg'] = 'R_100';
                $this->load->view('category', $data);
            } else {
                $Ret = $this->category_model->add_category();
                if ($Ret == '1')
                    redirect(base_url() . 'category?Msg=G_121');
                if($Ret == '-1'){
                    $data['Msg'] = 'R_108';
                    $this->load->view('category', $data);
                }
            }
        }
	}

	public function delete_cat(){
        $this->load->model('category_model');
        print($this->category_model->dell_category());
    }

    public function delete_subcat(){
        $this->load->model('category_model');
        print($this->category_model->dell_sub_category());
    }

    public function get_subcat(){
        $this->load->model('category_model');
        echo json_encode($this->category_model->get_subcat($this->input->post('CID')));
    }
}