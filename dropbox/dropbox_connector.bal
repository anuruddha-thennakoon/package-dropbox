import ballerina/http;
import ballerina/mime;

documentation {
    Object to initialize the connection with Dropbox.

    F{{accessToken}} Access token of the account
    F{{client}} Http client endpoint for api
}
public type DropboxConnector object {

    public string accessToken;
    public http:Client client;

    documentation {
        Returns all the authenticated user's file lists.

        R{{}} If success, returns json with of file list, else returns `DropboxError` object
    }
    public function listFiles() returns (json|DropboxError);

};

function DropboxConnector::listFiles() returns (json|DropboxError) {
    endpoint http:Client httpClient = self.client;
    string requestPath = FILES_LIST;
    var response = httpClient->get(requestPath);
    json jsonResponse = check parseResponseToJson(response);
    return jsonResponse;
}