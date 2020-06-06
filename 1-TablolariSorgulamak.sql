--NOT: Sorgularýmýzý yazarken küçük-büyük harfe dikkat etmemize gerek yoktur. (Eðer baþlangýçta Server kurulurken bu ayar seçilmiþ ise)

--Yorum Satýrý

/*
	Çoklu
	Yorum 
	Satýrý
 */

--DML -> Data Manipulation Language

Use Northwind --Northwind veritabaný üzerinde sorgulamalar yapacaðýmýz için ya bu þekilde sorgu ile yada sol üstte bulunan 'Avaible Databases' combobox'ýný kulllanarak  veritabanýmýzý seçeriz.

--TABLOLARI SORGULAMAK

--Select <sütun_adlarý> From <tablo_adý> -- (Sütýnlar arasýnda virgül var)

--Employees tablosundaki tüm kayýtlarý listeleyelim

Select * From Employees 

--Result Ekranýný CTRL + R ile açýp kapatabilirsiniz...

--Kolonlarý Filtrelemek

/*
select
	<kolonadi>,
	<kolonadi>,
	<kolonadi>,
	<kolonadi>
From <tabloadi>

*/
--1.Yöntem
Select 
	CategoryID,
	ProductID,
	ProductName,
	UnitPrice,
	UnitsInStock
From Products

--2.Yöntem
Select
	Products.CategoryID,
	Products.ProductID,
	Products.ProductName,
	Products.UnitPrice,
	Products.UnitsInStock
From Products

--3.Yöntem
Select 
	p.CategoryID,
	p.ProductID,
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p

--4.Yöntem
Select 
	Northwind.dbo.Products.CategoryID,
	Northwind.dbo.Products.ProductID,
	Northwind.dbo.Products.ProductName,
	Northwind.dbo.Products.UnitPrice,
	Northwind.dbo.Products.UnitsInStock 
From Northwind.dbo.Products

--5.Yöntem
Select 
	Northwind..Products.CategoryID,
	Northwind..Products.ProductID,
	Northwind..Products.ProductName,
	Northwind..Products.UnitPrice,
	Northwind..Products.UnitsInStock 
From Northwind..Products

--6.Yöntem
Select 
	p.CategoryID,
	p.ProductID,
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock 
From Northwind..Products p

--Koþullu Filtreleme (Where)

/*
select
	<kolonadi>,
	<kolonadi>,
	<kolonadi>,
	<kolonadi>
From <tabloadi>
Where <kriter>
*/

--Stok Miktarý 20'den fazla olan ürünleri getiren sorguyu yazýnýz....
Select 
	*
From 
	Products p
where
	p.UnitsInStock > 20

--Fiyatý 20'den fazla olan ürünleri getiren sorguyu yazýnýz...

Select 
	*
From 
	Products p
where
	p.UnitPrice > 20

/*
SORGU YAZARKEN ÝZLENECEK YÖNTEM
1) Sorgunu belirle
2) Tablonu belirle
3) Kolonlarýný belirle
4) Varsa kriterlerini belirle 

*/

--CategoryID,ProductID,ProductName,UnitPrice,UnitsInStock

--Fiyatý 20 ile 50 arasýnda olan ürünleri getiren sorguyu yazýnýz...(ÜrünAdý,Fiyatý,StokMiktarý)
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
where 
	p.UnitPrice > 20 and
	p.UnitPrice < 50

--UrunId'si 10 dan küçük olan ürünleri getiren sorguyu yazýnýz...
Select 
	*
From 
	Products p
Where 
	p.ProductID < 10

--BETWEEN
/*
	Select 
		*
	From 
		<tablo_adý>
	WHERE 
		<kolonAdi> BETWEEN <birinciDeger> AND <ikinciDeger>
*/
--Fiyatý 20 ile 50 arasýnda olan ürünleri getiren sorguyu yazýnýz...(ÜrünAdý,Fiyatý,StokMiktarý)
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
where 
	p.UnitPrice BETWEEN 20 AND 50 --20 Dahildir, 50 dahil deðildir.

--SÜTUNLARIN ISIMLENDIRILMESI
--Sorgu sonucu oluþacak olan sonuç kümesindeki (result set) sütun isimlerinin deðiþtirilmesi iþlemidir.
--Tablodaki orjinal sütun isimlerinin deðiþtirilmesi söz konusu deðildir.

--Tedarikçiler tablosundan Þirket adý, yetkili kiþi, telefon,þehirülke ve adress bilgilerinin custom kolon isimleri ile getiren sorgu

Select 
	s.CompanyName as 'Firma Adý', --1.Yöntem
	s.ContactName 'Yetkili Kiþi', --2.Yöntem
	s.Phone as Telefon, --3.Yöntem
	s.City as [Þehir], --4.Yöntem
	s.Country ULKE, --5.Yöntem
	s.[Address] 
From 
	Suppliers s

--OR
--Londra ve paristeki müþterilerin Þirket adý, Yetkili kiþi, Þehir ve Adres bilgilerini getiren sorguyu yazýnýz..
Select
	c.CompanyName as [Þiket Adý],
	c.ContactName as [Yetkili Kiþi],
	c.City as Þehir,
	c.Address as Adres
From
	Customers c
Where
	c.City = 'paris' OR c.City = 'london'

--Þehir Bilgisi Londra olmayan müþterilerin Þirket adý, Yetkili kiþi, Þehir ve Adres bilgilerini getiren sorguyu yazýnýz..
Select
	c.CompanyName as [Þiket Adý],
	c.ContactName as [Yetkili Kiþi],
	c.City as Þehir,
	c.Address as Adres
From
	Customers c
Where
	--c.City != 'london' --1.Yöntem
	c.City <> 'london' --2.Yöntem

--London,Madrid,Paris ve Berlin'de olan müþterilerin CompanyName ve City bilgilerini getiren sorguyu yazýnýz.

Select 
	c.CompanyName 'Þirket Adý',
	c.City 'Þehir'
From 
	Customers c
Where 
	c.City = 'london' OR
	c.City = 'madrid' OR
	c.City = 'Paris' OR
	c.City = 'Berlin'
--Yukarýdaki sorguyu OR kullanmadan yazýnýz...
Select 
	c.CompanyName 'Þirket Adý',
	c.City 'Þehir'
From 
	Customers c
Where 
	c.City IN ('london','madrid','paris','berlin')

--London,Madrid,Paris ve Berlin'de olmayan müþterilerin CompanyName ve City bilgilerini getiren sorguyu yazýnýz.
-- Gri keywordlerin baþlarýna NOT gelebilir.
Select 
	c.CompanyName 'Þirket Adý',
	c.City 'Þehir'
From 
	Customers c
Where 
	c.City NOT IN ('london','madrid','paris','berlin')

--TEKÝL KAYITLARI LÝSTELEMEK

Select
	City
From
	Employees -- Ayný þehirler defalarca listelenir.

Select DISTINCT
	City
From 
	Employees -- Ayný þehirler sadece bir sefer listelenir.


-------------------------- REGULAR EXPRESSION - REGEX ---------------
--Þirket adýnda 'Market' geçen müþterilerin bilgilerini getiren sorgu

Select 
	* 
From 
	Customers c 
Where
	c.CompanyName Like '%Market%'

--REGEX MANTIÐI
-- % -> eklendiði yerde kaç karakter olduðu ve bu karakterlerin hangi karakterler olduðu önemli deðildir, anlamýna gelir.
-- _ (alt tire) -> eklendiði yerde tek bir karakteri temsil eder. Bu karakterin hangi karakter olduðu önemli deðildir.

--Ürün Adý içerisinde 'A' içeren ürünlerin sorgusunu yazalým.

Select 
	*
From 
	Products p
Where 
	p.ProductName LIKE '%A%'

--Ürün Adý 'A' ile baþlayan ürünlerin sorgusunu yazalým.
Select 
	*
From 
	Products p
Where 
	p.ProductName LIKE 'A%'

--isminin içerisinde 'an' harfleri olan çalýþaným kimdir.
Select 
	*
From 
	Employees e
Where 
	e.FirstName LIKE '%an%'

-- C ile baþlayan 3.harfi a olan ve toplam 5 harf olan
Select 
	* 
