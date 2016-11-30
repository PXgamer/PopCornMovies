<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<title>PopCornMovieAPI</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>PopCornMovie</title>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel="stylesheet" href="<?php echo base_url();?>assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<?php echo base_url();?>assets/custom/css/style.css">
</head>
<body>
<div class="jumbotron">
	<div class="info">
		<img src="<?php echo base_url();?>assets/gfx/logo.png" alt="Logo">
		<h2>Cinemas <small>by Oliver & Konstantin</small></h2>
		<h4><a href="http://localhost/PopCornMovies/cinemas">http://localhost/PopCornMovies/cinemas</a> <span class="label label-info">Auflistung aller Kinos</span></h4>
		<h4><a href="http://localhost/PopCornMovies/cinemas/1">http://localhost/PopCornMovies/cinemas/1</a> <span class="label label-info">Einzelne Kinos können über die ID aufgerufen werden.</span></h4>
	</div>
</div>


<script src="<?php echo base_url();?>assets/jquery/jquery.js"></script>
<script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>assets/custom/js/work.js"></script>
</body>
</html>