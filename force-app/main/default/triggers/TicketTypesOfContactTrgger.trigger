trigger TicketTypesOfContactTrgger on Ticket__c (after insert) {    
        
    List<Id> listIds = new List<Id>();    
    
    for(Ticket__c tck : Trigger.new){
        listIds.add(tck.Contact__c);
    }
    
    Map<Id, Contact> parentConts = new Map<Id, Contact>
        ([SELECT Id, Ticket_Types__c, (SELECT Id, Type__c FROM Tickets__r) 
          FROM Contact WHERE Id IN : listIds]);
        
    for (Ticket__c tck : Trigger.new){
        Contact theCont = parentConts.get(tck.Contact__c);
        
        if (theCont.Ticket_types__c == null){            
            theCont.Ticket_Types__c = '<ul><li>' + tck.Type__c + ' </li></ul>';
        }else if (!theCont.Ticket_Types__c.contains(tck.Type__c)){            
            theCont.Ticket_Types__c = theCont.Ticket_Types__c + '<li> ' + tck.Type__c + '</li></ul>';            
        }
    }    
    
    update parentConts.values();
}