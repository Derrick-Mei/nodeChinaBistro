Table employees {
  id int [pk, increment] // auto-increment
  name varchar
  color varchar
  auth_level int
  created_at timestamp
}

Table customers as C {
  id int [pk, increment]
  name varchar
  default_address int
  created_at timestamp
 }

Table addresses as A {
  id int [pk, increment]
  customer_id int [ref: > C.id]
  street varchar
  city varchar
  state varchar
  zipcode varchar
  phone_number varchar
  created_at timestamp
}

Table entrees {
  id int [pk, increment]
  entree_code int
  name varchar
  price_reg int
  price_small int
  type varchar [note: 'chef, sous chef, app chef']
}

Table orders as O {
  id int [pk, increment]
  order_num int [note: 'order num for daily use']
  customer_id int [ref: > C.id]
  type varchar [note: 'dine-in, delivery, or pickup']
  address_id int
  in_time timestamp
  out_time timestamp
  payment_method varchar
  took_payment int [ref: > employees.id]
  took_order int [ref: > employees.id]
  took_delivery int [ref: > employees.id]
  table_num int
}

Table order_items as OI {
  id int [pk, increment]
  order_id int [ref: > O.id]
  entree_id int [ref: > entrees.id]
  quantity_reg int
  quantity_small int
  modification varchar
  modification_price int
  cooked boolean
}




https://dbdiagram.io/d/5ee880a69ea313663b3a9d11