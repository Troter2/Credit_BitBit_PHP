<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Grocery_controller extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->helper('url');
		$this->load->library('grocery_CRUD');
	}

	public function index()
	{
        $this->load->library('session');
        $this->load->library('ion_auth');
        if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('tablestrap');
			$crud->set_table('users');
			$crud->change_field_type('slug', 'invisible');
			$crud->columns(['username','email','first_name','last_name','company','phone']);
			$output = $crud->render();
			//$this->load->view('templates/header');
			$this->_render_output($output);
			//$this->load->view('templates/footer');
		}else{
			redirect(base_url('news'));
		}
	}

	function news_before_insert($post_array)
	{

		$post_array["slug"] = strtr($post_array['title'], " ", "-") . "-" . $post_array['date'];

		return $post_array;
	}

	function news_before_update($post_array)
	{

		$post_array["slug"] = strtr($post_array['title'], " ", "-") . "-" . $post_array['date'];

		return $post_array;
	}

	protected function _render_output($output = null)
	{
		$this->load->view('grocery/index.php', (array)$output);
	}
}
