<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Company_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function company_add_legal(){
        $flag = 0;
        $this->db->trans_start();
        $Data = array(
            'Name' => $this->input->post("Name"),
            'Brand' => $this->input->post("Brand"),
            'Register' => $this->input->post("Reg"),
            'Type' => $this->input->post("Type"),
            'Email' => $this->input->post("Email"),
            'Site' => $this->input->post("Site"),
            'SubCategory_ID' => $this->input->post("SubCat"),
            'Category' => 'شخص حقوقی',
            'Description' => $this->input->post("Desc")
            );

        if($this->db->insert('company', $Data)){
            $id = $this->db->insert_id();
            $this->log_db->log();

            if($this->input->post('Label'))
                foreach ($this->input->post('Label') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'Label_ID' => $row
                    );
                    if($this->db->insert('company_label', $Data))
                        $this->log_db->log();
                    else
                        $flag = 1;
                }

            if($this->input->post('CTell'))
                foreach ($this->input->post('CTell') as $Tell){
                $Data = array(
                    'Company_ID' => $id,
                    'Code' => $Tell['Code'],
                    'Tell' => $Tell['Tell'],
                    'Title' => $Tell['Title']
                );
                if($this->db->insert('company_tell', $Data))
                    $this->log_db->log();
                else
                    $flag = 1;
            }

            if($this->input->post('CFax'))
                foreach ($this->input->post('CFax') as $Fax){
                    $Data = array(
                        'Company_ID' => $id,
                        'Code' => $Fax['Code'],
                        'Fax' => $Fax['Fax'],
                        'Title' => $Fax['Title']
                    );
                    if($this->db->insert('company_fax', $Data))
                        $this->log_db->log();
                    else
                        $flag = 1;
                }

            if($this->input->post('Agent'))
                foreach($this->input->post('Agent') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'Department_ID' => $row['Department'],
                        'Post' => $row['Post'],
                        'Prefix' => $row['Title'],
                        'FN' => $row['FN'],
                        'LN' => $row['LN'],
                        'Description' => $row['Desc']
                    );
                    if($this->db->insert('company_agent', $Data)){
                        $aid = $this->db->insert_id();
                        $this->log_db->log();

                        if(isset($row['Tell']))
                            foreach ($row['Tell'] as $ATell){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Code' => $ATell['Code'],
                                    'Tell' => $ATell['Tell']
                                );
                                if($this->db->insert('agent_tell', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Fax']))
                            foreach ($row['Fax'] as $AFax){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Code' => $AFax['Code'],
                                    'Fax' => $AFax['Fax']
                                );
                                if($this->db->insert('agent_fax', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Int']))
                            foreach ($row['Int'] as $Int){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Internal' => $Int
                                );
                                if($this->db->insert('agent_internal', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Mobile']))
                            foreach ($row['Mobile'] as $Mobile){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Mobile' => $Mobile
                                );
                                if($this->db->insert('agent_mobile', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Email']))
                            foreach ($row['Email'] as $Email){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Email' => $Email
                                );
                                if($this->db->insert('agent_email', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }
                    }
                    else
                        $flag = 1;
                }

            if($this->input->post('Address'))
                foreach ($this->input->post('Address') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'County_ID' => $row['City'],
                        'Address' => $row['Address']
                    );
                    if($this->db->insert('company_address', $Data))
                        $this->log_db->log();
                    else
                        $flag = 1;
                }
        }
        else
            $flag = 1;

        $this->db->trans_complete();
        if($flag == 1)
            return '-1';
        else
            return '1';
    }

    public function company_add_real(){
        log_message('debug', json_encode($_POST));
        $flag = 0;
        $this->db->trans_start();
        $Data = array(
            'Name' => $this->input->post("Name"),
            'Brand' => $this->input->post("Brand"),
            'Type' => $this->input->post("Type"),
            'Site' => $this->input->post("Site"),
            'SubCategory_ID' => $this->input->post("SubCat"),
            'Category' => 'شخص حقیقی',
            'Description' => $this->input->post("Desc")
        );

        if($this->db->insert('company', $Data)){
            $id = $this->db->insert_id();
            $this->log_db->log();

            if($this->input->post('Label'))
                foreach ($this->input->post('Label') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'Label_ID' => $row
                    );
                    if($this->db->insert('company_label', $Data))
                        $this->log_db->log();
                    else
                        $flag = 1;
                }

            if($this->input->post('Agent'))
                foreach($this->input->post('Agent') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'Department_ID' => $row['Department'],
                        'Post' => $row['Post'],
                        'Prefix' => $row['Title'],
                        'FN' => $row['FN'],
                        'LN' => $row['LN'],
                        'Description' => $row['Desc']
                    );
                    if($this->db->insert('company_agent', $Data)){
                        $aid = $this->db->insert_id();
                        $this->log_db->log();

                        if(isset($row['Tell']))
                            foreach ($row['Tell'] as $ATell){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Code' => $ATell['Code'],
                                    'Tell' => $ATell['Tell']
                                );
                                if($this->db->insert('agent_tell', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Fax']))
                            foreach ($row['Fax'] as $AFax){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Code' => $AFax['Code'],
                                    'Fax' => $AFax['Fax']
                                );
                                if($this->db->insert('agent_fax', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Int']))
                            foreach ($row['Int'] as $Int){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Internal' => $Int
                                );
                                if($this->db->insert('agent_internal', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Mobile']))
                            foreach ($row['Mobile'] as $Mobile){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Mobile' => $Mobile
                                );
                                if($this->db->insert('agent_mobile', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }

                        if(isset($row['Email']))
                            foreach ($row['Email'] as $Email){
                                $Data = array(
                                    'Agent_ID' => $aid,
                                    'Email' => $Email
                                );
                                if($this->db->insert('agent_email', $Data))
                                    $this->log_db->log();
                                else
                                    $flag = '1';
                            }
                    }
                    else
                        $flag = 1;
                }

            if($this->input->post('Address'))
                foreach ($this->input->post('Address') as $row){
                    $Data = array(
                        'Company_ID' => $id,
                        'County_ID' => $row['City'],
                        'Address' => $row['Address']
                    );
                    if($this->db->insert('company_address', $Data))
                        $this->log_db->log();
                    else
                        $flag = 1;
                }
        }
        else
            $flag = 1;

        $this->db->trans_complete();
        if($flag == 1)
            return '-1';
        else
            return '1';
    }

    public function update_company($cid){

        $Data = array(
            'Name' => $this->input->post("name"),
            'Brand' => $this->input->post("brand"),
            'Register' => $this->input->post("register"),
            'Type' => $this->input->post("type"),
            'CEO' => $this->input->post("ceo"),
            'Email' => $this->input->post("email"),
            'Tell' => $this->input->post("tell"),
            'Fax' => $this->input->post("fax"),
            'Mobile' => $this->input->post("mobile"),
            'Site' => $this->input->post("site"),
            'Address' => $this->input->post("address"),
            'Category_ID' => $this->input->post("category"),
            'SubCategory_ID' => $this->input->post("subcategory"),
        );

        $this->db->where('CID', $cid);
        if($this->db->update('company', $Data)){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';

    }

    public function get_company($cid = 0){
        if($cid AND $cid != 0)
            $query = $this->db->get_where('company',array('CID' => $cid));
        else{
            $this->db->select('company.CID,
                                company.`Name`,
                                company.`Brand`,
                                company.Register,
                                company.Type,
                                company.CEO,
                                company.Mobile,
                                company.Tell,
                                company.Site,
                                company.Email,
                                company.Address,
                                category.Title as `Cat`,
                                subcategory.Title as `Sub`');
            $this->db->from('company');
            $this->db->join('category','company.Category_ID = category.CID');
            $this->db->join('subcategory','company.SubCategory_ID = subcategory.SCID');
            $this->db->order_by('CID','desc');
            $query = $this->db->get();
        }

        return $query->result();
    }

    public function dell_agent(){
        $aid = $this->input->post('AID');
        if($this->db->delete('company_agent', array('AID' => $aid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function dell_address(){
        $aid = $this->input->post('AID');
        if($this->db->delete('company_address', array('AID' => $aid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function dell_tell(){
        $tid = $this->input->post('TID');
        if($this->db->delete('company_tell', array('TID' => $tid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function add_agent(){
        $Data = array(
            'Company_ID' => $this->input->post("CID"),
            'Section' => $this->input->post("Section"),
            'Post' => $this->input->post("Post"),
            'Add' => $this->input->post("Add"),
            'FN' => $this->input->post("FN"),
            'LN' => $this->input->post("LN"),
            'Tell' => $this->input->post("Tell"),
            'Fax' => $this->input->post("Fax"),
            'Mobile' => $this->input->post("Mobile"),
            'Email' => $this->input->post("Email"),
            'SocialNID' => $this->input->post("SNID")
        );

        if($this->db->insert('company_agent', $Data)){
            $id = $this->db->insert_id();
            $this->log_db->log();
            return $id;
        }
        else
            return '-1';

    }

    public function add_address(){
        $Data = array(
            'Company_ID' => $this->input->post("CID"),
            'Province_ID' => $this->input->post("Province"),
            'County_ID' => $this->input->post("County"),
            'Address' => $this->input->post("Address"),
            'Title' => $this->input->post("Title")
        );

        if($this->db->insert('company_address', $Data)){
            $id = $this->db->insert_id();
            $this->log_db->log();
            return $id;
        }
        else
            return '-1';
    }

    public function add_tell(){
        $Data = array(
            'Address_ID' => $this->input->post("AID"),
            'Tell' => $this->input->post("Tell"),
            'Title' => $this->input->post("Title"),
            'Fax' => $this->input->post("Fax")
        );

        if($this->db->insert('company_tell', $Data)){
            $id = $this->db->insert_id();
            $this->log_db->log();
            return $id;
        }
        else
            return '-1';
    }

    public function dell_company($cid){
        if(! $cid)
            $cid = $this->input->post('CID');
        if($this->db->delete('company', array('CID' => $cid))){
            $this->log_db->log();
            return '1';
        }
        else
            return '-1';
    }

    public function list_company(){

            $this->db->select('company.CID,
                                company.`Name`,
                                company.`Brand`,
                                subcategory.Title as `Sub`,
                                company.Category as `Type`,
                                category.Title as `Cat`');
            $this->db->from('company');
            $this->db->join('company_agent','company_agent.Company_ID = company.CID');
            $this->db->join('subcategory','company.SubCategory_ID = subcategory.SCID');
            $this->db->join('category','subcategory.Category_ID = category.CID');
            $query = $this->db->get();
            $arr = array();
            foreach ($query->result() as $Res){
                $arr['data'][] = array(
                    $Res->Name,
                    $Res->Brand,
                    $Res->Cat,
                    $Res->Sub,
                    $Res->Type,
                    $this->Button($Res->CID));
            }

        return json_encode($arr);

    }
    public function Button($id){
        return ('<span class="btn" data-toggle="tooltip" title="ویرایش" id="DellSpan" style="padding: 0;">
                     <a href="'.base_url().'company_details/update/'.$id.'"><i class="far fa-edit fa-fw fa-2x"></i></a>
                 </span>
                 <span class="btn" data-toggle="tooltip" title="حذف" id="DellSpan" onclick="ConfirmDelete(\''.$id.'\');" style="padding: 0;">
                    <i class="far fa-trash-alt fa-fw fa-2x text-danger" data-toggle="modal" data-target="#ConfirmDell"></i>
                 </span>');
    }

}
