<div class="zawartosc">

	<?php echo form_open("c_pokoje/edytuj_klase");?>
	<p>Edytuj klasę pokoju</p>
    <p>Nazwa
		<?php $nazwa = array(
		'name' => 'nazwa',
		'value' => $klasa_pokoju->nazwa
		);	
		echo form_input($nazwa);?>
	</p>
    <p>Opis
		<?php $opis = array(
		'name' => 'opis',
		'value' => $klasa_pokoju->opis
		);
		echo form_input($opis);?>
	</p>
	<p>Cena
		<?php $cena = array(
		'name' => 'cena',
		'value' => $klasa_pokoju->cena
		);
		echo form_input($cena);?>
	</p>
  <input type="hidden" name="redirect" value="<?php echo $_SERVER['REQUEST_URI']; ?>" />
  
  
 
  <input type="hidden" name="idklasyp" value="<?php echo $klasa_pokoju->id_klasa_pokoju; ?>" />

  <p><?php echo form_submit('submit', 'Zapisz zmiany');?></p>
  
  <?php echo validation_errors('<p class="blad">','</p>');?>

<?php echo form_close();?>