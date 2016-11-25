<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MovieController extends CI_Controller
{
    public function getMovies()
    {
        $this->load-model("movie_model");
        $movies = $this->movie_model->load();

        if (is_numeric($this->input->get("id")))
        {
            
        }
    }
}