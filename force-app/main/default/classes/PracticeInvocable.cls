global class PracticeInvocable {
    
    @InvocableMethod(label='The One To Practice With')
    global static List<Ticket__c> checkTicketsW(List<Contact> cons){
        List<Ticket__c> lt = new List<Ticket__c>();
        return lt;
    }
    
    public static Map<Id, String> getTicketTypes(Set<Id> contactIds, Boolean checkValidity){
        
        Map<Id, String> mapToReturn = new Map<Id, String>(); 
		return mapToReturn;
    }

	global class ConvertLeadActionRequest {
        @InvocableVariable(required=true)
        global ID leadId;
    
        @InvocableVariable(required=true)
        global String convertedStatus;
    
        @InvocableVariable
        global ID accountId;
    
        @InvocableVariable
        global ID contactId;
    
        @InvocableVariable
        global Boolean overWriteLeadSource;
    }    
}