From 
	Products p
Where 
	--p.ProductName LIKE 'c_a__' -- C ile baþlayan 3.harfi a olan ve toplam 5 harf olan
	--p.ProductName LIKE 'c_[a-k]%'--C ile baþlayan 3.harfi a ile k arasýnda olsun
	--p.ProductName LIKE 'c_[ae]%'--C ile baþlayan 3.harfi a ve e olan ürünler
	--p.ProductName LIKE 'c_[^a]%'--C ile baþyan 3.Harfi a olmayan ürünler
	p.ProductName LIKE '_o%meat'--ikinci harfi 'o' olan ve 'meat' ile biten ürünler
----------------------REGEX END ------------------------------------

--Fax numarasý boþ olan müþterilerin bilgilerini getiren sorgu
Select 
	*
From 
	Customers c
Where 
	--c.Fax = '' --> WhiteSpace
	c.Fax is null --> NULL

-- ORDER BY (SIRALAMA)
--Order By sýralama iþlemlerini yapar. Order By söz dizimi Where koþulundan sonra belirtilir. Where koþulu kullanýlmayacaksa tablo adýndan sonra yazýlabilir.

--Order By söz dizimi iki deðer alýr.

--1) ASC (Ascending)
--2) DESC (Descending)

--Order By default deðeri 'ASC' dir, ASC veya DESC yazmazsam default olarak 'ASC' olarak compiler derler.

--Ürün adýna göre ürünleri sýralayarak getiren sorgu [A-Z]
Select 
	*
From 
	Products p
Order By 
	p.ProductName ASC

--Ürünlerin ürün adý, Fiyatý ve stoktaki miktarýný fiyata göre pahalýdan ucuza doðru sýralayýnýz.

--1.Yöntem
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
Order by 
	p.UnitPrice DESC

--2.Yöntem
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
Order by 2 DESC --Burada yukarýda belirtilen kolonlarýn sýrasý girilebilir.
--Dikkat -- Eðer kolon isimleri yerine kolon numarasý ile sýralama yapýlýrsa ve yeni kolon sýrasý eski kolonun sýrasýný deðiþtirirse sorgu patlar.

--------------------Tarihler-------------------

--01.01.1996 ile 31.12.1996 tarihleri arasýndaki sipariþlerin Sipariþ ID'si, Tarihi, Þehir ve Ülke bilgilerini getiren ve tarih kolonuna göre tersten sýralayan sorguyu yazýnýz...

--1.Kullaným
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate BETWEEN '01.01.1996' AND '1996-12-31' --> Noktalý veya treli olabilir.
Order By
	o.OrderDate DESC

--2.Kullaným
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= '01.01.1996 00:00:00.000' AND o.OrderDate <= '1996-12-31 00:00:00.000' --> Noktalý veya treli olabilir.
Order By
	o.OrderDate DESC

--3.Kullaným
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= '01/01/1996' AND o.OrderDate <= '1996/12/31' --> Noktalý veya treli olabilir.
Order By
	o.OrderDate DESC

--4.Kullaným (CONVERT)
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= CONVERT(datetime,'01/01/1996',103) AND o.OrderDate <= CONVERT(datetime,'31/12/1996',103) --> Noktalý veya treli olabilir.
Order By
	o.OrderDate DESC

--5.Kullaným (CAST)
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	CAST(o.OrderDate as datetime) >= CONVERT(datetime,'01/01/1996',103) AND CAST(o.OrderDate as datetime) <= CONVERT(datetime,'31/12/1996',103) --> GUN/AY/YIL
Order By
	o.OrderDate DESC
--6.Kullaným (Zaman Metotlarý)
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	YEAR(o.OrderDate) = 1996
Order By
	o.OrderDate DESC

/*
	ZAMAN METOTLARI
YEAR -> Verilen tarihtekii yýl deðerini döndürür.
MONTH -> Verilen tarihtekii ay deðerini döndürür.
DAY -> Verilen tarihtekii gün deðerini döndürür.
GETDATE -> Þu an ki sistem saat ve tarihini döndürür.

*/

--Doðum günü bu gün olan çalýþanlarýmýzýn ad,soyad,doðum tarihini getiren sorgu
Select
	e.FirstName + ' ' + e.LastName as 'AD SOYAD',
	e.BirthDate
From 
	Employees e
Where 
	DAY(e.BirthDate) = DAY(GETDATE()) AND
	MONTH(e.BirthDate) = MONTH(GETDATE())

--Sipariþ Tarihi tarihte bu gün olan sorguyu yazýnýz..

Select
	*
From 
	Orders o
Where 
	DAY(o.OrderDate) = DAY(GETDATE()) AND
	MONTH(o.OrderDate) = MONTH(GETDATE())

--SubQuery (Sorgu içinde Sorgu)

--Almak istediðiniz tek satýr tek hücrelik veri ise bu veri tablolarda ve kolonlarda yok ise veya hesaplama yaptýrýlarak getirilmesi gerekiyorsa burada tek hücre ve tek satýr sonuc döndüren sorgu kullanabiliriz

Select 
	AVG(p.UnitPrice)
From Products p
---------------------------------
Select 
	*
From
	Products p
Where
	 p.UnitPrice < (Select AVG(p.UnitPrice) From Products p)
Order By 
	p.UnitPrice DESC

--Stok Miktarý ortalama stok miktarýnýn altýnda olan ürünleri getiren sorguyu yazýnýz.

Select 
	*
From
	Products p
Where
	 p.UnitsInStock < (Select AVG(p.UnitsInStock) From Products p)
Order By 
	p.UnitsInStock DESC

--Stok Miktarý ortalama stok miktarýnýn altýnda olan ürünlerden stok miktarý en az olan 3 ürünü getiren sorguyu yazýnýz.

Select TOP 3
	*
From
	Products p
Where
	 p.UnitsInStock < (Select AVG(p.UnitsInStock) From Products p)
Order By 
	p.UnitsInStock ASC


Select 
	* 
From
	(
	Select 
		* 
	From 
		Products
	) as p


--En Pahalý 3 ürünü getiren sorguyu yazýnýz...

Select TOP 3
	*
From 
	Products p
Order By
	p.UnitPrice DESC

--Hangi Ülkelerle iþ yapýyoruz.
Select DISTINCT
	c.Country
From 
	Customers c

--ilk iþe aldýðým çalýþaným kimdir.

Select Top 1
	(e.FirstName + ' ' + e.LastName) as 'FULL NAME',
	e.HireDate
From 
	Employees e
Where 
	e.HireDate IS NOT NULL
Order By 
	e.HireDate ASC

  -------------------STRING FORMATLAR -------------------------
  --NOT: Select ile mutlaka bir tablo adý kullanýlmak zorunda deðiliz.

  Select 
	5 + 9 as Toplam, 
	9 - 5 as Fark, 
	5 * 9 as Çarpým, 
	5/3 as Bölüm, 
	5 % 2 as [Mod]

Select 'YMS 5528 - SQL SERVER DERSLERÝ' as Mesaj

Print 'YMS 5528 - SQL SERVER DERSLERÝ'

--STRING FONKSIYONLARI

Select ASCII('A') as 'ASCII KODU' -- Ascii kodunu verir

SELECT CHAR(65) AS KARAKTER --Ascii kodu verilen karakteri söyler.

SELECT CHARINDEX('@','bilal.yilmaz@bilgeadam.com') as Konum

Select LEFT('Bilge Adam',4) as 'Soldan Karakter Sayýsý'

Select RIGHT('Bilge Adam',6) as 'Saðdan Karakter sayýsý'

Select LEN('Bilge Adam') as [Karakter Sayýsý]

Select LOWER('BiLGe AdAm') as [Hepsi Küçük]

Select UPPER('BiLGe AdAm') as [Hepsi Büyük]

Select LTRIM('              Bilge Adam') as [Soldaki Boþluklarý Siler]

Select RTRIM('Bilge Adam               ') as [Saðdaki Boþluklarý Siler]

Select LTRIM(RTRIM('           Bilge Adam              ')) as [Tüm Boþluklarý Siler]
-- TRIM Fonksiyonu bulunmamaktadýr.

