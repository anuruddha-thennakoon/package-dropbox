import ballerina/http;

documentation {
    F{{message}} A custom message about the error
    F{{cause}} Error object reffered to the occurred error
}

public type DropboxError record {
    string message;
    error? cause;
};