<?php

class Rating extends CI_Model
{
    private $movieId;
    private $userId;
    private $rating;
    private $text;

    public function getMovieId()
    {
        return $this->movie_id;
    }

    public function getAVGRating($movie_id)
    {
        $query = $this->db->query("SELECT AVG(rating) as rating FROM popcorndb.ratings where movie_id = ?", array($movie_id));
        $row = $query->row();

        if (isset($row))
        {
           return $row->rating;
        }
    }

}
