<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_add extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('category_model');
        $this->load->model('department_model');
        $this->load->model('company_model');
        $this->load->model('address_model');
        $this->load->model('label_model');
    }
    public function index($Msg=0)
    {
        $data['Title'] = 'CRM - ایجاد شرکت';
        $data['Msg'] = $Msg;

        $res = $this->category_model->get_category();
        $data['Category'] = $res;

        $res = $this->category_model->get_subcat();
        $data['SubCategory'] = $res;

        $res = $this->department_model->get_department();
        $data['Department'] = $res;

        $res = $this->address_model->get_province();
        $data['Province'] = $res;

        $res = $this->address_model->get_county();
        $data['County'] = $res;

        $res = $this->label_model->get_company_labels();
        $data['Company_Label'] = $res;

        if($this->input->post('category') AND $this->input->post('category') == 'Real')
            $this->load->view('company_add_real', $data);
        else
            $this->load->view('company_add', $data);
    }

    public function insert_legal(){
        $res = $this->company_model->company_add_legal();
        echo $res;
    }
    public function insert_real(){
        $res = $this->company_model->company_add_real();
        echo $res;
    }
}