<?php
    class HttpException extends Exception
    {
         private $statusCode;

        public function getStatusCode()
        {
            return $this->statusCode;
        }

        public function __construct($statusCode, $message = null, $code = 0)
        {
             $this->statusCode = $statusCode;
             parent::__construct($message, $code);
        }
    }