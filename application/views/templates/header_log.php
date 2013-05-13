<html lang="pl">
<head>
<meta charset="utf-8" />
	<title>
	<?php echo $title ?>
	</title>
	
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/mail.css"/>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700&subset=latin,latin-ext" /> 
	
</head>
<body>
<div class="menu_adm">
	<ul class="login">
		<li><?php
		if ($this->ion_auth->logged_in()) { 
		?><a href="<?php echo base_url();?>auth/logout">Wyloguj się</a>
		<?php
		}else{
		?>
		
		<?php echo form_open("auth/login");?>

  <p>

    <?php $identity = array(
		'name' => 'identity',
		'value' => set_value('identity')
		);
	
	echo form_input($identity);?>
  </p>

  <p>

    <?php $password = array(
		'name' => 'password',
		'value' => set_value('password')
		);

	echo form_password($password);?>
  </p>
  <input type="hidden" name="redirect" value="<?php echo $_SERVER['REQUEST_URI']; ?>" />


  <p><?php echo form_submit('submit', 'zaloguj guzik');?></p>
  <?php if(isset($bladlog)){ echo '<div style="color: red; z-index: 1000000;">'.$bladlog.'</div>';}?>

<?php echo form_close();?>


		
		
		<?php
		}
		?></li>
	</ul>
</div>

<div class="kontener">
	