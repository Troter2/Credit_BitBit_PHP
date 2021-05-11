<?php
class About_model extends CI_Model
{
    public function getEvent()
    {
        $query = $this->db->get('datos_about');
        return $query->result_array();
    }

}
