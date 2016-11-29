<?php

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