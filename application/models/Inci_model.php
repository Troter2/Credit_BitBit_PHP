<?php
class Inci_model extends CI_Model
{
    public function setOwner()
    {
        $this->load->library('ion_auth');
        $userinfo = $this->ion_auth->user()->row();
        $id = $userinfo->id;

        return $this->db->query("UPDATE incidencies SET id_user_propietari = '" . $id . "' WHERE UUID ='" . $this->input->post('uuid') . "'");
    }
    
    public function exist()
    {
        $this->load->library('ion_auth');
        $userinfo = $this->ion_auth->user()->row();
        $id = $userinfo->id;

        $query=$this->db->query("SELECT COUNT(*) FROM incidencies  WHERE UUID ='" . $this->input->post('uuid') . "'");
        $row = $query->result_array();
        return $row[0]['COUNT(*)'];
    }

    public function has_owner()
    {

        try {
            $query = $this->db->query("SELECT id_user_propietari FROM incidencies  WHERE UUID ='" . $this->input->post('uuid') . "'");
            $row = $query->result_array();
        } catch (Exception $e) {
        }
        if ($row[0]['id_user_propietari'] != NULL) {
            
            return false;
        }
        return true;
    }
}
