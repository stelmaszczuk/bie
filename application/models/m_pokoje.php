<?php

class M_pokoje extends CI_Model{
	
	function __construct(){
		parent::__construct();
		$this->load->database('default',TRUE);
		}
//KLASY POKOJOW	
	
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
	
	function pokazidKlasy($idklasyp){
		$zapyt = $this->db->where('id_klasa_pokoju',$idklasyp)->get('klasa_pokoju');
		return $zapyt->row();
		}
		
	function edytujKlase($idklasyp){
		$data_klasa = array(
			'nazwa' => $this->input->post('nazwa'),
			'opis' => $this->input->post('opis'),
			'cena' => $this->input->post('cena'),			
			);
		return $this->db->update('klasa_pokoju', $data_klasa, array('id_klasa_pokoju' => $idklasyp));
		}
		
	function usunKlase($idklasyp){
		return $this->db->delete('klasa_pokoju', array('id_klasa_pokoju' => $idklasyp));
		}
		
//POKOJE
	
	function dodajPokoj(){
		$data = array(
			'numer' => $this->input->post('numer'),
			'status' => $this->input->post('status'),
			'id_klasa_pokoju' => $this->input->post('klasa'),			
			);
		return $this->db->insert('pokoje', $data);
		}
		
	function pokazPokoje(){
		return $this->db->get('pokoje')->result();
		}
		
	function pokazidPokoju($idpokoju){
		$zapyt = $this->db->where('id_pokoje',$idpokoju)->get('pokoje');
		return $zapyt->row();
		}
		
	
	function edytujPokoj($idpokoju){
		$data = array(
			'numer' => $this->input->post('numer')			
			);
		return $this->db->update('pokoje', $data, array('id_pokoje' => $idpokoju));
		}
		
	function usunPokoj($idpokoju){
		return $this->db->delete('pokoje', array('id_pokoje' => $idpokoju));
		}			
	}
?>