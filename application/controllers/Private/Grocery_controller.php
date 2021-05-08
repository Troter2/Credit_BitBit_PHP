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
		if (!$this->ion_auth->is_admin()&&!$this->ion_auth->in_group('gestor') ) {
			$this->session->set_flashdata('message', 'You must be an admin to view this page');
			redirect('about');
		}
	}


	public function news()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('news');


			$crud->callback_before_insert(array($this, 'news_before_insert'));

			$crud->set_field_upload('image', 'assets/uploads/files');
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
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('consultes');
			$crud->columns(['nom', 'email', 'assumpte', 'contingut', 'date']);

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

	public function tasques()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('tasques');
			$crud->unset_add();

			$crud->callback_before_insert(array($this, 'tasques_before_insert'));
			$crud->set_relation('id_user', 'users', 'username');
			$crud->set_relation('id_inci', 'incidencies', 'marca');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->display_as('id_user', 'Tecnic');
			$crud->display_as('id_inci', 'Model portatil');
			$crud->display_as('desc', 'Descripcio');
			$crud->display_as('start_date', 'Data inici');
			$crud->display_as('end_date', 'Data fi');
			$output = $crud->render();

			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$crud->callback_before_insert(array($this, 'tasques_before_insert'));

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}

	function tasques_before_insert($post_array)
	{

		$post_array["id_inci"] = $_SESSION['id_incidencia'];

		return $post_array;
	}


	public function incidencies()
	{
		$this->load->library('session');
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->logged_in()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte_incidencia');
			$crud->set_table('incidencies');
			$crud->set_relation('id_user_propietari', 'users', 'username');
			$crud->display_as('id_user_propietari', 'Usuari propietari');
			$crud->display_as('id_estat', 'Estat');
			$crud->display_as('tlf', 'Telefon');
			$state=$crud->getState();
			$crud->order_by('entry_date','desc');
			if ($state == 'list'||$state == 'read') {
				$crud->set_relation('id_estat', 'status', 'desc');
			}
			$crud->callback_before_insert(array($this,'add_date_callback'));
			$crud->columns(['id_estat', 'id_user_propietari', 'nom', 'tlf', 'entry_date', 'out_date']);

			$crud->change_field_type('out_date', 'invisible');
			$crud->change_field_type('entry_date', 'invisible');
			$crud->change_field_type('id_estat', 'invisible');


			$state = $crud->getState();
			$state_info = $crud->getStateInfo();

			if ($state == 'read') {
				$this->session->set_flashdata('id_incidencia', $state_info->primary_key);
			}

			$output = $crud->render();
			// print_r($output->id_incidencia);
			// die;


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
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('users');


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
		if ($this->ion_auth->is_admin()) {

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
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('users_groups');
			$crud->display_as('user_id', "Nom d'usuari");
			$crud->display_as('group_id', 'Rol');
			$crud->set_relation('user_id', 'users', 'username');
			$crud->field_type("user_id", 'readonly');
			$crud->set_relation('group_id', 'groups', 'description');


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
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('messages');

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



	function add_date_callback($post_array)
	{

		$post_array["entry_date"] = date("Y-m-d");

		return $post_array;
	}

	
}
