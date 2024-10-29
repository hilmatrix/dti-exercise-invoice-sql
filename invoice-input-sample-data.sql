INSERT INTO "sellers" ("id", "name", "address", "contact_info", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'Seller One', '123 Market Street', 'seller1@example.com', '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 'Seller Two', '456 High Street', 'seller2@example.com', '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 'Seller Three', '789 Broadway', 'seller3@example.com', '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into buyers
INSERT INTO "buyers" ("id", "name", "address", "contact_info", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'Buyer One', '321 Elm Street', 'buyer1@example.com', '2024-01-05 10:00:00', '2024-01-05 10:00:00', NULL),
(2, 'Buyer Two', '654 Oak Avenue', 'buyer2@example.com', '2024-02-05 11:00:00', '2024-02-05 11:00:00', NULL),
(3, 'Buyer Three', '987 Maple Drive', 'buyer3@example.com', '2024-03-05 12:00:00', '2024-03-05 12:00:00', NULL);

-- Insert dummy data into shipping_address_list
INSERT INTO "shipping_address_list" ("id", "buyer_id", "name", "address", "created_at", "updated_at", "deleted_at")
VALUES
(1, 1, 'Home', '321 Elm Street', '2024-01-05 10:00:00', '2024-01-05 10:00:00', NULL),
(2, 2, 'Office', '654 Oak Avenue', '2024-02-05 11:00:00', '2024-02-05 11:00:00', NULL),
(3, 3, 'Vacation Home', '987 Maple Drive', '2024-03-05 12:00:00', '2024-03-05 12:00:00', NULL);

-- Insert dummy data into items
INSERT INTO "items" (
    "id", "seller_id", "name", "description", 
    "price", "weight", "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Item One', 'Description of item one', 100, 500, '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 2, 'Item Two', 'Description of item two', 200, 1000, '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 3, 'Item Three', 'Description of item three', 300, 1500, '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into courier_types
INSERT INTO "courier_types" ("id", "name", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'Standard Shipping', '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 'Express Shipping', '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 'Overnight Shipping', '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into invoices
INSERT INTO "invoices" (
    "id", "invoice_number", "buyer_id", "seller_id", 
    "courier_type_id", "shipping_address", "services_fee", 
    "app_services_fee", "shipping_fee", "shipping_assurance_fee", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 'INV-001', 1, 1, 1, 1, 10, 5, 15, 2, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 'INV-002', 2, 2, 2, 2, 20, 10, 25, 5, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 'INV-003', 3, 3, 3, 3, 30, 15, 35, 10, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into invoice_item
INSERT INTO "invoice_item" (
    "id", "invoice_id", "items_id", "quantity", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 1, 2, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 1, 2, 1, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(3, 2, 1, 1, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(4, 2, 3, 3, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(5, 3, 2, 2, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into payment_types
INSERT INTO "payment_types" (
    "id", "invoice_id", "name", "ammount", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Credit Card', 130, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 'PayPal', 210, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 3, 'Bank Transfer', 300, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into promos
INSERT INTO "promos" (
    "id", "invoice_id", "name", "discount", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Promo One', 10.0, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 'Promo Two', 20.0, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 3, 'Promo Three', 30.0, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into insurance
INSERT INTO "insurance" (
    "id", "invoice_id", "name", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Standard Insurance', '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 'Premium Insurance', '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 3, 'Basic Insurance', '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

