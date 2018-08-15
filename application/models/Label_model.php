<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Label_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_company_labels(){
        $query = $this->db->get_where('labels',array('Type'=>'Company'));
        return $query->result();
    }

}
