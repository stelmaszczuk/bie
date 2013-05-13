<?php defined('BASEPATH') OR exit('No direct script access allowed');

Class C_pokoje extends CI_Controller{
	
	function __construct(){
		parent::__construct();
	
		$this->load->database('autoryzacja', TRUE);
		$this->lang->load('auth');
		$this->load->helper('language');
		
		$this->data['base_url'] = base_url();
		$this->data['title'] = 'Pokoje';
		}
	
	public function index(){
		if ($this->ion_auth->is_admin()){	
			$this->load->model('m_pokoje');
			$this->data['klasa_pokoju'] = $this->m_pokoje->pokazKlasy();
			$this->data['pokoje'] = $this->m_pokoje->pokazPokoje();
			$this->load->view('templates/header_adm', $this->data);		
			$this->load->view('adm/v_pokoje', $this->data);		
			$this->load->view('templates/footer');		
			}
		elseif($this->ion_auth->logged_in()){
			$this->load->view('templates/header_log', $this->data);
			$this->load->view('dynamic/v_mail');
			$this->load->view('templates/footer');
			}
		else{
			$this->load->view('templates/header_log', $this->data);
			$this->load->view('templates/footer');
			}
		}
		
//KLASY POKOJOW		

	public function dodaj_klasep(){
		$this->load->model('m_pokoje');
		$this->load->library('form_validation');
	
		$this->form_validation->set_rules('nazwa', 'Nazwa', 'trim|required|is_unique[klasa_pokoju.nazwa]');
		$this->form_validation->set_rules('opis', 'Opis', 'trim|required');
		$this->form_validation->set_rules('cena', 'Cena', 'trim|required');
		
		if($this->form_validation->run() == FALSE){
			$this->data['title']= 'Pokoje';
			$this->load->view('templates/header_adm', $this->data);
			$this->load->view('adm/v_pokoje');
			$this->load->view('templates/footer');
			}
		else{
			if($this->m_pokoje->dodajKlase() == TRUE){
				redirect('c_pokoje', 'refresh');
				}
			}
		}
		
	public function edit($id){
		$this->load->view('templates/header_log', $this->data);
		$this->load->model('m_pokoje');
		$this->data['klasa_pokoju'] = $this->m_pokoje->pokazidKlasy($id);
		$this->load->view('adm/v_edytuj_klase', $this->data);
		$this->load->view('templates/footer');
		}
	
	public function edytuj_klase(){
		$this->load->model('m_pokoje');
		$idklasyp = $_POST['idklasyp'];
		$this->m_pokoje->edytujKlase($idklasyp);
		redirect("c_pokoje", 'location');	
		}
	
	public function usun_klasep($idklasyp){
		$this->load->model('m_pokoje');
		$this->m_pokoje->usunKlase($idklasyp);
		redirect("c_pokoje", 'refresh');		
		}
	
//POKOJE
	
	public function dodaj_pokoj(){
		$this->load->model('m_pokoje');
		$this->load->library('form_validation');
		
		$this->form_validation->set_rules('numer', 'Numer', 'trim|required|is_unique[pokoje.numer]');
		
		if($this->form_validation->run() == FALSE){
			$this->data['title']= 'Pokoje';
			$this->load->view('templates/header_adm', $this->data);
			$this->load->view('adm/v_pokoje');
			$this->load->view('templates/footer');
			}
		else{
			if($this->m_pokoje->dodajPokoj() == TRUE){
				redirect('c_pokoje', 'refresh');
				}
			}
		}
	public function editp($id){
		$this->load->view('templates/header_log', $this->data);
		$this->load->model('m_pokoje');
		$this->data['pokoje'] = $this->m_pokoje->pokazidPokoju($id);
		$this->load->view('adm/v_edytuj_pokoj', $this->data);
		$this->load->view('templates/footer');
		}
		
	public function edytuj_pokoj(){
		$this->load->model('m_pokoje');
		$idpokoju = $_POST['idpokoju'];
		$this->m_pokoje->edytujPokoj($idpokoju);
		redirect("c_pokoje", 'location');	
		}
		
	public function usun_pokoj($idpokoju){
		$this->load->model('m_pokoje');
		$this->m_pokoje->usunPokoj($idpokoju);
		redirect("c_pokoje", 'refresh');		
		}
	}