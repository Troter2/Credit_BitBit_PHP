<?php
class About_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('about_model');
    }

    public function view_about()
    {
        $this->load->library('ion_auth');

        $event = $this->about_model->getEvent();
        $data['events'] = $event;

        $this->load->view('templates/header');
        $this->load->view('pages/about', $data);
        $this->load->view('templates/footer');
    }
}
