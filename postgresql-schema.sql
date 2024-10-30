CREATE TABLE sellers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  address TEXT,
  contact_info TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE buyers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  address TEXT,
  contact_info TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE shipping_address_list (
  id SERIAL PRIMARY KEY,
  buyer_id INTEGER REFERENCES buyers(id),
  name TEXT,
  address TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  seller_id INTEGER REFERENCES sellers(id),
  name TEXT,
  description TEXT,
  price INTEGER,
  weight INTEGER,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE item_snapshots (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES items(id),
  price INTEGER,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE courier_types (
  id SERIAL PRIMARY KEY,
  name TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  invoice_number TEXT,
  buyer_id INTEGER REFERENCES buyers(id),
  seller_id INTEGER REFERENCES sellers(id),
  courier_type_id INTEGER REFERENCES courier_types(id),
  shipping_address INTEGER REFERENCES shipping_address_list(id),
  services_fee INTEGER,
  app_services_fee INTEGER,
  shipping_fee INTEGER,
  shipping_assurance_fee INTEGER,
  insurance_id INTEGER,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE invoice_item (
  id SERIAL PRIMARY KEY,
  invoice_id INTEGER REFERENCES invoices(id),
  items_id INTEGER REFERENCES items(id),
  quantity INTEGER,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE payment_types (
  id SERIAL PRIMARY KEY,
  invoice_id INTEGER REFERENCES invoices(id),
  name TEXT,
  amount INTEGER,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE promos (
  id SERIAL PRIMARY KEY,
  invoice_id INTEGER REFERENCES invoices(id),
  name TEXT,
  discount NUMERIC,
  cashback NUMERIC,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);

CREATE TABLE insurance (
  id SERIAL PRIMARY KEY,
  invoice_id INTEGER REFERENCES invoices(id),
  name TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ,
  deleted_at TIMESTAMPTZ
);
