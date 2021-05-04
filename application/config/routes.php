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

$route['about'] = 'Public/Home_controller/about';
$route['contact'] = 'Public/Home_controller/contact';

$route['status'] = 'Public/Home_controller/status';

$route['userProfile'] = 'Public/User_controller/user_profile';
$route['userEdit'] = 'Public/User_controller/user_edit_page';
$route['updateUser'] = 'Public/User_controller/update';

$route['login/login'] = 'Public/Login_controller/login';
$route['login/register'] = 'Public/Login_controller/register';

$route['mail/view/(:num)'] = 'Public/Mail_controller/view/$1';
$route['mail/send'] = 'Public/Mail_controller/send';
$route['mail/sendMail'] = 'Public/Mail_controller/sendMail';


$route['news/view/(:num)'] = 'Public/News_controller/view/$1';
$route['news/send'] = 'Public/Newsl_controller/send';
$route['news/sendMail'] = 'Public/News_controller/sendMail';


$route['details'] = 'Public/Home_controller/details';



$route['admin/user'] = 'Private/Grocery_controller/user';
$route['admin/user/(:any)'] = 'Private/Grocery_controller/user/$1';
$route['admin/user/(:any)/(:any)'] = 'Private/Grocery_controller/user/$1/$2';

$route['admin/mail'] = 'Private/Grocery_controller/mail';
$route['admin/mail/(:any)'] = 'Private/Grocery_controller/mail/$1';
$route['admin/mail/(:any)/(:any)'] = 'Private/Grocery_controller/mail/$1/$2';

$route['admin/news'] = 'Private/Grocery_controller/news';
$route['admin/news/(:any)'] = 'Private/Grocery_controller/news/$1';
$route['admin/news/(:any)/(:any)'] = 'Private/Grocery_controller/news/$1/$2';

$route['admin/tipus_consulta'] = 'Private/Grocery_controller/tipus_consulta';
$route['admin/tipus_consulta/(:any)'] = 'Private/Grocery_controller/tipus_consulta/$1';
$route['admin/tipus_consulta/(:any)/(:any)'] = 'Private/Grocery_controller/tipus_consulta/$1/$2';


$route['upload'] = 'Upload_controller/index';
$route['upload/do_upload'] = 'Upload_controller/do_upload';


//$route['pagina/(:any)'] = '/pages/view/$1';
//$route['pagina/(:any)/(:num)'] = '/pages/view/$1';
//$route['news/index'] = 'news_controller/index';
//$route['news/index/(:num)'] = 'news_controller/index/$1';
//$route['news/update'] = 'news_controller/update';
//$route['news/update/(:num)'] = 'news_controller/update/$1';
//$route['news/delete'] = 'news_controller/delete';
//$route['news/delete/(:num)'] = 'news_controller/delete/$1';
//
//$route['register'] = 'login_controller/register';
//
//$route['login'] = 'login_controller/login';
//$route['login/index'] = 'login_controller/index';
//$route['login/destroy'] = 'login_controller/destroy';
//
//
//$route['news/create'] = 'news_controller/create';
//$route['news'] = 'news_controller/index';
//$route['news/delete/(:num)'] = 'news_controller/delete/$1';
//$route['news/(:any)'] = 'news_controller/view/$1';
//
//
//$route['Pdf'] = 'pdf_controller/index';

