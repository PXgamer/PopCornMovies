<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class RatingController extends CI_Controller {

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
			echo $rating;
		}
		else
		{
			echo "404";
		}
	}

	public function postCustomRating($movie_id)
	{
		$this->load->model('Rating');
		$this->Rating->setMovieId($movie_id);
		$this->Rating->setUserId($this->input->post("user_id"));
		$this->Rating->setRating($this->input->post("rating"));
		$this->Rating->setText($this->input->post("text"));
				$rating = $this->Rating->insertRating();
	}
}