Select REPLACE('Birbirbirilerine' , 'bir','üç') as [Metinlerin Yerine Yenilerini Atar]

Select SUBSTRING('Bilge Adam Bakýrköy Biliþim Akademisi',4,6) as 'Substring''in Örneði'

Select REVERSE('Bilge Adam Bakýrköy Biliþim Akademisi') as [Tersine Çevirir]

Select 'Bilge Adam'+SPACE(30)+'Bakýrköy' as [Belirtilen Miktar kadar boþluk ekler]

Select REPLICATE('Bilge',5) as 'Belirtilen metni, belirtilen adet kadar çoðaltýr'

----CASE - WHEN - THEN
Select 
	e.FirstName,
	e.LastName,
	CASE(e.Country)
		When 'USA' Then 'Amerika Birleþik DEvletleri'
		When 'UK' Then 'Ýngiltere Biirleþik Krallýk'
	ELSE 'Ülkesi Belirtilmemiþ'
	END as 'Ülke Adý'
From 
	Employees e

--Employees tablosundan EmployeeID,FirstName,LastName'i çekiniz. Fakat EmployeeID'si 5'ten küçük olanlar için "5'ten küçük" büyük olanlar için "5'ten Büyük" eþit olanlar için "5'e eþittir" yazdýrýnýz.. 

Select
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  CASE
  When e.EmployeeID > 5 Then '5 ten büyük'
  When e.EmployeeID < 5 Then '5 ten küçük'
  ELSE '5 e eþit' 
  END as 'ID Durumu'
From
  Employees e

--Aggregate Function -Bütünleþik Fonksiyonlar
--Aggregate Function'lar her zaman tek deðer döndürür.

/*
SUM  : Toplama Fonksiyonudur, Tüm deðerlerin toplam sonucunu elde eder.
AVG  : Ortalama almak için kullanýlýr.
COUNT: Sayma, Satýr sayýsýný sayar.
MAX  : Max deðerini bulur.
MIN  : Min deðerini bulur.
ROUND: Yuvarlama, dönen sonuçtaki deðerin ',' virgülden sonraki deðerini yuvarlar.
*/

--Þuana kadarki toplam ciroyu hesaplayalým...
Select
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) as [Toplam Ciro]
From 
	[Order Details] od

--Bugüne kadar kaç adet ürün satmýþýz?

Select 
	SUM(od.Quantity) as 'Toplam Satýþ Miktarý'
From 
	[Order Details] od

--Bu güne kadar kaç adet sipariþ

Select 
	COUNT(*) --Bir tablodaki kayýt sayýsýný öðrenebiliriz.
From 
	Orders

Select * From Employees
Select COUNT(*) From Employees
Select COUNT(EmployeeID) From Employees
Select COUNT(Region) From Employees
Select COUNT(DISTINCT City) From Employees

--Þuan Fiyatý en pahalý ürün

Select 
	MAX(UnitPrice) as 'En Pahalý Ürün Fiyatý'
From
	Products

Select MAX(FirstName) From Employees --Sütunun sayýsal olmasýna gerek yok, alfabetik olarak en büyük deðeri gösterir.

Select MIN(FirstName) From Employees --Sütunun sayýsal olmasýna gerek yok, alfabetik olarak en küçük deðeri gösterir.

--Þuan Fiyatý en ucuz ürün

Select 
	MIN(UnitPrice) as 'En ucuz Ürün Fiyatý'
From
	Products

--Kategoriye göre ürün sayýsýný getiren Sorgu
--1  23
--2  50
--3  75 

Select
	c.CategoryID,
	c.CategoryName
From 
	Categories c

Select 
	p.CategoryID,
	COUNT(p.CategoryID) as 'Ürün Sayýsý'
From
	Products p 

--Yukarýdaki Hata: Aggregate Function'dan gelen tek deðer, birden fazla satýra parçalanamýyor. Parçala iþlemi için uyumlu olan verileri Group By ile gruplamamýz gerekiyor.

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAdý',
	COUNT(p.CategoryID) as 'Ürün Sayýsý'
From
	Products p
Group By
	p.CategoryID

------

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAdý',
	COUNT(*) as 'Ürün Sayýsý',
	SUM(p.UnitsInStock) as 'Ürün Miktarý'
From 
	Products p
Group By
	p.CategoryID


--Ülkelere Göre Müþteri Daðýlýmýný Getiren Sorgu (Ülke,Müþteri Sayýsý)

Select 
	c.Country,
	c.City,
	Count(*) as 'Müþteri Sayýsý' 
From 
	Customers c
Group By
	c.Country,
	c.City
Order BY 
	c.Country

--Çalýþanlarýn yapmýþ olduðu sipariþ Adedi
Select 
	(
	Select 
		e.FirstName + ' ' + e.LastName 
	From 
		Employees e 
	Where 
		e.EmployeeID = o.EmployeeID
	) as Çalýþan,
	COUNT(*) as 'Sipariþ Adedi'
From 
	Orders o
Group By
	o.EmployeeID
Order By
	[Sipariþ Adedi] DESC

--Ürün Fiyatý $35'dan az olan ürünlerin kategorilerine göre gruplayýnýz...

Select	
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAdý',
	COUNT(*) as [Ürün Adedi]
From 
	Products p
Where  
	p.UnitPrice < 35
Group By
	p.CategoryID

--Baþ Harfi A-K arasýnda olan ve stok miktarý 5 - 50 arasýnda olan ürünleri katogorilerine göre gruplayýnýz.

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAdý',
	COUNT(*) as 'Ürün Adedi'
From 
	Products p
Where 
	(p.ProductName LIKE '[A-K]%' )
	AND
	(p.UnitsInStock BETWEEN 5 AND 50) 
Group By
	p.CategoryID
	
--HAVING
--Sorgu sonucu gelen sonuç kümesi üzerinde Aggregate Function fonksiyonlarýna baðlý olacak þekilde filtreleme iþlemi yapmak istiyorsak Where yarine Having kullanýrýz.

--Toplam Tutarý 2500 ile 3500 arasýnda olan sipariþlerin sýralamasýný saðlayýnýz.
Select 
	od.OrderID as 'SipariþNo',
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) as 'Toplam Tutar' 
From 
	[Order Details] od
Group By
	od.OrderID
Having
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) BETWEEN 2500 AND 3500

--Eðer bir sorguda Aggregate Function kullanýlýrsa bizden diðer kolonlarýn hepsini Group By içerisine almamýzý ister ancak filtreleme iþlemi yapmak  istediðimiz Aggregate kolonunu where anahtar kelimesi ile filtreleyememekteyiz, bunun yerine Having Anahtar sözcüðü kullanýlýr. Ancak Where gibi From'dan sonra deðil Group By'dan sonra yazýlýr. 

--Her bir Sipariþeki toplam ürün sayýsý 200'den az olan ürünleri listelleyiniz.. SipariþID,ToplamAdet,SipariþTutarý

Select 
	od.OrderID as 'SipariþNo',
	SUM(od.Quantity) as 'Toplam Adet',
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) as 'Toplam Tutar' 
From 
	[Order Details] od
--Where 
--	od.OrderID > 1000
Group By
	od.OrderID
Having
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) BETWEEN 2500 AND 3500	AND
	SUM(od.Quantity) < 200
Order By
	[Toplam Tutar] DESC

-----------------JOINLER--------------------
--1) INNER JOIN : Bir tablodaki her bir kaydýn diðer tabloda bulunann karþýlýlðý ile Id'si üzerinden birbirine baðlanarak sanki her iki tablonun birleþtirilmesi ile meydana gelen yeni bir tablo oluþturulmasý iþlemidir. (Inner Join ifadesi yazarken inner kelimesini yazmasakta yani sadece join yazarsak bu yine inner Join olarak iþleme alýnýr.)

--Product tablosundan ProductID,ProdunctName,CategoryId
--Categories tablosundan CategoryName,Description alanlarýnýn Inner Join yöntemiyle çekelim

Use Northwind
Select  * From Products
Select * From Categories

Select 
	p.ProductID,
	p.ProductName,
	p.CategoryID,
	c.CategoryName,
	c.Description
From 
	Products p,Categories c
Where 
	p.CategoryID = c.CategoryID

