<?php
class Pdf_controller extends Private_controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('Pdf');
        $this->load->model('Inci_model');
    }
    public function generatePDF($uuid)
    {
        $this->load->helper('url');
        $incidencia = $this->Inci_model->get_incidencia($uuid);

        $pdf = new Pdf(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
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

        // Set some content to print


        $html = '
        <h1 style="text-align: center;color:red;">' . $incidencia['nom_propietari'] . '</h1>
        <div><p>Nom del propietari: '. $incidencia['nom_propietari'] . '</p></div>
        <div><p>Marca del ordinador: '. $incidencia['marca'] . '</p></div>
        <div><p>Model del ordinador: '. $incidencia['model'] . '</p></div>
        <div><p>Nom: '. $incidencia['nom_propietari'] . '</p></div>
        <div><p>Nom: '. $incidencia['nom_propietari'] . '</p></div>
        <div><p>Nom: '. $incidencia['nom_propietari'] . '</p></div>
        <div><p>Nom: '. $incidencia['nom_propietari'] . '</p></div>
        <div><p>Nom: '. $incidencia['nom_propietari'] . '</p></div>

        <h3>' . $incidencia['nom_propietari'] . '</h3>
        <p style="text-align: justify;text-justify: inter-word;">' . $incidencia['nom_propietari'] . '</p>';

        // Print text using writeHTMLCell()
        $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);


        // ---------------------------------------------------------

        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        $pdf->Output('example_001.pdf', 'I');
    }
}