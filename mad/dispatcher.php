<?php

class madHttpDispatcher {
    public function monkeyFiles( $monkey ) {
        $files = new madObject(  );

        foreach( $monkey as $formName => $array ) {
            $files[$formName] = array(  );
        
            foreach( array_keys( $array['name'] ) as $fieldName ) {
                if ( is_array( $array['name'][$fieldName] ) ) {
                    $files[$formName][$fieldName] = array(  );

                    foreach( $array['name'][$fieldName] as $key => $value ) {
                        
                        if ( is_array( $array['name'][$fieldName][$key] ) ) {
                            $files[$formName][$fieldName][$key][$key] = array();

                            foreach( $array['name'][$fieldName][$key] as $subKey => $subValue ) {
                                $file = new ezcMvcRequestFile;
                                $file->mimeType = $array['type'][$fieldName][$key][$subKey];
                                $file->name = $array['name'][$fieldName][$key][$subKey];
                                $file->size = $array['size'][$fieldName][$key][$subKey];
                                $file->status = $array['error'][$fieldName][$key][$subKey];
                                $file->tmpPath = $array['tmp_name'][$fieldName][$key][$subKey];

                                if ( $file->status != UPLOAD_ERR_NO_FILE ) {
                                    $files[$formName][$fieldName][$key][$subKey] = $file;
                                }
                            }
                        } else {
                            $file = new ezcMvcRequestFile;
                            $file->mimeType = $array['type'][$fieldName][$key];
                            $file->name = $array['name'][$fieldName][$key];
                            $file->size = $array['size'][$fieldName][$key];
                            $file->status = $array['error'][$fieldName][$key];
                            $file->tmpPath = $array['tmp_name'][$fieldName][$key];

                            if ( $file->status != UPLOAD_ERR_NO_FILE ) {
                                $files[$formName][$fieldName][$key] = $file;
                            }
                        }
                    }
                } else {
                    $file = new ezcMvcRequestFile;
                    $file->mimeType = $array['type'][$fieldName];
                    $file->name = $array['name'][$fieldName];
                    $file->size = $array['size'][$fieldName];
                    $file->status = $array['error'][$fieldName];
                    $file->tmpPath = $array['tmp_name'][$fieldName];
                   
                    if ( $file->status != UPLOAD_ERR_NO_FILE ) {
                        $files[$formName][$fieldName] = $file;
                    }
                }
            }
        }

        return $files;
    }
    public function run(  ) {
        $framework = madFramework::instance();
        
        $framework->requestParser = new ezcMvcHttpRequestParser;        
        $framework->requestParser->prefix = $framework->urlPrefix;

        $framework->request = $framework->requestParser->createRequest();

        $continue = true;
        $continueCount = 1;
        while( $continue === true ) {
            $continue = false;

            $framework->request->uri = substr( $framework->request->uri, -1 ) == '/' ? substr( $framework->request->uri, 0, -1 ) : $framework->request->uri;

            $framework->request->variables['prefixedUrl'] = $framework->urlPrefix . $framework->request->uri;

            $framework->request->variables['isAjaxRequest'] = isset( $framework->request->raw['HTTP_X_REQUESTED_WITH'] ) &&
                $framework->request->raw['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';

            $framework->request->files = $this->monkeyFiles( $_FILES );

            $framework->sendSignal( 'postParseRequest', array( $framework->request ) );

            $framework->router = new madRouter( $framework->request, $framework->configuration['routes'] );

            $framework->sendSignal( 'postCreateRouter', array( $framework->request, $framework->router ) );

            try {
                $framework->routingInformation = $framework->router->getRoutingInformation();
            } catch ( ezcMvcRouteNotFoundException $e ) {
                $framework->routingInformation = new madRoutingInformation( 'mad.404', 'madController', '404', $framework->router );
                $framework->routingInformation->routeName = 'mad.404';
                $framework->routingInformation->route = $framework->configuration['routes']['mad.404'];
            }

            // get route routeConfiguration
            $framework->routeConfiguration = $framework->configuration['routes'][$framework->routingInformation->routeName];
            $framework->routeConfiguration['action'] = (string) $framework->routeConfiguration['action'];

            $framework->controller = $this->createRouteController( $framework );
            $framework->result = $framework->controller->createResult();

            $framework->sendSignal( 'postCreateResult', array( $framework->request, $framework->result ) );

            if ( $continueCount > 4 ) {
                trigger_error('Too many loops!', E_USER_ERROR);
            }

            if ( $framework->result instanceof ezcMvcInternalRedirect )
            {
                $request = $framework->result->request;
                $continue = true;
                $continueCount++;
                continue;
            }

            if ( $framework->result->status !== 0 ) {
                $framework->response = new ezcMvcResponse;
                $framework->response->status = $framework->result->status;
            } 

            if ( ! $framework->result->status instanceof ezcMvcExternalRedirect ) {
                $framework->response = $this->createResponse( $framework );
            }

            $framework->responseWriter = new ezcMvcHttpResponseWriter( $framework->response );
            $framework->responseWriter->handleResponse();
        }
    }

    public function createRouteController( $framework ) {
        $class = $framework->routeConfiguration['controller'];
        $framework->action = $framework->routeConfiguration['action'];
        $controller = new $class( $framework );
        
        foreach( $framework->configuration->getSetting( 'applications', 'mad', 'controllers', array(  ) ) as $name => $class ) {
            $controller->compose( $name, new $class( $framework ) );
        }

        return $controller;
    }

    public function createResponse( $framework ) {
        if ( !empty( $framework->result->variables['responseBody'] ) ) {
            $final = $framework->result->variables['responseBody'];
        } 
        
        if ( !empty( $framework->result->variables['serveFile'] ) ) {
            $final = file_get_contents( $framework->result->variables['serveFile'] );
        }

        if ( !isset( $final ) ) {
            $framework->view = new madViewHandler( 'main', ENTRY_APP_PATH . '/cache/templates/' . 'site_base.php' );

            $framework->view->send( 'request', $framework->request );
            $framework->view->send( 'framework', $framework );

            foreach( $framework->result->variables as $key => $value ) {
                $framework->view->send( $key, $value );
            }

            if ( !empty( $framework->result->variables['template'] ) ) {
                $template = ENTRY_APP_PATH . '/cache/templates/' . $framework->result->variables['template'];

                if ( !file_exists( $template ) ) {
                    trigger_error( "Result variable template $template does not exists", E_USER_ERROR );
                }
            } else {
                $template = ENTRY_APP_PATH . '/cache/templates/' . $framework->routeConfiguration['template'];
            }

            if ( !empty( $framework->result->variables['form'] ) ) {
                if ( !file_exists($template) ) {
                    $template = ENTRY_APP_PATH . '/cache/templates/forms/' . $framework->result->variables['form']->formName . '.php';
                }
                $framework->view->send( 'metaTitle', $framework->view->hut( $framework->routeConfiguration['name'], $framework->result->variables['form']->data ) );
            }

            if ( !empty( $framework->result->variables['object'] ) ) {
                $framework->view->send( 'metaTitle', $framework->view->hut( $framework->routeConfiguration['name'], $framework->result->variables['object'] ) );
            }

            if ( !file_exists($template) ) {
                $template = ENTRY_APP_PATH . '/cache/templates/' . $framework->routeConfiguration['META']['application']. '.'. $framework->routeConfiguration['action'] . '.php';
            }
            if ( !file_exists($template) ) {
                $template = ENTRY_APP_PATH . '/cache/templates/' . $framework->routeConfiguration['action'] . '.php';
            }

            if ( empty( $framework->view->metaTitle ) || stripos( $framework->view->metaTitle, 'meta.title' ) !== false ) {
                $framework->view->send( 'metaTitle', $framework->view->hut( $framework->routeConfiguration['name'] ) );
            }

            $framework->view->processZone( 'body', $template );
            $framework->view->process(true);
            $final = $framework->view->getResult();
        }

        $response = new ezcMvcResponse(
            $framework->result->status,
            $framework->result->date,
            'madFramework by MadeleineMarket.com. Code less, eat more.',
            $framework->result->cache,
            $framework->result->cookies,
            $framework->result->content,
            $final
        );

        return $response;
    }
}
