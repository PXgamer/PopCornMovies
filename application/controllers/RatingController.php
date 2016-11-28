<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RatingController extends RestController {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function getRatings($movie_id)
	{
		if($this->input->get("type") == "custom_avg")
		{
			$this->load->model('Rating');
			$rating = $this->Rating->getAVGRating($movie_id);
			$this->response($rating, 200);
		}
		else
		{
			echo "404";
		}
	}

	public function postCustomRating($movie_id)
	{
		$this->load->model('Rating');
		$rating_json = json_decode(trim(file_get_contents('php://input')), true);
		$this->Rating->setMovieId($movie_id);
		$this->Rating->setUserId($rating_json["user_id"]);
		$this->Rating->setRating($rating_json["rating"]);
		$this->Rating->setText($rating_json["text"]);
		$rating = $this->Rating->insertRating();
	}
}
