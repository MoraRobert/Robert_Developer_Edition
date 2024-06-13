global with sharing class soapServiceClass{
    //Based on this parameter, it returns the account information
    webService static String getAccountRecord(string accid){
                /*Account acc = [select id, name, type, AccountNumber,  Rating, AnnualRevenue  from account 
                                   where id=:accid];*/
                return accid;
    }
}