<?php

class M_adm extends CI_Model{
	
	function __construct(){
		parent::__construct();
		$this->load->database('default',TRUE);
		}
		
	function dodajKlase(){
		$data_klasa = array(
			'nazwa' => $this->input->post('nazwa'),
			'opis' => $this->input->post('opis'),
			'cena' => $this->input->post('cena'),			
			);
		return $this->db->insert('klasa_pokoju', $data_klasa);
		}
	function pokazKlasy(){
		return $this->db->get('klasa_pokoju')->result();
		}
	function usunKlase($idklasyp){
		return $this->db->delete('klasa_pokoju', array('id_klasa_pokoju' => $idklasyp));
		}
	}
?>