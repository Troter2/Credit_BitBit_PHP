<?php
require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';

class Pdf extends TCPDF
{
    public $urlpdf;

    function __construct()
    {
        parent::__construct();
    }
}
