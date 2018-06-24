<?php
/**
 *
 * @About      API Interface
 * @version    $Rev:$ 0.0.1
 * @author     Raúl Caro Pastorino (fryntiz@gmail.com)
 * @copyright  Copyright © 2018 Raúl Caro Pastorino
 * @license    https://www.gnu.org/licenses/gpl-3.0-standalone.html
 **/

// Headers para poder acceder desde otros dominios
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS');
header("Access-Control-Allow-Headers: X-Requested-With");
header('Content-Type: text/html; charset=utf-8');
header('P3P: CP="IDC DSP COR CURa ADMa OUR IND PHY ONL COM STA"');

require '../index.php';

use app\helpers\EchoResponse;
//use app\components\DbConnect;
//use app\components\DbHandler;


/* Usando GET para consultar un usuario */
$app->get('/user/{id}', function($request, $response, $args) {
    $user_id = (int)$args['id'];
    $response = [];

    // Emulando datos que se obtendrían con DBHandler
    $users = [
        ['nombre'=>'Antonio', 'edad'=>'19', 'tlf'=>'634343344', 'cod'=>'A001'],
        ['nombre'=>'Maria', 'edad'=>'21', 'tlf'=>'643534345', 'cod'=>'A002'],
    ];

    $response["error"] = false;
    $response["message"] = "Total de usuarios: " . count($users);
    $response["user"] = $users[$user_id];

    EchoResponse::response($response, 200);
});

/* Usando GET para consultar todos los usuarios */
$app->get('/users', function() {
    $response = [];

    // Emulando datos que se obtendrían con DBHandler
    $users = [
        ['nombre'=>'Antonio', 'edad'=>'19', 'tlf'=>'634343344', 'cod'=>'A001'],
        ['nombre'=>'Maria', 'edad'=>'21', 'tlf'=>'643534345', 'cod'=>'A002'],
    ];

    $response["error"] = false;
    $response["message"] = "Total de autos: " . count($users);
    $response["users"] = $users;
    EchoResponse::response($response, 200);
    //echo json_encode($response);
});

$app->run();
