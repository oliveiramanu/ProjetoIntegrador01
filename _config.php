<?php

header('Content-Type: text/html; charset=utf-8');

$db = array(
    'hostname' => 'localhost',
    'username' => 'root',
    'password' => '',
    'database' => 'bookside'
);

$conn = new mysqli($db['hostname'], $db['username'], $db['password'], $db['database']);


$conn->query("SET NAMES 'utf8'");
$conn->query('SET character_set_connection=utf8');
$conn->query('SET character_set_client=utf8');
$conn->query('SET character_set_results=utf8');


$conn->query('SET GLOBAL lc_time_names = pt_BR');
$conn->query('SET lc_time_names = pt_BR');


date_default_timezone_set('America/Sao_Paulo');


if (isset($_COOKIE['user']))
    $user = unserialize($_COOKIE['user']);
else
    $user = false;


function get_years_old($birth)
{

    $n = array(date('Y'), date('m'), date('d'));

    $b = explode('-', $birth);

    $yo = $n[0] - $b[0];

    if ($n[1] < $b[1]) {

        $yo--;

    } elseif ($n[1] == $b[1] and $n[2] <= $b[2]) {

        $yo--;
    }

    return $yo;
}

function dump($variable, $exit = true, $pre = true)
{
    if ($pre) echo '<pre>';
    print_r($variable);
    if ($pre) echo '</pre>';
    if ($exit) exit;
}

function upload_photo($photo_dir, $photo_name = '')
{

    if ($photo_name === '')
        $photo_name = substr(sha1(time() + rand()), 40 - min(24, 40));

    $return_url = false;                                                       
    $error = false;                                                           
    $photo_data = $_FILES['photo'];                                           
    list($photo_width, $photo_height) = getimagesize($photo_data['tmp_name']); 
    $photo_type = strtolower($photo_data['type']);                             
    $photo_ext = trim(explode('/', $photo_type)[1]);                           
    $photo_url = $photo_dir . $photo_name . '.' . $photo_ext;                  

    if (
        $photo_type !== 'image/jpeg' and
        $photo_type !== 'image/jpg' and
        $photo_type !== 'image/png'
    ) {

        $error .= "A foto não está em um formato válido.";

    } elseif (
        $photo_data['size'] > 1000000   
    ) {

        $error .= "A foto deve ter menos de 1MB.";

    } elseif (
        $photo_width < 64 or             
        $photo_width > 512 or            
        $photo_width !== $photo_height  
    ) {

        $error .= "A foto não está em um formato válido.";

    } else {

        if (move_uploaded_file($photo_data["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . $photo_url)) {

            $return_url .= $photo_url;
        } else {

            $error .= "Erro ao enviar foto.";
        }
    }

    return array(
        'url' => $return_url,   
        'error' => $error       
    );
}