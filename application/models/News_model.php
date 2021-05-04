<?php
class News_model extends CI_Model
{

    public function getNew()
    {
        $num_limit=8;
        if ($this->ion_auth->logged_in()) {
            $num_limit=6;
        }
        $this->db->order_by("date DESC");
        $query = $this->db->get('news', $num_limit, 0);

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
