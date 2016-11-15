({
	doInit : function(component, event, helper) {

        helper.callAction( component, 'c.getFieldLabel', {
            	'objectName' : component.get('v.objectName'),
            	'fieldName'  : component.get('v.fieldName')
        	}, function( data ) {
            component.set('v.label', data);
        });

        helper.callAction( component, 'c.getPicklistOptions', {
            	'objectName' : component.get('v.objectName'),
            	'fieldName'  : component.get('v.fieldName')
        	}, function( data ) {
            component.set('v.options', data);
        });

	}
    
})