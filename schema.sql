CREATE TABLE "sellers" (
  "id" id,
  "name" text,
  "address" text,
  "contact_info" text
);

CREATE TABLE "buyers" (
  "id" id,
  "name" text,
  "address" text,
  "contact_info" text
);

CREATE TABLE "shipping_address_list" (
  "id" id,
  "buyer_id" id,
  "name" text,
  "address" text
);

CREATE TABLE "items" (
  "id" id,
  "seller_id" id,
  "name" text,
  "description" text,
  "price" integer
);

CREATE TABLE "invoices" (
  "id" id,
  "label" text,
  "buyer_id" id,
  "seller_id" id,
  "courier_type_id" id,
  "shipping_address" id,
  "assurance" bool,
  "services_price" integer,
  "app_services_price" integer,
  "shipping_price" integer,
  "shipping_assurance_price" integer,
  "purchase_date" datetime,
  "last_update" datetime
);

CREATE TABLE "invoice_item" (
  "id" id,
  "invoice_id" id,
  "items_id" id,
  "quantity" integer
);

CREATE TABLE "courier_types" (
  "id" id,
  "name" text
);

CREATE TABLE "payment_types" (
  "id" id,
  "invoice_id" id,
  "name" text,
  "ammount" int
);

CREATE TABLE "promos" (
  "id" id,
  "invoice_id" id,
  "name" text,
  "discount" float
);

ALTER TABLE "items" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("buyer_id") REFERENCES "buyers" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("id");

ALTER TABLE "invoice_item" ADD FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id");

ALTER TABLE "invoice_item" ADD FOREIGN KEY ("items_id") REFERENCES "items" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("courier_type_id") REFERENCES "courier_types" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("shipping_address") REFERENCES "shipping_address_list" ("id");

ALTER TABLE "promos" ADD FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id");

ALTER TABLE "payment_types" ADD FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id");
