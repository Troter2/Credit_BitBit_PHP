<?php
class Image_controller extends Public_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url_helper');
        $this->load->library('ion_auth');
        $this->load->model('news_model');
        $this->load->model('contact_model');
    }

    public function show_inci_img($inci, $img)
    {


        $this->load->helper('download');
        $file_name = '../../uploads/incidencies/' . $inci . '/' . $img;
        
        force_download($file_name,null);
    }
}
