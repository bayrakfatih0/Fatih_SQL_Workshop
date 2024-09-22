--1. En Pahalı Ürünü Getirin
--SELECT MAX(unitprice) from Products
--order by unitprice ASC

--2. En Son Verilen Siparişi Bulun
--SELECT orderdate FROM Orders
--ORDER BY shippeddate DESC
--LIMIT 1

--3. Fiyatı Ortalama Fiyattan Yüksek Olan Ürünleri Getirin
--SELECT productname, unitprice from Products
--WHERE unitprice > (SELECT AVG(unitprice) as ortalama from Products)
 
 --4. Belirli Kategorilerdeki Ürünleri Listeleyin
 --SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductName FROM Categories
 --left JOIN Products on Categories.CategoryID = Products.CategoryID
 
 --5. En Yüksek Fiyatlı Ürünlere Sahip Kategorileri Listeleyin
 --SELECT Products.ProductID,Products.ProductName,MAX(Products.UnitPrice),Categories.CategoryID, Categories.CategoryName from Categories
 --JOIN Products ON Categories.CategoryID = Products.CategoryID
 --GROUP by Categories.CategoryID

--6. Bir Ülkedeki Müşterilerin Verdiği Siparişleri Listeleyin
--SELECT customers.CustomerID,Customers.CompanyName,Customers.Country,Orders.OrderID from Customers
--JOIN Orders on Customers.CustomerID = Orders.CustomerID
--order by country

--7. Her Kategori İçin Ortalama Fiyatın Üzerinde Olan Ürünleri Listeleyin
--SELECT Products.ProductID,Products.ProductName,Products.UnitPrice, AVG(Products.UnitPrice) AS ortalama, Categories.CategoryID, Categories.CategoryName from Categories
--JOIN Products on Categories.CategoryID = Products.CategoryID
--where Products.UnitPrice > (SELECT AVG(Products.UnitPrice) AS ortalama FROM Products)
--GROUP by Products.ProductID

--8. Her Müşterinin En Son Verdiği Siparişi Listeleyin
--SELECT Orders.OrderID, MAX(Orders.OrderDate) AS son_order, Customers.CustomerID,Customers.CompanyName from Customers
--JOIN Orders on Customers.CustomerID = Orders.CustomerID
--GROUP BY Customers.CustomerID
--order by son_order desc

--9. Her Çalışanın Kendi Departmanındaki Ortalama sipariş alan Üzerinde sipariş Alıp Almadığını Bulun
--SELECT Employees.EmployeeID, CONCAT(Employees.FirstName,' ', Employees.LastName) AS name_emp, COUNT(Orders.OrderID) as toplam_order
--FROM Employees
--JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--GROUP BY Employees.EmployeeID, name_emp
--HAVING COUNT(Orders.OrderID) > (SELECT AVG(order_count) FROM 
--   (SELECT COUNT(OrderID) AS order_count FROM Orders GROUP BY EmployeeID))
--ORDER BY Employees.EmployeeID;

--10. En Az 10 Ürün Satın Alınan Siparişleri Listeleyin
--SELECT Orders.OrderID, COUNT([OrderDetails].ProductID) AS TotalProducts
--FROM Orders
--JOIN [OrderDetails] ON Orders.OrderID = [OrderDetails].OrderID
--GROUP BY Orders.OrderID
--HAVING COUNT([OrderDetails].ProductID) >= 10;

--11. Her Kategoride En Pahalı Olan Ürünlerin Ortalama Fiyatını Bulun
--SELECT Categories.CategoryID, Categories.CategoryName, AVG(MaxPrice) AS AverageMaxPric FROM 
--(SELECT Categories.CategoryID, Categories.CategoryName, MAX(Products.UnitPrice) AS MaxPrice FROM Categories
--JOIN Products ON Categories.CategoryID = Products.CategoryID
--GROUP BY Categories.CategoryID, Categories.CategoryName) AS HighestPrices
--GROUP BY Categories.CategoryID, Categories.CategoryName;

--12. Müşterilerin Verdiği Toplam Sipariş Sayısına Göre Sıralama Yapın
--SELECT Customers.CustomerID, Customers.CompanyName, COUNT(Orders.OrderID) AS TotalOrders
--FROM Customers
--LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--GROUP BY Customers.CustomerID, Customers.CompanyName
--ORDER BY TotalOrders DESC;

--13. En Fazla Sipariş Vermiş 5 Müşteriyi ve Son Sipariş Tarihlerini Listeleyin
--SELECT Customers.CustomerID, Customers.CompanyName, COUNT(Orders.OrderID) AS TotalOrders, MAX(Orders.OrderDate) AS LastOrderDate
--FROM Customers
--JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--GROUP BY Customers.CustomerID, Customers.CompanyName
--ORDER BY TotalOrders DESC
--LIMIT 5;

