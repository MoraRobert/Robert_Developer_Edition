@RestResource(urlMapping = '/_/*')
global class Demo_DEKRA_REST {
    public Demo_DEKRA_REST() {

    }

    global static String generateWorkOrders(){

        makeCallout();
        return '*';
    }

    @future (callout= true)
    public static void makeCallout(){

        String salesforceHost = System.Url.getOrgDomainUrl().toExternalForm();
        String url = salesforceHost + '/services/data/v45.0/actions/standard/generateWorkOrders';
        // Create HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        // Set the body as a JSON object
        request.setBody('{"inputs" : [{"recordId" : "1MPJ8000000GmctOAC"}]}');
        Http http = new Http();
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
}