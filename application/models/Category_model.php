<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_category(){
        $query = $this->db->get('category');
        return $query->result();
    }

    public function add_category(){
        $Data = array('Title' => $this->input->post("title"));
        if($this->db->insert('category', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function dell_category(){
        $cid = $this->input->post('CID');
        if($this->db->delete('category', array('CID' => $cid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function dell_sub_category(){
        $scid = $this->input->post('SCID');
        if($this->db->delete('subcategory', array('SCID' => $scid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function get_subcat($cid=0){
        $this->db->select('category.Title as `CTitle`,subcategory.Title as `STitle`,subcategory.SCID');
        $this->db->from('category');
        $this->db->join('subcategory', 'subcategory.Category_ID = category.CID');
        if($cid != 0)
            $this->db->where('Category_ID',$cid);
        $query = $this->db->get();
        return $query->result();
    }

    public function add_subcategory(){
        $Data = array('Title' => $this->input->post("title"),'Category_ID' => $this->input->post('category'));
        if($this->db->insert('subcategory', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

}
