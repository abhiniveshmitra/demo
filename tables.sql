-- Buyers Table
CREATE TABLE buyers (
    buyer_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE,
    bitscoin_balance INT
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_username VARCHAR(255),
    product_name VARCHAR(255),
    description TEXT,
    asking_price INT,
    listing_start_date TIMESTAMP,
    bid_end_date TIMESTAMP,
    video_url VARCHAR(255),
    is_sold BOOLEAN DEFAULT false,
    FOREIGN KEY (seller_username) REFERENCES buyers(username)
);
-- Bids Table
CREATE TABLE bids (
    bid_id INT PRIMARY KEY AUTO_INCREMENT,
    buyer_username VARCHAR(255),
    product_id INT,
    bid_amount INT,
    bid_time TIMESTAMP,
    is_winning_bid BOOLEAN DEFAULT false,
    FOREIGN KEY (buyer_username) REFERENCES buyers(username),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Messages Table
CREATE TABLE messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_username VARCHAR(255),
    receiver_username VARCHAR(255),
    content TEXT,
    timestamp TIMESTAMP,
    FOREIGN KEY (sender_username) REFERENCES buyers(username),
    FOREIGN KEY (receiver_username) REFERENCES buyers(username)
);
