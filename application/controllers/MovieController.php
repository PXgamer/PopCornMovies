<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovieController extends CI_Controller
{
    public function getMovies()
    {
        $this->load->model("movie_model");
        $movies = $this->movie_model->loadAll();
		
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