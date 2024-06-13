global class ChekTextClass {
    @InvocableMethod(label='Check if no valid Tickets' description='Method description')
    global static List<Boolean> retrieveTickets(List<String> receivedList){
        List<Boolean> lb = new List<Boolean>();
        Boolean b = false;
        
        String str = receivedList.get(0);
        system.debug(str);
        if(String.isBlank(str)){
            b = true;
        }
        lb.add(b);
        system.debug(lb);
        return lb;
    }
}