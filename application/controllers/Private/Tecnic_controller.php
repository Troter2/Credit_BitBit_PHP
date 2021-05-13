<?php
class Tecnic_controller extends Private_controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function update_inci_page()
    {
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
        $this->load->model('inci_model');

        $data['status'] = $this->inci_model->get_status();
        $data['tasca'] = $_SESSION['tasca'];
        $data['inci'] = $_SESSION['inci'];

        

        $this->load->view('templates/header');
        $this->load->view('tecnic/add_inci', $data);
        $this->load->view('templates/footer');
    }


    public function update_incidencia()
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
}
