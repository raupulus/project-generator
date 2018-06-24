<?php
/**
 *
 * User: fryntiz
 * Date: 24/06/18
 * Time: 0:08
 */

/**
 * @author    Raúl Caro Pastorino
 * @link      http://www.fryntiz.es
 * @copyright Copyright (c) 2018 Raúl Caro Pastorino
 * @license   https://www.gnu.org/licenses/gpl-3.0-standalone.html
 **/

namespace app\helpers;

class EchoResponse
{
    /**
     * Devuelve la respuesta formateada en JSON
     * @param []  $response Contenido de la respuesta
     * @param int $status_code Código de respuesta HTTP
     */
    static public function response($response, $status_code = 200)
    {
        //$app = Slim\Slim::getInstance();

        // Assign Http response code or 200 default
        //$newApp = $app->withStatus($status_code);

        // Response content setting type to json
        //$newApp = $app->withHeader('Content-type', 'application/json');

        //$newApp = $app->withJson($response, $status_code);

        //header('Content-Type: application/json');
        //var_dump(json_encode($cont));die();
        echo json_encode($response);
        //echo html_entity_decode(json_encode($cont));
    }
}

/**
 * API Response HTTP CODE
 * Used as reference for API REST Response Header
 *
 */
/*
200 	OK
201 	Created
304 	Not Modified
400 	Bad Request
401 	Unauthorized
403 	Forbidden
404 	Not Found
422 	Unprocessable Entity
500 	Internal Server Error
*/
?>

