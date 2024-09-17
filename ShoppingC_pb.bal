import ballerina/io;
import ballerina/grpc;

type Product record {
    string name;
    string description;
    float price;
    int stockQuantity;
    string sku;
    boolean isAvailable;
};

type Order record {
    string userId;
    Product[] items;
};

// Create an in-memory store for products and user orders.
Product[] products = [];
Order[] orders = [];

// gRPC service implementation
service "ShoppingService" on new grpc:Listener(9090) {

    // Add a new product (admin operation)
    remote function AddProduct(Product product) returns ProductCode {
        products.push(product); // Add the product to the list
        io:println("Product added: ", product.name);
        return {sku: product.sku};
    }

    
    remote function CreateUsers(stream<User, grpc:Error> userStream) returns CreateUsersResponse {
        check from User user in userStream
            do {
                io:println("User created: ", user.username, " (", user.userType, ")");
            };
        return {message: "Users created successfully"};
    }

    remote function UpdateProduct(UpdateProductRequest request) returns Empty {
        foreach Product product in products {
            if product.sku == request.sku {
                product.name = request.product.name;
                product.description = request.product.description;
                product.price = request.product.price;
                product.stockQuantity = request.product.stockQuantity;
                product.isAvailable = request.product.isAvailable;
                io:println("Product updated: ", product.name);
                return {};
            }
        }
        io:println("Product not found: ", request.sku);
        return {};
    }

    // Remove a product by SKU
    remote function RemoveProduct(ProductCode code) returns ProductList {
        Product[] updatedProducts = [];
        foreach Product product in products {
            if product.sku != code.sku {
                updatedProducts.push(product); // Keep the products that are not removed
            } else {
                io:println("Product removed: ", product.name);
            }
        }
        products = updatedProducts; // Update the products array
        return {products: products};
    }

    // List available products (customer operation)
    remote function ListAvailableProducts(Empty request) returns ProductList {
        Product[] availableProducts = [];
        foreach Product product in products {
            if product.isAvailable {
                availableProducts.push(product);
            }
        }
        io:println("Listing available products...");
        return {products: availableProducts};
    }

    // Search for a product by SKU (customer operation)
    remote function SearchProduct(ProductCode code) returns Product|error {
        foreach Product product in products {
            if product.sku == code.sku {
                io:println("Product found: ", product.name);
                return product;
            }
        }
        io:println("Product not found: ", code.sku);
        return error("Product not available");
    }

    // Add product to cart (customer operation)
    remote function AddToCart(AddToCartRequest request) returns Empty {
        Product[] userCart = [];
        foreach Product product in products {
            if product.sku == request.sku {
                userCart.push(product); // Add the product to the user's cart
                io:println("Product added to cart: ", product.name);
            }
        }
        orders.push({userId: request.userId, items: userCart});
        return {};
    }

    // Place an order (customer operation)
    remote function PlaceOrder(UserId userId) returns OrderResponse|error {
        foreach Order order in orders {
            if order.userId == userId.userId {
                io:println("Order placed for user: ", userId.userId);
                orders = removeOrder(order);  // Remove the order after processing
                return {message: "Order placed successfully"};
            }
        }
        return error("No orders found for the user");
    }
}

// Helper function to remove the order from the list
function removeOrder(Order orderToRemove) returns Order[] {
    Order[] updatedOrders = [];
    foreach Order order in orders {
        if order.userId != orderToRemove.userId {
            updatedOrders.push(order); // Keep other orders
        }
    }
    return updatedOrders;
}