-----------
Select	
	p.ProductID,
	p.ProductName,
	p.CategoryID,
	c.CategoryName,
	c.Description
From
	Products p
Inner Join Categories c ON p.CategoryID = c.CategoryID


Select  * From Products --SupplierID,CategoryID
Select * From Categories -- CategoryID
Select * From Suppliers -- SupplierID

Select	
	p.ProductID,
	p.ProductName,
	c.CategoryName,
	c.[Description],
	s.CompanyName as 'Tedarikçi'
From 
	Products p
Inner Join Categories c ON p.CategoryID = c.CategoryID
Inner Join Suppliers s On p.SupplierID = s.SupplierID

--Hangi Sipariþ, Hangi Çalýþan tarafýndan, Hangi müþteriye yapýlmýþ listeleyiniz...
--SipariþID,Sipariþ Tarihi,Çalýþan,MüþteriAdý

SELECT * from Customers c
select * from Employees e
select * from Orders o

SELECT 
	o.OrderID, 
	o.OrderDate, 
	e.FirstName + '' + e.LastName AS 'Çalýþan', 
	c.CompanyName AS 'Müþteri Adý' 
FROM Orders o 
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID

--Ürünlerin Kategorilerine Göre Toplam Stok Miktarýný Getiren Sorguyu Yazýnýz...

Select
	c.CategoryName as 'Kategori Adý',
	SUM(p.UnitsInStock) as 'Toplam Stok'
From
	Categories c 
Inner Join Products p ON c.CategoryID = p.CategoryID
Group By 
	c.CategoryName

--Her bir çalýþanýn toplam satýþ tutarý ne kadardýr.Çalýþan,SatýþTutarý
Select * From Orders
Select * From Employees
Select * From [Order Details]

Select 
	(e.FirstName + ' ' + e.LastName) as Çalýþan,
	CAST(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)) as decimal(10,2)) as Toplam
From 
	Employees e
Join Orders o On o.EmployeeID = e.EmployeeID
Join [Order Details] od On od.OrderID = o.OrderID
Group By 
	e.FirstName,
	e.LastName
Order By
	Toplam DESC

--2) OUTET JOIN

--2.1) LEFT OUTER JOIN : Sorguya giren tablolardan soldakinin tüm kayýtlarýný getirirken, saðdakinin sadece iliþkili olan kayýtlarýný getirir.

Select 
	p.ProductName,
	c.CategoryName
From 
	Products p
LEFT OUTER JOIN Categories c On p.CategoryID = c.CategoryID

--Her bir çalýþaný rapor verdiði kiþiyle birlikte listeleyelim.

Select 
	e1.FirstName + ' ' + e1.LastName as 'Çalýþan',
	e2.FirstName + ' ' + e2.LastName as 'Müdür'
 From 
	Employees e1 
LEFT OUTER JOIN Employees e2 On e1.ReportsTo = e2.EmployeeID

--2.1) RIGHT OUTER JOIN : Sorguya giren tablolardan saðdakinin tüm kayýtlarýný getirirken, soldakinin sadece iliþkili olan kayýtlarýný getirir.

Select 
	e1.FirstName + ' ' + e1.LastName as 'Çalýþan',
	e2.FirstName + ' ' + e2.LastName as 'Müdür'
 From 
	Employees e1 
RIGHT OUTER JOIN Employees e2 On e1.ReportsTo = e2.EmployeeID
--2.3) CROSS JOIN

Select 
	p.ProductName,
	c.CategoryName
From 
	Products p 
CROSS JOIN Categories c

--2.4) FULL JOIN

Select 
	*
From 
	Products p 
FULL JOIN Categories c ON c.CategoryID = p.CategoryID


-------------- WINDOWING  SAYFALAMA  -----------------------

--ROW_NUMBER() satýrlar için sanal id oluþturur.
Select 
	ROW_NUMBER() OVER(order by ContactTitle) as SatirNo,
	c.*
From 
	Customers c

-- Partition by ayný deðerlere sýralý id verme
Select 
	ROW_NUMBER() OVER(Partition by ContactTitle order  by ContactTitle) as SatirNo,
	c.*
From 
	Customers c

--RANK() 
Select 
	ROW_NUMBER() OVER(Partition by ContactTitle order  by ContactTitle) as SatirNo,
	RANK() OVER(order by ContactTitle) as SatirNo,
	c.*
From 
	Customers c

--DENSE_RANK() 
Select 
	ROW_NUMBER() OVER(Partition by ContactTitle order  by ContactTitle) as SatirNo,
	DENSE_RANK() OVER(order by ContactTitle) as SatirNo,
	c.*
From 
	Customers c

--RowNumber ile Derived bir tablo aluþturarak sayfalama yapma


Select 
	*
From 
	(
	Select 
		ROW_NUMBER() OVER(order by ContactTitle) as SatirNo,
		c.CompanyName,
		c.ContactTitle,
		c.City
	From 
		Customers c
	) as tbl
Where tbl.SatirNo between 11 and 20

--Veritabaný CRUD iþlemlerine Giriþ
--1) Insert: Veritabanýndaki tablolardan birine yeni kayýt eklemek için kullanacaðýmýz komuttur.
/*
Insert Into <tabloAdý>(<sütunisimleri>) Values (<sütunDeðerleri>)
*/ 
--1.Yöntem
Insert Into
	Categories
		(Description,CategoryName)
	Values 
		('Vitaminlidir Bunlar','Meyveler')

Select * From Categories 


--Aþaðýdaki insert iþlemi baþarýsýz olacaktýr, Çünkü Categories tablosunda Null geçilemeyen CategoryName sütunu için bir deðer atamadýk.
Insert Into
	Categories
		(Description)
	Values 
		('Vitaminlidir Bunlar')

Select * From Categories

--2.Yöntem
Insert Into 
	Shippers 
		Values ('MNG Kargo','0212 212 21 21')

Select * From Shippers

--Customers tablosuna 'Bilge Adam' isimli yeni bir müþteri kaydý ekleyiniz...

Insert Into 
	Customers 
		Values ('BLGAD','Bilge Adam','Bilge Demir','Akademi','Bakýrköy','Ýstanbul','NULL','34000','TURKEY','0212 212 12 12','0212 212 12 13')

Select * From Customers

--2) Update : Bir tablodaki verileri güncellemek için kullanýlýr.

/*
	Update <tabloadý> 
	Set <sütunAdý> = <yenideðer>,
		 <sütunAdý> = <yenideðer>,
		 <sütunAdý> = <yenideðer>,
		 <sütunAdý> = <yenideðer>,
	Where <sütunAdý> = <koþul>
*/
 
 Select * From Customers Where CustomerID = 'BLGAD'
 Update Customers 
	Set CompanyName = 'Bilge Adam',
		ContactName = 'Bilal YILMAZ',
		ContactTitle = 'Bay',
		Address = 'Zeytinlik Mah. Bakýrköy'
Where CustomerID = 'BLGAD'

--Employees tablosuna insert ile kendi kaydýnýzý ekleyin daha sonra kaydettiðiniz kaydý FirstName = 'Bilge', LastName = 'Adam' olarak güncelleyiniz....
Insert Into
	Employees
		(FirstName,LastName)
	Values 
		('VBilgeee','Adaaamm')
	Select * From Employees

Update Employees
	Set FirstName = 'Bilge',
	LastName ='Adam'
Where EmployeeID = 12


------Tablolar arasý veri transferi -------

--Emplooyess tablosundaki verileri, Calisanlar tablosuna transfer edelim

--1.Yöntem 'Select Insert'
Insert Into Calisanlar
Select * From Employees

Select * From Calisanlar

--Kolon filtreleme ile taþýma
Insert Into Calisanlar (EmployeeID,FirstName,LastName,BirthDate)
Select e.EmployeeID,e.FirstName,e.LastName,e.BirthDate From Employees e

--2.Yöntem 'Select Into'

select * Into Urunler From Products 

Select * From Urunler

--Kolon filtreleme ile taþýma

select p.ProductID,p.ProductName,p.UnitPrice,p.UnitsInStock,p.CategoryID Into Urunler From Products  p
  

