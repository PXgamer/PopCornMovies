<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovieController extends CI_Controller
{
	/*
	GET
	Zeigt eine Liste von Filmen als JSON an
	Kann über GET-Parameter gefiltert werden:
		Cinema_id (int) (optional) - zeige nur Filme die im gegebenem Kino laufen
		Min_Rating (int) (optional) - zeige nur Filme mit einem Durchschnittsrating >= Min_Rating
		Genre_id (int) (optional) - zeige nur Filme des gegebenem Genre
		Actor_id (int) (optional) - zeige nur Filme in denen der gegebene Schauspieler mitspielt
	*/
    public function getMovies()
    {
		$cinemaID = NULL;
		$minRating = NULL;
		$genreID = NULL;
		$actorID = NULL;
		
		function strIsUnsignedInt($str) { return preg_match('/^[0-9]+$/', $str) === 1; }
		
		if ($this->input->get('Cinema_id') !== NULL && strIsUnsignedInt($this->input->get('Cinema_id')))
		{
			$cinemaID = (int) $this->input->get('Cinema_id');
		}
		
		if ($this->input->get('Min_Rating') !== NULL && strIsUnsignedInt($this->input->get('Min_Rating')))
		{
			$minRating = (int) $this->input->get('Min_Rating');
		}
		
		if ($this->input->get('Genre_id') !== NULL && strIsUnsignedInt($this->input->get('Genre_id')))
		{
			$genreID = (int) $this->input->get('Genre_id');
		}
		
		if ($this->input->get('Actor_id') !== NULL && strIsUnsignedInt($this->input->get('Actor_id')))
		{
			$actorID = (int) $this->input->get('Actor_id');
		}
		
		$this->load->model("movie_model");
		$movies = $this->movie_model->loadFiltered($cinemaID, $minRating, $genreID, $actorID);
		
		$this->load->view('movie_view', $this->prepareDataForView($movies));
    }
	
	/*
	GET
	Zeigt einen Film als JSON an
	id muss übergeben werden
	*/
	public function getMovieByID($id)
	{
		$this->load->model("movie_model");
        $movie = $this->movie_model->loadByID($id);
		
		$this->load->view('movie_view', $this->prepareDataForView($movie));
	}
	
	/*
	Gibt die Daten für den View zurück
	*/
	private function prepareDataForView($data)
	{
		return array(
			'json' => json_encode($data)
		);
	}
}