-- Insert sellers
INSERT INTO sellers (id, name, address, contact_info) VALUES
(1, 'Seller One', '123 Market Street', 'seller1@example.com'),
(2, 'Seller Two', '456 Commerce Road', 'seller2@example.com');

-- Insert buyers
INSERT INTO buyers (id, name, address, contact_info) VALUES
(1, 'Buyer One', '789 Main Avenue', 'buyer1@example.com'),
(2, 'Buyer Two', '101 River Lane', 'buyer2@example.com');

-- Insert shipping addresses
INSERT INTO shipping_address_list (id, buyer_id, name, address) VALUES
(1, 1, 'Buyer One', '789 Main Avenue, Apt 1'),
(2, 2, 'Buyer Two', '101 River Lane, Suite 2');

-- Insert items
INSERT INTO items (id, seller_id, name, description, price) VALUES
(1, 1, 'Item One', 'Description for item one', 100),
(2, 1, 'Item Two', 'Description for item two', 200),
(3, 2, 'Item Three', 'Description for item three', 150);

-- Insert courier types
INSERT INTO courier_types (id, name) VALUES
(1, 'Standard Shipping'),
(2, 'Express Shipping');

-- Insert invoices
INSERT INTO invoices (
  id, label, buyer_id, seller_id, courier_type_id, shipping_address, assurance, 
  services_price, app_services_price, shipping_price, shipping_assurance_price, 
  purchase_date, last_update
) VALUES
(1, 'INV001', 1, 1, 1, 1, TRUE, 300, 50, 20, 10, '2024-10-01 10:00:00', '2024-10-01 11:00:00'),
(2, 'INV002', 2, 2, 2, 2, FALSE, 450, 75, 30, 0, '2024-10-02 14:00:00', '2024-10-02 15:00:00');

-- Insert invoice items
INSERT INTO invoice_item (id, invoice_id, items_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3);

-- Insert payment types
INSERT INTO payment_types (id, invoice_id, name, ammount) VALUES
(1, 1, 'Credit Card', 400),
(2, 2, 'PayPal', 450);

-- Insert promos
INSERT INTO promos (id, invoice_id, name, discount) VALUES
(1, 1, 'Promo10', 10.0),
(2, 2, 'Holiday20', 20.0);