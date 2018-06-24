<?php
/**
 * @author Raúl Caro Pastorino
 * @copyright Copyright © 2018 Raúl Caro Pastorino
 * @license https://www.gnu.org/licenses/gpl-3.0-standalone.html
 */

/* Creo variables */
$params = require __DIR__ . '/config/params.php';
extract($params);

$db = require __DIR__ . '/config/db.php';
$config = require __DIR__ . '/config/config.php';

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/components/DbConnect.php';
require __DIR__ . '/components/DbHandler.php';
require __DIR__ . '/helpers/EchoResponse.php';

use app\components\DbConnect;
use app\components\DbHandler;

$app = new Slim\App(['settings' => $config]);

//$db = new DbHandler($db);
