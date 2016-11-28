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
	
	public function jsonSerialize()
	{
        return (object) get_object_vars($this);
    }
}