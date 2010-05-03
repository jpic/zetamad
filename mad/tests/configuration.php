<?php
/**
 * @package MadConfiguration
 * @subpackage Tests
 */
class madConfigurationTest extends ezcTestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madConfigurationTest' );
    }

    static public function getRelativePathProvider(  )  {
        return array( 
            array( 
                '/srv/foo/bar',
                '/srv',
                'foo/bar',
            ),
            array( 
                '/srv/foo/bar',
                '/srv/',
                'foo/bar',
            ),
            array( 
                '/srv/foo/bar/',
                '/srv',
                'foo/bar',
            ),
            array( 
                '/srv/foo/bar/',
                '/srv/',
                'foo/bar',
            ),
            array( 
                '/srv/foo/bar',
                '/srv/test',
                '../foo/bar',
            ),
            array( 
                '/srv/foo/bar',
                '/srv/test/fool',
                '../../foo/bar',
            ),
            array( 
                '/srv/mad/xp/mad/model/static/css/uni-form.css',
                '/srv/mad/xp/liria/',
                '../mad/model/static/css/uni-form.css',
            ),
        );
    }

    /**
     * @dataProvider getRelativePathProvider
     */
    public function testGetRelativePath( $path, $compareTo, $expected ) {
        $result = madConfiguration::getRelativePath( $path, $compareTo );
        $this->assertEquals( $expected, $result );
    }
}
