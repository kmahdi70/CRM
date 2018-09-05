<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_user(){

        $uid = $this->input->post("uid");
        $pass = $this->input->post("pass");
        $type = $this->input->post("type");

        $tb = 'users';

        if($type == 'admin')
            $tb = 'admins';

        $query = $this->db->get_where($tb, array('User_ID' => $uid, 'Password' => sha1($pass)));
        return $query->result();
    }
}
