public with sharing class ACT {
    @AuraEnabled
    public static list<Contact> getRelatedList(Id recordId)
    {
        Map<String, Integer> mapToReturn = new Map<String, Integer>();
        List<Contact> Conlist = [Select id, name,(SELECT id FROM Tickets__r) from Contact where AccountId=: recordId ];
        for(Contact cnt : Conlist){
            if(cnt.Tickets__r.size() != 0){
            	mapToReturn.put(cnt.Name, cnt.Tickets__r.size());
            }
        }
        system.debug(Conlist.get(0));
        system.debug(mapToReturn.get(Conlist.get(0).Name));
        return Conlist;
    }

}