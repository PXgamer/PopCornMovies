<?php

defined('BASEPATH') OR exit('No direct script access allowed');

abstract class RestController extends CI_Controller 
{
    private function response($data, $http_status_code  = 404)
    {
        if($data == empty)
        {
            $this->output->set_status_header($http_exception);
        }
        $json_data = json_encode($data);
        $this->output->set_output($json_data);

         $this->output->_display();
    }
}