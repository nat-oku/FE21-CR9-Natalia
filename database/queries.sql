/* adding products to products table */
Insert into products VALUES
(ProductID, 'Pork - Bacon,back Peameal', 'Cord about the eroduct', 'http://dummyimage.com/201x100.png/5fa2dd/ffffff', 822687631, 7.2),
(ProductID, 'Plasticknivesblack', 'nord about the product', 'http://dummyimage.com/202x100.png/ff4444/ffffff', 101977522, 79.3),
(ProductID, 'Cut Wakame - Hanawakaba', 'tord about the Troduct', 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 257093976, 43.5),
(ProductID, 'Chocolate - Chips Compound', 'Oord about the wroductt', 'http://dummyimage.com/107x100.png/5fa2dd/ffffff', 285272353, 26.5),
(ProductID, 'Bread - Rolls, Rye', 'mord about the kroduct', 'http://dummyimage.com/141x100.png/dddddd/000000', 604882647, 45.1),
(ProductID, 'Lentils - Green, Dry', 'Mord about the iroduct', 'http://dummyimage.com/161x100.png/ff4444/ffffff', 938386323, 15.6),
(ProductID, 'Oil - Macadamia', 'Hord about the rroduct', 'http://dummyimage.com/179x100.png/ff4444/ffffff', 311367833, 80.9),
(ProductID, 'Cheese - Goat With Herbs', 'Cord about the Qroduct', 'http://dummyimage.com/212x100.png/cc0000/ffffff', 502792393, 34.9),
(ProductID, 'True - Vue Containers', 'uord about the zroduct', 'http://dummyimage.com/190x100.png/cc0000/ffffff', 098927325, 90.7);



-- 1 QUERY: List all products offered by each supplier by product name
SELECT products.ProductName, supplier.SupplierID
FROM((sells INNER JOIN products ON fk_product_id = products.ProductID) INNER JOIN supplier ON fk_supplier_id = supplier.SupplierID)




-- how many products were bought from a specific company
  -- (1) Which products were bought
  -- (2) how many products were paid for
  SELECT COUNT(PaymentID) as no_of_products_paid from payment where payment.DateOfPayment is not NULL;




-- 2 QUERY: who purchased which product on which date
SELECT customers.CustomerID, customers.FirstName, customers.LastName, products.ProductName, buy.DateOfBuy
from buy
INNER join customers on buy.fk_customer_id = customers.CustomerID 
INNER join products on buy.fk_product_id = products.ProductID


-- 3 QUERY: are there any customers who haven't purchased yet?
SELECT customers.CustomerID, customers.FirstName, customers.LastName, buy.DateOfBuy
from customers
left join buy on buy.fk_customer_id = customers.CustomerID



-- 4 QUERY: Show me the customers who actively searched for products between 01.06.2002 and now
SELECT searches.SearchID, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from customers 
INNER JOIN searches on searches.fk_customer_id = customers.CustomerID where searches.SearchDate >= '2020-06-01' && searches.SearchDate <= CURRENT_DATE



-- 5 QUERY: Show me customers who have not searched for products
SELECT searches.SearchID, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from customers 
left JOIN searches on searches.fk_customer_id = customers.CustomerID WHERE searches.SearchDate is null



--  6 QUERY: Show me the customers who actively searched for products between 01.06.2002 and now & show me the products they are interested in
SELECT searches.SearchID, products.ProductName, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from products
INNER join searches on searches.fk_product_id = products.ProductID
INNER JOIN customers on searches.fk_customer_id = customers.CustomerID where searches.SearchDate >= '2020-06-01' && searches.SearchDate <= CURRENT_DATE


-- 7 QUERY: how many customers received a parcel?
SELECT COUNT(*) from delivers_products_to;

-- 8 QUERY: how often did a customer receive a parcel from each shipping company?
SELECT customers.CustomerID, COUNT(fk_customer_id) as 'Number_of_times', shipping_company.ShippingCompanyName
from delivers_products_to
INNER JOIN customers on delivers_products_to.fk_customer_id = customers.CustomerID
INNER join shipping_company on delivers_products_to.fk_shipping_company_id = shipping_company.ShippingCompanyID
GROUP by delivers_products_to.fk_shipping_company_id