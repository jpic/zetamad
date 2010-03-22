<?php
/**
 * @package MadCore
 * @subpackage Tests
 * @version //autogentag//
 * @copyright Copyright (C) 2010-2011 MadeleineMarket.com. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */

require 'router.php';

/**
 * @package MadCore
 * @subpackage Tests
 */
class madCoreSuite extends PHPUnit_Framework_TestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName("Core");
        $this->addTest( madCoreRouterTest::suite() );
        $this->addTest( madCoreConfigurationTest::suite() );
    }

    public static function suite()
    {
        return new madCoreSuite();
    }
}
?>
