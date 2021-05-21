<?php
class Api_model extends CI_Model
{
    public function getTask()
    {
        $query = $this->db->get('datos_about');
        return $query->result_array();
    }

}
