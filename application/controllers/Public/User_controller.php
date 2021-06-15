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

        $user = $this->ion_auth->user()->row();
        $data["user"] = $user;
        $data["group"] = $this->ion_auth->get_users_groups($user->id)->result();
        $this->load->view('templates/header');
        $this->load->view('pages/user_profile', $data);
        $this->load->view('templates/footer');
    }
    public function user_edit_page()
    {

        $this->load->helper('form');
        $user = $this->ion_auth->user()->row();
        $data["user"] = $user;
        $data["group"] = $this->ion_auth->group($user->id)->result();
        $this->load->view('templates/header');
        $this->load->view('pages/user_edit', $data);
        $this->load->view('templates/footer');
    }

    public function pass_edit_page()
    {
        $this->load->helper('form');
        $user = $this->ion_auth->user()->row();
        $data["user"] = $user;
        $data["group"] = $this->ion_auth->group($user->id)->result();
        $this->load->view('templates/header');
        $this->load->view('pages/pass_edit', $data);
        $this->load->view('templates/footer');
    }

    public function update()
    {
        $user = $this->ion_auth->user()->row();
        $id = $user->id;
        $data = array(
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'phone' => $this->input->post('phone'),
            'email' => $this->input->post('email'),
        );
        $this->ion_auth->update($id, $data);
        redirect(base_url('userProfile'));
    }

    public function update_pass()
    {
        $user = $this->ion_auth->user()->row();
        $id = $user->id;
        $oldPass = $this->input->post('oldPass');
        $username = $user->username;
        if ($this->ion_auth->login($username, $oldPass)) {
            $newPass = $this->input->post('newPass');
            $data = array(
                'password' => $newPass
            );
            $this->ion_auth->update($id,$data);
            redirect(base_url('userProfile'));
        } else {
            redirect(base_url('passEdit'));
        }
    }
}
