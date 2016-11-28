<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cinema_model extends CI_Model {
    public function getAllCinemas() {
        $query = $this->db->get('cinemas');
        return $query->result();   
    }

    public function getCinema($id) {
        $query = $this->db->where('id', $id); 
        $query =  $this->db->get('cinemas'); 
        return $query->result();
    }

}