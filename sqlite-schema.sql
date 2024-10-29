CREATE TABLE "sellers" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "address" TEXT,
  "contact_info" TEXT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME
);

CREATE TABLE "buyers" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "address" TEXT,
  "contact_info" TEXT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME
);

CREATE TABLE "shipping_address_list" (
  "id" INTEGER PRIMARY KEY,
  "buyer_id" INTEGER,
  "name" TEXT,
  "address" TEXT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("buyer_id") REFERENCES "buyers" ("id")
);

CREATE TABLE "items" (
  "id" INTEGER PRIMARY KEY,
  "seller_id" INTEGER,
  "name" TEXT,
  "description" TEXT,
  "price" INTEGER,
  "weight" INTEGER,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("seller_id") REFERENCES "sellers" ("id")
);

CREATE TABLE "courier_types" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME
);

CREATE TABLE "invoices" (
  "id" INTEGER PRIMARY KEY,
  "invoice_number" TEXT,
  "buyer_id" INTEGER,
  "seller_id" INTEGER,
  "courier_type_id" INTEGER,
  "shipping_address" INTEGER,
  "services_fee" INTEGER,
  "app_services_fee" INTEGER,
  "shipping_fee" INTEGER,
  "shipping_assurance_fee" INTEGER,
  "insurance_id" INTEGER,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("buyer_id") REFERENCES "buyers" ("id"),
  FOREIGN KEY ("seller_id") REFERENCES "sellers" ("id"),
  FOREIGN KEY ("courier_type_id") REFERENCES "courier_types" ("id"),
  FOREIGN KEY ("shipping_address") REFERENCES "shipping_address_list" ("id")
);

CREATE TABLE "invoice_item" (
  "id" INTEGER PRIMARY KEY,
  "invoice_id" INTEGER,
  "items_id" INTEGER,
  "quantity" INTEGER,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id"),
  FOREIGN KEY ("items_id") REFERENCES "items" ("id")
);

CREATE TABLE "payment_types" (
  "id" INTEGER PRIMARY KEY,
  "invoice_id" INTEGER,
  "name" TEXT,
  "ammount" INTEGER,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id")
);

CREATE TABLE "promos" (
  "id" INTEGER PRIMARY KEY,
  "invoice_id" INTEGER,
  "name" TEXT,
  "discount" REAL,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id")
);

CREATE TABLE "insurance" (
  "id" INTEGER PRIMARY KEY,
  "invoice_id" INTEGER,
  "name" TEXT,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  "deleted_at" DATETIME,
  FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id")
);