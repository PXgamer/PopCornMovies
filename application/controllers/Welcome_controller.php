<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome_controller extends CI_Controller {
  
     public function welcome() {
         $this->load->view('welcome_message');
    }

}