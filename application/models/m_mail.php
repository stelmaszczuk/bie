<?php

class M_mail extends CI_Model{
	
	function __construct(){
		parent::__construct();
		$this->load->database('default',TRUE);
		}
		
	function saveMail(){
		$czas = date("Y-m-d H:i:s");
		$data_mail = array(
			'mail' => $this->input->post('mail'),
			'status' => 1,
			'data' => $czas,
			'ip' => $this->input->ip_address()
			);
		return $this->db->insert('beta_test_mail', $data_mail);
		}
	}
?>