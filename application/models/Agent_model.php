<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Agent_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_agents($cid){
        $query = $this->db->get_where('company_agent',array('Company_ID' => $cid));
        return $query->result();
    }

    public function get_company_agents($cid){


        $query = $this->db->get_where('company_agent',array('Company_ID' => $cid));
        return $query->result();
    }


}
