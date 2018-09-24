import ballerina/http;

documentation {
    Check for HTTP response and if response is success parse HTTP response object into json and parse error otherwise.

    P{{response}} Http response or HTTP connector error with network related errors
    R{{}} Json payload or `DropboxError` if anything wrong happen when HTTP client invocation or parsing response to json
}
function parseResponseToJson(http:Response|error response) returns (json|DropboxError) {
    json result = {};
    match response {
        http:Response httpResponse => {
            var jsonPayload = httpResponse.getJsonPayload();
            match jsonPayload {
                json payload => {
                    if (httpResponse.statusCode != http:OK_200 && httpResponse.statusCode != http:CREATED_201) {
                        DropboxError dropboxError = { message: httpResponse.statusCode + WHITE_SPACE
                            + httpResponse.reasonPhrase + DASH_WITH_WHITE_SPACES_SYMBOL + payload.toString() };
                        return dropboxError;
                    }
                    return payload;
                }
                error err => {
                    DropboxError dropboxError = { message: "Error occurred when parsing response to json." };
                    dropboxError.cause = err.cause;
                    return dropboxError;
                }
            }
        }
        error err => {
            DropboxError dropboxError = { message: err.message };
            dropboxError.cause = err.cause;
            return dropboxError;
        }
    }
}

documentation {
    Return the untainted value for the given string if it is valid.

    P{{input}} Input string to be validated
    R{{}} Untainted string or `error` if it is not valid
}
function getUntaintedStringIfValid(string input) returns @untainted string {
    boolean isValid = check input.matches(REGEX_STRING);
    if (isValid) {
        return input;
    } else {
        error err = { message: "Validation error: Input '" + input + "' should be valid." };
        throw err;
    }
}
