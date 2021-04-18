<?php
class Public_controller extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        $this->load->library('ion_auth');
    }
}
