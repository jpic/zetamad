<?php
/**
 * @package MadModel
 * @subpackage Tests
 * @version //autogentag//
 * @copyright Copyright (C) 2010-2011 MadeleineMarket.com. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */

require 'model.php';
require 'controller.php';
require 'query.php';

/**
 * @package MadModel
 * @subpackage Tests
 */
class madModelSuite extends PHPUnit_Framework_TestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName("Model");
        $this->addTest( madQueryTest::suite(  ) );
        $this->addTest( madModelTest::suite() );
        $this->addTest( madModelControllerTest::suite() );
    }

    public static function suite()
    {
        $return = new madModelSuite();
        return $return;
    }

}
?>
