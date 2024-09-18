import ballerina/grpc;
import ballerina/protobuf;

public const string SHOPPINGC_DESC = "0A0F53686F7070696E67432E70726F746F120F6F6E6C696E652E73686F7070696E6722A5010A0750726F6475637412120A046E616D6518012001280952046E616D6512200A0B6465736372697074696F6E180220012809520B6465736372697074696F6E12140A0570726963651803200128015205707269636512240A0D73746F636B5175616E74697479180420012805520D73746F636B5175616E7469747912100A03736B751805200128095203736B7512160A067374617475731806200128095206737461747573221F0A0B50726F64756374436F646512100A03736B751801200128095203736B7522560A045573657212160A067573657249641801200128095206757365724964121A0A08757365726E616D651802200128095208757365726E616D65121A0A08757365725479706518032001280952087573657254797065222F0A134372656174655573657273526573706F6E736512180A076D65737361676518012001280952076D657373616765225C0A1455706461746550726F647563745265717565737412100A03736B751801200128095203736B7512320A0770726F6475637418022001280B32182E6F6E6C696E652E73686F7070696E672E50726F64756374520770726F6475637422430A0B50726F647563744C69737412340A0870726F647563747318012003280B32182E6F6E6C696E652E73686F7070696E672E50726F64756374520870726F6475637473223C0A10416464546F436172745265717565737412160A06757365724964180120012809520675736572496412100A03736B751802200128095203736B7522200A0655736572496412160A06757365724964180120012809520675736572496422290A0D4F72646572526573706F6E736512180A076D65737361676518012001280952076D65737361676522070A05456D70747932E9040A0F53686F7070696E675365727669636512440A0A41646450726F6475637412182E6F6E6C696E652E73686F7070696E672E50726F647563741A1C2E6F6E6C696E652E73686F7070696E672E50726F64756374436F6465124C0A0B437265617465557365727312152E6F6E6C696E652E73686F7070696E672E557365721A242E6F6E6C696E652E73686F7070696E672E4372656174655573657273526573706F6E73652801124E0A0D55706461746550726F6475637412252E6F6E6C696E652E73686F7070696E672E55706461746550726F64756374526571756573741A162E6F6E6C696E652E73686F7070696E672E456D707479124B0A0D52656D6F766550726F64756374121C2E6F6E6C696E652E73686F7070696E672E50726F64756374436F64651A1C2E6F6E6C696E652E73686F7070696E672E50726F647563744C697374124D0A154C697374417661696C61626C6550726F647563747312162E6F6E6C696E652E73686F7070696E672E456D7074791A1C2E6F6E6C696E652E73686F7070696E672E50726F647563744C69737412470A0D53656172636850726F64756374121C2E6F6E6C696E652E73686F7070696E672E50726F64756374436F64651A182E6F6E6C696E652E73686F7070696E672E50726F6475637412460A09416464546F4361727412212E6F6E6C696E652E73686F7070696E672E416464546F43617274526571756573741A162E6F6E6C696E652E73686F7070696E672E456D70747912450A0A506C6163654F7264657212172E6F6E6C696E652E73686F7070696E672E5573657249641A1E2E6F6E6C696E652E73686F7070696E672E4F72646572526573706F6E7365620670726F746F33";

