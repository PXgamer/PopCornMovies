<?php

require APPPATH . '/libraries/exceptions/HttpException.php';
    class HttpNotFoundException extends HttpException
    {
        public function __construct($message = null, $code = 0)
        {
            parent::__construct(404, $message, $code);
        }
    }
?>