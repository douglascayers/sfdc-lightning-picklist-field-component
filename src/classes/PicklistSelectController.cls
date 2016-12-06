public with sharing class PicklistSelectController {

    /**
     * Given an API object and field name, returns the configured field label to display to users.
     */    
    @AuraEnabled
    public static String getFieldLabel( String objectName, String fieldName ) {
        
        System.debug( 'Getting field label: objectName=' + objectName + ', fieldName=' + fieldName );
        
        String label = Schema.getGlobalDescribe().get( objectName ).getDescribe().fields.getMap().get( fieldName ).getDescribe().getLabel();
        
        System.debug( 'label= ' + label );
        
        return label;
    }
    
    /**
     * Given an API object and field name, returns list of the picklist values for use in select input.
     */
    @AuraEnabled
    public static List<PicklistOption> getPicklistOptions( String objectName, String fieldName ) {
        
        System.debug( 'Getting picklist options: objectName=' + objectName + ', fieldName=' + fieldName );
        
        List<PicklistOption> options = new List<PicklistOption>();
        
        for ( PicklistEntry entry : Schema.getGlobalDescribe().get( objectName ).getDescribe().fields.getMap().get( fieldName ).getDescribe().getPicklistValues() ) {
            options.add( new PicklistOption( entry.getLabel(), entry.getValue() ) );
        }
        
        System.debug( 'options=' + options );
        
        return options;
    }
    
    /**
     * The system class PicklistEntry is not aura enabled so cannot be returned from @AuraEnabled method.
     * Workaround is to define our own class with aura enabled properties.
     */
    public class PicklistOption {
        
        @AuraEnabled
        public String label { get; set; }
        
        @AuraEnabled
        public String value { get; set; }
        
        public PicklistOption( String label, String value ) {
            this.label = label;
            this.value = value;
        }
        
    }
    
}
