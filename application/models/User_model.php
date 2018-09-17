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

    public function users_list(){
        $query = $this->db->get('users');
        $arr = array();
        foreach ($query->result() as $Res){
            if($Res->Active == '1'){
                $active = '<label class="switch" title="فعال" data-toggle="tooltip" >
                                        <input type="checkbox" checked name="status" disabled="disabled">
                                        <div class="slider round"></div>
                                    </label>';
            }
            else{
                $active = '<label class="switch" title="غیرفعال" data-toggle="tooltip" >
                                        <input type="checkbox" name="status" disabled="disabled">
                                        <div class="slider round"></div>
                                    </label>';
            }
            $arr['data'][] = array(
                $Res->User_ID,
                $Res->FN,
                $Res->LN,
                $Res->Email,
                $Res->Mobile,
                $Res->ID,
                'بازاریاب',
                $active,
                $this->Button($Res->UID,'users'));
        }
        $query = $this->db->get('admins');
        foreach ($query->result() as $Res){
            if($Res->Active == '1'){
                $active = '<label class="switch" title="فعال" data-toggle="tooltip" >
                                        <input type="checkbox" checked name="status" disabled="disabled">
                                        <div class="slider round"></div>
                                    </label>';
            }
            else{
                $active = '<label class="switch" title="غیرفعال" data-toggle="tooltip" >
                                        <input type="checkbox" name="status" disabled="disabled">
                                        <div class="slider round"></div>
                                    </label>';
            }
            $arr['data'][] = array(
                $Res->User_ID,
                $Res->FN,
                $Res->LN,
                $Res->Email,
                $Res->Mobile,
                $Res->ID,
                'راهبر',
                $active,
                $this->Button($Res->AID,'admins'));
        }
        return json_encode($arr);
    }


    public function Button($id,$tb){
        $str = strtr(base64_encode($id), '+/=', '._-');
        return ('<span class="btn" data-toggle="tooltip" title="تغییر رمز" id="DellSpan" onclick="ConfirmDelete(\''.$str.'\',\''.$tb.'\');" style="padding: 0;">
                    <i class="fas fa-key fa-fw fa-2x text-success"></i>
                 </span><span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'company_edit/code/'.$str.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
                 </span><span class="btn" data-toggle="tooltip" title="حذف" id="DellSpan" style="padding: 0;">
                    <i class="far fa-trash-alt fa-fw fa-2x text-danger" data-toggle="modal" data-target="#ConfirmDell"></i>
                 </span>');
    }

    public function dell_user($uid){
        $this->db->where('UID', $uid);
        if($this->db->delete('users'))
            return '1';
        else
            return '-1';

    }


}
