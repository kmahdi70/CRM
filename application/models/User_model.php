<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function user_add(){
        $Data = array(
            'User_ID' => $this->input->post("user_id"),
            'FN' => $this->input->post("fn"),
            'LN' => $this->input->post("ln"),
            'Password' => sha1($this->input->post("pw1"))
            );

        if($this->db->insert('users', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function get_users(){
        $query = $this->db->get('users');
        return $query->result();
    }
}
