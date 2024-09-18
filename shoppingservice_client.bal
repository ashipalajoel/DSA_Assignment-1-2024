import ballerina/io;

ShoppingServiceClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Product addProductRequest = {name: "ballerina", description: "ballerina", price: 1, stockQuantity: 1, sku: "ballerina", status: "ballerina"};
    ProductCode addProductResponse = check ep->AddProduct(addProductRequest);
    io:println(addProductResponse);

    UpdateProductRequest updateProductRequest = {sku: "ballerina", product: {name: "ballerina", description: "ballerina", price: 1, stockQuantity: 1, sku: "ballerina", status: "ballerina"}};
    Empty updateProductResponse = check ep->UpdateProduct(updateProductRequest);
    io:println(updateProductResponse);

    ProductCode removeProductRequest = {sku: "ballerina"};
    ProductList removeProductResponse = check ep->RemoveProduct(removeProductRequest);
    io:println(removeProductResponse);

    Empty listAvailableProductsRequest = {};
    ProductList listAvailableProductsResponse = check ep->ListAvailableProducts(listAvailableProductsRequest);
    io:println(listAvailableProductsResponse);

    ProductCode searchProductRequest = {sku: "ballerina"};
    Product searchProductResponse = check ep->SearchProduct(searchProductRequest);
    io:println(searchProductResponse);

    AddToCartRequest addToCartRequest = {userId: "ballerina", sku: "ballerina"};
    Empty addToCartResponse = check ep->AddToCart(addToCartRequest);
    io:println(addToCartResponse);

    UserId placeOrderRequest = {userId: "ballerina"};
    OrderResponse placeOrderResponse = check ep->PlaceOrder(placeOrderRequest);
    io:println(placeOrderResponse);

    User createUsersRequest = {userId: "ballerina", username: "ballerina", userType: "ballerina"};
    CreateUsersStreamingClient createUsersStreamingClient = check ep->CreateUsers();
    check createUsersStreamingClient->sendUser(createUsersRequest);
    check createUsersStreamingClient->complete();
    CreateUsersResponse? createUsersResponse = check createUsersStreamingClient->receiveCreateUsersResponse();
    io:println(createUsersResponse);
}

