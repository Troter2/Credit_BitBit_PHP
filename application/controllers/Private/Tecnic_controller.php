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


        $data['status'] = $this->inci_model->get_status();
        $data['material'] = $this->inci_model->get_material();

        $data['tasca'] = $_SESSION['tasca'];
        $data['inci'] = $_SESSION['inci'];



        $this->load->view('templates/header');
        $this->load->view('tecnic/add_inci', $data);
        $this->load->view('templates/footer');
    }


    public function update_inci()
    {
        $this->load->model('inci_model');
        $this->load->library('ion_auth');
        $this->load->helper('url');
        $this->load->helper('form');
        $path="assets/uploads/incidencies/".$_SESSION['inci']['id_inci'];

        if (!is_dir ($path)) 
            mkdir($path);
        // mkdir(realpath($path));

        $config['upload_path']          = $path;
        $config['allowed_types']        = 'gif|jpg|png';
        $config['encrypt_name']         = true;

        $this->upload->initialize($config);

        for ($i=1;$i<4;$i++)
        {
            if (isset($_FILES["doc".$i]) && $_FILES["doc".$i]["name"]!="")
            {
                if (!$this->upload->do_upload('doc'.$i)) {
                    $error = array('error' => $this->upload->display_errors());
                    echo "ERROR: " . $i . "<br>";
                    print_r($error);
                    die;
                } else {
                    $data = array('upload_data' => $this->upload->data());
                    $data = array(
                        'image' => $data['upload_data']['file_name'],
                        'path' => "assets/test/uploads/incidencies/".$_SESSION['inci']['id_inci'],
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
        $this->db->set('id_estat', $estatus);
        $this->db->where('id_inci', $_SESSION['inci']['id_inci']);
        $this->db->update('incidencies');

        $action = $this->input->post('action');
        $this->db->set('accions', $action);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');

        $canvas = $this->input->post('CFILE');
        
        $this->db->set('canvas', $canvas);
        $this->db->where('id_tasca', $idTasca);
        $this->db->update('tasques');
        redirect(base_url('tecnic/tasques/success/'));
    }
}
