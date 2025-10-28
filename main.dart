<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreshMart - Online Grocery Delivery</title>
    <style>
        body {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            height: 100%;
        }
        
        html {
            height: 100%;
        }

        .app-container {
            max-width: 414px;
            margin: 0 auto;
            background: white;
            min-height: 100%;
            position: relative;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .header {
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
            padding: 20px;
            position: relative;
        }

        .location-bar {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .search-bar {
            display: flex;
            background: white;
            border-radius: 25px;
            padding: 12px 20px;
            align-items: center;
        }

        .search-bar input {
            border: none;
            outline: none;
            flex: 1;
            margin-left: 10px;
            color: #333;
        }

        .categories {
            padding: 20px;
            background: white;
        }

        .categories h3 {
            margin: 0 0 15px 0;
            color: #333;
            font-size: 18px;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        .category-item {
            text-align: center;
            padding: 15px 10px;
            background: #f8f9fa;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .category-item:hover {
            background: #e9ecef;
            transform: translateY(-2px);
        }

        .category-icon {
            font-size: 24px;
            margin-bottom: 8px;
        }

        .category-name {
            font-size: 12px;
            color: #666;
            font-weight: 500;
        }

        .products-section {
            padding: 20px;
            background: white;
            margin-top: 10px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin: 0;
        }

        .view-all {
            color: #4CAF50;
            font-size: 14px;
            text-decoration: none;
            font-weight: 500;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .product-card {
            background: white;
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .product-image {
            width: 100%;
            height: 80px;
            background: #f8f9fa;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 14px;
            font-weight: 500;
            color: #333;
            margin-bottom: 5px;
        }

        .product-weight {
            font-size: 12px;
            color: #666;
            margin-bottom: 8px;
        }

        .product-price {
            font-size: 16px;
            font-weight: 600;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .add-btn {
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 8px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .add-btn:hover {
            background: #45a049;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #4CAF50;
            border-radius: 6px;
            padding: 4px;
        }

        .qty-btn {
            background: none;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            padding: 4px 8px;
            border-radius: 4px;
        }

        .qty-btn:hover {
            background: rgba(255,255,255,0.2);
        }

        .quantity {
            color: white;
            font-weight: 500;
            font-size: 14px;
        }

        .bottom-nav {
            position: fixed;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
            max-width: 414px;
            background: white;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: space-around;
            padding: 10px 0;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
        }

        .nav-item {
            text-align: center;
            cursor: pointer;
            padding: 5px;
            transition: color 0.3s ease;
        }

        .nav-item.active {
            color: #4CAF50;
        }

        .nav-icon {
            font-size: 20px;
            margin-bottom: 4px;
        }

        .nav-label {
            font-size: 10px;
            color: #666;
        }

        .nav-item.active .nav-label {
            color: #4CAF50;
        }

        .cart-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: #ff4444;
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            font-size: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .cart-section {
            display: none;
            padding: 20px;
            padding-bottom: 80px;
        }

        .cart-section.active {
            display: block;
        }

        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px;
            background: white;
            border-radius: 12px;
            margin-bottom: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .cart-item-image {
            width: 50px;
            height: 50px;
            background: #f8f9fa;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-right: 15px;
        }

        .cart-item-details {
            flex: 1;
        }

        .cart-item-name {
            font-size: 14px;
            font-weight: 500;
            color: #333;
            margin-bottom: 4px;
        }

        .cart-item-price {
            font-size: 14px;
            color: #4CAF50;
            font-weight: 600;
        }

        .cart-total {
            background: white;
            padding: 20px;
            border-radius: 12px;
            margin-top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .total-label {
            color: #666;
        }

        .total-amount {
            font-weight: 600;
            color: #333;
        }

        .checkout-btn {
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 15px;
            transition: background 0.3s ease;
        }

        .checkout-btn:hover {
            background: #45a049;
        }

        .main-content {
            padding-bottom: 80px;
        }

        .empty-cart {
            text-align: center;
            padding: 40px 20px;
            color: #666;
        }

        .empty-cart-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: #ddd;
        }
    </style>
</head>
<body>
    <div class="app-container">
        <header class="header">
            <div class="location-bar">
                <span>📍</span>
                <span style="margin-left: 8px;">Deliver to: Home - 123 Main St</span>
            </div>
            <div class="search-bar">
                <span>🔍</span>
                <input type="text" placeholder="Search for groceries..." id="searchInput">
            </div>
        </header>

        <main class="main-content" id="mainContent">
            <section class="categories">
                <h3>Shop by Category</h3>
                <div class="category-grid">
                    <div class="category-item" onclick="filterByCategory('fruits')">
                        <div class="category-icon">🍎</div>
                        <div class="category-name">Fruits</div>
                    </div>
                    <div class="category-item" onclick="filterByCategory('vegetables')">
                        <div class="category-icon">🥕</div>
                        <div class="category-name">Vegetables</div>
                    </div>
                    <div class="category-item" onclick="filterByCategory('dairy')">
                        <div class="category-icon">🥛</div>
                        <div class="category-name">Dairy</div>
                    </div>
                    <div class="category-item" onclick="filterByCategory('meat')">
                        <div class="category-icon">🥩</div>
                        <div class="category-name">Meat</div>
                    </div>
                </div>
            </section>

            <section class="products-section">
                <div class="section-header">
                    <h3 class="section-title">Fresh Produce</h3>
                    <a href="#" class="view-all">View All</a>
                </div>
                <div class="products-grid" id="productsGrid">
                    <!-- Products will be populated by JavaScript -->
                </div>
            </section>
        </main>

        <div class="cart-section" id="cartSection">
            <h2>Your Cart</h2>
            <div id="cartItems"></div>
            <div class="cart-total" id="cartTotal" style="display: none;">
                <div class="total-row">
                    <span class="total-label">Subtotal:</span>
                    <span class="total-amount" id="subtotal">$0.00</span>
                </div>
                <div class="total-row">
                    <span class="total-label">Delivery Fee:</span>
                    <span class="total-amount">$2.99</span>
                </div>
                <div class="total-row" style="border-top: 1px solid #eee; padding-top: 10px; margin-top: 10px;">
                    <span class="total-label" style="font-weight: 600; color: #333;">Total:</span>
                    <span class="total-amount" style="font-size: 18px; color: #4CAF50;" id="totalAmount">$2.99</span>
                </div>
                <button class="checkout-btn" onclick="checkout()">Proceed to Checkout</button>
            </div>
            <div class="empty-cart" id="emptyCart">
                <div class="empty-cart-icon">🛒</div>
                <h3>Your cart is empty</h3>
                <p>Add some fresh groceries to get started!</p>
            </div>
        </div>

        <nav class="bottom-nav">
            <div class="nav-item active" onclick="showSection('home')">
                <div class="nav-icon">🏠</div>
                <div class="nav-label">Home</div>
            </div>
            <div class="nav-item" onclick="showSection('search')">
                <div class="nav-icon">🔍</div>
                <div class="nav-label">Search</div>
            </div>
            <div class="nav-item" onclick="showSection('cart')" style="position: relative;">
                <div class="nav-icon">🛒</div>
                <div class="nav-label">Cart</div>
                <div class="cart-badge" id="cartBadge" style="display: none;">0</div>
            </div>
            <div class="nav-item" onclick="showSection('profile')">
                <div class="nav-icon">👤</div>
                <div class="nav-label">Profile</div>
            </div>
        </nav>
    </div>

    <script>
        // Sample product data
        const products = [
            { id: 1, name: 'Fresh Bananas', weight: '1 dozen', price: 2.99, icon: '🍌', category: 'fruits' },
            { id: 2, name: 'Organic Apples', weight: '1 lb', price: 4.99, icon: '🍎', category: 'fruits' },
            { id: 3, name: 'Fresh Carrots', weight: '2 lbs', price: 1.99, icon: '🥕', category: 'vegetables' },
            { id: 4, name: 'Whole Milk', weight: '1 gallon', price: 3.49, icon: '🥛', category: 'dairy' },
            { id: 5, name: 'Ground Beef', weight: '1 lb', price: 6.99, icon: '🥩', category: 'meat' },
            { id: 6, name: 'Fresh Tomatoes', weight: '1 lb', price: 2.49, icon: '🍅', category: 'vegetables' },
            { id: 7, name: 'Greek Yogurt', weight: '32 oz', price: 4.99, icon: '🥛', category: 'dairy' },
            { id: 8, name: 'Orange Juice', weight: '64 fl oz', price: 3.99, icon: '🍊', category: 'fruits' }
        ];

        let cart = {};
        let currentCategory = 'all';

        // Initialize the app
        function init() {
            renderProducts();
            updateCartDisplay();
        }

        // Render products based on current filter
        function renderProducts() {
            const grid = document.getElementById('productsGrid');
            const filteredProducts = currentCategory === 'all' 
                ? products 
                : products.filter(p => p.category === currentCategory);
            
            grid.innerHTML = filteredProducts.map(product => `
                <div class="product-card">
                    <div class="product-image">${product.icon}</div>
                    <div class="product-name">${product.name}</div>
                    <div class="product-weight">${product.weight}</div>
                    <div class="product-price">$${product.price.toFixed(2)}</div>
                    <div id="product-${product.id}">
                        ${cart[product.id] ? 
                            `<div class="quantity-controls">
                                <button class="qty-btn" onclick="updateQuantity(${product.id}, -1)">−</button>
                                <span class="quantity">${cart[product.id]}</span>
                                <button class="qty-btn" onclick="updateQuantity(${product.id}, 1)">+</button>
                            </div>` :
                            `<button class="add-btn" onclick="addToCart(${product.id})">Add to Cart</button>`
                        }
                    </div>
                </div>
            `).join('');
        }

        // Add product to cart
        function addToCart(productId) {
            cart[productId] = 1;
            renderProducts();
            updateCartDisplay();
        }

        // Update quantity in cart
        function updateQuantity(productId, change) {
            if (cart[productId]) {
                cart[productId] += change;
                if (cart[productId] <= 0) {
                    delete cart[productId];
                }
                renderProducts();
                updateCartDisplay();
            }
        }

        // Update cart badge and cart section
        function updateCartDisplay() {
            const cartBadge = document.getElementById('cartBadge');
            const cartItems = document.getElementById('cartItems');
            const cartTotal = document.getElementById('cartTotal');
            const emptyCart = document.getElementById('emptyCart');
            
            const totalItems = Object.values(cart).reduce((sum, qty) => sum + qty, 0);
            
            if (totalItems > 0) {
                cartBadge.style.display = 'flex';
                cartBadge.textContent = totalItems;
                
                // Render cart items
                cartItems.innerHTML = Object.keys(cart).map(productId => {
                    const product = products.find(p => p.id == productId);
                    const quantity = cart[productId];
                    const itemTotal = product.price * quantity;
                    
                    return `
                        <div class="cart-item">
                            <div class="cart-item-image">${product.icon}</div>
                            <div class="cart-item-details">
                                <div class="cart-item-name">${product.name}</div>
                                <div class="cart-item-price">$${itemTotal.toFixed(2)} (${quantity}x)</div>
                            </div>
                            <div class="quantity-controls" style="width: 80px;">
                                <button class="qty-btn" onclick="updateQuantity(${productId}, -1)">−</button>
                                <span class="quantity">${quantity}</span>
                                <button class="qty-btn" onclick="updateQuantity(${productId}, 1)">+</button>
                            </div>
                        </div>
                    `;
                }).join('');
                
                // Calculate totals
                const subtotal = Object.keys(cart).reduce((sum, productId) => {
                    const product = products.find(p => p.id == productId);
                    return sum + (product.price * cart[productId]);
                }, 0);
                
                document.getElementById('subtotal').textContent = `$${subtotal.toFixed(2)}`;
                document.getElementById('totalAmount').textContent = `$${(subtotal + 2.99).toFixed(2)}`;
                
                cartTotal.style.display = 'block';
                emptyCart.style.display = 'none';
            } else {
                cartBadge.style.display = 'none';
                cartItems.innerHTML = '';
                cartTotal.style.display = 'none';
                emptyCart.style.display = 'block';
            }
        }

        // Filter products by category
        function filterByCategory(category) {
            currentCategory = category;
            renderProducts();
        }

        // Show different sections
        function showSection(section) {
            const navItems = document.querySelectorAll('.nav-item');
            navItems.forEach(item => item.classList.remove('active'));
            event.currentTarget.classList.add('active');
            
            const mainContent = document.getElementById('mainContent');
            const cartSection = document.getElementById('cartSection');
            
            if (section === 'cart') {
                mainContent.style.display = 'none';
                cartSection.classList.add('active');
            } else {
                mainContent.style.display = 'block';
                cartSection.classList.remove('active');
            }
        }

        // Checkout function
        function checkout() {
            const totalItems = Object.values(cart).reduce((sum, qty) => sum + qty, 0);
            const subtotal = Object.keys(cart).reduce((sum, productId) => {
                const product = products.find(p => p.id == productId);
                return sum + (product.price * cart[productId]);
            }, 0);
            
            // Create custom modal for checkout confirmation
            const modal = document.createElement('div');
            modal.style.cssText = `
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 1000;
            `;
            
            modal.innerHTML = `
                <div style="background: white; padding: 30px; border-radius: 12px; text-align: center; max-width: 300px; margin: 20px;">
                    <div style="font-size: 48px; margin-bottom: 15px;">✅</div>
                    <h3 style="margin: 0 0 10px 0; color: #333;">Order Confirmed!</h3>
                    <p style="color: #666; margin: 0 0 20px 0;">Your ${totalItems} items will be delivered within 30-45 minutes.</p>
                    <p style="font-weight: 600; color: #4CAF50; margin: 0 0 20px 0;">Total: $${(subtotal + 2.99).toFixed(2)}</p>
                    <button onclick="this.parentElement.parentElement.remove(); cart = {}; renderProducts(); updateCartDisplay();" 
                            style="background: #4CAF50; color: white; border: none; padding: 12px 24px; border-radius: 6px; cursor: pointer; font-weight: 500;">
                        Continue Shopping
                    </button>
                </div>
            `;
            
            document.body.appendChild(modal);
        }

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const grid = document.getElementById('productsGrid');
            
            if (searchTerm === '') {
                renderProducts();
                return;
            }
            
            const filteredProducts = products.filter(product => 
                product.name.toLowerCase().includes(searchTerm) ||
                product.category.toLowerCase().includes(searchTerm)
            );
            
            grid.innerHTML = filteredProducts.map(product => `
                <div class="product-card">
                    <div class="product-image">${product.icon}</div>
                    <div class="product-name">${product.name}</div>
                    <div class="product-weight">${product.weight}</div>
                    <div class="product-price">$${product.price.toFixed(2)}</div>
                    <div id="product-${product.id}">
                        ${cart[product.id] ? 
                            `<div class="quantity-controls">
                                <button class="qty-btn" onclick="updateQuantity(${product.id}, -1)">−</button>
                                <span class="quantity">${cart[product.id]}</span>
                                <button class="qty-btn" onclick="updateQuantity(${product.id}, 1)">+</button>
                            </div>` :
                            `<button class="add-btn" onclick="addToCart(${product.id})">Add to Cart</button>`
                        }
                    </div>
                </div>
            `).join('');
        });

        // Initialize the app when page loads
        init();
    </script>
<script>(function(){function c(){var b=a.contentDocument||a.contentWindow.document;if(b){var d=b.createElement('script');d.innerHTML="window.__CF$cv$params={r:'993f9412b45a7f17',t:'MTc2MTM3MjkxNi4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js';document.getElementsByTagName('head')[0].appendChild(a);";b.getElementsByTagName('head')[0].appendChild(d)}}if(document.body){var a=document.createElement('iframe');a.height=1;a.width=1;a.style.position='absolute';a.style.top=0;a.style.left=0;a.style.border='none';a.style.visibility='hidden';document.body.appendChild(a);if('loading'!==document.readyState)c();else if(window.addEventListener)document.addEventListener('DOMContentLoaded',c);else{var e=document.onreadystatechange||function(){};document.onreadystatechange=function(b){e(b);'loading'!==document.readyState&&(document.onreadystatechange=e,c())}}}})();</script></body>
</html>
