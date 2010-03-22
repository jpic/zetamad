<?php

class madModelController extends ezcMvcController {
    public $registry = null;
    
    public function __construct( $action, ezcMvcRequest $request ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
    }

    public function doList() {
        $filter = new madBase();
        foreach( $this->request->variables as $key => $value ) {
            if ( strpos( $key, 'filter__' ) === 0 ) {
                $name = substr(
                    $key,
                    strlen( 'filter__' )
                );
                $filter[$name] = $value;
            }
        }

        $objectList = $this->registry->model->load( $filter );

        $result = new ezcMvcResult(  );
        $result->variables['objectList'] = $objectList;
        $result->variables['filter']     = $filter;
        return $result;
    }

    public function doForm(  ) {
        $result = new ezcMvcResult(  );

        $object = new madBase();
        if ( isset( $this->id ) ) {
            $object['id'] = $this->id;
            $this->registry->model->refresh( $object );
        }

        if ( !isset( $object['namespace'] ) ) {
            $object['namespace'] = 'recipe';
        }

        $result->variables['object'] = $object;

        if ( $this->request->protocol == 'http-post' ) {
            $object['title'] = $_POST['title'];
            $this->registry->model->save( $object );
        }

        return $result;
    }

    public function doDetails(  ) {
        $object = new madBase( array( 
            'id' => $this->id,
        ) );

        $this->registry->model->refresh( $object );

        $result = new ezcMvcResult(  );
        $result->variables['object'] = $object;
        return $result;
    }
}

?>
