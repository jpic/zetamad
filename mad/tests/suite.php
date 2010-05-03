<?php
/**
 * @package MadBase
 * @subpackage Tests
 * @version //autogentag//
 * @copyright Copyright (C) 2010-2011 MadeleineMarket.com. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */

/**
 * @package Framework
 * @subpackage Tests
 */
class madTestSuite extends PHPUnit_Framework_TestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName('Framework');
        //$this->addTest( madObjectTest::suite(  ) );
        //$this->addTest( madModelTest::suite(  ) );
        $this->addTest( madConfigurationTest::suite(  ) );
    }

    public static function suite()
    {
        return new madTestSuite();
    }
}
?>
