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
                            development.Created as `Date`,
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
        $query = $this->db->get();
        $arr = array();
        $this->load->library('j_date_time');
        foreach ($query->result() as $Res){
            $arr['data'][] = array(
                $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date),
                $Res->Name,
                ($Res->Brand != '')?($Res->Company.' - '.$Res->Brand):($Res->Company),
                ($Res->LN != '')?($Res->FN.' - '.$Res->LN):($Res->FN),
                $Res->Title,
                $Res->Desc,
                $this->Button($Res->DID));
        }
        return json_encode($arr);

    }

    public function dev_list_user(){
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
        $this->db->where('UID',$this->session->userdata('UID'));
        $this->db->order_by('Date');
        $query = $this->db->get();
        $this->load->library('j_date_time');
        $arr = array();
        foreach ($query->result() as $Res){
            $arr['data'][] = array(
                $this ->j_date_time->convertFormatToFormat('Y/m/d', 'Y-m-d H:i:s', $Res->Date),
                $Res->Name,
                ($Res->Brand != '')?($Res->Company.' - '.$Res->Brand):($Res->Company),
                $Res->Title,
                $Res->Desc,
                $this->Button_user($Res->DID));
        }
        return json_encode($arr);

    }

    public function Button($id){
        $str = strtr(base64_encode($id), '+/=', '._-');
        return ('<span class="btn" data-toggle="tooltip" title="ایجاد وظیفه" style="padding: 0;">
                     <a href="'.base_url().'task_add/code/'.$str.'"><i class="fas fa-tasks fa-fw fa-2x text-primary"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="ویرایش" style="padding: 0;">
                     <a href="'.base_url().'dev_edit/code/'.$str.'"><i class="far fa-edit fa-fw fa-2x text-warning"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="وظایف" style="padding: 0;">
                    <a href="'.base_url().'task_dev_find/code/'.$str.'"><i class="far fa-eye fa-fw fa-2x text-success"></i></a>
                 </span>');
    }

    public function Button_user($id){
        $str = strtr(base64_encode($id), '+/=', '._-');
        return ('<span class="btn" data-toggle="tooltip" title="ایجاد وظیفه" style="padding: 0;">
                     <a href="'.base_url().'task_add/code/'.$str.'"><i class="fas fa-tasks fa-fw fa-2x text-primary"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="ویرایش" style="padding: 0;">
                     <a href="'.base_url().'dev_edit_user/code/'.$str.'"><i class="far fa-edit fa-fw fa-2x text-warning"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="وظایف" style="padding: 0;">
                    <a href="'.base_url().'task_dev_find/code/'.$str.'"><i class="far fa-eye fa-fw fa-2x text-success"></i></a>
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

    public function dev_task_states(){
        $this->db->select('task_states.Title,task_states.SID');
        $this->db->from('development');
        $this->db->join('tasks','tasks.Develop_ID = development.DID');
        $this->db->join('task_states','tasks.State_ID = task_states.SID');
        $this->db->group_by('task_states.SID');
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
                            dev_states.SID,
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

    public function dev_update(){
        $did = $this->input->post('did');
        $state = $this->input->post('state');

        $this->db->trans_start();

        if($state == '8'){
            $data = array('State_ID' => '4');
            $this->db->where('Develop_ID', $did);
            $this->db->where('State_ID !=', '3');
            $this->db->update('tasks', $data);
            log_message('debug', 'Query=' . $this->db->last_query() . ',User=' . $this->session->userdata('MENU') . ',Time=' . time());
        }

        $data = array(
            'State_ID' => $state,
            'Description' => $this->input->post('desc')
        );

        $this->db->where('DID', $did);
        $this->db->update('development', $data);
        log_message('debug', 'Query=' . $this->db->last_query() . ',User=' . $this->session->userdata('MENU') . ',Time=' . time());

        //MK70 todo if state = 5 teymoori make task

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE)
            return '-1';
        else
            return $did;
    }

    public function fetch_company(){
        $this->db->select('company.CID,
                        company.`Name` AS Company,
                        company.`Brand` AS Brand,
                        project.PID,
                        subcategory.Title as `Sub`,
                        category.Title as `Cat`,
                        users.FN,
                        users.LN');
        $this->db->from('company');
        $this->db->join('development','development.Company_ID = company.CID','left');
        $this->db->join('project','development.Project_ID = project.PID','left');
        $this->db->join('subcategory','company.SubCategory_ID = subcategory.SCID');
        $this->db->join('category','subcategory.Category_ID = category.CID');
        $this->db->join('users','company.AccountManager_ID = users.UID','left');
        $this->db->where_not_in('project.PID',$this->input->post('PID'));
        $this->db->or_where('project.PID is null',null, false);
        $query = $this->db->get();
        return $query->result();
    }

}
