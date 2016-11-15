@isTest
private class PicklistSelectControllerTest {

    @isTest
    static void test_get_field_label() {
        
        Test.startTest();
        
        String fieldLabel = PicklistSelectController.getFieldLabel( 'Account', 'Type' );
        
        Test.stopTest();
        
        System.assertEquals( Account.Type.getDescribe().getLabel(), fieldLabel );
        
    }
    
    @isTest
    static void test_get_picklist_values() {
        
        Test.startTest();
        
        List<PicklistSelectController.PicklistOption> options = PicklistSelectController.getPicklistOptions( 'Account', 'Type' );
        
        Test.stopTest();
        
        List<PicklistEntry> values = Account.Type.getDescribe().getPicklistValues();
        
        for ( Integer i = 0; i < options.size(); i++ ) {
            System.assertEquals( values[i].getLabel(), options[i].label );
            System.assertEquals( values[i].getValue(), options[i].value );
        }
        
    }
    
}