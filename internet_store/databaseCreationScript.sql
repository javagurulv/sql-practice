
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