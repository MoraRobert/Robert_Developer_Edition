public class AccountHandler  {
	
	public static void beforeInsert(List<Account> triggerNew){
		
	List<Ticket__c> listT = [SELECT ID FROM Ticket__c WHERE Price__c = 102];
		
		for(Ticket__c tck : listT){			

			tck.Price__c = 103;							
		}

		update listT;
	}
}