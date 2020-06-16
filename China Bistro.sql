CREATE TABLE "employees" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "color" varchar,
  "auth_level" int,
  "created_at" timestamp
);

CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "default_address" int,
  "created_at" timestamp
);

CREATE TABLE "addresses" (
  "id" SERIAL PRIMARY KEY,
  "customer_id" int,
  "street" varchar,
  "city" varchar,
  "state" varchar,
  "zipcode" varchar,
  "phone_number" varchar,
  "created_at" timestamp
);

CREATE TABLE "entrees" (
  "id" SERIAL PRIMARY KEY,
  "entree_code" int,
  "name" varchar,
  "price_reg" int,
  "price_small" int,
  "type" varchar
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "order_num" int,
  "customer_id" int,
  "type" varchar,
  "address_id" int,
  "in_time" timestamp,
  "out_time" timestamp,
  "payment_method" varchar,
  "took_payment" int,
  "took_order" int,
  "took_delivery" int,
  "table_num" int
);

CREATE TABLE "order_items" (
  "id" SERIAL PRIMARY KEY,
  "order_id" int,
  "entree_id" int,
  "quantity_reg" int,
  "quantity_small" int,
  "modification" varchar,
  "modification_price" int,
  "cooked" boolean
);

ALTER TABLE "addresses" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("took_payment") REFERENCES "employees" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("took_order") REFERENCES "employees" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("took_delivery") REFERENCES "employees" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_items" ADD FOREIGN KEY ("entree_id") REFERENCES "entrees" ("id");

COMMENT ON COLUMN "entrees"."type" IS 'chef, sous chef, app chef';

COMMENT ON COLUMN "orders"."order_num" IS 'order num for daily use';

COMMENT ON COLUMN "orders"."type" IS 'dine-in, delivery, or pickup';
