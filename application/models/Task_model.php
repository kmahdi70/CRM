<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Task_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_task_types(){
        $query = $this->db->get('task_types');
        return $query->result();
    }
    public function task_add(){
        $Data = array(
            'Develop_ID' => $this->input->post("did"),
            'Date' => gmdate("Y-m-d", $this->input->post("date_stamp")/1000).' 00:00:00',
            'Task' => $this->input->post("task"),
            'TaskType_ID' => $this->input->post("type"),
            'State_ID' => $this->input->post("state"),
            'Priority_ID' => $this->input->post("priority"),
            'Description' => $this->input->post("task_desc"),
            'Alarm' => gmdate("Y-m-d", $this->input->post("alarm_stamp")/1000).' 00:00:00',
            'Alarm_Desc' => $this->input->post("alarm_desc")
        );

        if($this->db->insert('tasks', $Data)){
            $this->log_db->log();
            return $this->input->post("did");
        }
        else
            return '-1';
    }


}
