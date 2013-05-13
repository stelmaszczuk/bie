<?php defined('BASEPATH') OR exit('No direct script access allowed');

class C_adm extends CI_Controller {
	
	function __construct(){		
		parent::__construct();
		$this->load->database('autoryzacja', TRUE);
		$this->lang->load('auth');
		$this->load->helper('language');
		
		$this->data['base_url'] = base_url();
		$this->data['title']= 'Administracja';
		}
	
	public function index(){		
		if ($this->ion_auth->is_admin()){			
			$this->load->view('templates/header_adm', $this->data);
			$this->load->view('adm/v_grafik');
			$this->load->view('templates/footer');
			}
		elseif ($this->ion_auth->logged_in()){
			$this->load->view('templates/header_log', $this->data);
			$this->load->view('dynamic/v_mail');
			$this->load->view('templates/footer');
			}
		elseif (!$this->ion_auth->logged_in()){
			$this->load->view('templates/header_log', $this->data);
			$this->load->view('templates/footer');
			}
		}
	public function panel(){
			$this->load->view('templates/header_adm', $this->data);
			$this->load->view('adm/v_adm_panel');
			$this->load->view('templates/footer');
		}
	public function konta(){
		$this->data['title']= 'Konta';
		$this->data['users'] = $this->ion_auth->users()->result();
			foreach ($this->data['users'] as $k => $user)
			{
			$this->data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
			}
		$this->load->view('templates/header_adm', $this->data);
		$this->load->view('adm/v_konta', $this->data);
		$this->load->view('templates/footer');
		}
	public function grafik(){
		$this->data['title']= 'Grafik';
		$this->load->view('templates/header_adm', $this->data);
		$this->load->view('adm/v_grafik');
		$this->load->view('templates/footer');
		}
	}