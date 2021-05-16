<?php
 defined('BASEPATH') OR exit('No direct script access allowed');

$config['jwt_key'] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzZWN1cmUuand0LmRhdy';

$config['jwt_autorenew'] = TRUE;
$config['jwt_timeout'] = 300;

$config['jwt_table'] = 'tokens';
                      
