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
			$crud->display_as('amount', 'Disponible');
			$crud->display_as('id_mat', 'Material');
			$crud->set_relation('id_mat', 'materials', 'nom');
			$crud->change_field_type('id_mat_inci', 'invisible');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->required_fields('nom', 'email', 'assumpte', 'contingut', 'date');

			$crud->callback_field('amount', array($this, 'field_callback_1'));
			$crud->unset_back_to_list();

			$crud->callback_before_insert(array($this, 'callback_insert_id_inci'));
			//$crud->callback_after_insert(array($this, 'callback_insert_after_id_inci'));

			$crud->set_lang_string(
				'insert_success_message',
				'Your data has been successfully stored into the database.<br/>Please wait while you are redirecting to the list page.
			<script type="text/javascript">
				window.location = "' . base_url('tecnic/update_inci') . '";
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
			$crud->required_fields('desc', 'id_user');
			$crud->change_field_type('id_inci', 'invisible');
			$crud->display_as('id_user', 'Tecnic');
			$crud->display_as('id_inci', 'Model portatil');
			$crud->display_as('desc', 'Descripcio');
			$crud->display_as('start_date', 'Data inici');
			$crud->display_as('end_date', 'Data fi');
			$crud->change_field_type('start_date', 'invisible');
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
			
			$state = $crud->getState();
			if ($state == 'add') {
				if (!$this->session->has_userdata('id_incidencia')) {
					redirect('gestor/inci');
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
			$crud->callback_after_insert(array($this, 'hash_pass'));
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

			
			$data["grocery"] = true;
			
			
			$state = $crud->getState();
			$state_info = $crud->getStateInfo();
			
			
			//$_SESSION["uuid_url"] = $this->inci_model->get_uuidbyid($crud->get_primary_key());
			
			if($state == 'read')
			{
				$primary_key = $state_info->primary_key;
				$_SESSION["uuid_url"] = $this->inci_model->get_uuidbyid($primary_key);
				
			} else  {
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
            if ($this->ion_auth->in_group('user')) {
                
                $crud = new grocery_CRUD();
                
                $crud->unset_delete();
                $crud->unset_edit();
                
                $crud->display_as('send_date', 'Dia envio');
                $crud->display_as('send_hour', 'Hora envio');
                $crud->display_as('recive_date', 'Recibido dia');
                $crud->display_as('recive_hour', 'Recibido hora');
                $crud->display_as('about', 'Assumpte');
                
                $crud->columns(['from', 'to', 'about', 'send_date', 'send_hour', 'recive_date', 'recive_hour']);
                $crud->set_theme('adminlte');
                $crud->set_table('messages');
                // $crud->set_relation('to','qrynomusuari','id',array('group_id!=' => '4'));
				$crud->set_relation('to','qrynomusuari','username');
                // $crud->set_relation('to','qrynomusuari','id');
                // $crud->set_relation_n_n('to', 'users_groups', 'users', 'id', 'id',null, 'username',array('group_id!=' => '4'));
                // Tinc que agafar el nom d'usuari en el select del afegir, aixi filtro que no ho puguin passar entre usuaris, noomes de usuaris a 
                // admins gestors i tecnics, tinc que fer que me tregui el nom

				//Al camp to te que surtir el nom del usuari, ara nomes se mostren els ids de el 
				//usuaris que no estan dins dels usuaris generics
				//nomes me falte que me trego el nom dels usuaris no les id


				// la millor manera es, enlloc de fer-ho es: enlloc de linkar amb la taula, linka amb una vista (entenem vista per
				// una sql que desaras al mysql)

                // $crud->set_relation('user_id','users','id',array('group_id!=' => '4'));
                $crud->set_language("catalan");
                
                $crud->field_type("send_date", 'hidden');
                $crud->field_type("send_hour", 'hidden');
                $crud->field_type("recive_date", 'hidden');
                $crud->field_type("recive_hour", 'hidden');
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
		function hash_pass($post_array, $primary_key)
		{
			$passwordHashed = $this->ion_auth_model->hash_password($post_array['password'], FALSE, FALSE);
			$username = $post_array['username'];
			$this->db->set('password', $passwordHashed);
			$this->db->where('username', $username);
			$this->db->update('users');
			return true;
		}
		function tasques_before_insert($post_array)
		{
			
			$post_array["id_inci"] = $_SESSION['id_incidencia'];
			unset($_SESSION['id_incidencia']);
			
			return $post_array;
		}
		
		function callback_insert_id_inci($post_array)
		{
			$post_array["id_inci"] = $_SESSION['inci']['id_inci'];
	
	
			return $post_array;
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
	