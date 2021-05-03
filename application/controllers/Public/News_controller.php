<?php
class News_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('news_model');
    }

    public function view_new($id)
    {
        $this->load->helper('url');


        $new = $this->news_model->getNewId($id);
        $data['new'] = $new;
        $this->load->view('templates/header');
        $this->load->view('new/view_new', $data);
        $this->load->view('templates/footer');
    }

    public function view_all_new()
    {
        $this->load->helper('url');


        $new = $this->news_model->getNew();
        $data['news'] = $new;
        $this->load->view('templates/header');
        $this->load->view('pages/home', $data);
        $this->load->view('templates/footer');
    }

    public function view_create_news()
    {
        $this->load->helper('url');
        $this->load->helper('form');


        $this->load->view('templates/header');
        $this->load->view('news/create_news');
        $this->load->view('templates/footer');
    }
    public function create_news()
    {
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');


        $this->news_model->setNew();

        redirect(base_url('/home'));
    }
}
