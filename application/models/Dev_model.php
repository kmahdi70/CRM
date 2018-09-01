<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dev_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function dev_add(){
        $flag = 0;
        $this->db->trans_start();
        foreach($this->input->post("company") as $company){
            $Data = array(
                'Project_ID' => $this->input->post("project"),
                'State_ID' => $this->input->post("state"),
                'User_ID' => $this->input->post("user"),
                'Company_ID' => $company,
                'Description' => $this->input->post("desc")
            );
            if($this->db->insert('development', $Data)){
                $did = $this->db->insert_id();
                $this->log_db->log();
            }
            else
                $flag = 1;

            if($this->input->post("state") == '1'){

                $Data = array(
                    'Develop_ID' => $did,
                    'Date' => gmdate("Y-m-d", time()).' 00:00:00',
                    'Task' => 'ارسال نامه',
                    'TaskType_ID' => '1',
                    'State_ID' => '1',
                    'Priority_ID' => '1'
                );

                if($this->db->insert('tasks', $Data)){
                    $this->log_db->log();
                }
                else
                    $flag = 1;
            }
        }

        if($flag == 0){
            $this->db->trans_commit();
            return '1';
        }
        else{
            $this->db->trans_rollback();
            return '-1';
        }
    }

    public function dev_list(){
        $this->db->select('development.DID,
                            project.`Name`,
                            dev_states.Title,
                            users.FN,
                            users.LN,
                            company.`Name` as `Company`,
                            company.Brand,
                            development.Description as `Desc`,
                            development.Created as `Date`');
        $this->db->from('development');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->join('dev_states','development.State_ID = dev_states.SID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->order_by('Date');
        $query = $this->db->get();
        $arr = array();
        $i=1;
        foreach ($query->result() as $Res){
            $arr['data'][] = array(
                $i++,
                $Res->Name,
                ($Res->Brand != '')?($Res->Company.' - '.$Res->Brand):($Res->Company),
                ($Res->LN != '')?($Res->FN.' - '.$Res->LN):($Res->FN),
                $Res->Title,
                $Res->Desc,
                $this->Button($Res->DID));
        }
        return json_encode($arr);

    }

    public function Button($id){
        return ('<span class="btn" data-toggle="tooltip" title="ایجاد وظیفه" id="Add_Task" style="padding: 0;">
                     <a href="'.base_url().'task_add/'.$id.'"><i class="fas fa-tasks fa-fw fa-2x text-success"></i></a>
                 </span><span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'company_edit/'.$id.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="حذف" id="DellSpan" onclick="ConfirmDelete(\''.$id.'\');" style="padding: 0;">
                    <i class="far fa-trash-alt fa-fw fa-2x text-danger" data-toggle="modal" data-target="#ConfirmDell"></i>
                 </span>');
    }

    public function get_dev_proj(){
        $this->db->select('development.DID,project.`Name`');
        $this->db->from('development');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->group_by('project.PID');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_dev_state(){
        $this->db->select('development.DID,dev_states.Title');
        $this->db->from('development');
        $this->db->join('dev_states','development.State_ID = dev_states.SID');
        $this->db->group_by('dev_states.SID');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_dev_user(){
        $this->db->select('development.DID,users.FN,users.LN');
        $this->db->from('development');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->group_by('users.UID');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_dev_company(){
        $this->db->select('development.DID,company.`Name`,company.Brand');
        $this->db->from('development');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->group_by('company.CID');
        $query = $this->db->get();
        return $query->result();
    }

    public function get_dev_cond($arr){
        $pid = $arr['pid'];
        $uid = $arr['uid'];
        $cid = $arr['cid'];
        $sid = $arr['sid'];

        $cond = array();
        if($pid != 0)
            $cond['development.Project_ID'] = $pid;
        if($uid != 0)
            $cond['development.User_ID'] = $uid;
        if($sid != 0)
            $cond['development.State_ID'] = $sid;
        if($cid != 0)
            $cond['development.Company_ID'] = $cid;

        $this->db->select('development.DID,
                        users.FN,
                        users.LN,
                        company.`Name`,
                        company.Brand,
                        dev_states.Title,
                        project.`Name`');
        $this->db->from('development');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('dev_states','development.State_ID = dev_states.SID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->where($cond);
        //$this->db->group_by(array('development.User_ID','development.Company_ID','development.State_ID','development.Project_ID'));
        $query = $this->db->get();
        log_message('debug', 'Query=' . $this->db->last_query());

        return $query->result();
    }

    public function get_dev_info($did){
        $this->db->select('development.DID,
                            development.Description as `desc`,
                            project.`Name` as `proj`,
                            dev_states.Title,
                            users.FN,
                            users.LN,
                            company.`Name` as `company`,
                            company.Brand,
                            development.Created as `date`');
        $this->db->from('development');
        $this->db->join('company','development.Company_ID = company.CID');
        $this->db->join('users','development.User_ID = users.UID');
        $this->db->join('dev_states','development.State_ID = dev_states.SID');
        $this->db->join('project','development.Project_ID = project.PID');
        $this->db->where('development.DID',$did);
        $query = $this->db->get();
        return $query->row();
    }

}
