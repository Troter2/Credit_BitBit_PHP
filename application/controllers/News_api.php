<?php

use chriskacerguis\RestServer\RestController;

defined('BASEPATH') or exit('No direct script access allowed');
class News_api extends API_Controller
{
    public function __construct()
    {
        parent::__construct();
    }
    public function status_get()
    {
        $this->load->model('Inci_model');
        $news = $this->Inci_model->get_status();

        $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }
    public function index_delete()
    {
        $this->load->model('newsmodel');

        $id = $this->delete('id', true); // true for XSS Clean

        $affected_rows = $this->newsmodel->drop_news($id);

        $message = [
            'id' => $id,
            'message' => 'Resource deleted'
        ];
        $this->set_response($message, RestController::HTTP_OK); // CREATED (200) being the HTTP response code
    }
    public function index_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }
}
