CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS client (
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Cname VARCHAR(15),
    Csurname VARCHAR (45),
    cpf CHAR(11) NOT NULL,
    phone INT,
    email VARCHAR(70) NOT NULL,
    birthdate DATE,
    street VARCHAR (70),
    s_number INT,
    city VARCHAR(45),
    state VARCHAR(45),
    CONSTRAINT client_cpf UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS product (
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    category ENUM("Toy", "Mechanic", "Domestic", "Eletronic", "Clothing", "Food"),
    valor FLOAT,
    underage BOOL DEFAULT false,
    rating FLOAT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS payment (
	idClient INT,
    idPayment INT,
    paymentType ENUM ("QR Code", "Pix", "Credit Card", "Debit Card", "Two Cards"),
    verification_code VARCHAR(20),
    validity DATE,
    value_limit FLOAT,
    useful BOOL DEFAULT false,
    PRIMARY KEY (idClient, idPayment),
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES client (idClient) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS request (
	idOrder INT,
    idClient INT,
    idPayment INT,
    statement ENUM ("Waiting Payment", "Paid", "Travelling", "Finished", "Canceled") DEFAULT "Waiting Payment",
    details VARCHAR (255),
    price FLOAT NOT NULL,
    PRIMARY KEY (idOrder, idClient),
    CONSTRAINT fk_orders_payment FOREIGN KEY (idClient, idPayment) REFERENCES payment(idClient, idPayment) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS delivery (
	idDelivery INT,
    idRequest INT,
	delivery_cost FLOAT DEFAULT 0,
    delivery_status ENUM ("Waiting Confirmation", "Unpacking", "Detaching", "Sending to the Carrying", "In Travel", "Delivered") 
    DEFAULT "Waiting Confirmation",
    sender_adress VARCHAR (255),
    final_adress VARCHAR (255),
    PRIMARY KEY (idRequest, idDelivery),
    CONSTRAINT fk_delivery_order FOREIGN KEY (idRequest) REFERENCES request(idOrder) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS warehouse (
	idWarehouse INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR (255),
    quantity INT DEFAULT 0    
);

CREATE TABLE IF NOT EXISTS provider (
	idProvider INT AUTO_INCREMENT PRIMARY KEY,
    prov_name VARCHAR(255),
    cnpj CHAR(15) NOT NULL,
    email VARCHAR(75) NOT NULL,
    phone CHAR(11),
    CONSTRAINT cnpj_unique UNIQUE (cnpj)
);

CREATE TABLE IF NOT EXISTS seller (
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    seller_name VARCHAR(255),
    cnpj CHAR(15),
    cpf CHAR(11),
    email VARCHAR(75) NOT NULL,
    phone CHAR(11),
    CONSTRAINT cnpj_unique UNIQUE (cnpj),
    CONSTRAINT cpf_unique UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS productBySeller (
	idSeller INT,
    idProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller) ON UPDATE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (idProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS providerByProduct (
	idProvider INT,
    idProduct INT,
    PRIMARY KEY (idProvider, idProduct),
    CONSTRAINT fk_product_provider FOREIGN KEY (idProvider) REFERENCES provider(idProvider) ON UPDATE CASCADE,
    CONSTRAINT fk_productByProvider FOREIGN KEY (idProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS productByRequest (
	idOrder INT,
    idProduct INT,
    quantity INT DEFAULT 1,
    stock_status ENUM ("Available", "Out of Stock") DEFAULT "Available",
    PRIMARY KEY (idOrder, idProduct),
    CONSTRAINT fk_request_product FOREIGN KEY (idOrder) REFERENCES request(idOrder) ON UPDATE CASCADE,
    CONSTRAINT fk_product_order FOREIGN KEY (idProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS productByStock (
	idStock INT,
    idProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idStock, idProduct),
    CONSTRAINT fk_stockqntt FOREIGN KEY (idStock) REFERENCES warehouse(idWarehouse) ON UPDATE CASCADE,
    CONSTRAINT fk_product_warehouse FOREIGN KEY (idProduct) REFERENCES product(idProduct) ON UPDATE CASCADE
);