--3) DELETE : Bir tablodan kayýt silmek için kullanýlýr, Update gibi dikket edilmesi gerekir. Tüm güvenlik kurallarý buradada geçerlidir.

/*
	Delete From <tabloadý> where ....
*/

Select * From Urunler

Delete From Urunler 

Drop Table Urunler

Select * From Urunler u Where u.ProductID = 25

--Delete From Urunler Where ProductID = 25


-------------------------- View ---------------------

/* View'ler genel olarak 2 amaç için kullanýlýr
1) Karmaþýk sorgularý basitleþtirmek için
2) Tablo eriþimini kullanýcý bazýnda kýsýtlamak için. */

--Bir sipariþin hangi çalýþan tarafýndan, hangi müþteriye, hangi kategorideki üründen, hangi fiyattan kaç adet satýldýðýný listeleyiniz..

--Çalýþanýn adý,soyadý,ünvaný,görevi,iþe baþlama tarihi
--Müþterinin firmaadý,temsilcisini ve telefonunu 
--Ürünadý, stokmiktarý, birim fiyatý
--Sipariþ adedi ve satýþ fiyatýný
--Kategori adý

Select * FRom Employees --employeeID
Select * From Customers --customerID
Select * From Products --produstID, categoryID
Select * From Orders --OrderID,CustomerID,employeeID
Select * From [Order Details] --OrderID,productID
Select * From Categories --categoryID

Create View SatisRaporu as
Select 
	(e.FirstName + ' ' + e.LastName) as 'Çalýþan',
	e.TitleOfCourtesy as [Ünvan],
	e.Title as Görevi,
	e.HireDate as 'Ýþe Baþlama Tarihi',
	c.CompanyName as 'Firma Adý',
	c.ContactName as 'Yetkili Kiþi',
	c.Phone as [Müþteri Tel],
	p.ProductName as 'Ürün Adý',
	p.UnitsInStock as 'Stok Miktarý',
	od.UnitPrice as 'Birim Fiyat',
	o.OrderID as SiparisID,
	od.Quantity as 'Sipariþ Adedi',
	od.Discount,
	od.Quantity * od.UnitPrice as Tutar,
	ct.CategoryName
 From 
	Orders o
Inner Join [Order Details] od On o.OrderID = od.OrderID
Inner Join Employees e On o.EmployeeID = e.EmployeeID
Inner Join Customers c On o.CustomerID = c.CustomerID
Inner Join Products p On od.ProductID = p.ProductID
Inner Join Categories ct On p.CategoryID = ct.CategoryID

Select * From SatisRaporu

Create View Kategoriler -- Yeni Bir view Tanýmladýk
As
Select 
	CategoryName,
	Description
From 
	Categories 

Select * From Kategoriler

--View üzerinden insert komutuda kullanabilirsiniz.
Insert Into Kategoriler(CategoryName,Description) Values('Mercedes','Bir Alman Araba Markasý')

Select * From Kategoriler --View bir tablo gibi çalýþýr

--View Güncelleme
Alter View Kategoriler
As
	Select 
	CategoryID as [NO],
	CategoryName,
	Description
From 
	Categories 

Select * From Kategoriler 

--View ile With Check Option Kullaným

--1.Adým View oluþturma
Create View CalisanBilgileri 
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy
From 
	Employees e

Select * FRom CalisanBilgileri
--2.Adým View'i edðiþtirmek => City Bilgisi 'London' olanlar
Alter View CalisanBilgileri 
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy,
	e.City
From 
	Employees e
Where 
	e.City = 'london'

Select * FRom CalisanBilgileri
--3.Adým View üzerinden Kayýt eklemek

Insert Into CalisanBilgileri(FirstName,LastName,Title,TitleOfCourtesy,City)
Values ('Halil','Öztürk','Bilgi Ýþlem','Sistem Yöneticisi','Ýstanbul')

Select * FRom Employees

--4.Adým View Güncelleme View üzerinden insert yaptýðýmýzda View ile belirlenen filtreye uygun þekilde View yapýsýnda deðiþiklik yapalým ve istenmeyen þehir bilgisi hatasý verdirelim.
Alter View CalisanBilgileri 
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy,
	e.City
From 
	Employees e
Where 
	e.City = 'london'
With Check Option -- Artýk insert iþleminde Where kriterine uygun kayýtlarý kabul edecek

Insert Into CalisanBilgileri(FirstName,LastName,Title,TitleOfCourtesy,City)
Values ('Halil','Öztürk','Bilgi Ýþlem','Sistem Yöneticisi','Ýstanbul') --Bu kayýt artýk view'e eklenmez, çünkü þehir bilgisi kritere uymuyor.

Select * FRom Employees

-- With Schema Binding Kullanýmý

--Sorgularýmýzda base olarak aldýðýnýz tablolarýn içerinde herhangi bir deðiþiklik yapýlmasýný istemiyorsanýz (kolonlar ve kolonlarýn veri tipleri) With Schema Binding  kullanabilirsiniz. Dikkat edilmesi gereken bir diðer noktada select sorgumuzda From'dan sonra tablo adýnýn baþýnda "dbo." yazýlarak sorgu çalýþmasý gerekmektedir.

Alter View CalisanBilgileri 
With SchemaBinding
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy,
	e.City
From 
	dbo.Employees e
Where 
	e.City = 'london'
With Check Option

--VIEW ile With Encryption Kullanýmý
--View'ý oluþturan kodlarýn baþkalarý tarafýndan görüntülenmesini istemiyorsak bu kodlarý þifreleyebiliriz.

Alter View CalisanBilgileri 
With Encryption
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy,
	e.City
From 
	dbo.Employees e
Where 
	e.City = 'london'
With Check Option

--Kilit Açmak

Alter View CalisanBilgileri 
--With Encryption
As
Select 
	e.FirstName,
	e.LastName,
	e.Title,
	e.TitleOfCourtesy,
	e.City
From 
	dbo.Employees e
Where 
	e.City = 'london'
With Check Option


-------------CREATOR -- VERÝ TABANI OLUÞTURMA ------------------------

use master
Create DataBase KUTUPHANE
ON PRIMARY
(
	NAME = 'DataFile', -- veri dosyasý
	SIZE = 6MB, --db ilk oluþturulduðundaki kaplayacaðý yer ve alaný
	FILENAME = 'C:\Veritabaný\Kutuphane.mdf', --Master Data File
	MAXSIZE = 100MB,
	FILEGROWTH = 3MB -- her yer dolduðunda 3'er mb lýk bu db için yer açýlacak	
)
LOG ON
(
	NAME = 'LogFile',
	SIZE = 1MB,
	FILENAME = 'C:\Veritabaný\Kutuphane.ldf',
	FILEGROWTH = 10% 	
)

use KUTUPHANE
Create Table Yazar
(
	YazarID int Not NULL Primary Key Identity(1,1),
	Ad nvarchar(10) NOT NULL,
	SoyAd nvarchar(20) NOT NULL,
	DogumYeri nvarchar(25) NULL,
	DogumTarihi date NULL
)

Create Table Dil
(
	DilId int not null Primary Key identity(1,1),
	DilAdi nvarchar(20) NOT NULL
)

Create Table YazarDil 
(
	YazarID int Not Null Foreign Key References Yazar(YazarID),
	DilId int Not Null Foreign Key References Dil(DilId)
)

ALTER AUTHORIZATION ON DATABASE::Kutuphane To [sa]; --Database üzerinde sa userýnýn diagram yetkisi yoksa bu kod bloðu çalýþtýrýlýr.

Create Table Cevirmen
(
	CevirmenID int not null Primary Key identity(1,1),
	Ad nvarchar(10) NOT NULL,
	SoyAd nvarchar(20) NOT NULL
)

--Bir tabloya sonradan kolon ilave edebiliriz
Alter Table Cevirmen
Add Mail varchar(100) NULL

--Eklediðiniz kolon tipini güncelleyebilirsiniz.

Alter Table Cevirmen
Alter Column Mail nvarchar(MAX) NULL

--Kolon Silme

Alter Table Cevirmen
Drop Column Mail

