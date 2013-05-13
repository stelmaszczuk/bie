<div class="grid_12 naglowek"><img src="<?php echo base_url();?>img/logo-bookiteasy-s.png" alt="book it easy" title="book it easy" />
<h1>Zarządzanie pokojami</h1>
</div>

<div class="grid_6">
	<?php echo form_open("c_pokoje/dodaj_klasep");?>
	<h2>Dodaj nową klasę pokoju</h2>
    <table><tr><p><td>Nazwa</td><td>
		<?php $nazwa = array(
		'name' => 'nazwa',
		);	
		echo form_input($nazwa);?>
	</p></td></tr>
    <tr><p><td>Opis</td><td>
		<?php $opis = array(
		'name' => 'opis',
		);
		echo form_input($opis);?>
	</p></tr></td>
	<tr><p><td>Cena</td><td>
		<?php $cena = array(
		'name' => 'cena',
		);
		echo form_input($cena);?>
	</p></tr></td></table>
  <input type="hidden" name="redirect" value="<?php echo $_SERVER['REQUEST_URI']; ?>" />
  
<div class="spacer"></div>

  <p><?php echo form_submit('submit', 'Dodaj klasę');?></p>
  
  <?php echo validation_errors('<p class="blad">','</p>');?>

<?php echo form_close();?>
<div class="spacer"></div>
<h2>Twoje klasy pokojów</h2>
<ul>
		<?php foreach($klasa_pokoju as $item) {
		echo "<li>";
		echo $item->nazwa; echo ' - ';
		echo $item->opis; echo '. ';
		echo 'Cena: '. $item->cena; echo ' zł.';
		echo '<br /><a class="link" href="'.base_url().'c_pokoje/edit/'.$item->id_klasa_pokoju.'">edytuj</a>';// klase '.$item->id_klasa_pokoju.'</a>';
		echo '<a class="link" href="'.base_url().'c_pokoje/usun_klasep/'.$item->id_klasa_pokoju.'"> |usun</a>';// klase '.$item->id_klasa_pokoju.'</a>';
		echo "</li>";
		}?>
</ul>
</div>
<div class="grid_6">
<?php echo form_open("c_pokoje/dodaj_pokoj");?>
<h2>Dodaj nowy pokój</h2>
    <p>Numer pokoju
		<?php $numer = array(
		'name' => 'numer',
		);	
		echo form_input($numer);?>
	</p>
    <p>Aktywuj pokój
		<?php 
		$status = array(
		'name' => 'status',
		'value' => '1'
		);
		echo form_checkbox($status);
		?>
	</p>
<ul>
		<p>Przyporządkuj pokój do klasy</p>
		<?php foreach($klasa_pokoju as $item) {		
		$data = array(
			'name' => 'klasa',
			'value' => $item->id_klasa_pokoju,
			'checked' => FALSE 
			);
		echo form_radio($data);
		echo $item->nazwa;
		}?>
</ul>

  <p><?php echo form_submit('submit', 'Dodaj pokój');?></p>
  
  <?php echo validation_errors('<p class="blad">','</p>');?>

<?php echo form_close();?>

<div class="spacer"></div>

<h2>Pokoje</h2>
<ul>
		<?php foreach($pokoje as $item) {
		echo "<li>";
		echo $item->numer; echo ' ';
		echo '<br /><a class="link" href="'.base_url().'c_pokoje/editp/'.$item->id_pokoje.'">edytuj</a>';
		echo '<a class="link" href="'.base_url().'c_pokoje/usun_pokoj/'.$item->id_pokoje.'"> |usun</a>';
		echo "</li>";
		}?>
</ul>
</div>

