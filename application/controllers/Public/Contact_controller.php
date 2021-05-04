<?php
class Contact_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('news_model');
        $this->load->model('contact_model');

    }

    public function view_contact()
    {
        $this->load->library('ion_auth');
        $this->load->library('form_validation');

        $reason = $this->contact_model->getContactReason();
        $data['reasons'] = $reason;

        $this->load->view('templates/header');
        $this->load->view('pages/contact', $data);
        $this->load->view('templates/footer');
    }


    public function sendConsult()
    {

        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');
        
        $this->contact_model->setConsult();

        redirect(base_url('/home'));
    }
}