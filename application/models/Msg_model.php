<?php 
class Msg_model extends CI_Model{

    public function getMsg($user){
        $query = $this->db->get_where('messages', array('to' => $user));
        return $query->result_array();
    }

    public function getMsgId($id){
        $query = $this->db->get_where('messages', array('id_msg' => $id));
        return $query->row();
    }
}
