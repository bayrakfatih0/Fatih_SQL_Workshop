-- SELECT * FROM Suppliers
-- WHERE supplierid <=5

-- SELECT * FROM Suppliers
-- WHERE supplierid in(1,2,4,5)

-- select * from Products
-- WHERE productname LIKE '%Chang%' or productname like '%Aniseed Syrup%'

-- SELECT * FROM Products
-- WHERE supplierid = 3 AND unitprice > 10

-- SELECT productname, unitprice FROM Products

-- SELECT productname, unitprice FROM Products
-- WHERE UPPER(ProductName) LIKE '%C%';

-- SELECT * from Products
-- where productname like 'n%' AND LENGTH(ProductName) - LENGTH(REPLACE(ProductName, 'n', '')) = 1;

-- select * from Products
-- where unitsinstock > 50

-- select * from Products
-- WHERE unitprice = (SELECT MIN(unitprice) FROM Products)
-- or unitprice = (SELECT MAX(unitprice) from Products)

-- select * from Products
-- WHERE productname LIKE '%Spiced%';