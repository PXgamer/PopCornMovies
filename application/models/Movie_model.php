<?php

class Movie_model extends CI_Model implements JsonSerializable
{
    private $id = 0;
    private $name = '';
    private $description = '';
	private $image_path = '';
	private $imdbID = null;
	private $screenings = [];
	private $omdb = null;

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
	
	public function getImagePath()
	{
		return $this->image_path;
	}
	
	public function getScreenings()
	{
		return $this->screenings();
	}
	
	/*
	Lädt alle referenzierten Vorstellungen als Array in die Klassenvariable screenings
	*/
	private function loadScreenings()
	{
		$this->load->model("screening_model");
		$this->screenings = $this->screening_model->loadByMovieID($this->id);
	}
	
	private function loadIMDB()
	{
		if ($this->imdbID !== NULL)
		{
			$curl = curl_init();
			curl_setopt_array($curl, array(
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_URL => 'http://www.omdbapi.com/?i=' . $this->imdbID . '&plot=short&r=json'
			));
			
			$httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
			$result = json_decode(curl_exec($curl), true);
			
			curl_close($curl);
			
			if ($httpCode == 200 || true)
			{
				$this->omdb = $result;
			}
		}
	}
	
	/*
	Lädt alle Filme aus der Datenbank und gibt diese in einem Array zurück
	*/
    public function loadAll()
    {
        $query = $this->db->get('movies');
        $movies = array();

        foreach ($query->result('Movie_model') as $movie)
        {
			$movie->loadScreenings();
			$movie->loadIMDB();
            $movies[] = $movie;
        }

        return $movies;
    }
	
	/*
	Lädt einen Film anhand der ID aus der Datenbank und gibt diesen zurück
	*/
	public function loadByID($id)
	{
		$query = $this->db->select('*')->from('movies')->where('id =', $id)->get();
		
		if ($query->num_rows() >= 1)
		{
			$movie = $query->first_row('Movie_model');
			$movie->loadScreenings();
			$movie->loadIMDB();
			
			return $movie;
		}
		
		return FALSE;
	}
	
	/*
	Lädt alle Filme aus der Datenbank und gibt diese in einem Array zurück
	Es können folgende Filter genutzt werden:
		cinemaID (int) (optional) - nur Filme die im gegebenem Kino laufen
		minRating (int) (optional) - nur Filme mit einem Durchschnittsrating >= Min_Rating
		genreID (int) (optional) - nur Filme des gegebenem Genre
		actorID (int) (optional) - nur Filme in denen der gegebene Schauspieler mitspielt
	
	wird ein Filter nicht genutzt muss NULL übergeben werden
	*/
	public function loadFiltered($cinemaID, $minRating, $genreID, $actorID)
	{
		$builder = $this->db->select('movies.*')->from('movies');
		
		if ($cinemaID !== NULL)
		{
			$builder = $builder->join('movie_cinemas', 'movie_cinemas.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_cinemas.cinema_id =', $cinemaID);
		}
		
		if ($genreID !== NULL)
		{
			$builder = $builder->join('movie_genres', 'movie_genres.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_genres.genre_id =', $genreID);
		}
		
		if ($actorID !== NULL)
		{
			$builder = $builder->join('movie_actors', 'movie_actors.movie_id = movies.id', 'inner');
			$builder = $builder->where('movie_actors.actor_id =', $actorID);
		}
		
		$query = $builder->group_by('movies.id')->get();
		$movies = array();

        foreach ($query->result('Movie_model') as $movie)
        {
			if ($minRating !== NULL)
			{
				$curl = curl_init();
				curl_setopt_array($curl, array(
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_URL => 'http://localhost/PopCornMovies/ratings/' . $movie->getID() . '?type=custom_avg'
				));
				
				$httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
				$result = json_decode(curl_exec($curl), true);
				
				curl_close($curl);
				
				if ($httpCode != 200 || $result['rating'] < $minRating)
				{
					// Film wird nicht in List hinzugefügt
					continue;
				}
			}
			
			$movie->loadScreenings();
			$movie->loadIMDB();
            $movies[] = $movie;
        }

        return $movies;
	}
	
	/*
	Methode aus Interface JsonSerializable
	Zum Serialisieren des Objekts per json_encode($movie)
	*/
	public function jsonSerialize()
	{
        return (object) get_object_vars($this);
    }
}