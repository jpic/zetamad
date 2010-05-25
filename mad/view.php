<?php
/**
 * File containing class madView.
 * 
 * @package MadCore
 * @version //autogen//
 * @copyright Copyright (C) 2010-2011 madeleinemarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * This class is responsible for taking a result object (typically returned by 
 * a controller) and to create a response object (typically to give to a 
 * response writer).
 *
 * This include several resposnabilities:
 * - deciding which templates to use,
 * - in which order to render them
 * 
 * This class is responsible for creating the response object.
 *
 * @package MadCore
 * @version //autogen//
 */
class madView extends ezcMvcView {
    /**
     * Monkey patch ezcMvcView.
     * 
     * @var ezcMvcRoutingInformation
     */
    private $routeInfo;

    public $plugins = array(  );

    public $configuration = array(  );

    public $composite = null;
    public $views = array(  );

    /**
     * Instanciate a view object with a request, result and routing 
     * information. Typically called from the dispatcher.
     * 
     * @param ezcMvcRequest $request 
     * @param ezcMvcResult $result 
     * @param ezcMvcRoutingInformation $routeInfo 
     * @return void
     */
    public function __construct( ezcMvcRequest $request, ezcMvcResult $result, ezcMvcRoutingInformation $routeInfo, &$configuration = null ) {
        parent::__construct( $request, $result );
        $this->routeInfo = $routeInfo;
        $this->configuration =& $configuration;
    }

    public function compose( $name, $view ) {
        $view->composite = $this;
        $this->views[$name] = $view;
    }

    public function createZones( $layout )
    {
        $zones = array(  );

        if ( isset( $this->result->variables['responseBody'] ) ) {
            $zones[] = new ezcMvcPhpViewHandler( 'content', join( DIRECTORY_SEPARATOR, array( 
                dirname( __FILE__ ),
                'templates',
                'responseBody.php',
            ) ) );

            return $zones;
        }
        
        if ( isset( $this->result->variables['fileRequest'] ) ) {
            $zones[] = new ezcMvcPhpViewHandler( 'content', join( DIRECTORY_SEPARATOR, array( 
                dirname( __FILE__ ),
                'templates',
                'madDownloadController.download.php'
            ) ) );
            
            // short circuit to avoid regular template rendering in the case of 
            // a file download request
            return $zones;
        }

        if ( isset( $this->result->variables['consoleOutput'] ) ) {
            $zones[] = new ezcMvcPhpViewHandler( 'content', join( DIRECTORY_SEPARATOR, array( 
                dirname( __FILE__ ),
                'templates',
                'consoleOutput.php'
            ) ) );

            // short circuit to avoid regular template rendering in the case of 
            // a file download request
            return $zones;
        }

        foreach( $this->views as $name => $view ) {
            foreach( $view->createZones( false ) as $zone ) {
                $zones[] = $zone;
            }
        }

        $zones[] = new madViewHandler( 'body', $this->getTemplate( ) );
        
        if ( $layout && !$this->request->variables['ajaxRequest'] ) {
            $zones[] = new madViewHandler( 'site_base', ENTRY_APP_PATH . DIRECTORY_SEPARATOR . 'templates' . DIRECTORY_SEPARATOR . 'site_base.php' );
        }

        return $zones;
    }

