<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/RestController.php';
require APPPATH . '/libraries/exceptions/HttpNotFoundException.php';
require APPPATH . '/libraries/exceptions/DbNotFoundException.php';

class TestController extends CI_Controller
{
    private $base_url;

	public function testApi()
    {
        $this->base_url = "http://localhost";
        $this->load->library('unit_test');
        $this->testGetRatings();
        //$this->testPostRatings();
        //$this->testGetMovies();
        //$this->testGetCinemas();
    }

    public function doRequest($url, $post_data = null)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        $headers = array(
            'Accept: application/json',
            'Content-Type: application/json',
        );
        if($post_data != null)
        {
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
        }
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $result["data"] = json_decode(curl_exec($curl));
        $result["code"] = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        return $result;
    }

    public function testGetRatings()
    {
       $result = $this->doRequest($this->base_url . "/ratings/");
       echo $this->unit->run($result["code"] , 400, "getRatings - Error: 400");
       $result = $this->doRequest($this->base_url . "/ratings/?movie_id=1");
       echo $this->unit->run($result["code"] , 200, "getRatings - Success - Code: 200");
       $this->load->model('Rating');
       $ratings = $this->Rating->getRatings(1);
       foreach($ratings as $rating)
       {
            $ratingsArray[] = $rating->mapToArray();
       }
       echo $this->unit->run($result["data"] , json_decode(json_encode($ratingsArray)), "getRatings - Success - Data");
    }

    public function testPostRatings()
    {
        $result = $this->doRequest($this->base_url . "/ratings");
    }

    public function testGetMovies()
    {
        $result = $this->doRequest($this->base_url . "/movies/1");
    }

    public function testGetCinemas()
    {
        $result = $this->doRequest($this->base_url . "/cinemas/1");
    }
    
}