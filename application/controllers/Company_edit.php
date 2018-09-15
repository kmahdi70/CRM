<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_edit extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('address_model');
        $this->load->model('category_model');
        $this->load->model('agent_model');
        $this->load->model('department_model');
        $this->load->model('company_model');
        $this->load->model('label_model');
    }
    public function index($cid,$Msg=0)
    {
        $data['Title'] = 'CRM - ویرایش شرکت';
        $data['Msg'] = $Msg;

        $res = $this->category_model->get_category();
        $data['Category'] = $res;

        $res = $this->company_model->get_company_labels($cid);
        $data['Label'] = $res;

        $res = $this->company_model->get_company_tells($cid);
        $data['Tell'] = $res;

        $res = $this->company_model->get_company_faxes($cid);
        $data['Fax'] = $res;

        $res = $this->company_model->get_company_addresses($cid);
        $data['Address'] = $res;

        $city = array();
        foreach($res as $add){
            $PID = $add->province_id;
            $city[] = $this->company_model->get_company_city($PID);
        }
        $data['City'] = $city;

        $res = $this->address_model->get_province();
        $data['Province'] = $res;

        $res = $this->label_model->get_company_labels();
        $data['Company_Label'] = $res;

        $res1 = $this->company_model->get_company_details($cid);
        $data['Company'] = $res1;

        $res = $this->department_model->get_department();
        $data['Department'] = $res;

        $res = $this->company_model->get_company_agents($cid);
        $data['Agent'] = $res;

        $Cat = $res1->cat;
        $res = $this->category_model->get_subcat($Cat);
        $data['SubCategory'] = $res;

        if($res1->Category == 'شخص حقیقی')
            $this->load->view('company_edit_real', $data);
        if($res1->Category == 'شخص حقوقی')
            $this->load->view('company_edit_legal', $data);

    }
    public function update_legal(){
        $res = $this->company_model->company_update_legal();
        echo $res;
    }


}