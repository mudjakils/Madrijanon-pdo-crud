<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> <!-- Font Awesome CSS -->
    <style>
        /* Define a class for the grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* Responsive grid with minimum item width of 250px */
            gap: 20px; /* Gap between grid items */
            padding: 20px; /* Add padding around the grid container */
            width: 80%; /* Set width to 80% */
        }

        /* Style for individual cards */
        .card {
            width: 100% !important; /* Ensure cards take full width of their container */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Add smooth transitions */
            background-color: #d5ffd7;
        }

        .card:hover {
            background-color: rgb(185, 243, 186);
            transform: translateY(-10px); /* Move the card up when hovered */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Add shadow effect */
        }

        .card-img-top {
            width: 100%; /* Ensure the image fills its container */
            height: auto; /* Maintain aspect ratio */
            object-fit: cover; /* Ensure the image covers the entire container */
        }

        /* Style for the cart */
        #purchases {
            position: relative;
            width: 20%;
            position: fixed;
            top: 4em;
            right: 0px;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 999;
            overflow-y: auto; /* Enable vertical scrollbar */
            max-height: calc(100vh - 70px); /* Limit max height to viewport height minus header and footer */
        }

        /* CSS for the product images in the Cart section */
        .product-image {
            width: 1in; /* Set width to 1 inch */
            height: 1in; /* Set height to 1 inch */
        }

        /* Full width for purchased items section */
        #purchased {
            width: 100%; /* Full width */
            position: relative; /* Not fixed */
            top: 0; /* Reset top */
            right: 0; /* Reset right */
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 999;
            margin-top: 20px; /* Adjust as needed */
            overflow-y: auto; /* Enable vertical scrollbar */
            /*max-height: 400px;  Limit max height */
        }

    </style>
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="https://www.pngall.com/wp-content/uploads/2017/05/Copyright-Symbol-R-Free-Download-PNG.png" width="30" height="30" class="d-inline-block align-top" alt="">
        MUDJAKILS
    </a>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="display-purchases.php">Purchases<span class="sr-only"></span></a>
        </li>
      </ul>

      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
</nav>
<body>

    <div id="productsDisplay" class="card-grid"></div>
    <!-- Cart Display Area -->
    <div id="purchases">
        <h1>Cart</h1>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmationModalLabel">Order Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Your order has been placed successfully! Thank you for your purchase.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="redirectToOrderSummary()">View Order Summary</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Add these scripts at the end of the body tag for better performance -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
    <script>
        fetch('./products/products-api.php')
            .then(response => response.json())
            .then(data => {
                const productsContainer = document.getElementById('productsDisplay');
                data.forEach(product => {
                    const cardHTML = `
                        <div class="card m-2" style="width: 20rem;">
                            <img class="card-img-top" src="${product.img}">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5>
                                <p class="card-text">${product.description}</p>
                                <p class="card-text">Price: ₱${product.rrp}</p>
                                <button class="btn btn-success" onclick="addToCart(${product.id},'${product.description}','${product.img}')">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            </div>
                        </div>
                    `;
                    productsContainer.innerHTML += cardHTML;
                });
            })
            .catch(error => console.error('Error:', error));
    
        // Initialize cart object
        let cart = {};
    
        // Function to add a product to the cart
        function addToCart(productId, description, img) {
            // Get the product details from the DOM
            const productCard = document.querySelector(`[onclick="addToCart(${productId},'${description}','${img}')"]`).closest('.card');
            const title = productCard.querySelector('.card-title').textContent;
            const priceText = productCard.querySelector('.card-body').innerHTML.match(/Price: ₱(\d+\.?\d*)/);
            const price = priceText ? parseFloat(priceText[1]) : 0;
            const quantity = 1; // Default to 1 for simplicity
    
            // Add the product to the cart
            if (cart[productId]) {
                cart[productId].quantity++;
            } else {
                cart[productId] = { title, price, quantity, description, img };
            }
    
            // Display the updated cart
            displayCart();
        }
    
        // Function to display the cart with the items added and deduct the values from the quantity data field
        function displayCart() {
            const purchases = document.getElementById('purchases');
            let cartHTML = '<h1>Cart</h1>';
            // Iterate over the cart items and display them
            for (const [productId, productDetails] of Object.entries(cart)) {
                cartHTML += `
                    <div class="product mb-3">
                        <img src="${productDetails.img}" alt="${productDetails.title}" class="product-image" style="width: 100px; height: 100px;">
                        <div class="product-details">
                            <p class="product-title"><strong>${productDetails.title}</strong></p>
                            <p class="product-description">${productDetails.description}</p>
                            <p class="product-price">₱${productDetails.price.toFixed(2)}</p>
                            <p class="product-quantity">Quantity: ${productDetails.quantity}</p>
                        </div>
                    </div>
                `;
            }
            // Add the checkout button outside the loop
            cartHTML += `
                <button class="btn btn-primary btn-lg btn-block" onclick="checkout()">Buy now</button>
            `;
            // Update the cart display
            purchases.innerHTML = cartHTML;
        }

        // Function to handle checkout
        function checkout() {
            // Send a POST request to the server with the cart data
            fetch('checkout.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(cart)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    // Clear the cart if the data is successfully stored
                    cart = {};
                    displayCart(); // Update the cart display

                    // Display a confirmation message
                    alert('Your purchase was successful!');

                    // Optionally, display a modal instead of an alert
                    // $('#confirmationModal').modal('show');

                    // Optionally, send an order confirmation email or handle payment here

                } else {
                    console.error("Error during checkout:", data.message);
                }
            })
            .catch(error => console.error('Error:', error));
        }

        // Function to redirect to the order summary page
        function redirectToOrderSummary() {
            window.location.href = 'order-summary.php'; // Replace with the actual URL of your order summary page
        }
    </script>
</body>
</html>