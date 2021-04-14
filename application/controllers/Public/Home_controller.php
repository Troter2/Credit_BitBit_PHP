<?php
class Home_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
    }

    public function view()
    {

        $this->load->library('ion_auth');
        
        $this->load->view('templates/header');
        $this->load->view('pages/index');
        $this->load->view('templates/footer');
    }
    public function about(){
        
        $this->load->library('ion_auth');
        
        $this->load->view('templates/header');
        $this->load->view('pages/about');
        $this->load->view('templates/footer');
    }

    public function contact(){
        
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
        
        $this->load->view('templates/header');
        $this->load->view('pages/contact');
        $this->load->view('templates/footer');
    }
    
    public function status(){
        
        $this->load->library('ion_auth');
        
        $this->load->view('templates/header');
        $this->load->view('pages/status');
        $this->load->view('templates/footer');
    }

}
