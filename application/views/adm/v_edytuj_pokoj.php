<div class="zawartosc">

	<?php echo form_open("c_pokoje/edytuj_pokoj");?>
	<p>Edytuj pokój</p>
    <p>Numer
		<?php $numer = array(
		'name' => 'numer',
		'value' => $pokoje->numer
		);	
		echo form_input($numer);?>
	</p>
    
  <input type="hidden" name="redirect" value="<?php echo $_SERVER['REQUEST_URI']; ?>" />
  
  <input type="hidden" name="idpokoju" value="<?php echo $pokoje->id_pokoje; ?>" />

  <p><?php echo form_submit('submit', 'Zapisz zmiany');?></p>
  
  <?php echo validation_errors('<p class="blad">','</p>');?>

<?php echo form_close();?>