---------------STORED PROCEDURE (Saklý Yordamlar)----------------------
--TSQL komutlarý ile hazýrladýðýmýz iþlemler bütününün çalýþtýrýlma anýnda derlenmesi ile size bir sonuç üreten sql server bileþenidir.

--Çalýþtýrýlma anýnda planlama saðlar ve tekrar tekrar kullanýlabilir.
--Query'lerinize otomatik parametrelendirme getirir.
--Uygulamalar arasýnda ortak kullanýlabilir yapýdadýr.
--Güvenli data modifikasyonu saðlar.
--Network Bandwidth'inden tasarruf saðlar.
--Jop Olarak tanýmlanabilir.
--Database objelerine güvenli eriþim saðlar.

use Northwind
Create Procedure sp_CalisanlariGetir -- Stored Procedure'ün oluþturlmasý
as -- Bu Procedure aþaðýdaki sorguyu içerecek
Select 
		FirstName,
		LastName,
		Title
From Northwind..Employees 
Where City IS NOT NULL

Execute sp_CalisanlariGetir --Stored Procedure Çalýþtýrýlmasý iþlemi

Create Proc sp_UrunlerVeKategoriler
AS
Select 
	p.ProductName,
	c.CategoryName
From 
	Categories c
Inner Join Products p On p.CategoryID = c.CategoryID

Exec sp_UrunlerVeKategoriler

Create Proc sp_UrunlerByKategori
	@catID int --Proc'e parametre aktarýyoruz. Parametreler yazýlýrken, önce parametre adý (baþýnda @ ile beraber), daha sonra ise parametrenin tipi yazýlýr.
AS
Select 
	*
From 
	Products p
Where 
	p.CategoryID = @catID --Burada tanýmladýðýmýz parametreyi atýyoruz.

exec sp_UrunlerByKategori 2

exec sp_UrunlerByKategori @catID = 2

--Adýna ve Soyadýna göre çalýþanlarýn tüm bilgilerini getiren procedure'ü yazalým

Create Proc sp_BilgilerbyAdSoyad
	@isim nvarchar(10),
	@soyisim nvarchar(20)
AS
Select 
	* 
From 
	Employees e
where
	e.FirstName = @isim and 
	e.LastName = @soyisim

exec sp_BilgilerbyAdSoyad 'Nancy','Davolio'

--sp Güncelleme 

Alter Proc sp_BilgilerbyAdSoyad
	@isim nvarchar(10),
	@soyisim nvarchar(20),
	@City nvarchar(15) = NULL
AS
Select 
	* 
From 
	Employees e
where
	e.FirstName = @isim and 
	e.LastName = @soyisim and
	(@City IS NULL OR e.City = @City)

exec sp_BilgilerbyAdSoyad 'Nancy','Davolio','Seattle'

--sp silmek

Drop Proc sp_BilgilerbyAdSoyad

--sp ile insert 

CREATE PROCEDURE sp_InsertCustomer 
			@CustomerID nchar(5)
           ,@CompanyName nvarchar(40)
           ,@ContactName nvarchar(30) = NULL
           ,@ContactTitle nvarchar(30) = NULL
           ,@Address nvarchar(60) = NULL
           ,@City nvarchar(15) = NULL
           ,@Region nvarchar(15) = NULL
           ,@PostalCode nvarchar(10) = NULL
           ,@Country nvarchar(15) = NULL
           ,@Phone nvarchar(24) = NULL
           ,@Fax nvarchar(24) = NULL
AS
BEGIN
	INSERT INTO dbo.Customers
           (CustomerID
           ,CompanyName
           ,ContactName
           ,ContactTitle
           ,Address
           ,City
           ,Region
           ,PostalCode
           ,Country
           ,Phone
           ,Fax)
     VALUES
           (@CustomerID
           ,@CompanyName
           ,@ContactName
           ,@ContactTitle
           ,@Address
           ,@City
           ,@Region
           ,@PostalCode
           ,@Country
           ,@Phone
           ,@Fax)
END
GO

exec sp_InsertCustomer 'BLADM','Bilge Adam'

select * From Customers

-- Kullanýcýnýn belirttiði katoriyi eðer kategoriler tablosunda yok ise ekleyen SP yi yazýnýz. Kullanýcý SP'yi çalýþtýrýp sadece kategori adý ve açýklamasýný girecek. Eðer istenen kategori Categories tablosunda varsa 'bu kategori önceden eklenmiþ' uyarýsýný verip sadece eklenmek istenen kategorinin açýklamasýný güncelleyeceðiz.

Create Proc sp_KategoriEkle
	@categoryName nvarchar(15),
	@description ntext
AS
--IF EXISTS yapýsý ile belirtilen kaydýn tabloda olup olmadýðýný sorgulayabiliriz.
IF EXISTS (Select Categories.CategoryName From Categories Where Categories.CategoryName = @categoryName)
	BEGIN 
	Update Categories 
		Set Description = @description
	Where CategoryName = @categoryName
	Print 'Bu kategori daha önceden eklenmiþtir.Bu yüzden kategoriye ait açýklama bilgisi güncellenmiþtir.'
	END
ELSE
	BEGIN
		Insert Into Categories (CategoryName,Description)
		Values (@categoryName,@description)
	END

---Deðiþken Tanýmlama

Create Proc sp_SayilariTopla
	@sayi1 int,
	@sayi2 int,
	@sayi3 int
