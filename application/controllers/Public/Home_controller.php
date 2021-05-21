<?php
class Home_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('msg_model');
        $this->load->model('contact_model');
        $this->load->model('about_model');
        $this->load->model('news_model');
    }

    public function view()
    {

        $this->load->view('templates/header');
        $this->load->helper('text');
        $new = $this->news_model->getNew();
        $data['news'] = $new;


        $this->load->view('pages/home', $data);

        $this->load->view('templates/footer');
    }

    public function contact()
    {

        $this->load->library('ion_auth');
        $this->load->library('form_validation');

        $reason = $this->contact_model->getContactReason();
        $data['reasons'] = $reason;

        $this->load->view('templates/header');
        $this->load->view('pages/contact', $data);
        $this->load->view('templates/footer');
    }

    public function privacitat()
    {

        $this->load->library('ion_auth');

        $this->load->view('templates/header');
        $this->load->view('pages/politica_priv');
        $this->load->view('templates/footer');
    }

    public function details()
    {

        $this->load->library('ion_auth');

        $this->load->view('templates/header');
        $this->load->view('pages/detail_status');
        $this->load->view('templates/footer');
    }
}
