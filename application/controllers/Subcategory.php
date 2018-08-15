<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subcategory extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        if(! $this->session->userdata('UID') OR $this->session->userdata('PROJECT') != 'CRM')
            redirect(base_url() . 'login');

        $this->load->model('category_model');
    }

	public function index()
	{
        $data['Title'] = 'CRM - مدیریت زیردسته ها';
        if($this->input->get('Msg', TRUE))
            $data['Msg'] = $this->input->get('Msg', TRUE);
        else
            $data['Msg'] = '0';

        $res = $this->category_model->get_category();
        $data['Category'] = $res;
        $data['SubCat'] = array();
        $catid = '';
        if($this->input->post('category') OR $this->input->post('category') == 0 OR $this->input->get('CID')){

            if($this->input->get('CID'))
                $catid = $this->input->get('CID');
            if($this->input->post('category'))
                $catid = $this->input->post('category');

            $data['sel_cat'] = $catid;

            if($catid != 0){
                $Res = $this->category_model->get_subcat($catid);
                $data['SubCat'] = $Res;
            }
        }

        if ($this->input->post("AddSubCategory") != 'true')
            $this->load->view('subcategory', $data);
        else {
            $this->form_validation->set_rules("title", "نام زیردسته", "trim|required");

            if ($this->form_validation->run() == FALSE) {
                $data['Msg'] = 'R_100';
                $this->load->view('subcategory', $data);
            } else {
                $cid= '';
                if($this->input->post('category') != 0 OR $this->input->get('CID')){
                    if($this->input->get('CID'))
                        $cid = $this->input->get('CID');
                    if($this->input->post('category'))
                        $cid = $this->input->post('category');

                    $Ret = $this->category_model->add_subcategory();
                    if ($Ret == '1')
                        redirect(base_url() . 'subcategory?Msg=G_123&CID='.$cid);
                    if($Ret == '-1'){
                        $data['Msg'] = 'R_108';
                        $this->load->view('subcategory', $data);
                    }
                }
                else{
                    $data['Msg'] = 'R_100';
                    $this->load->view('subcategory', $data);
                }
            }
        }
	}

	public function delete(){
        $this->load->model('category_model');
        print($this->category_model->dell_sub_category());
    }
}