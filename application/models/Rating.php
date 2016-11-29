<?php
class Rating extends CI_Model
{
    private $movie_id;
    private $user_id;
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
        $query = $this->db->query("SELECT movie_id, AVG(rating) as rating FROM popcorndb.ratings where movie_id = ?", array($movie_id));
        if($query->num_rows() == 0)
        {
            $row = $query->row();
             var_dump($row);
            if (isset($row))
            {
                $this->setMovieId($row->movie_id);
                $this->setRating($row->rating);
                return $this;
            }
            else
            {
                throw new DbNotFoundException();
            }
        }
        else
        {
            throw new DbNotFoundException();
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
    
    public function mapToArray()
    {
        $ratingArray = [];
        if(!empty($this->getMovieId()))
            $ratingArray['movie_id'] = $this->getMovieId();
        if(!empty($this->getUserId()))
            $ratingArray['user_id'] = $this->getUserId();
        if(!empty($this->getRating()))
            $ratingArray['rating'] = $this->getRating();
        if(!empty($this->getText()))
            $ratingArray['text'] = $this->getText();

        return $ratingArray;
    }
}
