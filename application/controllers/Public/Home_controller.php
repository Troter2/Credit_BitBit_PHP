<?php
class Home_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('msg_model');
    }

    public function view()
    {
        $this->load->view('templates/header');
        if ($this->ion_auth->logged_in()) {
            $userinfo = $this->ion_auth->user()->row();
            $user = $userinfo->username;

            $msg = $this->msg_model->getMsg($user);
            $data['messages'] = $msg;
            $this->load->view('pages/home', $data);
        }else{
            $this->load->view('pages/home');

        }
        $this->load->view('templates/footer');
    }
    public function about()
    {

        $this->load->library('ion_auth');

        $this->load->view('templates/header');
        $this->load->view('pages/about');
        $this->load->view('templates/footer');
    }

    public function contact()
    {

        $this->load->library('ion_auth');
        $this->load->library('form_validation');

        $this->load->view('templates/header');
        $this->load->view('pages/contact');
        $this->load->view('templates/footer');
    }

    public function status()
    {

        $this->load->library('ion_auth');

        $this->load->view('templates/header');
        $this->load->view('pages/status');
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
