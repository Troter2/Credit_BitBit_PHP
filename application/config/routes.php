<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the 
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;






$route['home'] = 'Public/Home_controller/view';
$route['login'] = 'Public/Login_controller/login_page';
$route['register'] = 'Public/Login_controller/register_page';
$route['logout'] = 'Public/Login_controller/logout';

$route['about'] = 'Public/About_controller/view_about';
$route['contact'] = 'Public/Home_controller/contact';

$route['privacitat'] = 'Public/Home_controller/privacitat';

$route['userProfile'] = 'Public/User_controller/user_profile';
$route['userEdit'] = 'Public/User_controller/user_edit_page';
$route['passEdit'] = 'Public/User_controller/pass_edit_page';
$route['updateUser'] = 'Public/User_controller/update';
$route['updatePass'] = 'Public/User_controller/update_pass';

$route['details'] = 'Public/Home_controller/details';

$route['login/login'] = 'Public/Login_controller/login';
$route['login/register'] = 'Public/Login_controller/register';


$route['mail/view/(:num)'] = 'Public/Mail_controller/view/$1';
$route['mail/send'] = 'Public/Mail_controller/send';
$route['mail/sendMail'] = 'Public/Mail_controller/sendMail';




$route['news/view/(:num)'] = 'Public/News_controller/view_new/$1';
$route['news/send'] = 'Public/News_controller/send';
$route['news/sendMail'] = 'Public/News_controller/sendMail';

$route['gestor/tasques'] = 'Private/Grocery_controller/tasques';
$route['gestor/tasques/(:any)'] = 'Private/Grocery_controller/tasques/$1';
$route['gestor/tasques/(:any)/(:any)'] = 'Private/Grocery_controller/tasques/$1/$2';

$route['gestor/inci'] = 'Private/Grocery_controller/incidencies';
$route['gestor/inci/(:any)'] = 'Private/Grocery_controller/incidencies/$1';
$route['gestor/inci/(:any)/(:any)'] = 'Private/Grocery_controller/incidencies/$1/$2';

$route['tecnic/update_inci'] = 'Private/Tecnic_controller/update_inci_page';
$route['updateInci'] = 'Private/Tecnic_controller/update_inci';
$route['delete_img/(:any)'] = 'Private/Tecnic_controller/delete_image_page/$1';

$route['tecnic/tasques'] = 'Private/Grocery_controller/tasques_tecnic';
$route['tecnic/tasques/(:any)'] = 'Private/Grocery_controller/tasques_tecnic/$1';
$route['tecnic/tasques/(:any)/(:any)'] = 'Private/Grocery_controller/tasques_tecnic/$1/$2';

$route['tecnic/material'] = 'Private/Grocery_controller/mat_inci';
$route['tecnic/material/(:any)'] = 'Private/Grocery_controller/mat_inci/$1';
$route['tecnic/material/(:any)/(:any)'] = 'Private/Grocery_controller/mat_inci/$1/$2';

$route['admin/user'] = 'Private/Grocery_controller/user';
$route['admin/user/(:any)'] = 'Private/Grocery_controller/user/$1';
$route['admin/user/(:any)/(:any)'] = 'Private/Grocery_controller/user/$1/$2';

$route['admin/material'] = 'Private/Grocery_controller/material_admin';
$route['admin/material/(:any)'] = 'Private/Grocery_controller/material_admin/$1';
$route['admin/material/(:any)/(:any)'] = 'Private/Grocery_controller/material_admin/$1/$2';

$route['admin/mail'] = 'Private/Grocery_controller/mail';
$route['admin/mail/(:any)'] = 'Private/Grocery_controller/mail/$1';
$route['admin/mail/(:any)/(:any)'] = 'Private/Grocery_controller/mail/$1/$2';

$route['admin/news'] = 'Private/Grocery_controller/news';
$route['admin/news/(:any)'] = 'Private/Grocery_controller/news/$1';
$route['admin/news/(:any)/(:any)'] = 'Private/Grocery_controller/news/$1/$2';

$route['admin/consulta'] = 'Private/Grocery_controller/consulta';
$route['admin/consulta/(:any)'] = 'Private/Grocery_controller/consulta/$1';
$route['admin/consulta/(:any)/(:any)'] = 'Private/Grocery_controller/consulta/$1/$2';

$route['admin/about'] = 'Private/Grocery_controller/about';
$route['admin/about/(:any)'] = 'Private/Grocery_controller/about/$1';
$route['admin/about/(:any)/(:any)'] = 'Private/Grocery_controller/about/$1/$2';

$route['admin/tipus_consulta'] = 'Private/Grocery_controller/tipus_consulta';
$route['admin/tipus_consulta/(:any)'] = 'Private/Grocery_controller/tipus_consulta/$1';
$route['admin/tipus_consulta/(:any)/(:any)'] = 'Private/Grocery_controller/tipus_consulta/$1/$2';

$route['admin/group'] = 'Private/Grocery_controller/group';
$route['admin/group/(:any)'] = 'Private/Grocery_controller/group/$1';
$route['admin/group/(:any)/(:any)'] = 'Private/Grocery_controller/group/$1/$2';

$route['user/incidencies'] = 'Private/Grocery_controller/user_inci';
$route['user/incidencies/(:any)'] = 'Private/Grocery_controller/user_inci/$1';
$route['user/incidencies/(:any)/(:any)'] = 'Private/Grocery_controller/user_inci/$1/$2';

$route['user/mail'] = 'Private/Grocery_controller/public_mail';
$route['user/mail/(:any)'] = 'Private/Grocery_controller/public_mail/$1';
$route['user/mail/(:any)/(:any)'] = 'Private/Grocery_controller/public_mail/$1/$2';

$route['private/mail'] = 'Private/Grocery_controller/private_mail';
$route['private/mail/(:any)'] = 'Private/Grocery_controller/private_mail/$1';
$route['private/mail/(:any)/(:any)'] = 'Private/Grocery_controller/private_mail/$1/$2';


$route['user/save_incidencia'] = 'Private/Incidencia_controller/save_incidencia_page';
$route['user/save_incidencia_bd'] = 'Private/Incidencia_controller/save_incidencia';

$route['upload'] = 'Upload_controller/index';
$route['upload/do_upload'] = 'Upload_controller/do_upload';

$route['images/(:any)/(:any)'] = 'Public/Image_controller/show_inci_img/$1/$2'; 


$route['contact/sendConsult'] = 'Public/Contact_controller/sendConsult';
$route['incidencia/pdf/(:any)'] = 'Private/Pdf_controller/generatePDF/$1/$2';

$route['api/news'] = 'news_api/status'; 

$route['privateApi/status'] = 'PrivateApi_controller/status'; 
$route['privateApi/login'] = 'PrivateApi_controller/login'; 
$route['privateApi/about'] = 'PrivateApi_controller/about'; 
$route['privateApi/news'] = 'PrivateApi_controller/news'; 
$route['privateApi/getIncidencies'] = 'PrivateApi_controller/getIncidencies'; 
$route['privateApi/tipusConsulta'] = 'PrivateApi_controller/tipusConsulta'; 
$route['privateApi/consulta'] = 'PrivateApi_controller/consulta'; 
$route['privateApi/mail'] = 'PrivateApi_controller/mail'; 

