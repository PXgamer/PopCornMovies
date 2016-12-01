<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if (isset($json))
{
	echo $json;
}
else
{
	echo json_encode(array(
		'error' => 'internal error'
	));
}