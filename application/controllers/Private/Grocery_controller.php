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

	public function mat_inci()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');

		if ($this->ion_auth->in_group('gestor') || $this->ion_auth->in_group('tecnic')) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->unset_edit();
			$crud->unset_list();
			$crud->set_table('mat_inci');
			$crud->set_language("catalan");
			$crud->display_as('amount', 'Consumit');
			$crud->display_as('id_mat', 'Material');
			$crud->set_relation('id_mat', 'materials', 'nom');
			$crud->change_field_type('id_mat_inci', 'invisible');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->required_fields('nom', 'email', 'assumpte', 'contingut', 'date');

			$crud->callback_field('amount', array($this, 'field_callback_1'));
			$crud->unset_back_to_list();


			$crud->callback_before_insert(array($this, 'callback_insert_id_inci'));
			// $crud->callback_before_insert(array($this, 'insert_if_amount_available'));

			//$crud->callback_after_insert(array($this, 'callback_insert_after_id_inci'));

			$crud->set_lang_string(
				'insert_success_message',
				'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
			<script type="text/javascript">
				window.location = "' . base_url('tecnic/tasques') . '";
			</script>
			<div style="display:none">'
			);


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
			$crud->unset_add();
			$crud->unset_edit();
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

			$crud->set_relation('id_user', 'users', 'username');
			$state = $crud->getState();
			if ($state != 'add' && $state != 'edit') {
				$crud->set_relation('id_inci', 'incidencies', 'marca');
			}
			$crud->set_language("catalan");
			$crud->columns(['id_user', 'id_inci', 'desc', 'start_date', 'end_date']);
			$crud->fields(['id_user', 'id_inci', 'desc', 'accions', 'start_date']);
			$crud->set_primary_key('username', 'qrynomusuari');
			//$crud->set_relation('id_user', 'qrynomusuari', 'username');

			$crud->order_by('start_date', 'desc');
			// $crud->set_relation('id_user', 'qrynomusuari', 'username', array('group_id >' => '1'));
			$crud->required_fields('desc', 'id_user');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->display_as('id_user', 'Tecnic');
			$crud->display_as('id_inci', 'Model portatil');
			$crud->display_as('desc', 'Descripcio');
			$crud->display_as('start_date', 'Data inici');
			$crud->display_as('end_date', 'Data fi');
			$crud->change_field_type('start_date', 'invisible');
			$crud->change_field_type('accions', 'invisible');
			$crud->change_field_type('end_date', 'invisible');
			$crud->callback_before_insert(array($this, 'tasques_before_insert'));
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

	public function tasques_tecnic()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->in_group('gestor') || $this->ion_auth->in_group('tecnic')) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte_tecnic');
			$crud->set_table('tasques');
			$crud->unset_delete();
			$crud->unset_edit();
			$crud->order_by('start_date', 'desc');

			$state = $crud->getState();
			if ($state == 'add') {
				if (!$this->session->has_userdata('id_incidencia')) {
					redirect('gestor/inci');
				}
			}
			$state_info = $crud->getStateInfo();
			$userinfo = $this->ion_auth->user()->row();
			$username = $userinfo->id;


			$this->load->model('inci_model');

			if ($state == 'read') {
				$primary_key = $state_info->primary_key;
				$tasca = $this->inci_model->getTasquesId($primary_key);


				if ($tasca['id_user'] != $username) {
					$crud->set_lang_string(
						'form_back_to_list',
						'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
					<script type="text/javascript">
						window.location = "' . base_url('tecnic/tasques') . '";
					</script>
					<div style="display:none">'
					);
				}
			}

			$crud->callback_before_insert(array($this, 'tasques_before_insert'));
			$crud->set_relation('id_user', 'users', 'username');
			$state = $crud->getState();
			if ($state != 'edit') {
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
			$crud->columns(['id_user', 'desc', 'start_date', 'start_hour']);
			$userinfo = $this->ion_auth->user()->row();
			$id = $userinfo->id;
			$crud->where('id_user', $id);
			if ($state == 'read') {
				$id = $this->grocery_crud->getStateInfo()->primary_key;

				$tasca = $this->db->get_where('tasques', array('id_tasca' => $id));
				$tasca = $tasca->row_array();
				$inci = $this->db->get_where('incidencies', array('id_inci' => $tasca['id_inci']));
				$inci = $inci->row_array();
				$_SESSION['inci'] = $inci;
				$_SESSION['tasca'] = $tasca;
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
			$crud->display_as('entry_hour', "Hora d'entrada");

			$crud->display_as('out_hour', 'Hora de sortida');
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
			$crud->change_field_type('out_hour', 'invisible');
			$crud->change_field_type('entry_hour', 'invisible');
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
			/////////////////////////////////////////////////////////////////////////////////
			$crud->callback_before_delete(array($this, 'no_admin_delete'));
			/////////////////////////////////////////////////////////////////////////////////
			$crud->set_theme('adminlte_user_admin');
			$crud->set_table('users');
			$crud->fields('username', 'password', 'email', 'first_name', 'last_name', 'phone', 'city');
			$crud->set_language("catalan");
			$crud->required_fields('username', 'email', 'first_name', 'last_name', 'email', 'city');
			$crud->display_as('username', "Nom d'usuari");
			$crud->display_as('first_name', "Nom");
			$crud->display_as('last_name', "Cognom");
			$crud->display_as('company', "Companyia");
			$crud->display_as('phone', "Telefon");
			$crud->display_as('city', "Ciutat");
			$crud->columns(['username', 'email', 'first_name', 'last_name', 'company', 'phone', 'city']);
			$crud->callback_after_insert(array($this, 'hash_pass_insert'));
			$crud->callback_after_update(array($this, 'hash_pass'));

			$output = $crud->render();
			$state = $crud->getState();



			$data["css_files"] = $output->css_files;
			$data["grocery"] = true;

			$this->load->view('templates/header', $data);
			$this->load->view('grocery/index.php', (array)$output);
			$this->load->view('templates/footer', $data);
		} else {
			redirect(base_url('home'));
		}
	}
	public function no_admin_delete($primary_key)
	{
		if ($this->ion_auth->in_group('admin', $primary_key))
			exit();
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
	public function about()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();

			$crud->set_theme('adminlte');
			$crud->set_table('datos_about');
			$crud->set_language("catalan");
			$crud->required_fields('date', 'titol', 'content');

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
			$this->load->model('inci_model');
			$crud->set_theme('adminlte_user');
			$crud->set_table('incidencies');
			$crud->set_relation('id_estat', 'status', 'desc');
			$crud->columns(['id_estat', 'marca', 'model', 'numero_serie', 'entry_date']);
			$crud->order_by('entry_date', 'desc');
			$crud->display_as('id_estat', 'Estat');
			$crud->display_as('entry_date', "Data d'entrada");
			$crud->display_as('tlf', "Telefon");
			$crud->display_as('desc_averia', "Descripcio averia");
			$crud->display_as('diagnosis_prev', "Diagnosis previa");
			$crud->display_as('entry_hour', "Hora d'entrada");
			$crud->display_as('out_hour', "Hora de sortida");
			$crud->display_as('out_date', "data de sortida");

			$crud->unset_add();
			$crud->unset_edit();
			$crud->unset_delete();

			$state = $crud->getState();
			$state_info = $crud->getStateInfo();
			$userinfo = $this->ion_auth->user()->row();
			$username = $userinfo->id;


			$this->load->model('inci_model');

			if ($state == 'read') {
				$primary_key = $state_info->primary_key;
				$inci = $this->inci_model->getInciId($primary_key);


				if ($inci['id_user_propietari'] != $username) {
					$crud->set_lang_string(
						'form_back_to_list',
						'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
					<script type="text/javascript">
						window.location = "' . base_url('user/incidencies') . '";
					</script>
					<div style="display:none">'
					);
				}
			}

			$crud->change_field_type('out_date', 'invisible');
			$crud->change_field_type('entry_date', 'invisible');
			$crud->change_field_type('id_estat', 'invisible');
			$crud->change_field_type('uuid', 'invisible');


			$userinfo = $this->ion_auth->user()->row();
			$id = $userinfo->id;
			$crud->where('id_user_propietari', $id);


			$data["grocery"] = true;


			$state = $crud->getState();
			$state_info = $crud->getStateInfo();


			//$_SESSION["uuid_url"] = $this->inci_model->get_uuidbyid($crud->get_primary_key());

			if ($state == 'read') {
				$primary_key = $state_info->primary_key;
				$_SESSION["uuid_url"] = $this->inci_model->get_uuidbyid($primary_key);
			} else {
				$_SESSION["uuid_url"] = "";
			}

			$output = $crud->render();
			$data["css_files"] = $output->css_files;

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
			$crud->set_theme('adminlte');
			$crud->set_table('users_groups');
			$crud->display_as('user_id', "Nom d'usuari");
			$crud->display_as('group_id', 'Rol');
			$crud->set_relation('user_id', 'users', 'username');
			$state = $crud->getState();
			if ($state != 'add') {

				$crud->field_type("user_id", 'readonly');
			}
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
			$state = $crud->getState();
			$state_info = $crud->getStateInfo();
			if ($state == 'list'||$state == 'success') {
				$crud->set_relation('from', 'users', 'username');
				$crud->set_relation('to', 'users', 'username');
			}
		
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


	public function public_mail()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		$this->load->model('Msg_model');
		if ($this->ion_auth->in_group('user')) {

			$crud = new grocery_CRUD();

			$crud->unset_delete();
			$crud->unset_edit();

			$crud->display_as('send_date', 'Dia envio');
			$crud->display_as('send_hour', 'Hora envio');
			$crud->display_as('recive_date', 'Recibido dia');
			$crud->display_as('recive_hour', 'Recibido hora');
			$crud->order_by('id_msg', 'desc');
			$crud->display_as('about', 'Assumpte');
			$crud->field_type("from", 'hidden');
			$crud->callback_before_insert(array($this, 'public_mail_before_insert'));
			$state = $crud->getState();
			$state_info = $crud->getStateInfo();
			$userinfo = $this->ion_auth->user()->row();
			$username = $userinfo->id;

			if ($state == 'read') {
				$primary_key = $state_info->primary_key;
				$msg = $this->Msg_model->getMsgId($primary_key);


				if ($msg->to != $username) {
					$crud->set_lang_string(
						'form_back_to_list',
						'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
					<script type="text/javascript">
						window.location = "' . base_url('user/mail') . '";
					</script>
					<div style="display:none">'
					);
				}
				if ($msg->recive_hour == NULL && $msg->to == $username) {
					$this->Msg_model->setMsgRecived($primary_key);
				}
			}
			$crud->set_primary_key('id', 'qrynomusuari');
			if ($state == 'add') {
				$crud->set_relation('to', 'qrynomusuari', 'username');
			}
			

			if ($state == 'list'||$state == 'success') {
				$crud->set_relation('from', 'qrynomusuari', 'username');
			}

			$crud->columns(['from', 'about', 'send_date', 'send_hour', 'recive_date', 'recive_hour']);
			$crud->set_theme('adminlte');
			$crud->set_table('messages');

			$userinfo = $this->ion_auth->user()->row();
			$username = $userinfo->id;
			$crud->where('to', $username);

			$crud->set_language("catalan");

			$crud->field_type("send_date", 'hidden');
			$crud->field_type("send_hour", 'hidden');
			$crud->field_type("recive_hour", 'hidden');
			$crud->field_type("recive_date", 'hidden');
			$crud->field_type("from", 'hidden');
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


	public function private_mail()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->in_group('gestor') || $this->ion_auth->in_group('tecnic') || $this->ion_auth->in_group('admin')) {

			$crud = new grocery_CRUD();

			$crud->unset_delete();
			$crud->unset_edit();

			$crud->display_as('send_date', 'Dia envio');
			$crud->display_as('send_hour', 'Hora envio');
			$crud->display_as('recive_date', 'Recibido dia');
			$crud->order_by('id_msg', 'desc');
			$crud->display_as('recive_hour', 'Recibido hora');
			$crud->display_as('about', 'Assumpte');
			// $crud->field_type("from", 'hidden');
			$crud->callback_before_insert(array($this, 'public_mail_before_insert'));
			$state = $crud->getState();
			$state_info = $crud->getStateInfo();
			$userinfo = $this->ion_auth->user()->row();
			$username = $userinfo->id;
			$this->load->model('Msg_model');
			if ($state == 'list'||$state == 'success') {
				$crud->set_relation('from', 'users', 'username');
			}
			if ($state == 'read') {
				$primary_key = $state_info->primary_key;
				$msg = $this->Msg_model->getMsgId($primary_key);


				if ($msg->to != $username) {
					$crud->set_lang_string(
						'form_back_to_list',
						'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
					<script type="text/javascript">
						window.location = "' . base_url('private/mail') . '";
					</script>
					<div style="display:none">'
					);
				}
				if ($msg->recive_hour == NULL && $msg->to == $username) {
					$this->Msg_model->setMsgRecived($primary_key);
				}
			}


			$crud->columns(['from', 'about', 'send_date', 'send_hour', 'recive_date', 'recive_hour']);
			$crud->set_theme('adminlte');
			$crud->set_table('messages');
			$crud->where('to', $username);

			$crud->set_language("catalan");
			$crud->set_primary_key('id', 'users');
			$crud->set_relation('to', 'users', 'username');

			$crud->field_type("send_date", 'hidden');
			$crud->field_type("send_hour", 'hidden');
			$crud->field_type("recive_hour", 'hidden');
			$crud->field_type("recive_date", 'hidden');
			$crud->field_type("from", 'hidden');
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


	public function material()
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
			$crud->set_table('material');

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
	public function material_admin()
	{
		$this->load->library('session');
		$this->load->library('ion_auth');
		if ($this->ion_auth->is_admin()) {

			$crud = new grocery_CRUD();


			$crud->display_as('send_date', 'Dia envio');
			$crud->display_as('descri', 'Descripcio');
			$crud->display_as('num_serie', 'Numero de serie');
			$crud->display_as('amount', 'Cantitat disponible');

			$crud->required_fields('nom', 'descri', 'num_serie', 'amount');

			$crud->set_theme('adminlte');
			$crud->set_table('materials');

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



	function hash_pass_insert($post_array, $primary_key)
	{
		$userinfo = $this->ion_auth->user($primary_key)->row();
		if ($userinfo->password == $post_array['password']) {
			$passwordHashed = $this->ion_auth_model->hash_password($post_array['password'], FALSE, FALSE);
			$username = $post_array['username'];
			$this->db->set('password', $passwordHashed);
			$this->db->where('username', $username);
			$this->db->update('users');
		}
		$data = array(
			'user_id' => $userinfo->id,
			'group_id' => 4
		);

		$this->db->insert('users_groups', $data);

		return true;
	}

	function hash_pass($post_array, $primary_key)
	{
		$userinfo = $this->ion_auth->user()->row();
		if ($userinfo->password == $post_array['password']) {
			$passwordHashed = $this->ion_auth_model->hash_password($post_array['password'], FALSE, FALSE);
			$username = $post_array['username'];
			$this->db->set('password', $passwordHashed);
			$this->db->where('username', $username);
			$this->db->update('users');
		}

		return true;
	}
	function tasques_before_insert($post_array)
	{

		$post_array["id_inci"] = $_SESSION['id_incidencia'];
		unset($_SESSION['id_incidencia']);

		return $post_array;
	}

	function public_mail_before_insert($post_array)
	{
		$userinfo = $this->ion_auth->user()->row();
		$username = $userinfo->id;
		$post_array["from"] = $username;
		$post_array["send_date"] = date('Y-m-d');
		$post_array["send_hour"] = date("h:i:s");

		return $post_array;
	}

	function callback_insert_id_inci($post_array)
	{

		$post_array["id_inci"] = $_SESSION['inci']['id_inci'];
		$id_mat = $post_array['id_mat'];
		$this->db->select("amount");
		$this->db->from("materials");
		$this->db->where(array('id_mat' => $id_mat));
		$query = $this->db->get();
		$total_amount = $query->row_array()['amount'];

		if ($post_array['amount'] <= $total_amount) {

			$total_amount = $total_amount - $post_array['amount'];

			$this->db->set("amount", $total_amount);
			$this->db->where("id_mat", $id_mat);
			$this->db->update('materials');

			return $post_array;
		} else {
			exit();
		}
	}
	function insert_if_amount_available($post_array)
	{
		$post_array["id_inci"] = $_SESSION['inci']['id_inci'];
		$id_mat = $post_array['id_mat'];
		$this->db->select("amount");
		$this->db->from("materials");
		$this->db->where(array('id_mat' => $id_mat));
		$query = $this->db->get();
		$total_amount = $query->row_array()['amount'];


		if ($post_array['amount'] <= $total_amount) {
			$total_amount = $total_amount - $post_array['amount'];


			$this->db->set("amount", $total_amount);
			$this->db->where("id_mat", $id_mat);
			$this->db->update('materials');

			return $post_array;
		} else {
			exit();
		}
	}
	function callback_insert_after_id_inci($post_array, $primary_key)
	{
		redirect(base_url('tecnic/update_inci'));
		return true;
	}



	function field_callback_1($value = '', $primary_key = null)
	{
		return '<input type="number" min="0" maxlength="50"  value="0" class="form-control" name="amount" style="width:462px">';
	}
}
