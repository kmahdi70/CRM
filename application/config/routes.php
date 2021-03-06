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
$route['company_add/([GRY]+_(:num))'] = 'company_add/index/$1';
$route['project_add/([GRY]+_(:num))'] = 'project_add/index/$1';
$route['user_add/([GRY]+_(:num))'] = 'user_add/index/$1';
$route['admin_add/([GRY]+_(:num))'] = 'admin_add/index/$1';
$route['dev_add/([GRY]+_(:num))'] = 'dev_add/index/$1';
$route['task_add/(:num)/([GRY]+_(:num))'] = 'task_add/index/$1/$2';
$route['task_add/(:num)'] = 'task_add/index/$1';
$route['task_dev_find/(:num)'] = 'task_dev_find/index/$1';
$route['task_dev_find/(:num)/([GRY]+_(:num))'] = 'task_dev_find/index/$1/$2';
$route['company_edit/(:num)'] = 'company_edit/index/$1';
$route['company_find/([GRY]+_(:num))'] = 'company_find/index/$1';
$route['user_find/([GRY]+_(:num))'] = 'user_find/index/$1';
$route['dev_edit/(:num)'] = 'dev_edit/index/$1';
$route['dev_find/([GRY]+_(:num))'] = 'dev_find/index/$1';
$route['dev_find_user/([GRY]+_(:num))'] = 'dev_find_user/index/$1';
$route['task_mine/([GRY]+_(:num))'] = 'task_mine/index/$1';
//$route['task_find_user/(:num)'] = 'task_find_user/index/$1';
//$route['task_edit/(:num)'] = 'task_edit/index/$1';
$route['default_controller'] = 'login';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
