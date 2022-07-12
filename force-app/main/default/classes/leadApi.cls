@RestResource(urlMapping = '/Evento/Leads/*')

global with sharing class leadApi {

    @HttpGet
    global static void getLeads() {

        RestResponse resultRest = RestContext.response;

        List<Lead> leadsList = [SELECT Id, Name, Email, Phone FROM Lead];

        resultRest.responseBody = Blob.valueOf(JSON.serializePretty(leadsList));

        resultRest.statusCode = 200;
    }

}
