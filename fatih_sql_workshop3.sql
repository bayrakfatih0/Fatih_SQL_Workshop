--1_Verilen Customers ve Orders tablolarını kullanarak, Customers tablosundaki müşterileri ve onların verdikleri
--siparişleri birleştirerek listeleyin. Müşteri adı, sipariş ID'si ve sipariş tarihini gösterin
--SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate from Customers
--JOIN Orders

--2_Verilen Suppliers ve Products tablolarını kullanarak tüm tedarikçileri ve onların sağladıkları ürünleri listeleyin.
--Eğer bir tedarikçinin ürünü yoksa, NULL olarak gösterilsin.
--SELECT Suppliers.CompanyName, Products.ProductName, Suppliers.SupplierID, Products.ProductID from Suppliers
--LEFT JOIN Products on Suppliers.SupplierID = Products.SupplierID

--3_Verilen Employees ve Orders tablolarını kullanarak tüm siparişleri ve bu siparişleri işleyen çalışanları listeleyin. 
--Eğer bir sipariş bir çalışan tarafından işlenmediyse, çalışan bilgileri NULL olarak gösterilsin.
--SELECT Employees.EmployeeID, CONCAT(Employees.FirstName, ' ', Employees.LastName), Orders.OrderID from Employees
--RIGHT JOIN Orders on Employees.EmployeeID = Orders.EmployeeID

--4_Verilen Customers ve Orders tablolarını kullanarak tüm müşterileri ve tüm siparişleri listeleyin.
--Sipariş vermeyen müşteriler ve müşterisi olmayan siparişler için NULL döndürün.
--SELECT Customers.CustomerID, Orders.OrderID from Customers
--full OUTER JOIN Orders on Customers.CustomerID = Orders.CustomerID

--5_Verilen Products ve Categories tablolarını kullanarak tüm ürünler ve tüm kategoriler için olası tüm kombinasyonları listeleyin.
--Sonuç kümesindeki her satır bir ürün ve bir kategori kombinasyonunu göstermelidir.
--SELECT Categories.CategoryID, Products.ProductID from Categories
--INNER JOIN Products on Categories.CategoryID = Products.CategoryID

--6_Verilen Orders, Customers, Employees tablolarını kullanarak bu tabloları birleştirin ve 1998 yılında verilen siparişleri listeleyin. 
--Müşteri adı, sipariş ID'si, sipariş tarihi ve ilgili çalışan adı gösterilsin.
--SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID, Orders.OrderDate, CONCAT(Employees.FirstName, ' ', Employees.LastName) from Orders
--JOIN Employees, Customers
--where strftime('%Y', Orders.OrderDate) = '2023'

--7_verilen Orders ve Customers tablolarını kullanarak müşterileri, verdikleri sipariş sayısına göre gruplandırın.
--Sadece 5’ten fazla sipariş veren müşterileri listeleyin
--SELECT Customers.CustomerID, COUNT(Orders.OrderID) from Customers
--INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--GROUP by Customers.CustomerID
--HAVING COUNT(Orders.OrderID) > 5;

--8_Verilen OrderDetails ve Products tablolarını kullanarak her ürün için kaç adet satıldığını ve toplam satış miktarını listeleyin.
--Ürün adı, satılan toplam adet ve toplam kazancı (Quantity * UnitPrice) gösterin
--SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantity, SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalSales FROM OrderDetails
--INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
--GROUP BY Products.ProductName;

--9_Verilen Customers ve Orders tablolarını kullanarak, müşteri adı "B" harfiyle başlayan müşterilerin siparişlerini listeleyin
--SELECT Customers.CompanyName, Orders.OrderID FROM Customers
--JOIN Orders
--WHERE Customers.CompanyName LIKE 'B%'

--10_Verilen Products ve Categories tablolarını kullanarak tüm kategorileri listeleyin ve ürünleri olmayan kategorileri bulun.
--Ürün adı NULL olan satırları gösterin
--SELECT Categories.CategoryID, Categories.CategoryName, Products.ProductID FROM Products
--RIGHT JOIN Categories on Categories.CategoryID = Products.CategoryID
--WHERE Categories.CategoryID IS NULL;

