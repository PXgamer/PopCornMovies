<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if(!isset($error)) {
    echo $json;
} else {
    echo "Diese Id ist nicht verfügbar!";
}
