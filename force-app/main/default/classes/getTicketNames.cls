public class getTicketNames {
    
    @InvocableMethod(label='Retrieve Appropriate Ticket Names' description='Method description')
    public static List<String> retrieveTicketsNames(List<Id> receivedList){
    
        List<String> listStr = new List<String>();
        
        Id myId = receivedList.get(0);
        
        //List<String> listStr = new List<String>([SELECT Name FROM Ticket__c WHERE Contact__c = receivedList(0)]);
        
        return listStr;        
    }
}