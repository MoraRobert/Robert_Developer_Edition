global with sharing class MySOAPWebService {
    webservice static String getRecord(String str) { 
        /*IntegrationLog__c log = [SELECT Id, Name, SourceObjectID__c 
                                        FROM IntegrationLog__c 
                                        WHERE ErrorCode__c =: str LIMIT 1];
                                        */
        return str; 
    }
}

/*
global with sharing class soapServiceClass{
    //Based on this parameter, it returns the account information
    webService static String getAccountRecord(string accid){
                /*Account acc = [select id, name, type, AccountNumber,  Rating, AnnualRevenue  from account 
                                   where id=:accid];
                return accid;
    }
}
*/