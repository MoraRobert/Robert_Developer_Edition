public class Trailhead  {

	public void doStuf(){


		List<Contact> contactsList = [SELECT Email /*Account.Email__c*/ FROM Contact WHERE Title = 'VP'];

		for(Contact contact : contactsList){
			//contact.Email = contactsList.Account.Email__c;
		}

		update contactsList;
		String myString = 'whatever';
		//ListEmail<ListEmail<SObject>> leadsAndContactsList = [FIND {myString} IN ALL FIELDS RETURNING Lead(Id, Name), Contact(Id, Name)];

		List<List<SObject>> results = new List<List<SObject>>();
		results = [FIND 'United*' IN ALL /*NAME*/ FIELDS RETURNING Account (Id, Phone WHERE Type = 'Customer' LIMIT 10),
																		Contact(Id, Name ORDER BY Name)];
		List<Account> accounts = results[0];

	//--------------------------------------------------------------------------------

		Schema.sObjectType opp = Opportunity.sObjectType;
		System.debug('opp: ' + opp);

		Contact c = new Contact();
		Schema.SObjectType con = c.getSObjectType();
		System.debug('con: ' + con);

		Schema.SObjectField oppDesc = Opportunity.Description;
		System.debug('oppField: ' + oppDesc);

		Schema.DescribeFieldResult fieldResult = Contact.Description.getDescribe();
		Schema.SObjectField field = fieldResult.getSobjectField();
		System.debug('conField: ' + field);

		String[] objectTypes = new String[]{'Account', 'Contact', 'Opportunity'};
		Schema.DescribeSObjectResult[] objectResults = Schema.describeSObjects(objectTypes);
		System.debug(objectResults);

		Schema.DescribeSObjectResult con1 = Contact.sObjectType.getDescribe();
		System.debug('progCont: ' + con1);

		Schema.DescribeSObjectResult opp1 = Schema.SObjectType.Opportunity;
		System.debug('progOppty: ' + opp1);

		Map <String, Schema.SObjectType> allObjects = Schema.getGlobalDescribe();
		System.debug('progAll: ' + allObjects);

		Schema.DescribeSObjectResult[] results1 = Schema.describeSObjects(new String[]{'Account'});
		for (Schema.DescribeSObjectResult result : results1){
			System.debug(result.getLabel());
			System.debug(result.fields.getMap().size());
			System.debug(result.isCustom() ? 'No' : 'Yes');
		}

		if (Schema.SObjectType.contact.fields.Email.isAccessible()){
			System.debug('may send');
		}

		if (Schema.SObjectType.contact.isDeletable()){
			System.debug('del');
		}
	

		List<SObject> records = new List<SObject>();
		for(sObject record : records){
		
			switch on record {
				when Account a {
					a.Type = 'External';
				}
				when Contact cnt {
					c.Department = 'Temporary';
				}
				when Lead l {			
					l.Description = 'Auto';
				}
			}
		}

		if (!records.isEmpty()){
			update records;
		}
	}
}