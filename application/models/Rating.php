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
    
    public function setMovieId($movie_id)
    {
        $this->movie_id = $movie_id;
    }

    public function getUserId()
    {
        return $this->user_id;
    }

    public function setUserId($user_id)
    {
        $this->user_id = $user_id;
    }

    public function getRating()
    {
        return $this->rating;
    }

    public function setRating($rating)
    {
        $this->rating = $rating;
    }

    public function getText()
    {
        return $this->text;
    }

    public function setText($text)
    {
        $this->text = $text;
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

    public function insertRating()
    {
        $query = $this->db->query("INSERT INTO popcorndb.ratings VALUES(?,?,?,?);", array(
            $this->getMovieId(), 
            $this->getUserId(), 
            $this->getRating(), 
            $this->getText()));
    }

}
