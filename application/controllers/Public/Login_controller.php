<?php
class Login_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
    }

    public function login_page()
    {
        $this->load->library('session');
        $this->load->library('form_validation');
        $this->load->helper('url');
        $this->load->helper('form');


        $this->load->view('templates/header');
        $this->load->view('pages/login');
        $this->load->view('templates/footer');
    }

    public function login()
    {
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');

        $identity = $this->input->post('user');
        $password = $this->input->post('userpass');
        $remember = $this->input->post('remember'); // remember the user
        $is_logged = $this->ion_auth->login($identity, $password, $remember);


        $this->load->view('templates/header');
        if ($is_logged) {
            $this->session->set_userdata('logged_user', $identity);
            redirect(base_url('home'));
        } else {
            redirect(base_url('login'));
        }
        $this->load->view('templates/footer');
    }
    public function logout()
    {
        $this->load->library('session');
        $this->load->helper('url');

        $this->ion_auth->logout();
        $this->session->unset_userdata('logged_user');
        redirect(base_url('home'));
    }
}
