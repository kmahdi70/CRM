<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Address_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_addresses($cid){
        $this->db->select('company_address.AID,
                            company_address.Address,
                            company_address.Title,
                            province.`name` as `Province`,
                            county.`name` as `County`');
        $this->db->from('company_address');
        $this->db->join('province', 'company_address.Province_ID = province.id');
        $this->db->join('county', 'company_address.County_ID = county.id');
        $this->db->where('Company_ID', $cid);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_tells($cid){
        $this->db->select('company_tell.Tell,
                            company_tell.Title,
                            company_tell.Fax,
                            company_address.AID,
                            company_tell.TID');
        $this->db->from('company_tell');
        $this->db->join('company_address', 'company_tell.Address_ID = company_address.AID');
        $this->db->where('Company_ID', $cid);
        $query = $this->db->get();
        return $query->result();
    }

    public function get_province(){
        $query = $this->db->get('province');
        return $query->result();
    }

    public function get_county(){
        if($this->input->post('PID') != '0'){
            $query = $this->db->get_where('county',array('province_id' => $this->input->post('PID')));
            return $query->result();
        }
    }

}
