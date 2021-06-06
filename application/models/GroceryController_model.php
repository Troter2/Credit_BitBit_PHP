<?php
class GroceryController_model extends CI_Model { 

    public function __construct () 
    { 
        parent::__construct();
        $this->load->database();
    } 


    public function get_tasques ($id) 
    { 
        $tasca = $this->db->get_where('tasques', array('id_tasca' => $id));
        return $tasca;
    } 

    public function get_incidencies ($tasca) 
    { 
        $inci = $this->db->get_where('incidencies', array('id_inci' => $tasca['id_inci']));
        return $inci;
    } 
    

    public function insertar_pass_hashed ($passwordHashed, $username) 
    { 
        $this->db->set('password', $passwordHashed);
        $this->db->where('username', $username);
        $this->db->update('users');
    } 


    public function insert_userGroups($data)
    { 
        $this->db->insert('users_groups', $data);

    } 

    public function pass_hashed($passwordHashed, $username)
    { 
        $this->db->set('password', $passwordHashed);
		$this->db->where('username', $username);
		$this->db->update('users');

    } 

    public function cantidad_material($id_mat){
        $this->db->select("amount");
		$this->db->from("materials");
		$this->db->where(array('id_mat' => $id_mat));
    }


    public function get_amount(){
        $query=$this->db->get();
        return $query;
    }
    
    public function cantidad_materialTotal($total_amount, $id_mat){
    $this->db->set("amount", $total_amount);
    $this->db->where("id_mat", $id_mat);
    $this->db->update('materials');
    }

    public function materialUsado($id_mat){
        $this->db->select("amount");
		$this->db->from("materials");
		$this->db->where(array('id_mat' => $id_mat));
    }

    public function update_cantidad_material($total_amount, $id_mat){
        $this->db->set("amount", $total_amount);
		$this->db->where("id_mat", $id_mat);
		$this->db->update('materials');
    }
        
}