<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Project_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function project_add(){
        $Data = array(
            'Name' => $this->input->post("name"),
            'Admin_ID' => $this->input->post("admin"),
            'Description' => $this->input->post("desc"),
            'State_ID' => $this->input->post("state")
            );

        if($this->db->insert('project', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function get_projects(){
        $query = $this->db->get('project');
        return $query->result();
    }
}
