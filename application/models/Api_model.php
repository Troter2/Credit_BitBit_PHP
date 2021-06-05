<?php
class Api_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
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
    public function getMails()
    {
        $query = $this->db->get('messages');
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

    public function setConsult()
    {
        
        $this->load->library('form_validation');

        $data = array(
            'nom' => $this->input->post('nom'),
            'email' => $this->input->post('email'),
            'assumpte' => $this->input->post('assumpte'),
            'contingut' => $this->input->post('content'),
            'id_consulta' => $this->input->post('id_consulta'),
            'date' => date("Y-m-d")
        );

        return $this->db->insert('consultes', $data);
        
    }
}
