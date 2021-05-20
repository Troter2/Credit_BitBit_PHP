<?php

use chriskacerguis\RestServer\RestController;

class PrivateApi_controller extends JwtAPI_Controller
{


    public function __construct()
    {
        parent::__construct();

        $config = [
            //            "iat" => time(), // AUTOMATIC value 
            //            "exp" => time() + 300, // expires 5 minutes AUTOMATIC VALUE
            "sub" => "secure.jwt.daw.local", // subject of token
            "jti" => $this->uuid->v5('secure.jwt.daw.local') // Json Token Id
        ];
        $this->init($config, 300); // configuration + auth timeout
        // $this->init($config); // configuration + auth timeout is configured from JWT config file
    }


    
    public function about_get()
    {
        $this->load->model('About_model');

        $query = $this->About_model->getEvent();

        $this->response($query, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }



    public function status_get()
    {
        $this->load->model('Inci_model');
        $news = $this->Inci_model->get_status();

        $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }



    public function news_get()
    {
        $this->load->model('News_model');
        $news = $this->News_model->getNew();

        $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }



    public function login_post()
    {
        $user = $this->post('user');
        $pass = $this->post('pass');
        $this->login($user, $pass);
    }

    public function news_post()
    {
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request()) {

            $this->renewJWT();

            // ##########################################################################################
            $this->form_validation->set_rules('title', 'Title', 'required');
            $this->form_validation->set_rules('text', 'Text', 'required');

            if ($this->form_validation->run() === FALSE) {
                $message = [
                    'title' => $this->post('title'),
                    'text' => $this->post('text'),
                    'status' => RestController::HTTP_BAD_REQUEST,
                    'message' => validation_errors()
                ];
                $this->set_response($message, RestController::HTTP_BAD_REQUEST); // BAD_REQUEST (400)
            } else {
                $this->newsmodel->set_news($this->post('title'), $this->post('text'));

                $message = [
                    'title' => $this->post('title'),
                    'text' => $this->post('text'),
                    'status' => RestController::HTTP_CREATED,
                    'message' => 'Added a resource'
                ];

                $this->set_response($message, RestController::HTTP_CREATED); // CREATED (201) being the HTTP response code
            }
            // ##########################################################################################

        } else {
            $message = [
                'status' => $this->auth_code,
                'token' => "",
                'message' => 'Bad auth information. ' . $this->error_message
            ];
            $this->set_response($message, $this->auth_code); // 400 / 401 / 419 / 500
        }
    }
}
