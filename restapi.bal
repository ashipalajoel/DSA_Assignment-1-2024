import ballerina/http;

service /rest/api on new http:Listener(9090) {
    resource function get .() returns error? {
    }
}
