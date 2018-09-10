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

    public function task_list_user($sid=null){
        $this->db->select('tasks.TID,
                        tasks.Date,
                        tasks.Task,
                        task_states.Title as `State`,
                        priority.Title as `Pri`,
                        task_types.Type,
                        task_states.SID,
                        project.`Name` as `Proj`,
                        company.Brand,
                        company.`Name` as `Company`
                        ');
        $this->db->from('tasks');
        $this->db->join('development','tasks.Develop_ID = development.DID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->join('priority','tasks.Priority_ID = priority.PID');
        $this->db->join('task_types','tasks.TaskType_ID = task_types.TID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->where('users.UID',$this->session->userdata('UID'));
        if($sid != null)
            $this->db->where('task_states.SID',strtr(base64_decode($sid), '._-','+/='));
        $this->db->order_by('Date');
        $query = $this->db->get();
        $arr = array();
        $i=1;
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $str = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date);
            $arr['data'][] = array(
                $str,
                $Res->Company.', '.$Res->Brand,
                $Res->Proj,
                $Res->Task,
                $Res->Type,
                $Res->State,
                $Res->Pri,
                $this->Button($Res->TID));
        }
        return json_encode($arr);
    }

    public function task_list(){
        $this->db->select('tasks.TID,
                        tasks.Date,
                        tasks.Task,
                        task_states.Title as `State`,
                        priority.Title as `Pri`,
                        task_types.Type,
                        task_states.SID,
                        project.`Name` as `Proj`,
                        company.Brand,
                        company.`Name` as `Company`
                        ');
        $this->db->from('tasks');
        $this->db->join('development','tasks.Develop_ID = development.DID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->join('priority','tasks.Priority_ID = priority.PID');
        $this->db->join('task_types','tasks.TaskType_ID = task_types.TID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->order_by('Date');
        $query = $this->db->get();
        log_message('debug', $this->db->last_query());
        $arr = array();
        $i=1;
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $str = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date);
            $arr['data'][] = array(
                $str,
                $Res->Company.', '.$Res->Brand,
                $Res->Proj,
                $Res->Task,
                $Res->Type,
                $Res->State,
                $Res->Pri,
                $this->Button($Res->TID));
        }
        return json_encode($arr);
    }

    public function task_mine(){
        $this->db->select('finance.FID,
                        finance.Created,
                        project.`Name` as `Project`,
                        users.FN,
                        users.LN,
                        company.Brand,
                        company.`Name` as `Company`,
                        finance.Price,
                        finance.Cash,
                        finance.Date');
        $this->db->from('finance');
        $this->db->join('development','finance.Develop_ID = development.DID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('company','development.Company_ID = company.CID');
        $query = $this->db->get();
        $arr = array();
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $str = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Created);
            $date = $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date);
            $arr['data'][] = array(
                $str,
                $Res->Company.', '.$Res->Brand,
                $Res->Project,
                $Res->FN.' - '.$Res->LN,
                $Res->Price,
                $Res->Cash,
                $date,
                $this->Button_Mine($Res->FID));
        }
        return json_encode($arr);
    }

    public function Button_Mine($id){
        $str = strtr(base64_encode($id), '+/=', '._-');
        return ('<span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'task_mine/code/'.$str.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
                 </span>');
    }

    public function Button($id){
        $str = strtr(base64_encode($id), '+/=', '._-');
        return ('<span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'task_edit/code/'.$str.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
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

    public function get_task_post($tid){
        $res = $this->db->get_where('task_postpone',array('Task_ID' => $tid));
        return $res->result();
    }

    public function task_dev_list($did){
        //$did = base64_decode(strtr($DID, '._-', '+/='));
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

        if($this->input->post('state') == '2'){
            $Data = array(
                'Task_ID' => $this->input->post("tid"),
                'Date' => gmdate("Y-m-d", $this->input->post("post_stamp")/1000).' 00:00:00',
                'Description' => $this->input->post("post_desc")
            );
            $this->db->insert('task_postpone', $Data);
        }

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

    public function task_state(){
        $query = $this->db->get('task_states');
        return $query->result();
    }

    public function get_task_finance($fid){
        $FID = base64_decode(strtr($fid, '._-', '+/='));
        $this->db->select('finance.FID,
                        finance.Created,
                        project.`Name` as `Project`,
                        users.FN,
                        users.LN,
                        company.Brand,
                        company.`Name` as `Company`,
                        finance.Price,
                        finance.Cash,
                        finance.Date,
                        finance.Description');
        $this->db->from('finance');
        $this->db->join('development','finance.Develop_ID = development.DID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->where('finance.FID',$FID);
        $query = $this->db->get();
        return $query->row();
    }

    public function task_mine_update(){
        $data = array(
            'Date' => gmdate("Y-m-d", $this->input->post('date_stamp')/1000).' 00:00:00',
            'Cash' => $this->input->post('cash'),
            'Price' => $this->input->post('price'),
            'Description' => $this->input->post('desc')
        );

        $this->db->where('FID', $this->input->post('fid'));
        if($this->db->update('finance', $data)){
            return ($this->input->post('fid'));
        }
        else
            return '-1';

    }

}
