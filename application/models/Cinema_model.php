<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cinema_model extends CI_Model {

    private $id = 0;

    public function setId($id) {
        $this->id = $id;
    }

    private function getId() {
        return $this->id;
    }

    public function getAllCinemas() {
        $query = $this->db->get('cinemas');
        return $query->result();
    }

    public function getCinema() {
        $id = $this->getId();
        $this->db->where('id', $id);
        $query =  $this->db->get('cinemas');
         if ($query->num_rows() > 0){ 
             return $query->first_row();
         } else {
            return false;
         }
    }
}