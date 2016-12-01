<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/RestController.php';
require APPPATH . '/libraries/exceptions/HttpNotFoundException.php';
require APPPATH . '/libraries/exceptions/DbNotFoundException.php';
require APPPATH . '/libraries/exceptions/DbException.php';

class RatingController extends RestController 
{
	public function getRatings()
	{
		try
		{
			if($this->input->get("movie_id") != null)
			{
				if($this->input->get("type") != null)
				{
					if($this->input->get("type") == "custom_avg")
					{
						$this->load->model('Rating');
						$this->Rating->getAVGRating($this->input->get("movie_id"));
						$rating = $this->Rating->mapToArray();
						$this->response($rating, 200);
					}
					else
					{
						throw new HttpNotFoundException();
					}
				}
				else
				{
					$this->load->model('Rating');
					$ratings = $this->Rating->getRatings($this->input->get("movie_id"));
					foreach($ratings as $rating)
					{
						$ratingsArray[] = $rating->mapToArray();
					}
					$this->response($ratingsArray, 200);
				}
			}
			else
			{
				$this->response(null, null, new HttpdException(401, "Bad Request"));
			}
		}
		catch(DbNotFoundException $e)
		{
			$this->response(null, null, new HttpNotFoundException("No Rating found for movie_id "));
		}
	}

	public function postCustomRating()
	{
		$this->load->model('Rating');
		$rating_json = json_decode(trim(file_get_contents('php://input')), true);
		$this->Rating->setMovieId($rating_json["movie_id"]);
		$this->Rating->setUserName($rating_json["user_name"]);
		$this->Rating->setRating($rating_json["rating"]);
		$this->Rating->setText($rating_json["text"]);
		try
		{
			$rating = $this->Rating->insertRating();
		}
		catch(DbException $e)
		{
			$this->response(null, null, new HttpException(400,"Error in Database with data"));
		}
		$rating = $this->Rating->mapToArray();
		$this->response($rating, 201);
	}
}
