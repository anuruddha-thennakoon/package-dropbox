# Dropbox Connector

The Dropbox connector allows you to do operations like list, get, insert, update, delete tasks through the Dropbox REST API. It handles OAuth 2.0 authentication.

## Compatibility

| Ballerina Language Version  | Dropbox API Version |
|:---------------------------:|:-------------------:|
| 0.981.0                     | v1                  |

## Getting started

> Refer the [Getting Started](https://ballerina.io/learn/getting-started/) guide to download and install Ballerina.

Import the `anuruddhat/dropbox` package into the Ballerina project.
```ballerina
import anuruddhat/dropbox;
```
Instantiate the connector by giving authentication details in the HTTP client config, which has built-in support for
BasicAuth and OAuth 2.0. Dropbox uses OAuth 2.0 to authenticate and authorize requests. The Dropbox connector can be
minimally instantiated in the HTTP client config using the access token or using the client ID, client secret.

**Obtaining Tokens to Run the Sample**

1. Visit [Dropbox Developer Console](https://www.dropbox.com/developers/apps), click **Create app**, and follow the wizard to create a new app.
2. Go to created app.
3. Click the **Generate** to generate access token and obtain access token.

You can now enter the credentials in the HTTP client config.
```ballerina
endpoint dropbox:Client dropboxClient {
    clientConfig: {
        auth: {
            accessToken: ""
        }
    }
};
```

The `listFiles` function returns the information about the task lists.
```ballerina
    var details = dropboxClient->listFiles();
    match details {
        json response => io:println(response);
        dropbox:DropboxError dropboxError => test:assertFail(msg = dropboxError.message);
    }
```