    public function getTemplatePath( $template, $defaultApplication = null ) { // {{{
        $registry = madFramework::instance(  );
        
        // path to the "entry point" application
        $entryApplicationPath = ENTRY_APP_PATH;
        
        // path to the application defining the route
        $routeApplicationName = $this->routeInfo->route->application;
        $routeApplicationPath = $registry->configuration->getSetting( 
            'applications', $routeApplicationName, 'path' ) ;
        
        // path to the application defining the controller
        $controllerApplicationName = $registry->configuration->getClassApplicationName( $this->routeInfo->controllerClass );
        $controllerApplicationPath = $registry->configuration->getSetting( 'applications', $controllerApplicationName, 'path' );

        // also check parent controller
        // TODO make this recursive
        $parentControllerClass = get_parent_class( $this->routeInfo->controllerClass );
        // todo: catch proper exception
        try {
            $parentControllerApplicationName = $registry->configuration->getClassApplicationName( $parentControllerClass );
            $parentControllerApplicationPath = $registry->configuration->getSetting( 'applications', $parentControllerApplicationName, 'path' );
        } catch( Exception $e ) {
            // pass
        }

        if ( !is_null( $defaultApplication ) ) {
            // $defaultApplication/templates/$template
            $testPaths[] = $registry->configuration->getPathSetting( 'applications', $defaultApplication, 'path' ) . "/templates/$template";
        }

        // $entryAppPath/templates/$routeApp/$action.php
        $testPaths[] = join( DIRECTORY_SEPARATOR, array(
            $entryApplicationPath,
            'templates',
            $routeApplicationName,
            $template,
        ) );

        // $entryAppPath/templates/$action.php
        $testPaths[] = join( DIRECTORY_SEPARATOR, array(
            $entryApplicationPath,
            'templates',
            $template,
        ) );

        // $routeAppPath/templates/$action.php
        $testPaths[] = join( DIRECTORY_SEPARATOR, array(
            $routeApplicationPath,
            'templates',
            $template,
        ) );

        // $controllerAppPath/templates/$action.php
        $testPaths[] = join( DIRECTORY_SEPARATOR, array(
            $controllerApplicationPath,
            'templates',
            $template,
        ) );

        if ( isset( $parentControllerApplicationPath ) ) {
            // $parentControllerAppPath/templates/$action.php
            $testPaths[] = join( DIRECTORY_SEPARATOR, array(
                $parentControllerApplicationPath,
                'templates',
                $template,
            ) );
        }

        // return the first guessed template or die!
        foreach( $testPaths as $templatePath ) {
            // handle relative path
            if ( substr( $templatePath, 0, 1 ) != DIRECTORY_SEPARATOR ) {
                $templatePath = implode( '/', array( 
                    ENTRY_APP_PATH,
                    $templatePath,
                ) );
            }

            if ( file_exists( $templatePath ) ) {
                return $templatePath;
            }
        }

        trigger_error( "Can't figure a template path for " . join( "<br />", $testPaths ) );
    } // }}}

