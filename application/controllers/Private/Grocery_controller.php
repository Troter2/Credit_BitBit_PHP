<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Grocery_controller extends Private_controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->helper('url');
		$this->load->library('grocery_CRUD');
		$this->load->library('ion_auth');
		if (!$this->ion_auth->is_admin()) {
			$this->session->set_flashdata('message', 'You must be an admin to view this page');
			redirect('home');
		}
	}


	public function news()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('news');

			$crud->change_field_type('date', 'invisible');

			$crud->callback_before_insert(array($this, 'news_before_insert'));

			$crud->set_field_upload('image','assets/uploads/files');
			$crud->set_crud_url_path(base_url('admin/news'));
			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}

	public function consulta()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('consultes');

			$crud->callback_before_insert(array($this, 'news_before_insert'));

			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}


	public function user()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('users');

			$crud->change_field_type('slug', 'invisible');

			$crud->columns(['username', 'email', 'first_name', 'last_name', 'company', 'phone']);
			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}
	public function tipus_consulta()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('tipus_consulta');

			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}


	public function group()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('users_groups');
			$crud->display_as('user_id',"Nom d'usuari");
			$crud->display_as('group_id','Rol');
			$crud->set_relation('user_id','users','username');
			$crud->field_type("user_id", 'readonly');
			$crud->set_relation('group_id','groups','description');


			$output = $crud->render();


			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}

	public function mail()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('messages');

			$crud->change_field_type('slug', 'invisible');
			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}

	function news_before_insert($post_array)
	{

		$post_array["date"] = date("Y-m-d");

		return $post_array;
	}

	function news_before_update($post_array)
	{

		$post_array["slug"] = strtr($post_array['title'], " ", "-") . "-" . $post_array['date'];

		return $post_array;
	}

	protected function _render_output2($output = null)
	{
		$this->load->view('grocery/index-pelat.php', (array)$output);
	}

	protected function _render_output($output = null)
	{
		$this->load->view('grocery/index.php', (array)$output);
	}
}
