<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/RestController.php';
require APPPATH . '/libraries/exceptions/HttpNotFoundException.php';
require APPPATH . '/libraries/exceptions/DbNotFoundException.php';

class TestController extends CI_Controller
{
	public function testApi()
    {
        $this->load->library('unit_test');
        $this->testGetRatings();
        $this->testPostRatings();
        $this->testGetMovies();
        $this->testGetCinemas();
    }

    public function doRequest($url, $post_data = null)
    {
          $curl = curl_init($url);
          if($post_data != null)
          {
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
          }
          return curl_exec($curl);
    }

    public function testGetRatings()
    {

    }

    public function testPostRatings()
    {

    }

    public function testGetMovies()
    {

    }

    public function testGetCinemas()
    {

    }
    
}