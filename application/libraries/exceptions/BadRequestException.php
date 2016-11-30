<?php
    require APPPATH . '/libraries/exceptions/BadRequestException.php';
    class BadRequestException extends HttpException
    {
        public function __construct($message = null, $code = 0)
        {
            parent::__construct(400, $message, $code);
        }
    }