<?php
class Incidencia_controller extends Private_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('inci_model');
        $this->load->library('session');
    }

    public function save_incidencia_page()
    {
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
        $data = [];
        if ($this->session->has_userdata('error')) {
            $data['error'] = $this->session->userdata('error');
            unset($_SESSION['error']);
        }

        $this->load->view('templates/header');
        $this->load->view('incidencies/add_inci', $data);
        $this->load->view('templates/footer');
    }


    public function save_incidencia()
    {
        $this->load->model('inci_model');
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');

        if ($this->inci_model->exist() == 0) {
            $this->session->set_userdata('error', 'Incidencia inexistent');
            redirect('user/save_incidencia');
        } else if (!$this->inci_model->has_owner()) {
            $this->session->set_userdata('error', 'Ja te propietari');
            redirect('user/save_incidencia');
        } else {
            $this->inci_model->setOwner();
        }

        redirect(base_url('/user/incidencies'));
    }

    public function tasques_incidencia($uuid){
        $incidencia = $this->model->get_incidencia($uuid);
        $id_inci = $incidencia['id_inci'];
        $tasca = $this->model->get_tasca($id_inci);
    }
}
