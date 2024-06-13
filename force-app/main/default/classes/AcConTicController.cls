public with sharing class AcConTicController {
    @AuraEnabled
    public static list<Contact> getRelatedList(Id recordId){
		Map<String, Integer> mapToReturn = new Map<String, Integer>();
        
        List<Contact> Conlist = [SELECT id, name,(SELECT id FROM Tickets__r) FROM Contact 
                                 WHERE AccountId=: recordId ];
        
        List<Contact> listToReturn = new List<Contact>();
        
        for(Contact cnt : Conlist){
            Integer tickNr = [SELECT COUNT() FROM Ticket__c WHERE Contact__c =: cnt.Id];
            if(cnt.Tickets__r.size() > 0){                
            	
                cnt.Number_Of_Tickets__c = cnt.Tickets__r.size();
                Database.update(cnt);
                listToReturn.add(cnt);
            }
        }
        //system.debug(Conlist.get(0));
        //system.debug(mapToReturn.get(Conlist.get(0).Name));
        return listToReturn;
    }  

    @AuraEnabled
    public static List<Account> getInitialList(String nameUserWants){
        try {
            List<Account> initialList = new List<Account>();
            initialList = [SELECT Id FROM Account WHERE Name =: nameUserWants];
            return initialList;        
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }        
    }
}