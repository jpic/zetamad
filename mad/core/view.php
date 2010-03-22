<?php
/**
 * File containing class madCoreView.
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
 * @package MadCore
 * @version //autogen//
 */
class madCoreView extends ezcMvcView {
    /**
     * Monkey patch ezcMvcView.
     * 
     * @var ezcMvcRoutingInformation
     */
    private $routeInfo;

    /**
     * Instanciate a view object with a request, result and routing 
     * information. Typically called from the dispatcher.
     * 
     * @param ezcMvcRequest $request 
     * @param ezcMvcResult $result 
     * @param ezcMvcRoutingInformation $routeInfo 
     * @return void
     */
    public function __construct( ezcMvcRequest $request, ezcMvcResult $result, ezcMvcRoutingInformation $routeInfo ) {
        parent::__construct( $request, $result );

        $this->routeInfo = $routeInfo;
    }

    /**
     * The user-implemented that returns the zones.
     *
     * This method creates all the zones that are needed to render a view. A
     * zone is an array of elements that implement a view handler. The view
     * handlers do not have to be of the same type, as long as they implement
     * the ezcMvcViewHandler interface.
     *
     * The $layout parameter can be used to determine whether a "page layout" should
     * be added to the list of zones. This can be useful in case you're incorporating
     * many different applications. The $layout parameter will be set to true automatically
     * for the top level createZones() method, which can then chose to add zones from
     * other views as well. The createZones() methods from those other views should
     * have the $layout parameter set to false.
     *
     * @param bool $layout
     *
     * @return array(ezcMvcViewHandler)
     */
    public function createZones( $layout )
    {
        $zones = array(  );

        if ( isset( $this->result->variables['fileRequest'] ) ) {
            $zones[] = new ezcMvcPhpViewHandler( 'content', join( DIRECTORY_SEPARATOR, array( 
                dirname( __FILE__ ),
                'templates',
                'madCoreDownloadController.download.php'
            ) ) );

            // short circuit to avoid regular template rendering in the case of 
            // a file download request
            return $zones;
        }

        $zones[] = new madCoreViewHandler( 'body', $this->getTemplate( $this->getTemplateName(  ) ) );
        
        if ( $layout ) {
            $zones[] = new madCoreViewHandler( 'site_base', APP_PATH . DIRECTORY_SEPARATOR . 'templates' . DIRECTORY_SEPARATOR . 'site_base.php' );
        }

        return $zones;
    }

    /**
     * Try to figure the template path for this request/result.
     * 
     * @return string template path
     */
    public function getTemplate( $templateName ) {
        $testPaths = array( 
            join( DIRECTORY_SEPARATOR, array( 
                APP_PATH,
                'templates',
                $this->routeInfo->route->application,
                $templateName,
            ) ),
            join( DIRECTORY_SEPARATOR, array( 
                // tmp hack until we have an appname=>path array
                APPS_PATH,
                $this->routeInfo->route->application,
                'templates',
                $templateName,
            ) ),
        );

        foreach( $testPaths as $path ) {
            if ( file_exists( $path ) ) {
                return $path;
            }
        }
    }

    /**
     * Figures the template to use.
     * 
     * @return void
     */
    public function getTemplateName(  ) {
        if ( isset( $this->request->variables['template'] ) ) {
            return $this->request->variables['template'];
        }

        $namespace = $this->getNamespace(  );
        if ( $namespace ) {
            return sprintf( '%s_%s.php',
                $namespace,
                $this->routeInfo->action
            );
        }

        trigger_error( "Can't figure a template name!" );
    }

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
    public function getNamespace(  ) {
        if ( isset( $this->request->variables['filter__namespace'] ) ) {
            return $this->request->variables['filter__namespace'];
        }

        if ( isset( $this->result->variables['object'] ) ) {
            return $this->result->variables['object']['namespace'];
        }
    }
}

?>
