<?php
class Log_db
{
    public function log($uid=null,$q=0){

        $CI = &get_instance();
        ob_start(); // Turn on output buffering
        system('ipconfig /all'); //Execute external program to display output
        $mycom=ob_get_contents(); // Capture the output into a variable
        ob_clean(); // Clean (erase) the output buffer
        $findme = "Physical";
        $pmac = strpos($mycom, $findme); // Find the position of Physical text
        $mac=substr($mycom,($pmac+36),17); // Get Physical Address
        if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
            $ip=$_SERVER['HTTP_CLIENT_IP'];
        elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
            $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
        else
            $ip=$_SERVER['REMOTE_ADDR'];

        if($q == 0)
            $q = $CI->db->last_query();

        $pos = strpos($q,'UPDATE');
        if ($pos === false){
            $pos = strpos($q,'DELETE');
            if ($pos === false){
                $type = substr($q,0,6);
            }
            else{
                $type = 'DELETE';
            }
        }
        else{
            $type = 'UPDATE';
        }

        if($uid == null)
            $uid = $CI->session->userdata('UID');

        $arr['Query'] = $q;
        $arr['IP'] = $ip;
        $local = getHostByName(getHostName());
        $arr['Local'] = $local;
        $arr['MAC'] = $mac;
        $arr['User'] = $uid;
        $arr['Timestamp'] = time();
        $str = json_encode($arr);
        log_message('debug', $str);
        $data=array(
            'Type' =>$type,
            'Query' =>$q,
            'User' =>$uid,
            'Net_IP' =>$ip,
            'Local_IP' =>$local,
            'MAC' =>$mac
        );
        $CI->db->insert('log',$data);
    }
}