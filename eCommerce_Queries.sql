-- Quantos pedidos foram feitos por cliente? | How many buy request did by each client?
SELECT concat(c.Cname, " ", c.Csurname) AS name, COUNT(c.Cname) AS buys FROM request r
JOIN client c
ON r.idClient = c.idClient
GROUP BY name;

-- Quais os pedidos feitos por cada cliente? | What orders each client did?
SELECT concat(c.Cname, " ", c.Csurname) AS name, idOrder FROM request r
JOIN client c
ON r.idClient = c.idClient
GROUP BY name, idOrder;

-- Quais os pedidos feitos por Charles Oliveira? | What's Charles Oliveira's buy requests?
SELECT c.idClient AS idClient, concat(c.Cname, " ", c.Csurname) AS Cname, idOrder FROM request r
JOIN client c
ON r.idClient = c.idClient
WHERE c.idClient = 1
ORDER BY idOrder;

-- Quais os conteúdos de cada pedido? | What's every buy request content?
SELECT r.idOrder, r.statement, pr.quantity, p.Pname AS product, p.category, p.price, r.price AS total_price FROM request r
JOIN productbyrequest pr
ON r.idOrder = pr.idOrder
JOIN product p
ON pr.idProduct = p.idProduct
ORDER BY r.idOrder;

-- Qual a situação de cada pedido? | What's last update of each request?
SELECT r.idOrder, r.statement, d.delivery_status, d.delivery_cost FROM request r
JOIN delivery d
ON r.idOrder = d.idOrder;

-- Produto em cada estoque atualizado com as vendas | Product by storage, updated for the sold
SELECT idWarehouse, p.Pname, p.idProduct, (ps.quantity - pr.sold) AS total
FROM warehouse w
JOIN productbystock ps
ON w.idWarehouse = ps.idStock
LEFT JOIN (SELECT idProduct, SUM(quantity) AS sold FROM productbyrequest GROUP BY idProduct) pr
ON ps.idProduct = pr.idProduct
LEFT JOIN product p
ON ps.idProduct = p.idProduct;