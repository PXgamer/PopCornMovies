<?php

class Movie_model extends CI_Model
{
    private $id = 0;
    private $name = '';
    private $description = '';

    public function __construct()
    {
        parent::__construct();
    }

    public function getID()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function load()
    {
        $query = $this->db->query('SELECT * FROM movies');
        $movies = array();

        foreach ($query->result('Movie_model') as $movie)
        {
            $movies[] = $movie;
        }

        return $movies;
    }
}