--14. Toplam Ürün Sayısı 15'ten Fazla Olan Kategorileri Listeleyin
--SELECT Categories.CategoryID, Categories.CategoryName, COUNT(Products.ProductID) AS TotalProducts
--FROM Categories
--LEFT JOIN Products ON Categories.CategoryID = Products.CategoryID
--GROUP BY Categories.CategoryID, Categories.CategoryName
--HAVING COUNT(Products.ProductID) > 15;

--15. En Fazla 5 Farklı Ürün Sipariş Eden Müşterileri Listeleyin
--SELECT Customers.CustomerID, Customers.CompanyName, COUNT(DISTINCT OrderDetails.ProductID) AS UniqueProducts
--FROM Customers
--JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--GROUP BY Customers.CustomerID, Customers.CompanyName
--ORDER BY UniqueProducts DESC
--LIMIT 5;

--16. 20'den Fazla Ürün Sağlayan Tedarikçileri Listeleyin
--SELECT Suppliers.SupplierID, Suppliers.CompanyName, COUNT(Products.ProductID) AS TotalProducts
--FROM Suppliers
--LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
--GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
--HAVING COUNT(Products.ProductID) > 20;

--17. Her Müşteri İçin En Pahalı Ürünü Bulun
--SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID, Products.ProductName, MAX(Products.UnitPrice) AS MaxPrice
--FROM Customers
--JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--JOIN Products ON OrderDetails.ProductID = Products.ProductID
--GROUP BY Customers.CustomerID, Customers.CompanyName, Orders.OrderID, Products.ProductName
--HAVING Products.UnitPrice = (
--    SELECT MAX(Products.UnitPrice)
--    FROM OrderDetails
--    JOIN Products ON OrderDetails.ProductID = Products.ProductID
--    WHERE Orders.OrderID = OrderDetails.OrderID)
--ORDER BY MaxPrice DESC;

--18. 10.000'den Fazla Sipariş Değeri Olan Çalışanları Listeleyin
--SELECT Employees.EmployeeID, CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalOrderValue
--FROM Employees
--JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--GROUP BY Employees.EmployeeID, EmployeeName
--HAVING SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) > 10000;

--19. Kategorisine Göre En Çok Sipariş Edilen Ürünü Bulun
--SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID, Products.ProductName, COUNT(OrderDetails.ProductID) AS OrderCount
--FROM Categories
--JOIN Products ON Categories.CategoryID = Products.CategoryID
--JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
--JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
--GROUP BY Categories.CategoryID, Products.ProductID
--HAVING COUNT(OrderDetails.ProductID) = (
--    SELECT MAX(ProductCount)
--    FROM (
--        SELECT COUNT(OrderDetails.ProductID) AS ProductCount
--        FROM OrderDetails
--        JOIN Products ON OrderDetails.ProductID = Products.ProductID
--        JOIN Categories ON Products.CategoryID = Categories.CategoryID
--        GROUP BY Products.ProductID
--    ) AS ProductCounts
--)
--ORDER BY Categories.CategoryID;

--20. Müşterilerin En Son Sipariş Verdiği Ürün ve Tarihlerini Listeleyin
--SELECT Customers.CustomerID, Customers.CompanyName, Products.ProductID, Products.ProductName, Orders.OrderDate
--FROM Customers
--JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--JOIN Products ON OrderDetails.ProductID = Products.ProductID
--WHERE Orders.OrderDate = (
--    SELECT MAX(OrderDate)
--    FROM Orders AS o
--    WHERE o.CustomerID = Customers.CustomerID
--)
--ORDER BY Customers.CustomerID;

--21. Her Çalışanın Teslim Ettiği En Pahalı Siparişi ve Tarihini Listeleyin
--SELECT Employees.EmployeeID, CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName, Orders.OrderID, Orders.OrderDate, MAX(OrderDetails.UnitPrice * OrderDetails.Quantity) AS MaxOrderValue
--FROM Employees
--JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--GROUP BY Employees.EmployeeID, EmployeeName, Orders.OrderID, Orders.OrderDate
--HAVING MAX(OrderDetails.UnitPrice * OrderDetails.Quantity) = (
--    SELECT MAX(OrderDetails.UnitPrice * OrderDetails.Quantity)
--    FROM Orders AS o
--    JOIN OrderDetails ON o.OrderID = OrderDetails.OrderID
--    WHERE o.EmployeeID = Employees.EmployeeID
--)
--ORDER BY Employees.EmployeeID;

--22. En Fazla Sipariş Verilen Ürünü ve Bilgilerini Listeleyin
--SELECT Products.ProductID, Products.ProductName, COUNT(OrderDetails.ProductID) AS TotalOrders, SUM(OrderDetails.Quantity) AS TotalQuantity
--FROM Products
--JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
--JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
--GROUP BY Products.ProductID, Products.ProductName
--ORDER BY TotalOrders DESC
--LIMIT 1;