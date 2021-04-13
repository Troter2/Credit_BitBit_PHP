<?php
class Login_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
    }

    public function login_page()
    {
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->library('ion_auth');
        $this->load->view('templates/header');
        $this->load->view('login/login');
        $this->load->view('templates/footer');
    }
}
