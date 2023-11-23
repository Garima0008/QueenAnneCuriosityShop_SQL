/*using queen_anne_curiosity_shop database
                                               Name: Garima Sharma
                                               StudentID: 300343374
*/


SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM VENDOR;
SELECT * FROM ITEM;
SELECT * FROM SALE;
SELECT * FROM SALE_ITEM;

/*   d   */
SELECT ItemID, ItemDescription
FROM ITEM
WHERE ItemCost >= 1000 AND (VendorID IN (SELECT DISTINCT VendorID FROM VENDOR WHERE CompanyName LIKE 'New%'));

/*   e   */
SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE SaleID = 1);

/*   f   */
SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE SaleID >= 1 AND SaleID <= 3);

SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE (SaleID = 1 OR SaleID = 2 OR SaleID = 3));

SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE (SaleID BETWEEN 1 AND 3));

/******************************************************* Trying new queries  ***************************************************************/
SELECT LastName, FirstName, Phone
FROM CUSTOMER JOIN SALE
ON CUSTOMER.CustomerID = SALE.CustomerID
WHERE SaleID = 1
ORDER BY LastName, FirstName, Phone;

SELECT LastName, FirstName, Phone
FROM CUSTOMER JOIN SALE
ON CUSTOMER.CustomerID = SALE.CustomerID
WHERE SaleID BETWEEN 1 AND 3
ORDER BY LastName, FirstName, Phone;

SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE SubTotal > 500);

SELECT DISTINCT LastName, FirstName, Phone
FROM CUSTOMER AS C JOIN SALE AS S
ON C.CustomerID = S.CustomerID
WHERE SubTotal > 500
ORDER BY LastName, FirstName;

SELECT LastName, FirstName, Phone
FROM CUSTOMER 
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM SALE WHERE SaleID IN (SELECT DISTINCT SaleID FROM SALE_ITEM WHERE ItemPrice >= 500));

SELECT DISTINCT LastName, FirstName, Phone
FROM CUSTOMER AS C JOIN SALE AS S
ON C.CustomerID = S.CustomerID
   JOIN SALE_ITEM AS SI
   ON S.SaleID = SI.SaleID
WHERE ItemPrice >= 500
ORDER BY LastName, FirstName;

SELECT LastName, FirstName, Phone 
FROM CUSTOMER WHERE CustomerID IN
 (SELECT CustomerID FROM SALE WHERE SaleID IN
 (SELECT SaleID FROM SALE_ITEM WHERE ItemID IN
 (SELECT ItemID FROM ITEM WHERE VendorID IN
 (SELECT VendorID FROM VENDOR WHERE CompanyName LIKE 'L%'))));

SELECT DISTINCT LastName, FirstName, C.Phone 
FROM CUSTOMER AS C JOIN SALE AS S 
ON C.CustomerID = S.CustomerID 
   JOIN SALE_ITEM AS SI 
   ON S.SaleID = SI.SaleID 
      JOIN ITEM AS I 
      ON SI.ItemID = I.ItemID 
         JOIN VENDOR AS V
         ON I.VendorID = V.VendorID 
            WHERE CompanyName LIKE'L%';
            
SELECT C.CustomerID, LastName, FirstName, Phone, SUM(SubTotal) AS SumOfSubTotal
FROM CUSTOMER AS C JOIN SALE AS S
ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID 
ORDER BY C.CustomerID DESC;

UPDATE VENDOR 
SET CompanyName = 'Linens and Other Stuff'
 WHERE CompanyName = 'Linens and Things';