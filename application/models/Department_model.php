<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Department_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_department(){
        $query = $this->db->get('department');
        return $query->result();
    }

}
