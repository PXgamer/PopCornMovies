<?php

class Movie_model extends CI_Model implements JsonSerializable
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

    public function loadAll()
    {
        $query = $this->db->get('movies');
        $movies = array();

        foreach ($query->result('Movie_model') as $movie)
        {
            $movies[] = $movie;
        }

        return $movies;
    }
	
	public function loadByID($id)
	{
		$query = $this->db->select('*')->from('movies')->where('id =', $id)->get();
		$movie = $query->first_row('Movie_model');
		
		return $movie;
	}
	
	public function loadFiltered($cinemaID, $minRating, $genreID, $actorID)
	{
		$builder = $this->db->select('movies.*')->from('movies');
		
		if ($cinemaID !== null)
		{
			$builder = $builder->join('movie_cinemas', 'movie_cinemas.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_cinemas.cinema_id =', $cinemaID);
		}
		
		if ($minRating !== null)
		{
			$builder = $builder->join('ratings', 'ratings.movie_id = movies.id', 'inner');
			$builder = $builder->having('AVG(ratings.rating) >=', $minRating);
		}
		
		if ($genreID !== null)
		{
			$builder = $builder->join('movie_genres', 'movie_genres.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_genres.genre_id =', $genreID);
		}
		
		if ($actorID !== null)
		{
			$builder = $builder->join('movie_actors', 'movie_actors.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_actors.actor_id =', $actorID);
		}
		
		$query = $builder->group_by('movies.id')->get();
		$movies = array();

        foreach ($query->result('Movie_model') as $movie)
        {
            $movies[] = $movie;
        }

        return $movies;
	}
	
	public function jsonSerialize()
	{
        return (object) get_object_vars($this);
    }
}