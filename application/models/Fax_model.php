<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Fax_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function get_task_fax($tid){
        $arr = array();

        $this->db->select('tasks.TID,
                        company_fax.Fax,
                        company_fax.`Code`,
                        company_fax.Title,
                        company.`Name`,
                        company.Brand');
        $this->db->from('company');
        $this->db->join('development','development.Company_ID = company.CID');
        $this->db->join('tasks','tasks.Develop_ID = development.DID');
        $this->db->join('company_fax','company_fax.Company_ID = company.CID','left');
        $this->db->where('tasks.TID',$tid);
        $query = $this->db->get();
        $arr['company'] = $query->result();

        $this->db->select('tasks.TID,
                        agent_fax.`Code`,
                        agent_fax.Fax,
                        company.Brand,
                        department.Title,
                        company_agent.FN,
                        company_agent.LN');
        $this->db->from('company');
        $this->db->join('development','development.Company_ID = company.CID');
        $this->db->join('tasks','tasks.Develop_ID = development.DID');
        $this->db->join('company_agent','company_agent.Company_ID = company.CID');
        $this->db->join('agent_fax','agent_fax.Agent_ID = company_agent.AID');
        $this->db->join('department','company_agent.Department_ID = department.DID');
        $this->db->where('tasks.TID',$tid);
        $query = $this->db->get();
        $arr['agent'] = $query->result();

        return $arr;
    }

    public function fax_send(){

        log_message('debug', json_encode($_POST));
        log_message('debug', json_encode($_FILES));

        $this->db->trans_start();

        $Data = array(
            'Task_ID' => $this->input->post("tid"),
        );
        $this->db->insert('fax', $Data);

        $fid = $this->db->insert_id();

        $this->load->library('upload');
        $config = array();
        $config['allowed_types'] = 'gif|jpg|png|zip|rar|pdf|docx|doc';
        $config['max_size'] = '8000'; // 8MB

        $files = $_FILES;
        $Num = count($_FILES['upload']['name']);
        $uploads = array();
        for($i=0; $i<$Num; $i++) {
            $path_parts = pathinfo($files['upload']['name'][$i]);
            $Ext = strtolower($path_parts['extension']);
            $Image = md5($fid).'_'.$i.'.'.$Ext;
            $config['file_name'] = $Image;

            $Data = array('Fax_ID' => $fid,
                        'FileName' => md5($fid).'_'.$i,
                        'Extension' => $Ext);
            $this->db->insert('fax_attach', $Data);

            $_FILES['upload']['name'] = $files['upload']['name'][$i];
            $_FILES['upload']['type'] = $files['upload']['type'][$i];
            $_FILES['upload']['tmp_name'] = $files['upload']['tmp_name'][$i];
            $_FILES['upload']['error'] = $files['upload']['error'][$i];
            $_FILES['upload']['size'] = $files['upload']['size'][$i];

            $config['upload_path'] = BasePath.'fax/';
            $uploads[] = BasePath.'fax/'.$Image;
            $this->upload->initialize($config);
            $this->upload->do_upload('upload');
        }

        foreach($this->input->post('fax_no') as $fax){




            //$curl = curl_init();
            $curl = curl_init('https://api.fax.ir/v2/accounts/self/files?format=pdf');
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt(
                $curl,
                CURLOPT_POSTFIELDS,
                array(
                    'fax_file' => curl_file_create(realpath('/you/full/path/sample.pdf'))
                ));
            curl_setopt(
                $curl,
                CURLOPT_HTTPHEADER,
                array(
                    "Authorization: at2RGc2zcyKKLB5",
                    "x-fax-clientid: APIK-CQvRA2kXEX",
                    "Content-Type: multipart/form-data"
                ));

            // output the response
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($curl);
            $err = curl_error($curl);

            #"Content-Type: multipart/form-data;",
            curl_close($curl);

            if ($err) {
                echo "cURL Error #:" . $err;
            } else {
                echo $response;
            }











            $response = 0;

            $Data = array('Fax_ID' => $fid,
                        'Number' => $fax,
                        'Success' => $response);
            $this->db->insert('fax_to', $Data);
        }


        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
        }
        else
        {
            $this->db->trans_commit();
        }
    }
}
