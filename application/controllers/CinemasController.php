<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CinemasController extends CI_Controller {

    /**
    * Gibt alle Kinos aus
    **/
    public function index() {
        $this->load->model('cinema_model');
        $getAllCinemas = $this->cinema_model->getAllCinemas();
        $data['json'] = json_encode($getAllCinemas);
        $this->load->view('cinema_view', $data);
    }

    /**
    * Gibt ein bestimmtes Kino aus
    **/
    public function getCinema($id) {
    if(!is_numeric($id)){
        $this->index();
        return false;
    } else {
        $this->load->model('cinema_model');
        $this->cinema_model->setId($id);
        $getAllCinemas = $this->cinema_model->getCinema();
        if($getAllCinemas != FALSE){
            $data['json'] = json_encode($getAllCinemas);
            $this->load->view('cinema_view', $data);
        } else {
            $data['error'] = 1;
            $this->load->view('cinema_view', $data);
        }
        }
    }
}