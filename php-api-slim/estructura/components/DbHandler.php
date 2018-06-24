<?php
/**
 * @author Raúl Caro Pastorino
 * @link http://www.fryntiz.es
 * @copyright Copyright (c) 2018 Raúl Caro Pastorino
 * @license https://www.gnu.org/licenses/gpl-3.0-standalone.html
**/

namespace app\components;

class DbHandler
{
    private $cnx;
 
    function __construct($conf)
    {
        $db = new DbConnect($conf);
        $this->cnx = $db->connect();
    }
 
    public function create($array)
    {
        // Lógica para create
    }

    public function update($array)
    {
        // Lógica para update
    }

    public function delete($array)
    {
        // Lógica para delete
    }

    public function one($array)
    {
        // Lógica para delete
    }

    public function all($array)
    {
        // Lógica para delete
    }

}
 
