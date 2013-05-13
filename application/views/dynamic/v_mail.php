<h1><img src="<?php echo base_url();?>img/logo-bookiteasy.png" alt="book it easy" title="book it easy" /></h1>
<div class="zawartosc">
	<p class="pytania">
	Jesteś właścicielem hotelu?<br />
	Papierkowa robota Cię przytłacza?<br />
	Chcesz zdobyć nowych klientów?<br />
		<span>Mamy rozwiązanie dla Ciebie!</span>
	</p>
	
	<p class="licznik">
		Już za 
		<span id="odliczanie"></span>
		startuje platforma 
		<span class="logo-mini-b">book it</span> <span class="logo-mini-e">easy</span>!
	</p>

<p> Wystarczy, że podasz nam adres e-mail

<?php
	$attributes = array('class'=>'mail');
	echo form_open('/c_mail', $attributes);
	
	$adres = array(
		'name' => 'mail',
		'value' => set_value('mail'),
		'class' => 'okienko'
		);
?>
	<div>
		<?php echo form_input($adres);
		echo form_submit(array('name' => 'wyslij', 'class' => 'przycisk'), 'Wyślij');?>
	</div>

	<?php echo validation_errors('<p class="blad">','</p>');?>

	a jako pierwszy przetestujesz nasz system.
	</p>
		
<?php echo form_close(); ?>

<p>Odliczaj z nami!</p>

<script type="text/javascript">
		var czas=<?php echo date("U"); ?>;
	</script>

<script type="text/javascript" src="<?php echo base_url();?>js/odliczanie.js"></script>