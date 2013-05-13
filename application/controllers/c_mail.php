<?php

class C_mail extends CI_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->helper('url');	
		$this->load->helper('email');
		$this->load->model('m_mail');
		
		$this->data['base_url'] = base_url();
		$this->data['title']= 'Adresy';
		}
		
	function index(){
		$this->sendAdress();
		}
		
	function sendAdress(){
		$this->load->library('form_validation');
	
		$this->form_validation->set_rules('mail', 'Mail', 'trim|required|valid_email|is_unique[beta_test_mail.mail]');
		
		if($this->form_validation->run() == FALSE){
			$this->load->view('templates/header', $this->data);
			$this->load->view('dynamic/v_mail');
			$this->load->view('templates/footer');
			}
		else{
			$czas = date("Y-m-d H:m:s");	
			if($this->m_mail->saveMail() == TRUE){
				$this->load->view('templates/header', $this->data);
				$this->load->view('dynamic/v_mail_sukces');
				$this->load->view('templates/footer');
				}
			else{
				echo 'Wystąpił błąd.';
				}
			}
		}
	}
?>