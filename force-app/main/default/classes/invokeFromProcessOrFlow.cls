global class invokeFromProcessOrFlow{

    @invocableMethod
    global static List<Integer> invokeMe(List<String> str){
        List<Integer> listO = new List<Integer>();
        listO.add(1);
        return listO;
    }
}