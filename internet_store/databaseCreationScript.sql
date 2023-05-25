
CREATE SCHEMA IF NOT EXISTS sql_practice_internet_store
DEFAULT CHARACTER SET utf8 ;
USE sql_practice_internet_store;

commit;


CREATE TABLE clients (
    id BIGINT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE UNIQUE INDEX index_unique_clients_full_name
ON clients(full_name);

commit;


CREATE TABLE client_addresses (
    id BIGINT AUTO_INCREMENT,
    client_id BIGINT NOT NULL,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    post_code VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE UNIQUE INDEX index_unique_client_addresses_client_id
ON client_addresses(client_id);

commit;


CREATE TABLE products (
    id BIGINT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    manufacturer_country VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    availability INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE UNIQUE INDEX index_unique_products_title
ON products(title);

commit;


CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT,
    client_id BIGINT NOT NULL,
    total_price DOUBLE NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    amount INT NOT NULL,
    item_price DOUBLE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(1, "Milk 1L", "LATVIA", 1.5, 10);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(2, "White Bread", "Estonia", 2.0, 100);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(3, "iPhone x10", "USA", 1000.0, 99);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(4, "iPhone x14", "USA", 1500.0, 77);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(5, "Samsung TV", "Korea", 2500.0, 33);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(6, "Bose quietcomfort 45", "Korea", 500.0, 44);

INSERT INTO products(id, title, manufacturer_country, price, availability)
VALUES(7, "Blue pen", "Spain", 10.0, 999);

commit;

INSERT INTO clients(id, full_name, email, phone, registration_date)
VALUES(1, "Vasilij Ozerov", "ozer@inbox.lv", "+371 2677777", "2010.01.22");

INSERT INTO clients(id, full_name, email, phone, registration_date)
VALUES(2, "Jelena Kolesnikova", "j.koles@inbox.lv", "+371 2688888", "2015.04.25");

INSERT INTO clients(id, full_name, email, phone, registration_date)
VALUES(3, "Artur Shilov", "a.shilov@inbox.lv", "+371 26555555", "2017.09.15");

INSERT INTO clients(id, full_name, email, phone, registration_date)
VALUES(4, "Olesja Kibish", "olesja@gmail.com", "+371 26444444", "2019.03.15");

INSERT INTO clients(id, full_name, email, phone, registration_date)
VALUES(5, "Roland Ozols", "r.ozols@gmail.com", "+371 26333333", "2020.05.10");

commit;

INSERT INTO client_addresses(id, client_id, country, city, address, post_code)
VALUES(1, 1, "LATVIA", "Riga", "Lomonosova 1", "LV-1033");

INSERT INTO client_addresses(id, client_id, country, city, address, post_code)
VALUES(2, 2, "LATVIA", "Liepaja", "Ozola 9", "LV-7043");

INSERT INTO client_addresses(id, client_id, country, city, address, post_code)
VALUES(3, 3, "LATVIA", "Ventspils", "Berzas 12", "LV-9077");

INSERT INTO client_addresses(id, client_id, country, city, address, post_code)
VALUES(4, 4, "LATVIA", "Bauska", "Brivibas 77", "LV-4099");

commit;


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(1, 1, 15.0, "2020.01.22");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(1, 1, 1, 10, 15.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(2, 1, 25.0, "2020.01.23");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(2, 2, 1, 10, 15.0);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(3, 2, 2, 5, 10.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(3, 2, 1000.0, "2020.02.15");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(4, 3, 3, 1, 1000.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(4, 3, 1000.0, "2020.03.20");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(5, 4, 3, 1, 1000.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(5, 4, 1500.0, "2020.03.21");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(6, 5, 4, 1, 1500.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(6, 4, 3000.0, "2020.06.27");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(7, 6, 4, 2, 3000.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(7, 5, 11.0, "2020.05.29");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(8, 7, 1, 2, 3.0);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(9, 7, 2, 4, 8.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(8, 5, 3.5, "2020.07.29");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(10, 8, 1, 1, 1.5);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(11, 8, 2, 1, 2.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(9, 5, 7.0, "2020.08.16");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(12, 9, 1, 2, 3.0);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(13, 9, 2, 2, 4.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(10, 5, 1500.0, "2020.09.17");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(14, 10, 4, 1, 1500.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(11, 5, 3.5, "2020.10.18");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(15, 11, 1, 1, 1.5);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(16, 11, 2, 1, 2.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(12, 5, 500.0, "2020.11.19");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(17, 12, 6, 1, 500.0);


INSERT INTO orders(id, client_id, total_price, order_date)
VALUES(13, 1, 1020.0, "2020.12.20");
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(18, 13, 6, 2, 1000.0);
INSERT INTO order_items(id, order_id, product_id, amount, item_price)
VALUES(19, 13, 7, 2, 20.0);

commit;