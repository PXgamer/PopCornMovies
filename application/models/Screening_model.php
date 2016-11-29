<?php

class Screening_model extends CI_Model implements JsonSerializable
{
	private $id = 0;
	private $movie_id = 0;
	private $cinema_id = 0;
	private $start = '';
	private $end = '';
	private $is_ov = FALSE;
	private $is_3d = FALSE;
	
	public function __construct()
    {
        parent::__construct();
    }
	
	public function loadByMovieID($movieID)
	{
		$query = $this->db->select('*')->from('movie_screenings')->where('movie_id =', $movieID)->get();
		$screenings = array();

        foreach ($query->result('Screening_model') as $screening)
        {
            $screenings[] = $screening;
        }
		
		return $screenings;
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