public isolated client class ShoppingServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, SHOPPINGC_DESC);
    }

    isolated remote function AddProduct(Product|ContextProduct req) returns ProductCode|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductCode>result;
    }

    isolated remote function AddProductContext(Product|ContextProduct req) returns ContextProductCode|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/AddProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductCode>result, headers: respHeaders};
    }

    isolated remote function UpdateProduct(UpdateProductRequest|ContextUpdateProductRequest req) returns Empty|grpc:Error {
        map<string|string[]> headers = {};
        UpdateProductRequest message;
        if req is ContextUpdateProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Empty>result;
    }

    isolated remote function UpdateProductContext(UpdateProductRequest|ContextUpdateProductRequest req) returns ContextEmpty|grpc:Error {
        map<string|string[]> headers = {};
        UpdateProductRequest message;
        if req is ContextUpdateProductRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/UpdateProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Empty>result, headers: respHeaders};
    }

    isolated remote function RemoveProduct(ProductCode|ContextProductCode req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductCode message;
        if req is ContextProductCode {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function RemoveProductContext(ProductCode|ContextProductCode req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        ProductCode message;
        if req is ContextProductCode {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/RemoveProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function ListAvailableProducts(Empty|ContextEmpty req) returns ProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ProductList>result;
    }

    isolated remote function ListAvailableProductsContext(Empty|ContextEmpty req) returns ContextProductList|grpc:Error {
        map<string|string[]> headers = {};
        Empty message;
        if req is ContextEmpty {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/ListAvailableProducts", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ProductList>result, headers: respHeaders};
    }

    isolated remote function SearchProduct(ProductCode|ContextProductCode req) returns Product|grpc:Error {
        map<string|string[]> headers = {};
        ProductCode message;
        if req is ContextProductCode {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Product>result;
    }

    isolated remote function SearchProductContext(ProductCode|ContextProductCode req) returns ContextProduct|grpc:Error {
        map<string|string[]> headers = {};
        ProductCode message;
        if req is ContextProductCode {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/SearchProduct", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Product>result, headers: respHeaders};
    }

    isolated remote function AddToCart(AddToCartRequest|ContextAddToCartRequest req) returns Empty|grpc:Error {
        map<string|string[]> headers = {};
        AddToCartRequest message;
        if req is ContextAddToCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Empty>result;
    }

    isolated remote function AddToCartContext(AddToCartRequest|ContextAddToCartRequest req) returns ContextEmpty|grpc:Error {
        map<string|string[]> headers = {};
        AddToCartRequest message;
        if req is ContextAddToCartRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/AddToCart", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Empty>result, headers: respHeaders};
    }

    isolated remote function PlaceOrder(UserId|ContextUserId req) returns OrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UserId message;
        if req is ContextUserId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <OrderResponse>result;
    }

    isolated remote function PlaceOrderContext(UserId|ContextUserId req) returns ContextOrderResponse|grpc:Error {
        map<string|string[]> headers = {};
        UserId message;
        if req is ContextUserId {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online.shopping.ShoppingService/PlaceOrder", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <OrderResponse>result, headers: respHeaders};
    }

    isolated remote function CreateUsers() returns CreateUsersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("online.shopping.ShoppingService/CreateUsers");
        return new CreateUsersStreamingClient(sClient);
    }
}

public isolated client class CreateUsersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveCreateUsersResponse() returns CreateUsersResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <CreateUsersResponse>payload;
        }
    }

    isolated remote function receiveContextCreateUsersResponse() returns ContextCreateUsersResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <CreateUsersResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextProductList record {|
    ProductList content;
    map<string|string[]> headers;
|};

public type ContextEmpty record {|
    Empty content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextProductCode record {|
    ProductCode content;
    map<string|string[]> headers;
|};

public type ContextUserId record {|
    UserId content;
    map<string|string[]> headers;
|};

public type ContextProduct record {|
    Product content;
    map<string|string[]> headers;
|};

public type ContextOrderResponse record {|
    OrderResponse content;
    map<string|string[]> headers;
|};

public type ContextCreateUsersResponse record {|
    CreateUsersResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateProductRequest record {|
    UpdateProductRequest content;
    map<string|string[]> headers;
|};

public type ContextAddToCartRequest record {|
    AddToCartRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type ProductList record {|
    Product[] products = [];
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type Empty record {|
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type User record {|
    string userId = "";
    string username = "";
    string userType = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type ProductCode record {|
    string sku = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type UserId record {|
    string userId = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type Product record {|
    string name = "";
    string description = "";
    float price = 0.0;
    int stockQuantity = 0;
    string sku = "";
    string status = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type OrderResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type CreateUsersResponse record {|
    string message = "";
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type UpdateProductRequest record {|
    string sku = "";
    Product product = {};
|};

@protobuf:Descriptor {value: SHOPPINGC_DESC}
public type AddToCartRequest record {|
    string userId = "";
    string sku = "";
|};

