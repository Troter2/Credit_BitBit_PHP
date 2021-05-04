<?php
class Contact_model extends CI_Model
{

    public function getContactReason()
    {
        $query = $this->db->get('tipus_consulta');
        return $query->result_array();
    }
}
