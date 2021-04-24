<?php
class Msg_model extends CI_Model
{

    public function getMsg($user)
    {
        $query = $this->db->get_where('messages', array('to' => $user));
        return $query->result_array();
    }

    public function getMsgId($id)
    {
        $query = $this->db->get_where('messages', array('id_msg' => $id));
        return $query->row();
    }
    public function setMsg()
    {
        $this->load->helper('url');

        $data = array(
            'to' => $this->input->post('to'),
            'about' => $this->input->post('about'),
            'content' => $this->input->post('content'),
            'from' => $this->input->post('content'),
            'send_date' => date("Y-m-d"),
            'send_hour' => date("H:i:sa")
        );

        return $this->db->insert('messages', $data);
        redirect(base_url('/home'));
    }
}
