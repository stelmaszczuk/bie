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

echo'<p class="poprawne">Adres został dodany.<br />Proszę czekać na wiadomość</p>';?>

<p>Odliczaj z nami!</p>

<script type="text/javascript">
		var czas=<?php echo date("U"); ?>;
	</script>

<script type="text/javascript" src="<?php echo base_url();?>js/odliczanie.js"></script>