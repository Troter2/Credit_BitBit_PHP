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
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');
        $path = "assets/uploads/incidencies/" . $_SESSION['inci']['id_inci'];

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
                        'path' => "assets/uploads/incidencies/" . $_SESSION['inci']['id_inci'],
                        'id_tasca' => $_SESSION['tasca']['id_tasca']
                    );
                    $this->db->insert('documents_tasques', $data);
                }
            }
        }






        /*

        if (!$this->upload->do_upload('doc2')) {
            $error = array('error' => $this->upload->display_errors());
            echo "2222222222222";
            print_r($error);
            die;
        } else {
            $data = array('upload_data' => $this->upload->data());
        }
        
        if (!$this->upload->do_upload('doc3')) {
            $error = array('error' => $this->upload->display_errors());
            echo "3333333333333";
            print_r($error);
            die;
        } else {
            $data = array('upload_data' => $this->upload->data());
        }
*/

        $idTasca = $_SESSION['tasca']['id_tasca'];
        $estatus = $this->input->post('estatus');
        if ($estatus == '3') {
            $this->db->set("end_date", date('Y-m-d'));
            $this->db->set("end_hour", date("h:i:s"));
            $this->db->where("id_tasca", $idTasca);
            $this->db->update('tasques');
        }
        $this->db->set('id_estat', $estatus);
        $this->db->where('id_inci', $_SESSION['inci']['id_inci']);
        $this->db->update('incidencies');

        $action = $this->input->post('action');
        $this->db->set('accions', $action);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');

        $canvas = $this->input->post('CFILE');

        if ($canvas != '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') {
            $this->db->set('canvas', $canvas);
            $this->db->where('id_tasca', $idTasca);
            $this->db->update('tasques');
        }
        redirect(base_url('tecnic/tasques/success/'));
    }
}
