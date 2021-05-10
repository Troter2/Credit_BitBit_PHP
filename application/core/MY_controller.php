<?php
class Admin_controller extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        
        $this->load->library('session');
        $this->load->helper('url');
    }
}
class Public_controller extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
    }
}





class Private_controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('ion_auth');
        if (!$this->ion_auth->logged_in()) {
            redirect('/home');
        }
    }
}

