<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function admin_add(){
        $Data = array(
            'User_ID' => $this->input->post("user_id"),
            'FN' => $this->input->post("fn"),
            'LN' => $this->input->post("ln"),
            'Password' => sha1($this->input->post("pw1"))
        );

        if($this->db->insert('admins', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function get_admins(){
        $query = $this->db->get('admins');
        return $query->result();
    }

    public function dell_admin($aid){
        $this->db->where('AID', $aid);
        if($this->db->delete('admins'))
            return '1';
        else
            return '-1';
    }
}
