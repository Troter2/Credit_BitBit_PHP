<?php
class Mail_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('msg_model');
    }

    public function view($id)
    {
        $this->load->helper('url');


        $msg = $this->msg_model->getMsgId($id);
        if($msg->recive_date==NULL){
            $this->msg_model->setMsgRecived($id);
        }
        $data['message'] = $msg;
        $this->load->view('templates/header');
        $this->load->view('mail/view_mail', $data);
        $this->load->view('templates/footer');
    }

    public function send()
    {
        $this->load->helper('url');
        $this->load->helper('form');


        $this->load->view('templates/header');
        $this->load->view('mail/create_mail');
        $this->load->view('templates/footer');
    }
    public function sendMail()
    {

        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');

        $userinfo = $this->ion_auth->user()->row();
        $user = $userinfo->username;

        $this->msg_model->setMsg($user);

        redirect(base_url('/home'));
    }
}
