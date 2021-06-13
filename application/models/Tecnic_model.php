<?php
class Tecnic_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }


    public function insert_document_tasques($data)
    {
        $this->db->insert('documents_tasques', $data);
    }

    public function insertar_TascData($idTasca)
    {
        $this->db->set("end_date", date('Y-m-d'));
        $this->db->set("end_hour", date("h:i:s"));
        $this->db->where("id_tasca", $idTasca);
        $this->db->update('tasques');
    }

    public function insertar_estat($estatus, $dades)
    {
        $this->db->set('id_estat', $estatus);
        $this->db->where('id_inci', $dades);
        $this->db->update('incidencies');
    }

    public function insertar_accio($action, $idTasca)
    {
        $this->db->set('accions', $action);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');
    }
    public function insertar_desc($desc, $idTasca)
    {
        $this->db->set('desc', $desc);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');
    }

    public function insertar_canvas($canvas, $idTasca)
    {
        $this->db->set('canvas', $canvas);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');
    }
}
