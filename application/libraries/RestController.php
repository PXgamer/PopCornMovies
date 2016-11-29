<?php

defined('BASEPATH') OR exit('No direct script access allowed');

abstract class RestController extends CI_Controller 
{
    protected function response($data = null, $status_code = 200, Exception $exception = null)
    {
        if($exception === null)
        {
            $this->output->set_status_header($status_code);
            $json_data = json_encode($data);
        }
        else
        {
          $json_data = $this->createError($exception);
        }
        $this->output->set_output($json_data);
    }

    protected function createError(Exception $exception)
    {
        $error = [];
        $error["code"] = $exception->getStatusCode();
        $error["message"] = $exception->getMessage();
        return json_encode($error);
    }
}