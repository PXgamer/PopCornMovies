<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CinemasController extends CI_Controller {
  
     public function index() {
        $this->load->model('cinema_model');
        $getAllCinemas = $this->cinema_model->getAllCinemas();
        $data['json'] = json_encode($getAllCinemas);
        $this->load->view('cinema_view', $data);
        #var_dump($getAllCinemas);
    }

    public function getCinema($id) {
        $this->load->model('cinema_model');
        $getAllCinemas = $this->cinema_model->getCinema($id);
        $data['json'] = json_encode($getAllCinemas);
        $this->load->view('cinema_view', $data);
    }
}