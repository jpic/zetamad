<?php
/**
 * @package MadBase
 * @subpackage Tests
 * @version //autogentag//
 * @copyright Copyright (C) 2010-2011 MadeleineMarket.com. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 */

require 'base.php';

/**
 * @package MadBase
 * @subpackage Tests
 */
class madBaseSuite extends PHPUnit_Framework_TestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName('Base');
        $this->addTest( madBaseTest::suite() );
    }

    public static function suite()
    {
        return new madBaseSuite();
    }
}
?>
