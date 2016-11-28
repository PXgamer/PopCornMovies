<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CinemasController extends CI_Controller {
  
     public function index() {
        $this->load->model('cinema_model');
        $getAllCinemas = $this->cinema_model->getAllCinemas();
        echo json_encode($getAllCinemas);
        #var_dump($getAllCinemas);
    }

    public function getCinema($id) {
        $this->load->model('cinema_model');
        $getAllCinemas = $this->cinema_model->getCinema($id);
        echo json_encode($getAllCinemas);
    }
}