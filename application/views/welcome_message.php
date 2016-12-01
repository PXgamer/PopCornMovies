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
		<h4><a href="/PopCornMovies/cinemas" target="_blank">http://localhost/PopCornMovies/cinemas</a> <span class="label label-info">Auflistung aller Kinos</span></h4>
		<h4><a href="/PopCornMovies/cinemas/1" target="_blank">http://localhost/PopCornMovies/cinemas/1</a> <span class="label label-info">Einzelne Kinos können über die ID aufgerufen werden.</span></h4>
		
		<h2>Movies <small>by Felix</small></h2>
		<h4><a href="/PopCornMovies/movies" target="_blank">http://localhost/PopCornMovies/movies</a> <span class="label label-info">Auflistung aller Filme</span></h4>
		<h4><a href="/PopCornMovies/movies?Cinema_id=1" target="_blank">http://localhost/PopCornMovies/movies?Cinema_id=1</a> <span class="label label-info">Auflistung aller Filme, die im Kino mit der ID 1 laufen</span></h4>
		<h4><a href="/PopCornMovies/movies?Min_rating=5" target="_blank">http://localhost/PopCornMovies/movies?Min_rating=5</a> <span class="label label-info">Auflistung aller Filme mit einer Durchschnittsbewertung von mindestens 5</span></h4>
		<h4><a href="/PopCornMovies/movies?Cinema_id=1&Min_rating=5" target="_blank">http://localhost/PopCornMovies/movies?Cinema_id=1&Min_rating=5</a> <span class="label label-info">Auflistung aller Filme, die im Kino mit der ID 1 laufen und einer Durchschnittsbewertung von mindestens 5</span></h4>
		<h4><a href="/PopCornMovies/movies/1" target="_blank">http://localhost/PopCornMovies/movies/1</a> <span class="label label-info">Einzelne Filme können über die ID aufgerufen werden.</span></h4>
		
		<h2>Ratings <small>by Tom & Tobias</small></h2>
		<h4><a href="/PopCornMovies/ratings?movie_id=1&type=custom_avg" target="_blank">http://localhost/PopCornMovies/ratings/?movie_id=1&type=custom_avg</a> <span class="label label-info">Liefert den Durchschnitt aller Bewertungen eines Filmes.</span></h4>
		<h4><a href="/PopCornMovies/ratings?movie_id=1" target="_blank">http://localhost/PopCornMovies/ratings?movie_id=1</a> <span class="label label-info">Liefert alle Bewertungen inkl. Name, Text und Sterne-Bewertung eines Filmes.</span></h4>
	
		<hr>
		<a href="http://localhost/PopCornFrontend/" target="_blank" class="btn btn-danger">Zur Kinoseite!</a>
	</div>
</div>


<script src="<?php echo base_url();?>assets/jquery/jquery.js"></script>
<script src="<?php echo base_url();?>assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>assets/custom/js/work.js"></script>
</body>
</html>