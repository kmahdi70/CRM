<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class State_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_project_states(){
        $query = $this->db->get('project_states');
        return $query->result();
    }

    public function get_dev_states(){
        $query = $this->db->get('dev_states');
        return $query->result();
    }

    public function get_task_states(){
        $query = $this->db->get('task_states');
        return $query->result();
    }
}
