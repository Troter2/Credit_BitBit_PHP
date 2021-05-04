<?php
class Contact_model extends CI_Model
{
    public function getContactReason()
    {
        $query = $this->db->get('tipus_consulta');
        return $query->result_array();
    }
    public function setConsult()
    {
        $this->load->helper('url');

        $data = array(
            'nom' => $this->input->post('nom'),
            'email' => $this->input->post('email'),
            'assumpte' => $this->input->post('assumpte'),
            'contingut' => $this->input->post('content'),
            'id_consulta' => $this->input->post('id_consulta'),
            'date' => date("Y-m-d")
        );

        // print_r($data);die;

        return $this->db->insert('consultes', $data);
        redirect(base_url('/home'));
    }
}
