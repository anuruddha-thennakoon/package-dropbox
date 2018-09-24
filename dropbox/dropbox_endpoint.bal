import ballerina/http;

documentation {
    Object for Dropbox endpoint.

    F{{dropboxConnector}} Reference to DropboxConnector type
}
public type Client object {

    public DropboxConnector dropboxConnector = new;

    documentation {
        Initialize Dropbox endpoint.

        P{{dropboxConfig}} Dropbox configuraion
    }
    public function init(DropboxConfiguration dropboxConfig);

    documentation {
        Initialize Dropbox endpoint.

        R{{}} The Dropbox connector object
    }
    public function getCallerActions() returns DropboxConnector;

};

documentation {
    F{{accessToken}} Access token of the account
    F{{clientConfig}} The http client endpoint
}
public type DropboxConfiguration record {
    string accessToken;
    http:ClientEndpointConfig clientConfig;
};

function Client::init(DropboxConfiguration dropboxConfig) {
    http:AuthConfig? auth = dropboxConfig.clientConfig.auth;
    dropboxConfig.clientConfig.url = DROPBOX_API_URL;
    self.dropboxConnector.client.init(dropboxConfig.clientConfig);
}

function Client::getCallerActions() returns DropboxConnector {
    return self.dropboxConnector;
}