--11_Verilen Employees tablosunu kullanarak her çalışanın yöneticisiyle birlikte bir liste oluşturun.
--SELECT e1.EmployeeID,CONCAT(e1.FirstName, ' ', e1.LastName) as "Çalışan",CONCAT(e2.FirstName, ' ', e2.LastName) as "Yöneticisi" FROM Employees e1
--join Employees e2 on e1.ReportsTo = e2.EmployeeI

--12_Verilen Products tablosunu kullanarak her kategorideki en pahalı ürünleri ve bu ürünlerin farklı 
--fiyatlara sahip olup olmadığını sorgulayın
--SELECT DISTINCT Products.UnitPrice, Products.ProductID,Products.ProductID ,Categories.CategoryID,Categories.CategoryName from Categories
--left join Products on Categories.CategoryID = Products.CategoryID
--order by Products.UnitPrice desc

--13_Verilen Orders ve l--OrderDetails tablolarını kullanarak bu tabloları birleştirin ve her siparişin 
--detaylarını sipariş ID'sine göre artan sırada listeleyin.
--SELECT Orders.OrderID, Orders.CustomerID, Orders.OrderDate, OrderDetails.ProductID, OrderDetails.Quantity, OrderDetails.UnitPrice FROM Orders
--JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
--ORDER BY Orders.OrderID ASC;

--14_Verilen Employees ve Orders tablolarını kullanarak her çalışanın kaç tane sipariş işlediğini listeleyin. 
--Sipariş işlemeyen çalışanlar da gösterilsin.
--SELECT CONCAT(Employees.FirstName,' ', Employees.LastName), Employees.EmployeeID, COUNT(Orders.OrderID) AS 'TOTAL_ORDERS' FROM Employees
--LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--GROUP BY Employees.EmployeeID, CONCAT(Employees.FirstName, ' ', Employees.LastName)
--ORDER BY TOTAL_ORDERS

--15_Verilen Products tablosunu kullanarak bir kategorideki ürünleri kendi arasında 
--fiyatlarına göre karşılaştırın ve fiyatı düşük olan ürünleri listeleyin
--SELECT Products.ProductID, Products.ProductName, Products.UnitPrice FROM Products
--ORDER BY Products.UnitPrice

--16_Verilen Products ve Suppliers tablolarını kullanarak tedarikçiden alınan en pahalı ürünleri listeleyin
--SELECT Products.ProductID,Products.ProductName, Products.UnitPrice, Suppliers.SupplierID, Suppliers.CompanyName FROM Suppliers
--LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
--GROUP BY Products.ProductID
--ORDER BY Products.UnitPrice DESC


--17_Verilen Employees ve Orders tablolarını kullanarak her çalışanın işlediği en son siparişi bulun
--SELECT Employees.EmployeeID, CONCAT(Employees.FirstName,' ', Employees.LastName) AS employees_name, Orders.OrderID, (Orders.OrderDate) from Employees
--left JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
--GROUP BY employees_name 
--order by Orders.OrderDate asc

--18_Verilen Products tablosunu kullanarak ürünleri 
--fiyatlarına göre gruplandırın ve fiyatı 20 birimden fazla olan ürünlerin sayısını listeleyin.
--SELECT Products.ProductID, Products.ProductName, Products.UnitPrice AS birim_fiyat FROM Products
--WHERE birim_fiyat>20

--19_Verilen Orders ve Customers tablolarını kullanarak 1997 ile 1998 yılları 
--arasında verilen siparişleri müşteri adıyla birlikte listeleyin.
--SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID,Orders.OrderDate from Customers
--left JOIN Orders on Customers.CustomerID = Orders.CustomerID
--WHERE Orders.OrderDate BETWEEN '2016-01-01' AND '2017-12-31'
--order by Orders.OrderDate;

--20_Verilen Customers ve Orders tablolarını kullanarak hiç sipariş vermeyen müşterileri listeleyin
--SELECT Customers.CustomerID, Customers.CompanyName, Orders.OrderID from Customers
--JOIN Orders on Customers.CustomerID = Orders.CustomerID
--WHERE Orders.OrderID IS NULL
