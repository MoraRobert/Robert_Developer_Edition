global class CheckValidity {

    @InvocableMethod(label='Retrieve Appropriate Ticket Types' description='Method description')
    global static List<OutputVars> retrieveTickets(List<InputVars> receivedList){
        
        List<OutputVars> results = new List<OutputVars>();        

        	InputVars inv = new InputVars();
        	inv = receivedList.get(0);			
        	
            List<String> loids = new List<Id>(inv.listOfInputIds);        
        	List<String> utilList = loids.get(0).split(',');
        
            Boolean b = inv.inputBool;
                    
            Map<Id, String> utilityMap = new Map<Id, String>();
            Set<Id> utilSet = new Set<Id>();                            	        	

        	for(Id inid : utilList){
                utilSet.add(inid);
            }
            
            utilityMap = getTicketTypes(utilSet, b);                        
            
            List<String> finalList = new List<String>();
            
            for(Id keys : utilityMap.keySet()){
                for(Id key : utilityMap.keySet()){
                    finalList.add(utilityMap.get(key));
                }
                
                OutputVars outv = new OutputVars(finalList, keys);
                results.add(outv);
            }        
        return results;
    }
    
    public static Map<Id, String> getTicketTypes(Set<Id> contactIds, Boolean checkValidity){
        
        Map<Id, String> mapToReturn = new Map<Id, String>(); 
        Map<Id, Contact> utilMap = new Map<Id, Contact>
            ([SELECT Id, Ticket_Types__c, (SELECT Id, Type__c, Contact__c FROM Tickets__r) 
              FROM Contact WHERE Id IN : contactIds]);
                
        List<Ticket__c> checkTickets = new List<Ticket__c>();
        
        if(checkValidity){
            checkTickets = [SELECT Name, Id, Contact__c, Type__c FROM Ticket__c 
                            WHERE Is_Valid__c = true];
        } else{
            checkTickets = [SELECT Name, Id, Contact__c, Type__c FROM Ticket__c];   
        }
        
        String str = '<ul>';
        for(Id currentId : contactIds){
            for(Ticket__c tck : checkTickets){
                if(tck.Contact__c == currentId){
                    Contact currentCont = utilMap.get(currentId);
                    str += '<li>' + tck.Type__c + ' </li>';                    
                    mapToReturn.put(currentId, str+'</ul>');
                }
            }
        }        
        
        System.debug('Map to return keys:' + mapToReturn.keySet());
		System.debug('Map to return values: ' + mapToReturn.values());
        
        return mapToReturn;
    }
    
    global class InputVars{        
		
		global inputVars(){}        
        
        @InvocableVariable
        global List<Id> listOfInputIds;
        
        @InvocableVariable
        global Boolean inputBool;

		@InvocableVariable
        global Id inputId;
        
    }
    
    global class OutputVars{
        
        @InvocableVariable
        global List<String> outputStringList;            
                
        @InvocableVariable
        global String outputId;
        
        public OutputVars(List<String> ls, String myid) {
             this.outputStringList = ls;
             this.outputId = myId;
        }        
    }    
}