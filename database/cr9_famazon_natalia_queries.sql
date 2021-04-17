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


/* *** 2 QUERY: SEE THE END OF THE DOCUMENT *** */


-- 3 QUERY: are there any customers who haven't purchased yet?
SELECT customers.CustomerID, customers.FirstName, customers.LastName, buy.DateOfBuy
from customers
LEFT JOIN buy on buy.fk_customer_id = customers.CustomerID



-- 4 QUERY: Show me the customers who actively searched for products between 01.06.2002 and now
SELECT searches.SearchID, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from customers 
INNER JOIN searches on searches.fk_customer_id = customers.CustomerID where searches.SearchDate >= '2020-06-01' && searches.SearchDate <= CURRENT_DATE


/* *** 6 QUERY: SEE THE END OF THE DOCUMENT *** */


-- 5 QUERY: Show me customers who have not searched for products
SELECT searches.SearchID, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from customers 
left JOIN searches on searches.fk_customer_id = customers.CustomerID WHERE searches.SearchDate is null


-- 7 QUERY: how many customers received a parcel?
SELECT COUNT(*) from delivers_products_to;


/* *** 8 QUERY: SEE THE END OF THE DOCUMENT *** */


-- 9 QUERY: show me unpaid invoices
SELECT * from payment where payment.DateOfPayment is null;

-- 10 QUERY: -- How many products were bought & succesfully paid for?

SELECT (
	SELECT COUNT(*) from buy)
    as no_of_buys,
    (SELECT COUNT(*) from products)
    as no_of_products,
    (SELECT COUNT(*) from sells)
    as no_of_total_sells,
    (SELECT COUNT(*) from successful)
    as no_of_successful_payments;


-- 11 QUERY: which products were bought from a specific company
  SELECT products.ProductID, products.ProductName, buy.DateOfBuy
  from buy
  INNER JOIN products on buy.fk_product_id = products.ProductID WHERE buy.DateOfBuy is not null

-- 12 QUERY: how many products were paid for
SELECT COUNT(PaymentID) as no_of_products_paid from payment where payment.DateOfPayment is not NULL;





/* **** QUERIES CONNECTING MORE THAN 3 TABLES *** */


-- 2 QUERY: who purchased which product on which date
SELECT customers.CustomerID, customers.FirstName, customers.LastName, products.ProductName, buy.DateOfBuy
from buy
INNER join customers on buy.fk_customer_id = customers.CustomerID 
INNER join products on buy.fk_product_id = products.ProductID

--  6 QUERY: Show me the customers who actively searched for products between 01.06.2002 and now & show me the products they are interested in
SELECT searches.SearchID, products.ProductName, customers.CustomerID, customers.FirstName, customers.LastName, searches.SearchDate
from products
INNER join searches on searches.fk_product_id = products.ProductID
INNER JOIN customers on searches.fk_customer_id = customers.CustomerID where searches.SearchDate >= '2020-06-01' && searches.SearchDate <= CURRENT_DATE


-- 8 QUERY: how often did a customer receive a parcel from each shipping company?
SELECT customers.CustomerID, COUNT(fk_customer_id) as 'Number_of_times', shipping_company.ShippingCompanyName
from delivers_products_to
INNER JOIN customers on delivers_products_to.fk_customer_id = customers.CustomerID
INNER join shipping_company on delivers_products_to.fk_shipping_company_id = shipping_company.ShippingCompanyID
GROUP by delivers_products_to.fk_shipping_company_id























    
-- 10 QUERY: -- Show me all table data next to each other

SELECT (
	SELECT COUNT(*) from buy)
    as no_of_buys,
    (SELECT COUNT(*)
     from creates_invoice_for) as no_of_invoices,
    (SELECT COUNT(*) from customers)
    as no_of_customers,
    (SELECT COUNT(*) from delivers_products_to)
    as no_of_deliveries,
    (SELECT COUNT(*) from gives_to_delivery)
    as no_of_given_deliveries,
    (SELECT COUNT(*) from payment)
    as no_of_payments,
    (SELECT COUNT(*) from payment_form)
    as no_of_payment_forms,
    (SELECT COUNT(*) from products)
    as no_of_products,
    (SELECT COUNT(*) from searches)
    as no_of_searches,
    (SELECT COUNT(*) from sells)
    as no_of_total_sells,
    (SELECT COUNT(*) from shipping_company)
    as no_of_all_shipping_companies,
    (SELECT COUNT(*) from successful)
    as no_of_successful_payments,
    (SELECT COUNT(*) from supplier)
    as no_of_all_supliers;