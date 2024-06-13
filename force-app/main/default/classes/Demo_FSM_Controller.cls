@RestResource(urlMapping = '/Service_Report_REST_demo/*')
global with sharing class Demo_FSM_Controller {
    public Demo_FSM_Controller() {

    }

    public static void workWithHO(){
        String salesforceHost = System.Url.getOrgDomainUrl().toExternalForm();
        System.debug('SFhost: ' + salesforceHost);
        String sess = UserInfo.getSessionId();
        //System.debug('session: ' + sess);
        List<OperatingHours> opHourList = [SELECT Id From OperatingHours];
        System.debug('OHs: ' + opHourList);
    }

    @HttpGet
    global static String makeCallout(){

        ServiceReport sr = new ServiceReport();
        String salesforceHost = System.Url.getOrgDomainUrl().toExternalForm();
        String url = salesforceHost + '/services/data/v41.0/actions/standard/createServiceReport';
        // Create HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
        // Set the body as a JSON object
        request.setBody('{"inputs" : [ {"entityId" : "0WOJ8000000Gom2OAC","signatures" : [{"data":"Base64 code for the captured signature image","contentType":"image/png","name":"Customer Signature","signatureType":"Default","place":"San Francisco","signedBy":"John Doe","signedDate":"2019-06-05 12:00:00"}],"templateId" : "0SLJ80000004C9DOAU"} ]}');
        Http http = new Http();
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 200) {
            System.debug('The status code returned was not expected: ' +
                        response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug('the new response' + response.getBody());
            sr = [SELECT Id FROM ServiceReport WHERE CreatedDate = TODAY LIMIT 1];
            //(ServiceReport) JSON.Deserialize(response.getBody(), ServiceReport.class);
            System.debug('report details: ' + sr);
        }

        return 'The report was created successfully' + '    Report ID: ' + sr.id;
    }
    
}