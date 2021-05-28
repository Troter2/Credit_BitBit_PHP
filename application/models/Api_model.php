<?php
class Api_model extends CI_Model
{
    public function getTask()
    {
        $query = $this->db->get('datos_about');
        return $query->result_array();
    }

    public function getTipusConsulta()
    {
        $query = $this->db->get('tipus_consulta');
        return $query->result_array();
    }

    public function getInci()
    {
        $this->db->order_by("entry_date DESC");
        //$this->db->where('name', $id_user);
        $query = $this->db->get('incidencies');

        //echo $this->db->last_query();
        
        return $query->result_array();
    }
}
