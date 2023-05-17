
CREATE TABLE clients (
    id BIGINT AUTO_INCREMENT,
    full_name VARCHAR(200) NOT NULL,
    client_status VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    date_of_registration DATE NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY(id)
);
