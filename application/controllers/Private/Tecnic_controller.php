<?php
class Tecnic_controller extends Private_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('upload');
    }

    public function update_inci_page()
    {
        $this->load->library('ion_auth');
        $this->load->library('form_validation');
        $this->load->model('inci_model');

        if ($this->ion_auth->in_group('gestor') || $this->ion_auth->in_group('tecnic')) {
        } else {
            redirect(base_url('home'));
        }

        $data['status'] = $this->inci_model->get_status();
        $data['material'] = $this->inci_model->get_material();

        $data['tasca'] = $_SESSION['tasca'];
        $data['inci'] = $_SESSION['inci'];

        $data['images'] = $this->inci_model->getImgTasca($_SESSION['tasca']['id_tasca']);

        $data['inci'] = $_SESSION['inci'];



        $this->load->view('templates/header');
        $this->load->view('tecnic/add_inci', $data);
        $this->load->view('templates/footer');
    }

    public function delete_image_page($id)
    {

        $this->load->model('inci_model');
        $this->inci_model->deleteImg($id);
        redirect(base_url('tecnic/update_inci'));
    }


    public function update_inci()
    {
        $this->load->model('inci_model');
        $this->load->model('Tecnic_model');
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');
        $path = "../../uploads/incidencies/" . $_SESSION['inci']['id_inci'];

        if ($this->ion_auth->in_group('gestor') || $this->ion_auth->in_group('tecnic')) {
        } else {
            redirect(base_url('home'));
        }
        if (!is_dir($path))
            mkdir($path);



        $config['upload_path']          = $path;
        $config['allowed_types']        = 'gif|jpg|png';
        $config['encrypt_name']         = true;

        $this->upload->initialize($config);

        for ($i = 1; $i < 4; $i++) {
            if (isset($_FILES["doc" . $i]) && $_FILES["doc" . $i]["name"] != "") {
                if (!$this->upload->do_upload('doc' . $i)) {
                    $error = array('error' => $this->upload->display_errors());
                    echo "ERROR: " . $i . "<br>";
                } else {
                    $data = array('upload_data' => $this->upload->data());
                    $data = array(
                        'image' => $data['upload_data']['file_name'],
                        'path' =>  $_SESSION['inci']['id_inci'],
                        'id_tasca' => $_SESSION['tasca']['id_tasca']
                    );

		            $this->Tecnic_model->insert_document_tasques($data);
                    //$this->db->insert('documents_tasques', $data);
                }
            }

        }
        $idTasca = $_SESSION['tasca']['id_tasca'];
        $estatus = $this->input->post('estatus');
        if ($estatus == '3') {
			$this->Tecnic_model->insertar_TascData($idTasca);

        }
        $dades =  $_SESSION['inci']['id_inci'];
        
		$this->Tecnic_model->insertar_estat($estatus, $dades);




		
        $action = $this->input->post('action');
        $this->Tecnic_model->insertar_accio($action, $idTasca);

        $canvas = $this->input->post('CFILE');

        $this->Tecnic_model->insertar_canvas($canvas, $idTasca);


        redirect(base_url('tecnic/tasques/success/'));
    }
}
