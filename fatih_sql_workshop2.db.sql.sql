--Her kategorideki (CategoryID) ürün sayısını gösteren bir sorgu yazın.
--select categoryid,SUM(unitprice)
--from Products
--group by categoryid

--Birim fiyatı en yüksek 5 ürünü listeleyin.
--SELECT unitprice FROM Products
--order by unitprice DESC
--LIMIT 5

--Her tedarikçinin sattığı ürünlerin ortalama fiyatını listeleyin.
--SELECT supplierid, AVG(unitprice) FROM Products
--GROUP BY supplierid

--"Products" tablosunda birim fiyatı 100'den büyük olan ürünlerin kategorilerini ve bu kategorilerdeki ortalama fiyatı listeleyin.
--SELECT categoryid, unitprice from Products
--where (unitprice > 100) 
--GROUP by categoryid
--order BY categoryid

--"OrderDetails" tablosunda birim fiyat ve miktar çarpımıyla toplam satış değeri 1000'den fazla olan siparişleri listeleyin.
--SELECT * from [Order Details]
--WHERE (unitprice * quantity) > 1000

--En son sevk edilen 10 siparişi listeleyin
--SELECT shippeddate FROM Orders
--order by shippeddate DESC
--LIMIT 10

--"Products" tablosundaki ürünlerin ortalama fiyatını hesaplayın.
--SELECT AVG(unitprice) from Products


--"Products" tablosunda fiyatı 50’den büyük olan ürünlerin toplam stok miktarını hesaplayın.
--SELECT SUM(unitsinstock) 
--FROM Products
--WHERE unitprice > 50

--"Orders" tablosundaki en eski sipariş tarihini bulun.
--SELECT * FROM Orders
--ORDER BY orderdate ASC
--LIMIT 1

--"Employees" tablosundaki çalışanların kaç yıl önce işe başladıklarını gösteren bir sorgu yazın
--SELECT strftime('%Y', 'now') - strftime('%Y', hiredate) from Employees

--"OrderDetails" tablosundaki her bir sipariş için, birim fiyatın toplamını yuvarlayarak (ROUND) hesaplayın
--SELECT ROUND(unitprice) from [Order Details]

--Products" tablosunda stoktaki (UnitsInStock) ürün sayısını gösteren bir COUNT sorgusu yazın
--SELECT count(*) from Products
--where unitsinstock > 0

--"Products" tablosundaki en düşük ve en yüksek fiyatları hesaplayın
--SELECT MIN(unitprice) AS 'LOWER_PRICE',
--		MAX(unitprice) AS 'HIGHEST_PRICE'
--        FROM Products

--"Orders" tablosunda her yıl kaç sipariş alındığını listeleyin (YEAR() fonksiyonunu kullanarak)
--SELECT strftime('%Y', orderdate) AS 'YEARS', COUNT(*) FROM Orders
--GROUP BY YEARS

--"Employees" tablosundaki çalışanların tam adını (FirstName + LastName) birleştirerek gösterin.
--SELECT concat(firstname,' ', lastname) from Employees

--"Customers" tablosundaki şehir adlarının uzunluğunu (LENGTH) hesaplayın
--SELECT length(city) from Customers

--"Products" tablosundaki her ürünün fiyatını iki ondalık basamağa yuvarlayarak gösterin.
--SELECT ROUND(unitprice, 2) AS rounded_price
--FROM Products;

--"Orders" tablosundaki tüm siparişlerin toplam sayısını bulun.
--SELECT count(orderid) from Orders

--"Products" tablosunda her kategorideki (CategoryID) ürünlerin ortalama fiyatını (AVG) hesaplayın.
--SELECT categoryid,AVG(unitprice) from Products
--GROUP by categoryid

--"Orders" tablosunda sevk tarihi (ShippedDate) boş olan siparişlerin yüzdesini (COUNT ve toplam sipariş sayısını kullanarak) hesaplayın.
--SELECT SUM(shippeddate IS NULL), SUM(shippeddate IS NOT NULL) FROM ORDERS

--"Products" tablosundaki en pahalı ürünün fiyatını bulun ve bir fonksiyon kullanarak fiyatı 10% artırın
--SELECT MAX(unitprice)* 1.1 from Products

--"Products" tablosundaki ürün adlarının ilk 3 karakterini gösterin (SUBSTRING).
--SELECT SUBSTRING(productname,1,3) FROM Products

--"Orders" tablosunda verilen siparişlerin yıl ve ay bazında kaç sipariş alındığını hesaplayın (YEAR ve MONTH fonksiyonları).
--SELECT strftime('%y',orderdate) as order_year, strftime('%m', orderdate) as order_month, COUNT(*) from orders
--GROUP by order_year

--OrderDetails" tablosunda toplam sipariş değerini (UnitPrice * Quantity) hesaplayıp, bu değeri iki ondalık basamağa yuvarlayarak gösterin.
--SELECT ROUND((unitprice * quantity),2) FROM [Order Details]

--"Products" tablosunda stokta olmayan (UnitsInStock = 0) ürünlerin fiyatlarını toplam fiyat olarak hesaplayın
--SELECT unitsinstock, SUM(unitprice) from Products
--where unitsinstock != 0 