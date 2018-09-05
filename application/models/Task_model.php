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

    public function task_list_user(){
        $this->db->select('tasks.TID,
                        tasks.Date,
                        tasks.Task,
                        task_states.Title as `State`,
                        priority.Title as `Pri`,
                        task_types.Type,
                        task_states.SID
                        ');
        $this->db->from('tasks');
        $this->db->join('development','tasks.Develop_ID = development.DID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->join('priority','tasks.Priority_ID = priority.PID');
        $this->db->join('task_types','tasks.TaskType_ID = task_types.TID');
        $this->db->where('users.UID',$this->session->userdata('UID'));
        $this->db->order_by('Date');
        $query = $this->db->get();
        $arr = array();
        $i=1;
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $str = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date);
            $arr['data'][] = array(
                $str,
                $Res->Task,
                $Res->Type,
                $Res->State,
                $Res->Pri,
                $this->Button($Res->TID));
        }
        return json_encode($arr);
    }

    public function Button($id){
        return ('<span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'task_edit/'.$id.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
                 </span>');
    }

    public function get_task_info($tid){

        $this->db->select('tasks.TID,
                        tasks.Date,
                        tasks.Task,
                        task_types.Type,
                        task_states.Title as `State`,
                        tasks.State_ID,
                        priority.Title as `Pri`,
                        tasks.Description,
                        tasks.Alarm,
                        tasks.Alarm_Desc,
                        project.`Name` as `Proj`,
                        company.`Name` as `Company`,
                        company.Brand,
                        dev_states.Title as `Dev_State`,
                        development.Description as `Dev_Desc`');
        $this->db->from('tasks');
        $this->db->join('task_types','tasks.TaskType_ID = task_types.TID');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->join('development','tasks.Develop_ID = development.DID');
        $this->db->join('priority','tasks.Priority_ID = priority.PID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->join('dev_states','development.State_ID = dev_states.SID');
        $this->db->where('tasks.TID',$tid);
        $query = $this->db->get();
        return $query->row();
    }

    public function task_dev_list($did){

        $this->db->select('tasks.TID,
                        tasks.Date,
                        tasks.Task,
                        task_types.Type,
                        task_states.Title as `State`,
                        priority.Title as `Pri`');
        $this->db->from('tasks');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->join('priority','tasks.Priority_ID = priority.PID');
        $this->db->join('task_types','tasks.TaskType_ID = task_types.TID');
        $this->db->where('tasks.Develop_ID',$did);
        $this->db->order_by('Date');
        $query = $this->db->get();
        $arr = array();
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $str = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date);
            $arr['data'][] = array(
                $str,
                $Res->Task,
                $Res->Type,
                $Res->State,
                $Res->Pri,
                $this->Button($Res->TID));
        }
        return json_encode($arr);
    }

    public function task_update(){
        $data = array(
            'State_ID' => $this->input->post('state'),
            'Description' => $this->input->post('task_desc')
        );

        $this->db->where('TID', $this->input->post('tid'));
        if($this->db->update('tasks', $data)){
            $query = $this->db->get_where('tasks',array('TID' => $this->input->post('tid')));
            $row = $query->row();
            $did = $row->Develop_ID;
            return $did;
        }
        else
            return '-1';

    }
}
