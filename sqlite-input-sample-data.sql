INSERT INTO "sellers" ("id", "name", "address", "contact_info", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'COC Komputer', 'Jakarta Utara', 'cockomputer@yahoo.com', '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 'Snack Time', 'Surabaya', 'nyamnyam@gmail.com', '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 'Hilmatrix Toys', 'Tangerang Selatan', 'hilmatrix@gmail.com', '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into buyers
INSERT INTO "buyers" ("id", "name", "address", "contact_info", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'Sum Ting Wong', 'Batam', 'wrong@gmail.com', '2024-01-05 10:00:00', '2024-01-05 10:00:00', NULL),
(2, 'Budi', 'Banten', 'meong@gmail.com', '2024-02-05 11:00:00', '2024-02-05 11:00:00', NULL),
(3, 'Tuti', 'Bandung', 'kandang@yahoo.com', '2024-03-05 12:00:00', '2024-03-05 12:00:00', NULL);

-- Insert dummy data into shipping_address_list
INSERT INTO "shipping_address_list" ("id", "buyer_id", "name", "address", "created_at", "updated_at", "deleted_at")
VALUES
(1, 1, 'Sum Ting Wong', 'Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau, 29466', '2024-01-05 10:00:00', '2024-01-05 10:00:00', NULL),
(2, 2, 'Budi', 'Perumahan Serpong, Tangerang Selatan', '2024-02-05 11:00:00', '2024-02-05 11:00:00', NULL),
(3, 3, 'Tuti', 'Babakan Ciamis, Bandung', '2024-03-05 12:00:00', '2024-03-05 12:00:00', NULL);

-- Insert dummy data into items
INSERT INTO "items" (
    "id", "seller_id", "name", "description", 
    "price", "weight", "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Sapphire NITRO+ Radeon RX 7900 XTX 24GB', 'AMD Graphic Card', 20500000, 5000, '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 2, 'Omega Cat Food 1 Kg', 'Makanan Kucing', 30000, 1000, '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 3, 'Wonder Woman Action Figure', 'Based On Marvel universe character', 400000, 500, '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into courier_types
INSERT INTO "courier_types" ("id", "name", "created_at", "updated_at", "deleted_at")
VALUES
(1, 'J&T Reguler', '2024-01-01 10:00:00', '2024-01-01 10:00:00', NULL),
(2, 'Sicepat Reguler', '2024-02-01 11:00:00', '2024-02-01 11:00:00', NULL),
(3, 'JNE Reguler', '2024-03-01 12:00:00', '2024-03-01 12:00:00', NULL);

-- Insert dummy data into invoices
INSERT INTO "invoices" (
    "id", "invoice_number", "buyer_id", "seller_id", 
    "courier_type_id", "shipping_address", "services_fee", 
    "app_services_fee", "shipping_fee", "shipping_assurance_fee", 
    "insurance_id", "created_at", "updated_at", "deleted_at"
) VALUES
(1, 'INV-001', 1, 1, 1, 1, 1000, 1000, 126000, 57700, 1, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 'INV-002', 2, 2, 2, 2, 1000, 1000, 10000, 0, 2, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 'INV-003', 3, 3, 3, 3, 1000, 1000, 20000, 30000, 3, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into invoice_item
INSERT INTO "invoice_item" (
    "id", "invoice_id", "items_id", "quantity", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 1, 1, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 2, 5, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(3, 3, 3, 1, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL);

-- Insert dummy data into payment_types
INSERT INTO "payment_types" (
    "id", "invoice_id", "name", "ammount", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'BCA Virtual Accounts', 130, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 3, 'GoPay', 210, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 2, 'GoPay', 210, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(4, 3, 'GoPay Coins', 300, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into promos
INSERT INTO "promos" (
    "id", "invoice_id", "name", "discount", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Promo Tokopedia', 10.0, '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 'Promo CIMB Niaga', 20.0, '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 3, 'Promo Gojek', 30.0, '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

-- Insert dummy data into insurance
INSERT INTO "insurance" (
    "id", "invoice_id", "name", 
    "created_at", "updated_at", "deleted_at"
) VALUES
(1, 1, 'Tokopedia', '2024-01-10 10:00:00', '2024-01-10 10:00:00', NULL),
(2, 2, 'AXA', '2024-02-10 11:00:00', '2024-02-10 11:00:00', NULL),
(3, 3, 'Allianz', '2024-03-10 12:00:00', '2024-03-10 12:00:00', NULL);

