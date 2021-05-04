<?php
class News_model extends CI_Model
{

    public function getNew()
    {
        $query = $this->db->get('news', 6, 0);

        //echo $this->db->last_query();
        
        return $query->result_array();
    }

    public function getNewId($id)
    {
        $query = $this->db->get_where('news', array('id_new' => $id));
        return $query->row();

    }
    public function setNew()
    {
        $this->load->helper('url');

        $data = array(
            'title' => $this->input->post('title'),
            'content' => $this->input->post('content'),
            'image' => $this->input->post('image'),
            'date' => date("Y-m-d")
        );

        return $this->db->insert('news', $data);
        redirect(base_url('/home'));
    }
}
