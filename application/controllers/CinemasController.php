<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CinemasController extends CI_Controller
{
    public function index()
    {
        $this->load->model('cinema_model');
        $this->cinema_model->getAllCinnemas();
    }
}