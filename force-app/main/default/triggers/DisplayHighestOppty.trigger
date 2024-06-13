trigger DisplayHighestOppty on Opportunity (before insert, before update, before delete, after insert, after update, after delete, after undelete)  {
	
	Opportunity oppty = [SELECT Id, Amount FROM Opportunity ORDER BY Amount DESC LIMIT 1];
	List<Opportunity> oList = new List<Opportunity>();
	switch on Trigger.operationType {
		when BEFORE_INSERT, BEFORE_UPDATE{
			for(Opportunity o : Trigger.new){
				o.Highest_Oppty__c = oppty.Amount;
				//oList.add(o);
			}
			//OpportunityHandler.incoming(oList);
		}
	}
	/*
	if(Trigger.operationType == 'BEFORE_INSERT'){
		
	}*/

 }