<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if(!isset($error)) {
    echo $json;
} else {
    echo "Diese ID ist nicht verfügbar!";
}
