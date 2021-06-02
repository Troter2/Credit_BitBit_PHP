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

        $event = json_encode($this->About_model->getEvent());
        $message = [
            'status' => RestController::HTTP_OK,
            'message' => json_encode($event)
        ];

        $this->response($message, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function tipusConsulta_get()
    {
        $this->load->model('Api_model');

        $consultes = ($this->Api_model->getTipusConsulta());
        $message = [
            'status' => RestController::HTTP_OK,
            'message' => json_encode($consultes)
        ];

        $this->response($message, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }



    public function status_get()
    {
        $this->load->model('Inci_model');
        $status = ($this->Inci_model->get_status());
        $message = [
            'status' => RestController::HTTP_OK,
            'message' => json_encode($status)
        ];

        $this->response($message, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function news_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function news_get()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('News_model');
        $news = $this->News_model->getNew();
        $message = [
            // 'status' => RestController::HTTP_OK,
            'message' => $news
        ];

        $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }
    public function login_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }


    public function login_post()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $user = $this->post('user');
        $pass = $this->post('pass');
        $this->login($user, $pass);
    }



    public function getIncidencies_post()
    {
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request(['admin', 'gestor'])) {

            $this->renewJWT();

            // ##########################################################################################
            // $this->form_validation->set_rules('title', 'Title', 'required');
            // $this->form_validation->set_rules('text', 'Text', 'required');

            // if ($this->form_validation->run() === FALSE) {
            //     $message = [
            //         'status' => RestController::HTTP_BAD_REQUEST,
            //         'message' => validation_errors()
            //     ];
            //     $this->set_response($message, RestController::HTTP_BAD_REQUEST); // BAD_REQUEST (400)
            // } else {
            $this->load->model('Api_model');
            $news = $this->Api_model->getInci();
            // $this->token_data->usr

            $message = [
                'Token' => $this->renewJWT(),
                'status' => RestController::HTTP_OK,
                'message' => json_encode($news)
            ];

            $this->set_response($message, RestController::HTTP_OK); // CREATED (201) being the HTTP response code
            // }
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
    public function getMyTask_post()
    {
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request(['admin', 'gestor'])) {

            $this->renewJWT();

            // ##########################################################################################
            // $this->form_validation->set_rules('title', 'Title', 'required');
            // $this->form_validation->set_rules('text', 'Text', 'required');

            // if ($this->form_validation->run() === FALSE) {
            //     $message = [
            //         'status' => RestController::HTTP_BAD_REQUEST,
            //         'message' => validation_errors()
            //     ];
            //     $this->set_response($message, RestController::HTTP_BAD_REQUEST); // BAD_REQUEST (400)
            // } else {
            $this->load->model('Api_model');
            $news = $this->Api_model->getInci();
            // $this->token_data->usr

            $message = [
                'Token' => $this->renewJWT(),
                'status' => RestController::HTTP_OK,
                'message' => json_encode($news)
            ];

            $this->set_response($message, RestController::HTTP_OK); // CREATED (201) being the HTTP response code
            // }
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
    
    protected function _parse_post()
    {

        if ($this->request->format === 'json') {

            //Truc per tal que el JSON quedi ben carregat (parsejat) a $_POST

            $_POST = json_decode(file_get_contents('php://input'), true);
        }

        parent::_parse_post();
    }
}