    /**
     * Try to figure the template path for this request/result.
     *
     * If the route set argument "template", then:
     * - use $entryAppPath/templates/$routeApp/$template if exists,
     * - use $routeAppPath/templates/$template if exists,
     * - throw an exception.
     *
     * If the controller result has an "object" variable or the route set 
     * argument "filter__namespace", then:
     * - use $entryAppPath/templates/$routeApp/$namespace_$action.php if exists,
     * - use $routeAppPath/templates/$namespace_$action.php if exists,
     *
     * Anyway, try:
     * - use $entryAppPath/templates/$routeApp/$action.php if exists,
     * - use $entryAppPath/templates/$action.php if exists,
     * - use $routeAppPath/templates/$action.php if exists,
     * - use $controllerAppPath/templates/$action.php if exists
     * 
     * And finnaly, throw an exception.
     *
     * @return string template path
     */
    public function getTemplate(  ) { // {{{
        $actionName = $this->routeInfo->action;

        $registry = madFramework::instance(  );
        
        // path to the "entry point" application
        $entryApplicationPath = ENTRY_APP_PATH;
        
        // path to the application defining the route
        $routeApplicationName = $this->routeInfo->route->application;
        $routeApplicationPath = $registry->configuration->getSetting( 
            'applications', $routeApplicationName, 'path' ) ;
        
        // path to the application defining the controller
        $controllerApplicationName = $registry->configuration->getClassApplicationName( $this->routeInfo->controllerClass );
        $controllerApplicationPath = $registry->configuration->getSetting( 'applications', $controllerApplicationName, 'path' );

        // also check parent controller
        // TODO make this recursive
        $parentControllerClass = get_parent_class( $this->routeInfo->controllerClass );
        // todo: catch proper exception
        try {
            $parentControllerApplicationName = $registry->configuration->getClassApplicationName( $parentControllerClass );
            $parentControllerApplicationPath = $registry->configuration->getSetting( 'applications', $parentControllerApplicationName, 'path' );
        } catch( Exception $e ) {
            // pass
        }

        // pass 1, template was hardcoded in the route, it *must* exists
        if ( isset( $this->request->variables['template'] ) ) {
            $templateName = $this->request->variables['template'];

            $testPaths = array( 
                // $entryAppPath/templates/$routeApp/$template
                join( DIRECTORY_SEPARATOR, array( 
                    ENTRY_APP_PATH,
                    $entryApplicationPath,
                    'templates',
                    $routeApplicationName,
                    $templateName,
                ) ),
                // $routeAppPath/templates/$template
                join( DIRECTORY_SEPARATOR, array( 
                    ENTRY_APP_PATH,
                    $routeApplicationPath,
                    'templates',
                    $templateName,
                ) ),
            );

            // return the first guessed template path or die!
            foreach( $testPaths as $templatePath ) {
                if ( file_exists( $templatePath ) ) {
                    return $templatePath;
                }
            }

            throw new Exception( "Cannot find path for $templateName, tryed " . join( ", ", $testPaths ) );
        }

        // pass 2, template was hardcoded in the result, it *must* exists
        if ( isset( $this->result->variables['template'] ) ) {
            $templateName = $this->result->variables['template'];

            $testPaths = array( 
                // $entryAppPath/templates/$routeApp/$template
                join( DIRECTORY_SEPARATOR, array( 
                    ENTRY_APP_PATH,
                    $entryApplicationPath,
                    'templates',
                    $routeApplicationName,
                    $templateName,
                ) ),
                // $routeAppPath/templates/$template
                join( DIRECTORY_SEPARATOR, array( 
                    ENTRY_APP_PATH,
                    $routeApplicationPath,
                    'templates',
                    $templateName,
                ) ),
            );

            // return the first guessed template path or die!
            foreach( $testPaths as $templatePath ) {
                if ( file_exists( $templatePath ) ) {
                    return $templatePath;
                }
            }

            throw new Exception( "Cannot find path for $templateName, tryed " . join( ", ", $testPaths ) );
        }

        // pass 3, template should be magically figured from the most specific 
        // path to the most generic path
        $testPaths = array();

        $namespace = $this->getNamespace(  );
        if ( $namespace ) {
            $templateName = sprintf( '%s_%s.php',
                $namespace,
                $actionName
            );

            // $entryAppPath/templates/$routeApp/$namespace_$action.php
            $testPaths[] = join( DIRECTORY_SEPARATOR, array( 
                $entryApplicationPath,
                'templates',
                $routeApplicationName,
                $templateName,
            ) );

            // $routeAppPath/templates/$namespace_$action.php
            $testPaths[] = join( DIRECTORY_SEPARATOR, array( 
                $routeApplicationPath,
                'templates',
                $templateName,
            ) );
        }
        
        foreach( $testPaths as $templatePath ) {
            // handle relative path
            if ( substr( $templatePath, 0, 1 ) != DIRECTORY_SEPARATOR ) {
                $templatePath = implode( '/', array( 
                    ENTRY_APP_PATH,
                    $templatePath,
                ) );
            }

            if ( file_exists( $templatePath ) ) {
                return $templatePath;
            }
        }
        
        return $this->getTemplatePath( $actionName . '.php' );    
    } // }}}

    /**
     * Try to figure the namespace of the content object(s) concerned by the 
     * request, if any.
     *
     * It checks:
     * - result variable 'object',
     * - request variable 'filter__namespace'
     * 
     * @return string Persistent object namespace attribute.
     */
    public function getNamespace(  ) { // {{{
        if ( isset( $this->request->variables['filter']['namespace'] ) ) {
            return $this->request->variables['filter']['namespace'];
        }

        if ( isset( $this->result->variables['objectList'] ) ) {
            $current = current( $this->result->variables['objectList'] );
            return $current['namespace'];
        }

        if ( isset( $this->result->variables['object'] ) ) {
            return $this->result->variables['object']['namespace'];
        }

        return false;
    } // }}}
}

?>
