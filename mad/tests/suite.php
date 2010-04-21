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
class madObjectSuite extends PHPUnit_Framework_TestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName('Base');
        $this->addTest( madObjectTest::suite() );
    }

    public static function suite()
    {
        return new madObjectSuite();
    }
}
?>
