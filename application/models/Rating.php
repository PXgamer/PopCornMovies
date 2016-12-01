<?php
class Rating extends CI_Model
{
    private $movie_id;
    private $user_name;
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

    public function getUserName()
    {
        return $this->user_name;
    }

    public function setUserName($user_name)
    {
        $this->user_name = $user_name;
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
        $row = $query->row();
        if (isset($row))
        {
             if($row->movie_id === NULL)
                 throw new DbNotFoundException("movie");
            else
                $this->setMovieId($row->movie_id);
            if($row->rating === NULL)
                 throw new DbNotFoundException("rating");
            else
                $this->setRating($row->rating);
            return $this;
        }
        else
        {
            throw new DbNotFoundException("movie");
        }
    }

    public function getRatings($movie_id)
    {
        $query = $this->db->query("SELECT * FROM popcorndb.ratings where movie_id = ?", array($movie_id));
        if($query->num_rows() > 0)
        {
            foreach ($query->result() as $row)
            {
                $rating = new Rating();
                $rating->setMovieId($row->movie_id);
                $rating->setUserName($row->user_name);
                $rating->setRating($row->rating);
                $rating->setText($row->text);
                $ratings[] = $rating;
            }
            return $ratings;
        }
        else
        {
            throw new DbNotFoundException("movie");
        }
    }

    public function insertRating()
    {
        $insert = $this->db->insert("ratings", array(
        "movie_id" => $this->getMovieId(), 
        "user_name" => $this->getUserName(), 
        "rating" => $this->getRating(), 
        "text" => $this->getText()));
        return $this;
    }
    
    public function mapToArray()
    {
        $ratingArray = [];
        if(!empty($this->getMovieId()))
            $ratingArray['movie_id'] = $this->getMovieId();
        if(!empty($this->getUserName()))
            $ratingArray['user_name'] = $this->getUserName();
        if(!empty($this->getRating()))
            $ratingArray['rating'] = $this->getRating();
        if(!empty($this->getText()))
            $ratingArray['text'] = $this->getText();

        return $ratingArray;
    }
}
