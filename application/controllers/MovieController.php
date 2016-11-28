<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovieController extends CI_Controller
{
    public function getMovies()
    {
		$cinemaID = null;
		$minRating = null;
		$genreID = null;
		$actorID = null;
		
		if ($this->input->get('Cinema_id') !== null && is_numeric($this->input->get('Cinema_id')))
		{
			$cinemaID = (int) $this->input->get('Cinema_id');
		}
		
		if ($this->input->get('Min_Rating') !== null && is_numeric($this->input->get('Min_Rating')))
		{
			$minRating = (int) $this->input->get('Min_Rating');
		}
		
		if ($this->input->get('Genre_id') !== null && is_numeric($this->input->get('Genre_id')))
		{
			$genreID = (int) $this->input->get('Genre_id');
		}
		
		if ($this->input->get('Actor_id') !== null && is_numeric($this->input->get('Actor_id')))
		{
			$actorID = (int) $this->input->get('Actor_id');
		}
		
		$this->load->model("movie_model");
		$movies = $this->movie_model->loadFiltered($cinemaID, $minRating, $genreID, $actorID);
		
		$this->load->view('movie_view', $this->prepareDataForView($movies));
    }
	
	public function getMovieByID($id)
	{
		$this->load->model("movie_model");
        $movie = $this->movie_model->loadByID($id);
		
		$this->load->view('movie_view', $this->prepareDataForView($movie));
	}
	
	private function prepareDataForView($data)
	{
		return array(
			'json' => json_encode($data)
		);
	}
}