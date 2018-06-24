<?php
/**
 * @author Raúl Caro Pastorino
 * @link http://www.fryntiz.es
 * @copyright Copyright (c) 2018 Raúl Caro Pastorino
 * @license https://www.gnu.org/licenses/gpl-3.0-standalone.html
**/

namespace app\components;

class DbConnect
{
 
    private $cnx;
 
    function __construct($conf) {
        $this->config = $conf;
    }

    /**
     * Establishing connection with database
     * @return PDO Handler for PDO is return.
     */
    function connect() {
        try {
            $this->cnx = new PDO(
                $this->config['dsn'].';charset='.$this->config['dsn'],
                $this->config['username'],
                $this->config['password']
            );

            $this->cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->cnx->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

            // Return PDO Connection
            return $this->cnx;

        } catch(PDOException $ex) {

            // if the environment is development, show error details, otherwise show generic message
            if ( (defined('ENVIRONMENT')) && (ENVIRONMENT == 'development') ) {
                echo 'An error occured connecting to the database! Details: ' . $ex->getMessage();
            } else {
                echo 'An error occured connecting to the database!';
            }
            exit;
        }
        
    }
 
}
?>
