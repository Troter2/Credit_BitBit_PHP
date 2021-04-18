<?php
class User_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
    }

    public function user_profile()
    {

        $this->load->view('templates/header');
        $this->load->view('pages/user_profile');
        $this->load->view('templates/footer');
    }
    public function user_edit_page()
    {

        $this->load->helper('form');
        
        $this->load->view('templates/header');
        $this->load->view('pages/user_edit');
        $this->load->view('templates/footer');
    }
}
