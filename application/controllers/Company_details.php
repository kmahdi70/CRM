<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_details extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('company_model');
        $this->load->model('category_model');
        $this->load->model('agent_model');
        $this->load->model('address_model');
    }

    /*function _remap($method,$args)
    {
        if (method_exists($this, $method)){
            $this->$method($args);
        }
        else{
            $this->index($method,$args);
        }
    }*/

	public function index($Msg=0,$CID)
	{
	}

    public function edit($CID,$Msg=0)
    {
        $data['Title'] = 'CRM - مشخصات شرکت';
        $data['Msg'] = $Msg;

        if($CID){
            $res = $this->company_model->get_company($CID);
            $data['Company'] = $res[0];

            $res = $this->agent_model->get_agents($CID);
            $data['Agents'] = $res;

            $res = $this->address_model->get_addresses($CID);
            $data['Addresses'] = $res;

            $res = $this->address_model->get_tells($CID);
            $data['Tells'] = $res;

        }

        $res = $this->category_model->get_category();
        $data['Category'] = $res;

        $res = $this->category_model->get_subcat();
        $data['SubCategory'] = $res;

        $res = $this->address_model->get_province();
        $data['Province'] = $res;

        $this->load->view('company_details', $data);
    }

    public function update($CID,$Msg=0)
    {
        $data['Title'] = 'CRM - مشخصات شرکت';
        $data['Msg'] = $Msg;

        if($CID){
            $res = $this->company_model->get_company($CID);
            $data['Company'] = $res[0];

            $res = $this->agent_model->get_agents($CID);
            $data['Agents'] = $res;

            $res = $this->address_model->get_addresses($CID);
            $data['Addresses'] = $res;

            $res = $this->address_model->get_tells($CID);
            $data['Tells'] = $res;

        }

        $res = $this->category_model->get_category();
        $data['Category'] = $res;

        $res = $this->category_model->get_subcat();
        $data['SubCategory'] = $res;

        $res = $this->address_model->get_province();
        $data['Province'] = $res;

        if($this->input->post('UpdateCompany')){
            $this->form_validation->set_rules("name", "نام شرکت", "trim|required");

            if ($this->form_validation->run() == FALSE) {
                $data['Msg'] = 'R_100';
                $this->load->view('company_update', $data);
            } else {
                $Ret = $this->company_model->update_company($CID);
                if ($Ret == 1){
                    redirect(base_url() . 'company_details/update/'.$CID.'/G_128');
                }
                if($Ret == '-1'){
                    $data['Msg'] = 'R_108';
                    $this->load->view('company_update', $data);
                }
            }

        }
        else{
            $data['CID'] = $CID;
            $this->load->view('company_update', $data);
        }
    }

    public function delete_agent(){
        $this->load->model('company_model');
        print($this->company_model->dell_agent());
    }

    public function delete_address(){
        $this->load->model('company_model');
        print($this->company_model->dell_address());
    }

    public function delete_tell(){
        $this->load->model('company_model');
        print($this->company_model->dell_tell());
    }

    public function get_county(){
        $this->load->model('address_model');
        echo json_encode($this->address_model->get_county());
    }

    public function list_company(){
        $this->load->model('company_model');
        print($this->company_model->list_company());

    }
}