<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_admins(){
        $query = $this->db->get('admins');
        return $query->result();
    }
}
