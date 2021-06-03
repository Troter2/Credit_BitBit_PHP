<?php
defined('BASEPATH') or exit('No direct script access allowed');

$config['jwt_key'] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';

$config['jwt_autorenew'] = TRUE;
$config['jwt_timeout'] = 6000;

$config['jwt_table'] = 'tokens';
