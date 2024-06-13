/**
 * Created by rober on 2023. 02. 20..
 */

public with sharing class PracticeLWC {
    @AuraEnabled(cacheable = true)
    public static list<Account> getAccounts(String strAccountName) {
        String strKey = '%'+strAccountName+'%';
        List<Account> accList = [SELECT Id,Name,AccountNumber FROM Account WHERE name like :strKey ];
        return accList;
    }


    @AuraEnabled(cacheable = true)
    public static List<Account> getMoreAccounts(String recordId) {
        return [SELECT Name, Industry, Rating, Website FROM Account WHERE Id = :recordId];
    }
}