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
