({
    /**
     * actionName = the apex controller method to call (e.g. 'c.myMethod' )
     * params = JSON object specifying action parameters (e.g. { 'x' : 42 } )
     * successCallback = function to call when action completes (e.g. function( response ) { ... } )
     * failureCallback = function to call when action fails (e.g. function( response ) { ... } )
     */
	callAction : function( component, actionName, params, successCallback, failureCallback ) {
		
		var action = component.get( actionName );
        
        if ( params ) {
        	action.setParams( params );
        }
        
        action.setCallback( this, function( response ) {
            if ( component.isValid() && response.getState() === 'SUCCESS' ) {
                
                if ( successCallback ) {
					successCallback( response.getReturnValue() );
                }
                
            } else {
                
                console.error( 'Error calling action "' + actionName + '" with state: ' + response.getState() );
                
                if ( failureCallback ) {
                    failureCallback( response.getError(), response.getState() );
                } else {
                    this.logActionErrors( component, response.getError() );
                }
                
            }
        });
        
        $A.enqueueAction( action );
        
	},
    
    logActionErrors : function( component, errors ) {
	    if ( errors ) {
	    	for ( var index in errors ) {
	    		console.error( 'Error: ' + errors[index].message );
			}
		} else {
		    console.error( 'Unknown error' );
		}
	}

})