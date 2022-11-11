INSERT INTO client (Cname, Csurname, cpf, phone, email, birthdate, street, s_number, city, state)
VALUES	("Charles", "Oliveira", "11122233344", NULL, "charles@gmail.com", NULL, NULL, NULL, NULL, NULL),
		("Giovanna", "Melo", "44433322211", NULL, "giovanna@gmail.com", NULL, NULL, NULL, NULL, NULL),
        ("Everton", "Santos", "22233311144", NULL, "everton@hotmail.com", NULL, NULL, NULL, NULL, NULL),
        ("Fabio", "Faria", "55544433322", NULL, "fabiof@hotmail.com", NULL, NULL, NULL, NULL, NULL);
	
INSERT INTO payment (idClient, paymentType, verification_code, validity, value_limit, useful)
VALUES	(1, "Credit Card", NULL, NULL, NULL, 1),
		(1, "Pix", NULL, NULL, NULL, 1),
		(2, "Debit Card", NULL, NULL, NULL, 1),
		(3, "QR Code", NULL, NULL, NULL, 1),
		(3, "Credit Card", NULL, NULL, NULL, 1),
        (3, "Pix", NULL, NULL, NULL, 1),
        (4, "Credit Card", NULL, NULL, NULL, 0);
        
INSERT INTO product (Pname, category, price, underage, rating)
VALUES	("Earphone Wireless | JBS", "Eletronic", 200, DEFAULT, DEFAULT),
		("Earphone | Sony", "Eletronic", 150, DEFAULT, DEFAULT),
        ("Tshirt PP | Adidas", "Clothing", 80, DEFAULT, DEFAULT),
        ("Mouse | Razor", "Eletronic", 399.99, DEFAULT, DEFAULT),
        ("Puppet 45cm", "Toy", 150, DEFAULT, DEFAULT),
        ("Airfryer | Philips", "Domestic", 600, DEFAULT, 4),
        ("Shoes 33'| Puma", "Clothing", 99.99, DEFAULT, 5);
        
INSERT INTO warehouse (location, quantity)
VALUES ("Osasco", NULL),
		("Lapa", NULL),
        ("Itaquera", NULL);
        
INSERT INTO provider (prov_name, cnpj, email, phone)
VALUES	(NULL, 111111111111111, "prov1@yahoo.com.br", NULL),
		(NULL, 221111111111111, "prov2@yahoo.com.br", NULL),
        (NULL, 331111111111111, "prov3@yahoo.com.br", NULL),
        (NULL, 441111111111111, "prov4@yahoo.com.br", NULL);
        
INSERT INTO seller (seller_name, cnpj, cpf, email, phone)
VALUES	("Abigail", NULL, 55566677788, "abigail@gmail.com", NULL),
		("Rodrigo", NULL, 66655577788, "rodrigo@gmail.com", NULL),
        ("Tech Informatica", 456789101213145, NULL, "contato@techinfo.com", NULL),
        ("FreeClothing.com", 999989101213145, NULL, "contato@clothing.com", NULL);

INSERT INTO request (idPayment, idClient, statement, details, price)
VALUES	(1, 1, "Paid", NULL, 350),
        (7, 4, "Travelling", NULL, 280),
        (3, 2, "Travelling", NULL, 179.99),
        (4, 3, "Finished", NULL, 300),
        (5, 3, Default, NULL, 600),
        (6, 3, "Travelling", NULL, 280),
        (2, 1, Default, NULL, 399.99);
        
INSERT INTO providerbyproduct
VALUES 	(1, 1),
		(1, 2),
        (2, 3),
        (1, 4),
		(3, 5),
        (4, 6),
        (2, 7);
        
INSERT INTO productbystock
VALUES (1, 1, 50),
		(1, 2, 50),
        (2, 3, 50),
        (1, 4, 50),
        (2, 5, 50),
        (2, 6, 50),
        (2, 7, 50);
        
INSERT INTO productbyrequest
VALUES	(1, 1, 1, DEFAULT),
		(1, 2, 1, DEFAULT),
        (2, 4, 1, DEFAULT),
        (3, 3, 1, DEFAULT),
        (3, 7, 1, DEFAULT),
        (4, 5, 2, DEFAULT),
        (5, 2, 2, DEFAULT),
        (5, 5, 2, DEFAULT),
        (6, 1, 1, DEFAULT),
        (6, 3, 1, DEFAULT),
        (7, 4, 1, DEFAULT);
        
INSERT INTO productbyseller
VALUES	(1, 1, 1),
		(1, 2, 1),
        (2, 4, 1),
        (3, 3, 1),
        (3, 7, 1),
        (4, 5, 2),
        (3, 2, 2),
        (3, 5, 2),
        (3, 1, 1),
        (1, 3, 1);
        
INSERT INTO delivery (idOrder, delivery_cost, delivery_status, sender_adress, final_adress)
VALUES	(1, 10, Default, "Av. Jabuti, 21", "Rua Jacarezinho, 55"),
		(2, 25, "Detaching", "Av. Jabuti, 21", "Rodovia Raposo Tavares, KM55"),
        (3, 25, "Unpacking", "Av. Jabuti, 21", "Av. Limoeiro, 43"),
        (4, 50, "Delivered", "Av, Randolfo Soares, 56", "Estr. Castelo Branco, 2"),
        (6, 10, "In Travel", "Av. Randolfo Soares, 56", "Av. Juarez, 33");