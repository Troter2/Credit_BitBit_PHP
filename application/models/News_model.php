<?php
class News_model extends CI_Model
{

    public function getNew($user)
    {
        $query = $this->db->get_where('news', array('to' => $user));
        return $query->result_array();
    }

    public function getNewId($id)
    {
        $query = $this->db->get_where('news', array('id_new' => $id));
        return $query->row();
    }
    public function setNew($from)
    {
        $this->load->helper('url');

        $data = array(
            'title' => $this->input->post('title'),
            'content' => $this->input->post('content'),
            'image' => $this->input->post('image'),
        );

        return $this->db->insert('news', $data);
        redirect(base_url('/home'));
    }
}
