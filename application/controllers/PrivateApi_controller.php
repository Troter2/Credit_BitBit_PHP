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

    public function about_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function about_get()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('About_model');

        $event = $this->About_model->getEvent();

        $this->response($event, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }
    public function tipusConsulta_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function tipusConsulta_get()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('Api_model');
        $news = $this->Api_model->getTipusConsulta();
        $message = [
            // 'status' => RestController::HTTP_OK,
            'message' => $news
        ];

        $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code
    }


    public function consulta_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function consulta_post()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('Api_model');
        $this->load->library('form_validation');
        $this->form_validation->set_rules('nom', 'nom', 'required');
        $this->form_validation->set_rules('email', 'email', 'required');
        $this->form_validation->set_rules('assumpte', 'assumpte', 'required');
        $this->form_validation->set_rules('content', 'content', 'required');
        $this->form_validation->set_rules('id_consulta', 'id_consulta', 'required');

        if ($this->form_validation->run() === FALSE) {
            $message = [
                'nom' => $this->input->post('nom'),
                'email' => $this->input->post('email'),
                'assumpte' => $this->input->post('assumpte'),
                'contingut' => $this->input->post('content'),
                'id_consulta' => $this->input->post('id_consulta'),
                'status' => RestController::HTTP_BAD_REQUEST,
                'message' => validation_errors()
            ];
            $this->set_response($message, RestController::HTTP_BAD_REQUEST); // BAD_REQUEST (400)
        } else {
            $this->Api_model->setConsult();

            $message = [
                'nom' => $this->input->post('nom'),
                'email' => $this->input->post('email'),
                'assumpte' => $this->input->post('assumpte'),
                'contingut' => $this->input->post('content'),
                'id_consulta' => $this->input->post('id_consulta'),
                'status' => RestController::HTTP_CREATED,
                'message' => 'Added a resource'
            ];

            $this->set_response($message, RestController::HTTP_CREATED); // CREATED (201) being the HTTP response code
        }


        // $this->response($consultes, RestController::HTTP_OK); // OK (200) being the HTTP response code
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
        if ($this->input->get('id') != null) {
            $id = $this->input->get('id');
            $this->output->set_header("Access-Control-Allow-Origin: *");
            $this->load->model('News_model');
            $new = $this->News_model->getNewId($id);

            $this->response($new, RestController::HTTP_OK); // OK (200) being the HTTP response code

        } else {
            $this->output->set_header("Access-Control-Allow-Origin: *");
            $this->load->model('News_model');
            $news = $this->News_model->getNew();

            $this->response($news, RestController::HTTP_OK); // OK (200) being the HTTP response code

        }
    }
    public function mail_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS, POST");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }


    public function mail_post()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request()) {

            $newToken = $this->renewJWT();

            // ##########################################################################################
            $this->form_validation->set_rules('to', 'to', 'required');
            $this->form_validation->set_rules('about', 'About', 'required');
            $this->form_validation->set_rules('content', 'Content', 'required');

            if ($this->form_validation->run() === FALSE) {
                $message = [
                    'to' => $this->post('to'),
                    'about' => $this->post('about'),
                    'status' => RestController::HTTP_BAD_REQUEST,
                    'message' => validation_errors()
                ];
                $this->set_response($message, RestController::HTTP_OK); // BAD_REQUEST (400)
            } else {
                /////////////////////////////////////////////////////////////////////////////////////
                //                             FALTA MIRAR LA CRIDA                                //
                /////////////////////////////////////////////////////////////////////////////////////
                //- ES TE QUE PASSAR EL ID DEL USUARI QUE ESTA AL TOKEN
                $token = explode(" ", $this->head("Authorization"));
                $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                $decoded = JWT::decode($token[1], $key, array('HS256'));

                $to = $this->Api_model->get_user_id($this->post('to'));

                $this->Api_model->set_mail($this->post('content'), $to['id'], $this->post('about'), $decoded->usr);

                $message = [
                    'status' => RestController::HTTP_CREATED,
                    'token' => $newToken,
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

    public function incidencies_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS, POST");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function incidencies_get()
    {
        $this->load->model('Api_model');
        $this->load->library('form_validation');
        $this->output->set_header("Access-Control-Allow-Origin: *");

        if ($this->auth_request()) {

            $this->renewJWT();

            if ($this->head("Authorization") != null) {
                $token = explode(" ", $this->head("Authorization"));
                if ($this->input->get('limit') != null||$this->input->get('offset') != null) {
                    $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                    $decoded = JWT::decode($token[1], $key, array('HS256'));
                    $limit = $this->input->get('limit');
                    $offset = $this->input->get('offset');
                    $jwt = $this->renewJWT(); // Get new Token and set to HTTP header
                    $this->load->model('Api_model');
                    $incidencies = $this->Api_model->getInciByOwner($decoded->usr, $limit, $offset);

                    $message = [
                        'status' => RestController::HTTP_OK,
                        'token' => $jwt,
                        'incidencies' => $incidencies
                    ];
                    $this->response($message, RestController::HTTP_OK); // OK (200) being the HTTP response code
                } else {
                    $id = $this->input->get('id');
                    $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                    $decoded = JWT::decode($token[1], $key, array('HS256'));

                    $this->load->model('Api_model');
                    $mails = $this->Api_model->getMail($decoded->usr, $id);
                    $this->response($mails, RestController::HTTP_OK); // OK (200) being the HTTP response code
                }
            } else {

                $this->response('error', RestController::HTTP_BAD_REQUEST); // OK (200) being the HTTP response code
            }
        }
    }
    public function mail_get()
    {
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request()) {

            $this->renewJWT();

            $this->output->set_header("Access-Control-Allow-Origin: *");
            if ($this->head("Authorization") != null) {
                $token = explode(" ", $this->head("Authorization"));
                if ($this->input->get('id') == null) {
                    $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                    $decoded = JWT::decode($token[1], $key, array('HS256'));
                    $jwt = $this->renewJWT(); // Get new Token and set to HTTP header
                    $this->load->model('Api_model');
                    $mails = $this->Api_model->getMails($decoded->usr);

                    $message = [
                        'status' => RestController::HTTP_OK,
                        'token' => $jwt,
                        'mails' => $mails
                    ];
                    $this->response($message, RestController::HTTP_OK); // OK (200) being the HTTP response code
                } else {
                    $id = $this->input->get('id');
                    $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                    $decoded = JWT::decode($token[1], $key, array('HS256'));

                    $this->load->model('Api_model');
                    $mails = $this->Api_model->getMail($decoded->usr, $id);
                    $this->response($mails, RestController::HTTP_OK); // OK (200) being the HTTP response code
                }
            } else {

                $this->response('error', RestController::HTTP_BAD_REQUEST); // OK (200) being the HTTP response code
            }
        }
    }

    public function getUser_options()
    {
        $this->output->set_header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");
        $this->output->set_header("Access-Control-Allow-Methods: GET, DELETE, OPTIONS, POST");
        $this->output->set_header("Access-Control-Allow-Origin: *");

        $this->response(null, API_Controller::HTTP_OK); // OK (200) being the HTTP response code
    }

    public function getUser_get()
    {
        $this->output->set_header("Access-Control-Allow-Origin: *");
        $this->load->model('Api_model');
        $this->load->library('form_validation');

        if ($this->auth_request()) {

            $this->renewJWT();

            if ($this->head("Authorization") != null) {
                $token = explode(" ", $this->head("Authorization"));
                $key = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';
                $decoded = JWT::decode($token[1], $key, array('HS256'));
                $jwt = $this->renewJWT(); // Get new Token and set to HTTP header

                $this->load->model('Api_model');
                $user=$this->Api_model->get_user_by_id($decoded->usr);

                $message = [
                    'status' => RestController::HTTP_OK,
                    'token' => $jwt,
                    'user' => $user
                ];
                $this->response($message, RestController::HTTP_CREATED); // OK (200) being the HTTP response code

            } else {

                $this->response('error', RestController::HTTP_BAD_REQUEST); // OK (200) being the HTTP response code
            }
        }
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


    protected function _parse_post()
    {

        if ($this->request->format === 'json') {

            //Truc per tal que el JSON quedi ben carregat (parsejat) a $_POST

            $_POST = json_decode(file_get_contents('php://input'), true);
        }

        parent::_parse_post();
    }
}
