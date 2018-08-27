<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Priority_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_priority(){
        $query = $this->db->get('priority');
        return $query->result();
    }

}
