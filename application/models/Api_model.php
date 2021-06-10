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
    public function getMails($id)
    {
        $this->db->order_by('id_msg', 'DESC');
        $query = $this->db->get_where('mail_username', array('to' => $id));
        return $query->result_array();
    }
    public function getMail($id_user, $id_msg)
    {


        $query = $this->db->get_where('mail_username', array('id_msg' => $id_msg));
        return $query->row_array();
    }

    public function set_mail($content, $to, $about, $from)
    {
        $data = array(
            'from' => $from,
            'to' => $to,
            'about' => $about,
            'content' => $content,
            'send_date' => date("Y-m-d"),
            'send_hour' => date("H:i:sa")
        );

        return $this->db->insert('messages', $data);
    }

    public function get_user_id($username)
    {
        $query = $this->db->get_where('users', array('username' => $username));
        return $query->row_array();
    }
    public function api_update_user($user_id, $username, $email, $company, $tlf, $city, $first_name, $last_name)
    {
        if ($username!=null) $this->db->set("username",$username);
        if ($email!=null) $this->db->set("email",$email);
        if ($company!=null) $this->db->set("company",$company);
        if ($tlf!=null) $this->db->set("phone",$tlf);
        if ($city!=null) $this->db->set("city",$city);
        if ($city!=null) $this->db->set("first_name",$first_name);
        if ($city!=null) $this->db->set("last_name",$last_name);
        
        $this->db->where("id",$user_id);
        $this->db->update('users');
        return $this->db->affected_rows(); 
    }
    public function get_user_by_id($id)
    {
        $query = $this->db->get_where('users', array('id' => $id));
        return $query->row_array();
    }
    public function getInciByOwner($id, $limit, $offset)
    {
        $this->db->limit($limit, $offset);
        $query = $this->db->get_where('inci_user_app', array('id_user_propietari' => $id));
        return $query->result_array();
    }
    public function getTaquesByTecnic($id, $limit, $offset)
    {
        $this->db->limit($limit, $offset);
        $query = $this->db->get_where('tasques_tecnic_app', array('id_user' => $id));
        return $query->result_array();
    }
    public function getInciById($id)
    {
        $query = $this->db->get_where('inci_user_app', array('id_inci' => $id));
        return $query->row_array();
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
