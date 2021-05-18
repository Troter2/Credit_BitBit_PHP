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

    public function register_page()
    {
        $this->load->library('session');
        $this->load->library('form_validation');
        $this->load->helper('url');
        $this->load->helper('form');


        $this->load->view('templates/header');
        $this->load->view('pages/register');
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
    public function register()
    {
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->helper('form');
        $this->load->library('form_validation');

        $this->form_validation->set_rules(
            'username',
            "Nom d'usuari",
            'is_unique[users.username]||required',
            array('required' => 'usuari obligatori','is_unique' => 'Usuari existent')
        );

        $this->form_validation->set_rules(
            'email',
            "Correu electronic",
            'is_unique[users.email]',
            array('required' => 'Correu ja existent')
        );
        $this->form_validation->set_rules(
            'email',
            "Correu electronic",
            'required',
            array('required' => 'Correu obligatori')
        );
        $this->form_validation->set_rules(
            'pass',
            "Contrasenya",
            'required',
            array('required' => 'Contrasenya obligatoria')
        );
        $this->form_validation->set_rules(
            'name',
            "Nom ",
            'required',
            array('required' => 'Nom obligatori')
        );
        $this->form_validation->set_rules(
            'lastname',
            "Cognom",
            'required',
            array('required' => 'Cognom obligatori')
        );
        $this->form_validation->set_rules(
            'city',
            "Ciutat",
            'required',
            array('required' => 'Ciutat obligatori')
        );
        if ($this->form_validation->run() === FALSE) {

            $this->load->view('templates/header');
            $this->load->view('pages/register');
            $this->load->view('templates/footer');
        } else {
            $username = $this->input->post('username');
            $password = $this->input->post('pass');
            $email = $this->input->post('email');
            $additional_data = array(
                'first_name' => $this->input->post('name'),
                'last_name' => $this->input->post('lastname'),
                'city' => $this->input->post('city'),
            );

            if ($this->input->post('company')) {
                $additional_data['company'] = $this->input->post('company');
            }
            if ($this->input->post('phone')) {
                $additional_data['phone'] = $this->input->post('phone');
            }

            $additional_data['company'] = $this->input->post('company');
            $additional_data['phone'] = $this->input->post('phone');
            $this->ion_auth->register($username, $password, $email, $additional_data);
            $is_logged = $this->ion_auth->login($username, $password);
            redirect(base_url('/home'));
        }
        //if () != false) {
        //} else {
        //    $data['error'] = $this->ion_auth->errors();
        //
        //    $this->load->view('templates/header');
        //    $this->load->view('pages/register', $data);
        //    $this->load->view('templates/footer');
        //}
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
