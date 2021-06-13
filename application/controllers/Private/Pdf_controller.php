<?php
class Pdf_controller extends Private_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('Pdf');
        $this->load->model('Inci_model');
    }



    public function generatePDF($uuid, $tasca)
    {

        
        $this->load->helper('url');
        $incidencia = $this->Inci_model->get_incidencia($uuid);
        $id = $incidencia['id_inci'];

        $tasca = $this->Inci_model->get_tasca($id);

        $material = $this->Inci_model->get_material();

        //  print_r($tasca);
        //  die;

        $pdf = new Pdf(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 009', PDF_HEADER_STRING);
        $pdf->urlpdf = base_url('incidencies/' . $incidencia['uuid']);
        // set default header data


        // set header and footer fonts
        //        $pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
        $pdf->SetPrintHeader(false);
        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        $pdf->AddPage();

        // set text shadow effect
        $pdf->setTextShadow(array('enabled' => false, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array(196, 196, 196), 'opacity' => 1, 'blend_mode' => 'Normal'));
        $pdf->Image('/assets/img/logo/favIcon.svg', 15, 140, 75, 113, 'svg', '', '', true, 150, '', false, false, 1, false, false, false);

        // Set some content to print
        //      <link rel="icon" type="image/png" href="<?php echo base_url("/assets/img/logo/favIcon.svg")
        if ($incidencia['out_date'] != NULL) {
            $date_out = '<p style="text-align: justify;text-justify: inter-word;">Data sortida: ' . $incidencia['out_date'] . '</p>';
        } else {
            $date_out = '';
        }

        $totesAccions = '';
        $TotElMaterial = '';


        foreach ($tasca as $task) {
            $accioRealitzada = '<p style="text-align: justify;text-justify: inter-word;">Tasca: ' . $task['desc'] . '</p>
                            <p style="text-align: justify;text-justify: inter-word;">Acció necessaria: <br/>' . $task['accions'] . '</p>';

            if (isset($task['canvas']) && $task['canvas'] != '') {

                $accioRealitzada = '<img src="@' . $task['canvas'] . '"><hr>';
            }
            $id = $task['id_tasca'];
            $document = $this->Inci_model->get_document($id);

            //print_r($document);
            //die;
            foreach ($document as $doc) {
                //$DocumentAccio = '<p>Imatge: <img src="'. base_url() . '/' . $doc['path'].'/'. $doc['image'] .'"></p>';
                $DocumentAccio = '<p>Imatge: <img src="http://localhost/Credit_BitBit_PHP/images/' . $task['id_inci'] . '/' . $doc['image'] . '"></p>';
            }
            $totesAccions = $totesAccions . $accioRealitzada . $DocumentAccio;
        }




        foreach ($material as $mat) {
            $materialUtilitzat = '<p style="text-align: justify;text-justify: inter-word;">' . $mat['nom'] . '</p>';

            $TotElMaterial = $TotElMaterial . $materialUtilitzat;
        }




        $html = '
        <div><img src="/Credit_BitBit_PHP/assets/img/logo/LogoPDF.svg" alt="" width:"50" height:"50"></div>
        <h1 style="text-align: center;color:red;">' . $incidencia['nom_propietari'] . '</h1>
        <div><p>Nom del propietari: <br/><br/> ' . $incidencia['nom_propietari'] . '</p></div>
        <div><p>Marca del ordinador: <br/><br/>' . $incidencia['marca'] . '</p></div>
        <div><p>Model del ordinador: <br/><br/>' . $incidencia['model'] . '</p></div>
        <div><p>Numero de serie: <br/><br/>' . $incidencia['numero_serie'] . '</p></div>
        <div><p>Descripcio de la avaria: ' . $incidencia['desc_averia'] . '</p></div>
        <div><p>Diagnosi previ: ' . $incidencia['diagnosis_prev'] . '</p></div>
        <div><p>' . $totesAccions . '</p></div>
        <div><p>Material utilitzat: ' . $TotElMaterial . '</p></div>
        <div><p>Data entrada: <br/><br/>' . $incidencia['entry_date'] . '</p></div>
        <div><p>' . $date_out . '</p></div>
        
        ';
        //$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);
        $pdf->writeHTML($html, true, false, false, false, '');



        // ---------------------------------------------------------

        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        $pdf->Output('example_001.pdf', 'I');
    }

    
}