AS
BEGIN
	Declare @toplam int --int tipinde adý @toplam olan bir deðiþken tanýmladýk. (Deðiþkenler Declare keyword'ü ile tanýmlanýr)
	Set @toplam = @sayi1 + @sayi2 + @sayi3 -- Bir deðiþkene deðer atamasý iki þekilde yapýlýr. SET ve SELECT. Aralarýndaki fark þudur: Set ile tek bir deðiþkene deðer atanýrken, Select ile birden fazla deðiþkene deðer atanabilir.
	return @toplam
END

Declare @sonuc int
Exec @sonuc = sp_SayilariTopla 10,10,10
print 'Sonuc : ' + CAST(@sonuc as nvarchar)

--sp Out
Create Proc sp_SayilariToplaVeOrtalamasiniAl
	@sayi1 int,
	@sayi2 int,
	@sayi3 int,
	@avg decimal(15,2) output
AS
BEGIN
	Declare @toplam int 
	Set @toplam = @sayi1 + @sayi2 + @sayi3 
	Set @avg = @toplam / 3
	return @toplam
END

Declare @sonuc int, @ort decimal(15,2)
Exec @sonuc = sp_SayilariToplaVeOrtalamasiniAl 10,20,30,@ort output
print 'Sonuc : ' + CAST(@sonuc as nvarchar)
print 'Ortalama : ' + CAST(@ort as nvarchar)

--Ödev Ülkeler,Þehirler,ilçeler tablolarý içeren Bir Db oluþturun

/*
	Bir Procedure yazýlacak ve bu procedure ÜlkeAdý,Þehir Adý ve Ýlçe adý verilecek
	ülke kontrolü yapýlýp varsa idsi yakalanacak yoksa eklenip idsi alýnacak
	Þehir kontrolü yapýlacak varsa idsi yakalanacak yoksa ülke idsi ile birlikte eklenip idsi alýnacak 
	Ýlçe kontrolü yapýlacak varsa idsi yakalanacak ve bu ilçe zaten kayýtlýdýr uyarýsý verecek yoksa yakalanan ülke ve		þehir idsiile birlekte yeni kayýt yapýlacak.
*/

--SP kullanarak ürün ve kategori ekleme (eðer kategori daha önceden eklenmiþ ise yeniden eklemek yerine kategorinin ID bilgisini kullanacaðýz)

Create Proc sp_UrunveKategori
	@urunAdi nvarchar(40),
	@kategoriAdi nvarchar(15),
	@girilenUrunId int out
AS
BEGIN
	Declare @kategoriId int
	IF EXISTS (Select CategoryName From Categories Where CategoryName = @kategoriAdi)
		BEGIN
			Select @kategoriId = CategoryID From Categories Where CategoryName = @kategoriAdi
		END
	ELSE
		BEGIN
			Insert Categories (CategoryName) Values (@kategoriAdi)
			Select @kategoriId = @@IDENTITY --Girilen son kaydýn ID bilgisini döndüren Sql Server'da tanýmlý global deðiþken 
		END

	Insert Into Products(ProductName,CategoryID)
				Values(@urunAdi,@kategoriId)
		Set @girilenUrunId = @@IDENTITY
END


Declare @id int
Exec sp_UrunveKategori 'Süpriz Yumurta','Çikolata',@id out
Print 'Son girilen Ürün ID: ' + CAST(@id as nvarchar)

Select * From Categories order by CategoryID desc
Select * From Products order by ProductID desc
--Delete From Products Where ProductID = 78
--Delete From Categories Where CategoryID = 23

--Bir Proc içerisinden baþka bir Proc çaðýrma
Create Proc sp_InsertCategory
	@categoryName nvarchar(15),
	@categoryId int out
AS
	IF NOT EXISTS (Select * From Categories Where CategoryName = @categoryName)
		BEGIN
			Insert Into Categories (CategoryName) Values(@categoryName)
			Set @categoryId = @@IDENTITY 
		END
	ELSE
		BEGIN
			Select @categoryId = CategoryID From Categories Where CategoryName = @categoryName
		END
------------------------
Create Proc sp_InsertProduct
	@producytName nvarchar(40),
	@categoryName nvarchar(15),
	@unitprice money = 10
AS
	IF EXISTS (Select * From Products Where ProductName = @producytName)
		BEGIN
			Print('Bu ürün daha önceden eklendiði için, Product tablosu üzrinde herhangi bir kayýt iþlemi yapýlamadý')
		END
	ELSE
		BEGIN
			Declare @categoryId int
			Exec sp_InsertCategory @categoryName,@categoryId out --Baþka Bir SP çaðýrdýk
			Insert Into Products (ProductName,CategoryID,UnitPrice)
				Values(@producytName,@categoryId,@unitprice)
			Print('Belirttiðiniz Ürün Product tablosuna eklenmiþtir. Ürünün kayýt numarasý: ' + CAST(@@Identity as nvarchar))
		END
Exec sp_InsertProduct 'C200 AMG Coupe','Mercedes',250000

----------
/*
	TRIGGER
	Bir tablo üzerinde insert,update ve delete iþlemlerinden biri yapýldýðýnda otomatik olarak devreye girmesini istediðimiziþlemlerimiz varsa bunu trigger kullanarak gerçekleþtirebilirsiniz.

		Bu iþlemde bize yardýmcý olan iki sanal tablo vardýr. INSERTED ve DELETED

	2 Çeþit Trigger vardýr.
	1) DDL Triggerlar (Data Defination Language)
	2) DML Triggerlar (Data Manupilation Language)
	--2.1) After Trigger (For)
	--2.2) Instead Of Trigger
	
	After Trigger: Bir iþlem gerçekleþtikten sonra tetiklenir. Örn: Insert iþlemi yapýldýktan sonra

*/
Select * From [Order Details]
use Northwind
Create Trigger KayitEklendi
	On [Order Details]
	After Insert
As
	BEGIN
	Declare @urunId int, @miktar int
	Select @urunId = ProductID,@miktar = Quantity from inserted
	
	Update Products 
		Set UnitsInStock = UnitsInStock - @miktar
		Where ProductID = @urunId
	END

Insert Into [Order Details] (OrderID,ProductID,UnitPrice,Quantity,Discount)
			Values(10248,14,25,5,0)

Select * From Products Where ProductID = 14
Select * From Products


----Order Details Tablosundan kayýt silindiðinde Product tablosunda güncelleme yapan Trigger'ý yazýnýz...
Create Trigger KayitSilindi
	On [Order Details]
	After Delete
As
	BEGIN
	Declare @urunId int, @miktar int
	Select @urunId = ProductID,@miktar = Quantity from deleted
	
	Update Products 
		Set UnitsInStock = UnitsInStock + @miktar
		Where ProductID = @urunId
	END

Delete From [Order Details] where OrderID = 10248 and ProductID = 14
Select * From Products Where ProductID = 14

--Update
Create Trigger KayitGuncellendi
	On [Order Details]
	For Update
AS
BEGIN
	Declare @yeniMiktar int, @eskiMiktar int, @urunId int

	Select @yeniMiktar = Quantity,@urunId = ProductID From inserted --Güncelleme ile gireceðim yeni adet ve ürünId bilgilerini çekiyoruz.
	Select @eskiMiktar = Quantity from deleted -- Update iþleminde update edilecek ürünün adet miktarýný çekiyoruz.

	Update Products 
		Set UnitsInStock = UnitsInStock + (@eskiMiktar - @yeniMiktar)
		Where ProductID = @urunId
END

select * From [Order Details]

Update [Order Details] Set Quantity = 10 
Where OrderID = 10248 and ProductID = 14
Select * From Products Where ProductID = 14

---INSTEAD OF TRIGGER ----
--Bir çalýþaný silmek istersek gerçekten o çalýþan silinmemeli, Employees tablosuna eklemiþ olduðumuz silindimi kolonu true yapýlmalýdýr. Gerçekten bir çalýþaný silmek mantýklý  bir hareket deðildir. O çalýþanýn içeride sipariþler vs vardýr.

Create Trigger CalisanSil
	On Employees
	Instead Of Delete
AS
BEGIN
	Declare @calisanId int
	Select @calisanId = EmployeeID From deleted

	Update Employees 
		Set Durum = 0
		Where EmployeeID = @calisanId
END

Delete From Employees Where EmployeeID = 2
Select * FRom Employees

--Not: Instead Of Trigger'ý bir tablo üzerinde insert,update ve delete  iþlemleri için sadece birer sefer kullanabilirsiniz.

------------------------------------------------------------------
---- Kullanýcý Tanýmlý Fonksiyonlar (UDF - User Defined Functions)
--Fonksiyonlar geriye deðer döndüren yapýsal birimlerdir. Parametre alabilirler. ayný C# ve Stored Procedure'ler gibi önceden derlenmiþlerdir ve bu nedenle daha hýzlý çalýþýrlar.

--Fonksiyonlar geriye veri tiplerin tek bir deðer veya bir tablo döndürebilirler.
--View'ler arasýndaki fark view parametre almazken functionlar parametre alabilirler.

--Deðer döndüren fonksiyonlara 'Scalar Function', Tablo döndüren fonksiyonlarada 'Table Value Functions' denir.

/*
	SCALAR FONKSIYONLAR
	* Geriye tek bir deðer döndürürler. Genellikle matematiksel iþlemlerde kullanýlýrlar.
	* RETURNS <tip> ile geriye hangi tipte deðer döndürüleceði bildirilmelidir.
	* RETURN ifadesi ile de geriye fonksiyonun döndüreceði deðer belirtilir.
	* Fonksiyonu oluþturan kod bloðu BEGIN-END arasýnda yazýlýr ve kullanýlýrken tablo þemasýda belirtilir.
*/ 

--Klasik Sorgu
Select 
	p.ProductName as UrunAdi,
	c.CategoryName as Kategori,
	p.UnitPrice as BirimFiyat,
	p.UnitPrice * 1.18 as KDVDahil
From 
	Products p
Inner Join Categories c On c.CategoryID = p.CategoryID

--KDV Oranýný hesaplayan UDF
Create Function KDVHesapla(@fiyat money)
	RETURNS money
BEGIN
	RETURN @fiyat * 1.18 -- geriye function'ýn döndüreceði deðeri belirtiyoruz.
END
--Sorguda Function Kullanýmý
Select 
	p.ProductName as UrunAdi,
	c.CategoryName as Kategori,
	p.UnitPrice as BirimFiyat,
	dbo.KDVHesapla(p.UnitPrice) as KDVDahil
From 
	Products p
Inner Join Categories c On c.CategoryID = p.CategoryID

--Kiþilerin yaþlarýný hesaplayacak bir UDF yazalým.
Create Function YasHesapla(@dogumTarihi datetime)
	RETURNS int
		BEGIN
			Declare @yas int
			Set @yas = DATEDIFF(YY,@dogumTarihi,getdate())
			Return @yas 
		END

print(dbo.YasHesapla('1982-12-05 00:00:00.000'))

Select  
	e.FirstName,
	e.LastName,
	dbo.YasHesapla(e.BirthDate) as BirthDate
From Employees e 

/*
	Table Value Function - Tablo döndüren Fonksiyonlar
	
	* Scaler fonksiyonlar gibi dýþarýdan parametre alabilirler 
	* Begin - End Kullanýlmaz
	* Fonksiyon kullnýmýnda þema ismi kullanmaya gerek yok.
*/ 

Create Function CalisanBilgileriniGetir(@employeeID int)
	RETURNS TABLE
		RETURN
			Select * From Employees
			Where EmployeeID = @employeeID

Select * From CalisanBilgileriniGetir(3)
-----TRANSACTION ---
use master
Create DataBase BatanBank
ON PRIMARY
(
	NAME = 'DataFile', -- veri dosyasý
	SIZE = 6MB, --db ilk oluþturulduðundaki kaplayacaðý yer ve alaný
	FILENAME = 'C:\Veritabaný\BatanBank.mdf', --Master Data File
	FILEGROWTH = 3MB -- her yer dolduðunda 3'er mb lýk bu db için yer açýlacak	
)
LOG ON
(
	NAME = 'LogFile',
	SIZE = 1MB,
	FILENAME = 'C:\Veritabaný\BatanBank.ldf',
	FILEGROWTH = 10% 	
)
GO
use BatanBank

Create Table Sube
(
	SubeId int not null Primary Key Identity(1,1),
	SubeAd nvarchar(Max) not null,
	Adres nvarchar(MAX) Null
)
Create Table Musteri
(
	MusteriId int not null Primary Key Identity(1,1),
	Ad nvarchar(25) not null,
	SoyAd nvarchar(50) not null,
	TCKN char(11) Not null unique,
	DogumTarihi datetime null,
	Constraint chk_DogumTarihi Check(DogumTarihi < GETDATE()),
	Constraint chk_TCKN Check(TCKN LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
Create Table Hesaplar
(
	HesapId int not null Primary Key,
	MusteriId int Not Null Foreign Key References Musteri(MusteriId),
	SubeId int Not Null Foreign Key References Sube(SubeId),
	Bakiye Money Null, 
	Constraint chk_Bakiye Check(Bakiye > 0),
	Constraint chk_Hesap Check(HesapId LIKE '[0-9][0-9][0-9][0-9][0-9]')
)
GO
Alter Table Hesaplar
Add Constraint df_Bakiye Default(0) For Bakiye
GO

Insert Into Sube (SubeAd,Adres) Values ('Bakýrköy','Ýstanbul')
Insert Into Sube (SubeAd,Adres) Values ('Fatih','Ýstanbul')
Insert Into Sube (SubeAd,Adres) Values ('Merter','Ýstanbul')

Set DateFormat DMY -- Tarih Formatýný gün ay yýl olarak deðiþtirdim.

Insert Into Musteri(Ad,SoyAd,TCKN,DogumTarihi) Values ('Bilal','YILMAZ',52180385002,'12-05-1982')

Insert Into Musteri(Ad,SoyAd,TCKN,DogumTarihi) Values ('Veysel','SEVÝM',27529579844,'15-08-1995')

Insert Into Hesaplar (HesapId ,MusteriId,SubeId,Bakiye) 
	Values (12345,1,1,1000)
Insert Into Hesaplar (HesapId ,MusteriId,SubeId,Bakiye) 
	Values (54321,3,2,1000)

Select * From Sube
Select * From Musteri
Select * From Hesaplar 

Create Proc HavaleGonder
	@aliciHesap char(5),
	@gondericiHesap char(5),
	@miktar Money
AS
BEGIN
	 IF EXISTS (Select HesapId From Hesaplar Where HesapId = @aliciHesap)
		AND EXISTS (Select HesapId From Hesaplar Where HesapId = @gondericiHesap)
		BEGIN 
			IF (@miktar <= (Select Bakiye from Hesaplar Where HesapId = @gondericiHesap))
				BEGIN
					BEGIN TRY
						BEGIN TRANSACTION
						Update Hesaplar Set Bakiye = Bakiye + @miktar 
							Where HesapId = @aliciHesap
						Update Hesaplar Set Bakiye = Bakiye - @miktar 
							Where HesapId = @gondericiHesap
						COMMIT TRAN
					END TRY
					BEGIN CATCH
						ROLLBACK TRAN
							Print 'iþlemler Yapýlýrken bir hata oluþtu.'
					END CATCH
				END
			ELSE
				BEGIN
					Print('Yetersiz Bakiye')
				END
		END
	ELSE
		BEGIN
			Print('Girmiþ olduðunuz hesap bilgilerine ulaþýlamadý. Lütfen Hesap numaralarýnýzý kontrol ediniz!....')
		END
END


Exec HavaleGonder 54321,12345,100

Select * From Hesaplar

/* 1- Clustered index (FÝZÝKSEL ÝNDEX)
			 Genelde unique ve sayýsal alanlarda tavsiye edilir. Eðer unique bir alan dýþýnda kullanýrsak ve alan içerisinde tekrar eden veriler varsa index için server tarafýndan bir index belirlenir ve buda performans kaybýna neden olur.Ayrýca Clustered index olarak belirleyeceðimiz alanýn güncellenebilen alan olmamasýna dikkat etmemiz gerekir. Her güncellemede indexleme mekanizmasý sýralama için güncelleme yapacaðý için yine performans kaybý yaþanacaktýr.  Clustered Index her tabloda bir tane olmak zorundadýr.
			
			Önemli : Zaten her tabloda primary key olarak iþaretlediðimiz alanlar, otomatik clustered index olurlar. Tablomuzda primary key yoksa ve clustered index yapýsý oluþmayacaðýna göre eklemek için tablo sekmemizden indexes sekmesinden sað týk new clustered index diyerek istediðimiz kolonu primary key yapabiliriz. Eðer tablomuzda bir index varsa veya Clustered Index tanýmlýysa bu sekme aktif olmayacaktýr. 
			*/

Select * From Northwind..Products
use Northwind
Declare @sayac int = 1;
While @sayac < 50000
BEGIN
	Insert Into Uruns (ProductName,UnitPrice,UnitsInStock)
	Select p.ProductName,p.UnitPrice,p.UnitsInStock From Products p 

	Set @sayac += 1
END

Select * From Uruns

Set Statistics time On
Set Statistics io on
Select * From Uruns Where ProductID =  7903820
Set Statistics time off
Set Statistics io off
/*
(1 row(s) affected)
Table 'Uruns'. Scan count 5, logical reads 37004, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.

(1 row(s) affected)

 SQL Server Execution Times:
   CPU time = 342 ms,  elapsed time = 181 ms.

*/

/*2- Non-clustered (Fiziksel olmayan) Index => Ayný Clustered Indexte olduðu gibi Eðer unique bir alan dýþýnda kullanýrsak ve alan içerisinde tekrar eden veriler varsa index için server tarafýndan bir index belirlenir ve buda performans kaybýna neden olur.Ayrýca Non-Clustered index olarak belirleyeceðimiz alanýn güncellenebilen alan olmamasýna dikkat etmemiz gerekir.  Tablomuza Non-clustered index eklemek için tablo sekmemizden indexes sekmesinden sað týk new Non-clustered index diyerek istediðimiz kolonu seçip ekleyebiliriz.

		 Non-Clustered index yapýsýný niçin kullanýrýz;
			 1 * tek bir clustered index yapýsý kullandýðýmýz için.(primary key tanýmladýðýmýz zaman otomatik tanýmlanýyor)
			 2 * Pk dýþýndaki diðer alanlarýmýza da filtreleme uyguladðýmýz için
*/

Delete From Uruns

Select * From Northwind..Products
use Northwind
Declare @sayac int = 1;
While @sayac < 50000
BEGIN
	Insert Into Uruns (ProductName,UnitPrice,UnitsInStock)
	Select 
		p.ProductName + ' ' + CAST(@sayac as nvarchar),
		p.UnitPrice,
		p.UnitsInStock 
	From Products p  

	Set @sayac += 1
END

Select * From Uruns order by ProductName desc

Set Statistics time On
Set Statistics io on
Select * From Uruns Where ProductName =  'Chai 11520'
Set Statistics time off
Set Statistics io off