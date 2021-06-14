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

        $query = $this->db->query("SELECT COUNT(*) FROM incidencies  WHERE UUID ='" . $this->input->post('uuid') . "'");
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

    public function get_status()
    {

        $query = $this->db->query("SELECT * FROM status");
        return $query->result_array();
    }



    public function getImgTasca($id)
    {

        $query = $this->db->query("SELECT * FROM documents_tasques where id_tasca = " . $id);

        return $query->result_array();
    }
    public function deleteImg($id)
    {

        $query = $this->db->get_where('documents_tasques', array('image' => $id));

        $row = $query->row();
        $file_pointer = "../../uploads/incidencies/" . $row->path . '/' . $row->image;
        unlink($file_pointer);


        $this->db->delete('documents_tasques', array('image' => $id));


        return;
    }

    public function get_uuid()
    {

        $query = $this->db->query("SELECT * FROM status");
        return $query->result_array();
    }

    public function get_incidencia($uuid = FALSE)
    {
        $query = $this->db->get_where('incidencies', array('uuid' => $uuid));
        return $query->row_array();
    }
    public function getInciId($id = FALSE)
    {
        $query = $this->db->get_where('incidencies', array('id_inci' => $id));
        return $query->row_array();
    }
    public function getMaterialsId($id = FALSE)
    {
        $query = $this->db->get_where('materials', array('id_mat' => $id));
        return $query->row_array();
    }
    public function getTasquesId($id = FALSE)
    {
        $query = $this->db->get_where('tasques', array('id_tasca' => $id));
        return $query->row_array();
    }
    public function get_tasca($id)
    {
        $query = $this->db->query("SELECT * FROM tasques where id_inci = $id");

        return $query->result_array();
    }

    public function get_material()
    {
        // $tascaID=$this->db->query("SELECT * FROM tasques where id_tasca = $id_tasca");
        //$inciID=$this->db->query("SELECT * FROM incidencies where id_inci = $id_inci");
        // $id_material=$this->db->query("SELECT * FROM mat_inci where id_inci = $id_inci");
        $query = $this->db->query("SELECT * FROM ((materials INNER JOIN mat_inci ON materials.id_mat = mat_inci.id_mat) INNER JOIN incidencies ON incidencies.id_inci = mat_inci.id_inci)");
        return $query->result_array();
    }
    // public function get_tasca()
    // {
    //     $query=$this->db->query("SELECT * FROM incidencies INNER JOIN tasques WHERE tasques.id_inci = incidencies.id_inci");

    //     return $query->result_array();
    // }
    public function get_document($id)
    {
        $query = $this->db->get_where('documents_tasques', array('id_tasca' => $id));
        return $query->result_array();
    }



    public function get_uuidbyid($uuid)
    {
        $this->db->select("uuid");
        $this->db->from("incidencies");
        $this->db->where(array('id_inci' => $uuid));
        $query = $this->db->get();

        $row = $query->row();

        if (isset($row)) return $row->uuid;
        else return null;
    }
}
