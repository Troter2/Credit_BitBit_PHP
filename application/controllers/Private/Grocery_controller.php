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
	}


	public function news()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');

		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('news');
			$crud->set_language("catalan");
			$crud->display_as('title', 'Titul');
			$crud->display_as('content', 'Contingut');
			$crud->display_as('image', 'Imatge');
			$crud->display_as('date', 'Data');
			$crud->required_fields('title', 'content', 'image', 'content');


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
			$crud->display_as('date', "Data");
			$crud->columns(['nom', 'email', 'assumpte', 'contingut', 'date']);
			$crud->set_language("catalan");
			$crud->required_fields('nom', 'email', 'assumpte', 'contingut', 'date');


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
		if ($this->ion_auth->is_admin() || $this->ion_auth->in_group('gestor')) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte_task');
			$crud->set_table('tasques');

			$state = $crud->getState();
			if ($state == 'add') {
				if (!$this->session->has_userdata('id_incidencia')) {
					redirect('gestor/inci');
				}
			}

			$crud->callback_before_insert(array($this, 'tasques_before_insert'));
			$crud->set_relation('id_user', 'users', 'username');
			$state = $crud->getState();
			if ($state != 'add' && $state != 'edit') {
				$crud->set_relation('id_inci', 'incidencies', 'marca');
			}
			$crud->set_language("catalan");
			$crud->required_fields('desc', 'id_user');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->display_as('id_user', 'Tecnic');
			$crud->display_as('id_inci', 'Model portatil');
			$crud->display_as('desc', 'Descripcio');
			$crud->display_as('start_date', 'Data inici');
			$crud->display_as('end_date', 'Data fi');
			$crud->change_field_type('start_date', 'invisible');
			$crud->change_field_type('end_date', 'invisible');
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
		unset($_SESSION['id_incidencia']);

		return $post_array;
	}




	public function incidencies()
	{
		$this->load->library('session');
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->is_admin() || $this->ion_auth->in_group('gestor')) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte_incidencia');
			$crud->set_table('incidencies');
			$crud->set_relation('id_user_propietari', 'users', 'username');
			$crud->display_as('id_user_propietari', 'Usuari propietari');
			$crud->display_as('id_estat', 'Estat');
			$crud->display_as('entry_date', 'Entrada');
			$crud->display_as('out_date', 'Sortida');
			$crud->display_as('tlf', 'Telefon');
			$crud->order_by('entry_date', 'desc');
			$crud->set_language("catalan");
			$crud->required_fields('nom_propietari', 'marca', 'model', 'tlf', 'numero_serie', 'desc_averia', 'diagnosis_prev');

			$state = $crud->getState();
			if ($state == 'list' || $state == 'read' || $state == 'success') {
				$crud->set_relation('id_estat', 'status', 'desc');
			}
			$crud->callback_before_insert(array($this, 'add_date_callback'));
			$crud->columns(['id_estat', 'id_user_propietari', 'nom_propietari', 'tlf', 'entry_date', 'out_date']);

			$crud->change_field_type('out_date', 'invisible');
			$crud->change_field_type('entry_date', 'invisible');
			$crud->change_field_type('id_estat', 'invisible');
			$crud->change_field_type('uuid', 'invisible');


			$state = $crud->getState();
			$state_info = $crud->getStateInfo();

			if ($state == 'read') {
				$this->session->set_flashdata('id_incidencia', $state_info->primary_key);
			}

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
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('users');
			$crud->set_language("catalan");
			$crud->required_fields('username', 'email', 'first_name', 'last_name', 'email', 'city');
			$crud->display_as('username', "Nom d'usuari");
			$crud->display_as('first_name', "Nom");
			$crud->display_as('last_name', "Cognom");
			$crud->display_as('company', "Comanyia");
			$crud->display_as('phone', "Telefon");
			$crud->display_as('city', "Ciutat");
			$crud->columns(['username', 'email', 'first_name', 'last_name', 'company', 'phone', 'city']);
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
			$crud->set_language("catalan");
			$crud->required_fields('consulta');

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

	public function user_inci()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->in_group('user')) {

			$crud = new grocery_CRUD();

			$crud->set_language("catalan");
			$crud->set_theme('adminlte_user');
			$crud->set_table('incidencies');
			$crud->set_relation('id_estat', 'status', 'desc');
			$crud->columns(['id_estat', 'marca', 'model', 'numero_serie', 'entry_date']);
			$crud->display_as('id_estat', 'Estat');
			$crud->display_as('entry_date', "Data d'entrada");

			$crud->unset_add();
			$crud->unset_edit();
			$crud->unset_delete();

			$crud->change_field_type('out_date', 'invisible');
			$crud->change_field_type('entry_date', 'invisible');
			$crud->change_field_type('id_estat', 'invisible');
			$crud->change_field_type('uuid', 'invisible');

			$userinfo = $this->ion_auth->user()->row();
			$id = $userinfo->id;
			$crud->where('id_user_propietari', $id);

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

			$crud->set_language("catalan");
			$crud->required_fields('desc', 'id_user');
			$crud->unset_delete();
			$crud->unset_add();
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

			$crud->unset_delete();
			$crud->unset_add();
			$crud->unset_edit();

			$crud->display_as('send_date', 'Dia envio');
			$crud->display_as('send_hour', 'Hora envio');
			$crud->display_as('recive_date', 'Recibido dia');
			$crud->display_as('recive_hour', 'Recibido hora');
			$crud->display_as('about', 'Assumpte');

			$crud->columns(['from', 'to', 'about', 'send_date', 'send_hour', 'recive_date', 'recive_hour']);
			$crud->set_theme('adminlte');
			$crud->set_table('messages');

			$crud->set_language("catalan");
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
		$this->load->library('uuid');
		$post_array['uuid'] = str_replace("-", "", $this->uuid->v4());
		$post_array["entry_date"] = date("Y-m-d");
		$post_array["id_estat"] = '1';
		return $post_array;
	}
}
