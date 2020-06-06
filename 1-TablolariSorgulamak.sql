--NOT: Sorgular�m�z� yazarken k���k-b�y�k harfe dikkat etmemize gerek yoktur. (E�er ba�lang��ta Server kurulurken bu ayar se�ilmi� ise)

--Yorum Sat�r�

/*
	�oklu
	Yorum 
	Sat�r�
 */

--DML -> Data Manipulation Language

Use Northwind --Northwind veritaban� �zerinde sorgulamalar yapaca��m�z i�in ya bu �ekilde sorgu ile yada sol �stte bulunan 'Avaible Databases' combobox'�n� kulllanarak  veritaban�m�z� se�eriz.

--TABLOLARI SORGULAMAK

--Select <s�tun_adlar�> From <tablo_ad�> -- (S�t�nlar aras�nda virg�l var)

--Employees tablosundaki t�m kay�tlar� listeleyelim

Select * From Employees 

--Result Ekran�n� CTRL + R ile a��p kapatabilirsiniz...

--Kolonlar� Filtrelemek

/*
select
	<kolonadi>,
	<kolonadi>,
	<kolonadi>,
	<kolonadi>
From <tabloadi>

*/
--1.Y�ntem
Select 
	CategoryID,
	ProductID,
	ProductName,
	UnitPrice,
	UnitsInStock
From Products

--2.Y�ntem
Select
	Products.CategoryID,
	Products.ProductID,
	Products.ProductName,
	Products.UnitPrice,
	Products.UnitsInStock
From Products

--3.Y�ntem
Select 
	p.CategoryID,
	p.ProductID,
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p

--4.Y�ntem
Select 
	Northwind.dbo.Products.CategoryID,
	Northwind.dbo.Products.ProductID,
	Northwind.dbo.Products.ProductName,
	Northwind.dbo.Products.UnitPrice,
	Northwind.dbo.Products.UnitsInStock 
From Northwind.dbo.Products

--5.Y�ntem
Select 
	Northwind..Products.CategoryID,
	Northwind..Products.ProductID,
	Northwind..Products.ProductName,
	Northwind..Products.UnitPrice,
	Northwind..Products.UnitsInStock 
From Northwind..Products

--6.Y�ntem
Select 
	p.CategoryID,
	p.ProductID,
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock 
From Northwind..Products p

--Ko�ullu Filtreleme (Where)

/*
select
	<kolonadi>,
	<kolonadi>,
	<kolonadi>,
	<kolonadi>
From <tabloadi>
Where <kriter>
*/

--Stok Miktar� 20'den fazla olan �r�nleri getiren sorguyu yaz�n�z....
Select 
	*
From 
	Products p
where
	p.UnitsInStock > 20

--Fiyat� 20'den fazla olan �r�nleri getiren sorguyu yaz�n�z...

Select 
	*
From 
	Products p
where
	p.UnitPrice > 20

/*
SORGU YAZARKEN �ZLENECEK Y�NTEM
1) Sorgunu belirle
2) Tablonu belirle
3) Kolonlar�n� belirle
4) Varsa kriterlerini belirle 

*/

--CategoryID,ProductID,ProductName,UnitPrice,UnitsInStock

--Fiyat� 20 ile 50 aras�nda olan �r�nleri getiren sorguyu yaz�n�z...(�r�nAd�,Fiyat�,StokMiktar�)
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
where 
	p.UnitPrice > 20 and
	p.UnitPrice < 50

--UrunId'si 10 dan k���k olan �r�nleri getiren sorguyu yaz�n�z...
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
		<tablo_ad�>
	WHERE 
		<kolonAdi> BETWEEN <birinciDeger> AND <ikinciDeger>
*/
--Fiyat� 20 ile 50 aras�nda olan �r�nleri getiren sorguyu yaz�n�z...(�r�nAd�,Fiyat�,StokMiktar�)
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
where 
	p.UnitPrice BETWEEN 20 AND 50 --20 Dahildir, 50 dahil de�ildir.

--S�TUNLARIN ISIMLENDIRILMESI
--Sorgu sonucu olu�acak olan sonu� k�mesindeki (result set) s�tun isimlerinin de�i�tirilmesi i�lemidir.
--Tablodaki orjinal s�tun isimlerinin de�i�tirilmesi s�z konusu de�ildir.

--Tedarik�iler tablosundan �irket ad�, yetkili ki�i, telefon,�ehir�lke ve adress bilgilerinin custom kolon isimleri ile getiren sorgu

Select 
	s.CompanyName as 'Firma Ad�', --1.Y�ntem
	s.ContactName 'Yetkili Ki�i', --2.Y�ntem
	s.Phone as Telefon, --3.Y�ntem
	s.City as [�ehir], --4.Y�ntem
	s.Country ULKE, --5.Y�ntem
	s.[Address] 
From 
	Suppliers s

--OR
--Londra ve paristeki m��terilerin �irket ad�, Yetkili ki�i, �ehir ve Adres bilgilerini getiren sorguyu yaz�n�z..
Select
	c.CompanyName as [�iket Ad�],
	c.ContactName as [Yetkili Ki�i],
	c.City as �ehir,
	c.Address as Adres
From
	Customers c
Where
	c.City = 'paris' OR c.City = 'london'

--�ehir Bilgisi Londra olmayan m��terilerin �irket ad�, Yetkili ki�i, �ehir ve Adres bilgilerini getiren sorguyu yaz�n�z..
Select
	c.CompanyName as [�iket Ad�],
	c.ContactName as [Yetkili Ki�i],
	c.City as �ehir,
	c.Address as Adres
From
	Customers c
Where
	--c.City != 'london' --1.Y�ntem
	c.City <> 'london' --2.Y�ntem

--London,Madrid,Paris ve Berlin'de olan m��terilerin CompanyName ve City bilgilerini getiren sorguyu yaz�n�z.

Select 
	c.CompanyName '�irket Ad�',
	c.City '�ehir'
From 
	Customers c
Where 
	c.City = 'london' OR
	c.City = 'madrid' OR
	c.City = 'Paris' OR
	c.City = 'Berlin'
--Yukar�daki sorguyu OR kullanmadan yaz�n�z...
Select 
	c.CompanyName '�irket Ad�',
	c.City '�ehir'
From 
	Customers c
Where 
	c.City IN ('london','madrid','paris','berlin')

--London,Madrid,Paris ve Berlin'de olmayan m��terilerin CompanyName ve City bilgilerini getiren sorguyu yaz�n�z.
-- Gri keywordlerin ba�lar�na NOT gelebilir.
Select 
	c.CompanyName '�irket Ad�',
	c.City '�ehir'
From 
	Customers c
Where 
	c.City NOT IN ('london','madrid','paris','berlin')

--TEK�L KAYITLARI L�STELEMEK

Select
	City
From
	Employees -- Ayn� �ehirler defalarca listelenir.

Select DISTINCT
	City
From 
	Employees -- Ayn� �ehirler sadece bir sefer listelenir.


-------------------------- REGULAR EXPRESSION - REGEX ---------------
--�irket ad�nda 'Market' ge�en m��terilerin bilgilerini getiren sorgu

Select 
	* 
From 
	Customers c 
Where
	c.CompanyName Like '%Market%'

--REGEX MANTI�I
-- % -> eklendi�i yerde ka� karakter oldu�u ve bu karakterlerin hangi karakterler oldu�u �nemli de�ildir, anlam�na gelir.
-- _ (alt tire) -> eklendi�i yerde tek bir karakteri temsil eder. Bu karakterin hangi karakter oldu�u �nemli de�ildir.

--�r�n Ad� i�erisinde 'A' i�eren �r�nlerin sorgusunu yazal�m.

Select 
	*
From 
	Products p
Where 
	p.ProductName LIKE '%A%'

--�r�n Ad� 'A' ile ba�layan �r�nlerin sorgusunu yazal�m.
Select 
	*
From 
	Products p
Where 
	p.ProductName LIKE 'A%'

--isminin i�erisinde 'an' harfleri olan �al��an�m kimdir.
Select 
	*
From 
	Employees e
Where 
	e.FirstName LIKE '%an%'

-- C ile ba�layan 3.harfi a olan ve toplam 5 harf olan
Select 
	* 
From 
	Products p
Where 
	--p.ProductName LIKE 'c_a__' -- C ile ba�layan 3.harfi a olan ve toplam 5 harf olan
	--p.ProductName LIKE 'c_[a-k]%'--C ile ba�layan 3.harfi a ile k aras�nda olsun
	--p.ProductName LIKE 'c_[ae]%'--C ile ba�layan 3.harfi a ve e olan �r�nler
	--p.ProductName LIKE 'c_[^a]%'--C ile ba�yan 3.Harfi a olmayan �r�nler
	p.ProductName LIKE '_o%meat'--ikinci harfi 'o' olan ve 'meat' ile biten �r�nler
----------------------REGEX END ------------------------------------

--Fax numaras� bo� olan m��terilerin bilgilerini getiren sorgu
Select 
	*
From 
	Customers c
Where 
	--c.Fax = '' --> WhiteSpace
	c.Fax is null --> NULL

-- ORDER BY (SIRALAMA)
--Order By s�ralama i�lemlerini yapar. Order By s�z dizimi Where ko�ulundan sonra belirtilir. Where ko�ulu kullan�lmayacaksa tablo ad�ndan sonra yaz�labilir.

--Order By s�z dizimi iki de�er al�r.

--1) ASC (Ascending)
--2) DESC (Descending)

--Order By default de�eri 'ASC' dir, ASC veya DESC yazmazsam default olarak 'ASC' olarak compiler derler.

--�r�n ad�na g�re �r�nleri s�ralayarak getiren sorgu [A-Z]
Select 
	*
From 
	Products p
Order By 
	p.ProductName ASC

--�r�nlerin �r�n ad�, Fiyat� ve stoktaki miktar�n� fiyata g�re pahal�dan ucuza do�ru s�ralay�n�z.

--1.Y�ntem
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
Order by 
	p.UnitPrice DESC

--2.Y�ntem
Select 
	p.ProductName,
	p.UnitPrice,
	p.UnitsInStock
From 
	Products p
Order by 2 DESC --Burada yukar�da belirtilen kolonlar�n s�ras� girilebilir.
--Dikkat -- E�er kolon isimleri yerine kolon numaras� ile s�ralama yap�l�rsa ve yeni kolon s�ras� eski kolonun s�ras�n� de�i�tirirse sorgu patlar.

--------------------Tarihler-------------------

--01.01.1996 ile 31.12.1996 tarihleri aras�ndaki sipari�lerin Sipari� ID'si, Tarihi, �ehir ve �lke bilgilerini getiren ve tarih kolonuna g�re tersten s�ralayan sorguyu yaz�n�z...

--1.Kullan�m
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate BETWEEN '01.01.1996' AND '1996-12-31' --> Noktal� veya treli olabilir.
Order By
	o.OrderDate DESC

--2.Kullan�m
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= '01.01.1996 00:00:00.000' AND o.OrderDate <= '1996-12-31 00:00:00.000' --> Noktal� veya treli olabilir.
Order By
	o.OrderDate DESC

--3.Kullan�m
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= '01/01/1996' AND o.OrderDate <= '1996/12/31' --> Noktal� veya treli olabilir.
Order By
	o.OrderDate DESC

--4.Kullan�m (CONVERT)
Select 
	o.OrderID as SiparisID,
	o.OrderDate as Tarih,
	o.ShipCity Sehir,
	o.ShipCountry Ulke
From 
	Orders o
Where 
	o.OrderDate >= CONVERT(datetime,'01/01/1996',103) AND o.OrderDate <= CONVERT(datetime,'31/12/1996',103) --> Noktal� veya treli olabilir.
Order By
	o.OrderDate DESC

--5.Kullan�m (CAST)
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
--6.Kullan�m (Zaman Metotlar�)
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
YEAR -> Verilen tarihtekii y�l de�erini d�nd�r�r.
MONTH -> Verilen tarihtekii ay de�erini d�nd�r�r.
DAY -> Verilen tarihtekii g�n de�erini d�nd�r�r.
GETDATE -> �u an ki sistem saat ve tarihini d�nd�r�r.

*/

--Do�um g�n� bu g�n olan �al��anlar�m�z�n ad,soyad,do�um tarihini getiren sorgu
Select
	e.FirstName + ' ' + e.LastName as 'AD SOYAD',
	e.BirthDate
From 
	Employees e
Where 
	DAY(e.BirthDate) = DAY(GETDATE()) AND
	MONTH(e.BirthDate) = MONTH(GETDATE())

--Sipari� Tarihi tarihte bu g�n olan sorguyu yaz�n�z..

Select
	*
From 
	Orders o
Where 
	DAY(o.OrderDate) = DAY(GETDATE()) AND
	MONTH(o.OrderDate) = MONTH(GETDATE())

--SubQuery (Sorgu i�inde Sorgu)

--Almak istedi�iniz tek sat�r tek h�crelik veri ise bu veri tablolarda ve kolonlarda yok ise veya hesaplama yapt�r�larak getirilmesi gerekiyorsa burada tek h�cre ve tek sat�r sonuc d�nd�ren sorgu kullanabiliriz

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

--Stok Miktar� ortalama stok miktar�n�n alt�nda olan �r�nleri getiren sorguyu yaz�n�z.

Select 
	*
From
	Products p
Where
	 p.UnitsInStock < (Select AVG(p.UnitsInStock) From Products p)
Order By 
	p.UnitsInStock DESC

--Stok Miktar� ortalama stok miktar�n�n alt�nda olan �r�nlerden stok miktar� en az olan 3 �r�n� getiren sorguyu yaz�n�z.

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


--En Pahal� 3 �r�n� getiren sorguyu yaz�n�z...

Select TOP 3
	*
From 
	Products p
Order By
	p.UnitPrice DESC

--Hangi �lkelerle i� yap�yoruz.
Select DISTINCT
	c.Country
From 
	Customers c

--ilk i�e ald���m �al��an�m kimdir.

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
  --NOT: Select ile mutlaka bir tablo ad� kullan�lmak zorunda de�iliz.

  Select 
	5 + 9 as Toplam, 
	9 - 5 as Fark, 
	5 * 9 as �arp�m, 
	5/3 as B�l�m, 
	5 % 2 as [Mod]

Select 'YMS 5528 - SQL SERVER DERSLER�' as Mesaj

Print 'YMS 5528 - SQL SERVER DERSLER�'

--STRING FONKSIYONLARI

Select ASCII('A') as 'ASCII KODU' -- Ascii kodunu verir

SELECT CHAR(65) AS KARAKTER --Ascii kodu verilen karakteri s�yler.

SELECT CHARINDEX('@','bilal.yilmaz@bilgeadam.com') as Konum

Select LEFT('Bilge Adam',4) as 'Soldan Karakter Say�s�'

Select RIGHT('Bilge Adam',6) as 'Sa�dan Karakter say�s�'

Select LEN('Bilge Adam') as [Karakter Say�s�]

Select LOWER('BiLGe AdAm') as [Hepsi K���k]

Select UPPER('BiLGe AdAm') as [Hepsi B�y�k]

Select LTRIM('              Bilge Adam') as [Soldaki Bo�luklar� Siler]

Select RTRIM('Bilge Adam               ') as [Sa�daki Bo�luklar� Siler]

Select LTRIM(RTRIM('           Bilge Adam              ')) as [T�m Bo�luklar� Siler]
-- TRIM Fonksiyonu bulunmamaktad�r.

Select REPLACE('Birbirbirilerine' , 'bir','��') as [Metinlerin Yerine Yenilerini Atar]

Select SUBSTRING('Bilge Adam Bak�rk�y Bili�im Akademisi',4,6) as 'Substring''in �rne�i'

Select REVERSE('Bilge Adam Bak�rk�y Bili�im Akademisi') as [Tersine �evirir]

Select 'Bilge Adam'+SPACE(30)+'Bak�rk�y' as [Belirtilen Miktar kadar bo�luk ekler]

Select REPLICATE('Bilge',5) as 'Belirtilen metni, belirtilen adet kadar �o�alt�r'

----CASE - WHEN - THEN
Select 
	e.FirstName,
	e.LastName,
	CASE(e.Country)
		When 'USA' Then 'Amerika Birle�ik DEvletleri'
		When 'UK' Then '�ngiltere Biirle�ik Krall�k'
	ELSE '�lkesi Belirtilmemi�'
	END as '�lke Ad�'
From 
	Employees e

--Employees tablosundan EmployeeID,FirstName,LastName'i �ekiniz. Fakat EmployeeID'si 5'ten k���k olanlar i�in "5'ten k���k" b�y�k olanlar i�in "5'ten B�y�k" e�it olanlar i�in "5'e e�ittir" yazd�r�n�z.. 

Select
  e.EmployeeID,
  e.FirstName,
  e.LastName,
  CASE
  When e.EmployeeID > 5 Then '5 ten b�y�k'
  When e.EmployeeID < 5 Then '5 ten k���k'
  ELSE '5 e e�it' 
  END as 'ID Durumu'
From
  Employees e

--Aggregate Function -B�t�nle�ik Fonksiyonlar
--Aggregate Function'lar her zaman tek de�er d�nd�r�r.

/*
SUM  : Toplama Fonksiyonudur, T�m de�erlerin toplam sonucunu elde eder.
AVG  : Ortalama almak i�in kullan�l�r.
COUNT: Sayma, Sat�r say�s�n� sayar.
MAX  : Max de�erini bulur.
MIN  : Min de�erini bulur.
ROUND: Yuvarlama, d�nen sonu�taki de�erin ',' virg�lden sonraki de�erini yuvarlar.
*/

--�uana kadarki toplam ciroyu hesaplayal�m...
Select
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) as [Toplam Ciro]
From 
	[Order Details] od

--Bug�ne kadar ka� adet �r�n satm���z?

Select 
	SUM(od.Quantity) as 'Toplam Sat�� Miktar�'
From 
	[Order Details] od

--Bu g�ne kadar ka� adet sipari�

Select 
	COUNT(*) --Bir tablodaki kay�t say�s�n� ��renebiliriz.
From 
	Orders

Select * From Employees
Select COUNT(*) From Employees
Select COUNT(EmployeeID) From Employees
Select COUNT(Region) From Employees
Select COUNT(DISTINCT City) From Employees

--�uan Fiyat� en pahal� �r�n

Select 
	MAX(UnitPrice) as 'En Pahal� �r�n Fiyat�'
From
	Products

Select MAX(FirstName) From Employees --S�tunun say�sal olmas�na gerek yok, alfabetik olarak en b�y�k de�eri g�sterir.

Select MIN(FirstName) From Employees --S�tunun say�sal olmas�na gerek yok, alfabetik olarak en k���k de�eri g�sterir.

--�uan Fiyat� en ucuz �r�n

Select 
	MIN(UnitPrice) as 'En ucuz �r�n Fiyat�'
From
	Products

--Kategoriye g�re �r�n say�s�n� getiren Sorgu
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
	COUNT(p.CategoryID) as '�r�n Say�s�'
From
	Products p 

--Yukar�daki Hata: Aggregate Function'dan gelen tek de�er, birden fazla sat�ra par�alanam�yor. Par�ala i�lemi i�in uyumlu olan verileri Group By ile gruplamam�z gerekiyor.

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAd�',
	COUNT(p.CategoryID) as '�r�n Say�s�'
From
	Products p
Group By
	p.CategoryID

------

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAd�',
	COUNT(*) as '�r�n Say�s�',
	SUM(p.UnitsInStock) as '�r�n Miktar�'
From 
	Products p
Group By
	p.CategoryID


--�lkelere G�re M��teri Da��l�m�n� Getiren Sorgu (�lke,M��teri Say�s�)

Select 
	c.Country,
	c.City,
	Count(*) as 'M��teri Say�s�' 
From 
	Customers c
Group By
	c.Country,
	c.City
Order BY 
	c.Country

--�al��anlar�n yapm�� oldu�u sipari� Adedi
Select 
	(
	Select 
		e.FirstName + ' ' + e.LastName 
	From 
		Employees e 
	Where 
		e.EmployeeID = o.EmployeeID
	) as �al��an,
	COUNT(*) as 'Sipari� Adedi'
From 
	Orders o
Group By
	o.EmployeeID
Order By
	[Sipari� Adedi] DESC

--�r�n Fiyat� $35'dan az olan �r�nlerin kategorilerine g�re gruplay�n�z...

Select	
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAd�',
	COUNT(*) as [�r�n Adedi]
From 
	Products p
Where  
	p.UnitPrice < 35
Group By
	p.CategoryID

--Ba� Harfi A-K aras�nda olan ve stok miktar� 5 - 50 aras�nda olan �r�nleri katogorilerine g�re gruplay�n�z.

Select 
	(Select c.CategoryName From Categories c Where c.CategoryID = p.CategoryID) as 'KategoriAd�',
	COUNT(*) as '�r�n Adedi'
From 
	Products p
Where 
	(p.ProductName LIKE '[A-K]%' )
	AND
	(p.UnitsInStock BETWEEN 5 AND 50) 
Group By
	p.CategoryID
	
--HAVING
--Sorgu sonucu gelen sonu� k�mesi �zerinde Aggregate Function fonksiyonlar�na ba�l� olacak �ekilde filtreleme i�lemi yapmak istiyorsak Where yarine Having kullan�r�z.

--Toplam Tutar� 2500 ile 3500 aras�nda olan sipari�lerin s�ralamas�n� sa�lay�n�z.
Select 
	od.OrderID as 'Sipari�No',
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) as 'Toplam Tutar' 
From 
	[Order Details] od
Group By
	od.OrderID
Having
	ROUND(SUM(od.Quantity * od.UnitPrice * (1-od.Discount)),2) BETWEEN 2500 AND 3500

--E�er bir sorguda Aggregate Function kullan�l�rsa bizden di�er kolonlar�n hepsini Group By i�erisine almam�z� ister ancak filtreleme i�lemi yapmak  istedi�imiz Aggregate kolonunu where anahtar kelimesi ile filtreleyememekteyiz, bunun yerine Having Anahtar s�zc��� kullan�l�r. Ancak Where gibi From'dan sonra de�il Group By'dan sonra yaz�l�r. 

--Her bir Sipari�eki toplam �r�n say�s� 200'den az olan �r�nleri listelleyiniz.. Sipari�ID,ToplamAdet,Sipari�Tutar�

Select 
	od.OrderID as 'Sipari�No',
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
--1) INNER JOIN : Bir tablodaki her bir kayd�n di�er tabloda bulunann kar��l�l�� ile Id'si �zerinden birbirine ba�lanarak sanki her iki tablonun birle�tirilmesi ile meydana gelen yeni bir tablo olu�turulmas� i�lemidir. (Inner Join ifadesi yazarken inner kelimesini yazmasakta yani sadece join yazarsak bu yine inner Join olarak i�leme al�n�r.)

--Product tablosundan ProductID,ProdunctName,CategoryId
--Categories tablosundan CategoryName,Description alanlar�n�n Inner Join y�ntemiyle �ekelim

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
	s.CompanyName as 'Tedarik�i'
From 
	Products p
Inner Join Categories c ON p.CategoryID = c.CategoryID
Inner Join Suppliers s On p.SupplierID = s.SupplierID

--Hangi Sipari�, Hangi �al��an taraf�ndan, Hangi m��teriye yap�lm�� listeleyiniz...
--Sipari�ID,Sipari� Tarihi,�al��an,M��teriAd�

SELECT * from Customers c
select * from Employees e
select * from Orders o

SELECT 
	o.OrderID, 
	o.OrderDate, 
	e.FirstName + '' + e.LastName AS '�al��an', 
	c.CompanyName AS 'M��teri Ad�' 
FROM Orders o 
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID

--�r�nlerin Kategorilerine G�re Toplam Stok Miktar�n� Getiren Sorguyu Yaz�n�z...

Select
	c.CategoryName as 'Kategori Ad�',
	SUM(p.UnitsInStock) as 'Toplam Stok'
From
	Categories c 
Inner Join Products p ON c.CategoryID = p.CategoryID
Group By 
	c.CategoryName

--Her bir �al��an�n toplam sat�� tutar� ne kadard�r.�al��an,Sat��Tutar�
Select * From Orders
Select * From Employees
Select * From [Order Details]

Select 
	(e.FirstName + ' ' + e.LastName) as �al��an,
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

--2.1) LEFT OUTER JOIN : Sorguya giren tablolardan soldakinin t�m kay�tlar�n� getirirken, sa�dakinin sadece ili�kili olan kay�tlar�n� getirir.

Select 
	p.ProductName,
	c.CategoryName
From 
	Products p
LEFT OUTER JOIN Categories c On p.CategoryID = c.CategoryID

--Her bir �al��an� rapor verdi�i ki�iyle birlikte listeleyelim.

Select 
	e1.FirstName + ' ' + e1.LastName as '�al��an',
	e2.FirstName + ' ' + e2.LastName as 'M�d�r'
 From 
	Employees e1 
LEFT OUTER JOIN Employees e2 On e1.ReportsTo = e2.EmployeeID

--2.1) RIGHT OUTER JOIN : Sorguya giren tablolardan sa�dakinin t�m kay�tlar�n� getirirken, soldakinin sadece ili�kili olan kay�tlar�n� getirir.

Select 
	e1.FirstName + ' ' + e1.LastName as '�al��an',
	e2.FirstName + ' ' + e2.LastName as 'M�d�r'
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

--ROW_NUMBER() sat�rlar i�in sanal id olu�turur.
Select 
	ROW_NUMBER() OVER(order by ContactTitle) as SatirNo,
	c.*
From 
	Customers c

-- Partition by ayn� de�erlere s�ral� id verme
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

--RowNumber ile Derived bir tablo alu�turarak sayfalama yapma


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

--Veritaban� CRUD i�lemlerine Giri�
--1) Insert: Veritaban�ndaki tablolardan birine yeni kay�t eklemek i�in kullanaca��m�z komuttur.
/*
Insert Into <tabloAd�>(<s�tunisimleri>) Values (<s�tunDe�erleri>)
*/ 
--1.Y�ntem
Insert Into
	Categories
		(Description,CategoryName)
	Values 
		('Vitaminlidir Bunlar','Meyveler')

Select * From Categories 


--A�a��daki insert i�lemi ba�ar�s�z olacakt�r, ��nk� Categories tablosunda Null ge�ilemeyen CategoryName s�tunu i�in bir de�er atamad�k.
Insert Into
	Categories
		(Description)
	Values 
		('Vitaminlidir Bunlar')

Select * From Categories

--2.Y�ntem
Insert Into 
	Shippers 
		Values ('MNG Kargo','0212 212 21 21')

Select * From Shippers

--Customers tablosuna 'Bilge Adam' isimli yeni bir m��teri kayd� ekleyiniz...

Insert Into 
	Customers 
		Values ('BLGAD','Bilge Adam','Bilge Demir','Akademi','Bak�rk�y','�stanbul','NULL','34000','TURKEY','0212 212 12 12','0212 212 12 13')

Select * From Customers

--2) Update : Bir tablodaki verileri g�ncellemek i�in kullan�l�r.

/*
	Update <tabload�> 
	Set <s�tunAd�> = <yenide�er>,
		 <s�tunAd�> = <yenide�er>,
		 <s�tunAd�> = <yenide�er>,
		 <s�tunAd�> = <yenide�er>,
	Where <s�tunAd�> = <ko�ul>
*/
 
 Select * From Customers Where CustomerID = 'BLGAD'
 Update Customers 
	Set CompanyName = 'Bilge Adam',
		ContactName = 'Bilal YILMAZ',
		ContactTitle = 'Bay',
		Address = 'Zeytinlik Mah. Bak�rk�y'
Where CustomerID = 'BLGAD'

--Employees tablosuna insert ile kendi kayd�n�z� ekleyin daha sonra kaydetti�iniz kayd� FirstName = 'Bilge', LastName = 'Adam' olarak g�ncelleyiniz....
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


------Tablolar aras� veri transferi -------

--Emplooyess tablosundaki verileri, Calisanlar tablosuna transfer edelim

--1.Y�ntem 'Select Insert'
Insert Into Calisanlar
Select * From Employees

Select * From Calisanlar

--Kolon filtreleme ile ta��ma
Insert Into Calisanlar (EmployeeID,FirstName,LastName,BirthDate)
Select e.EmployeeID,e.FirstName,e.LastName,e.BirthDate From Employees e

--2.Y�ntem 'Select Into'

select * Into Urunler From Products 

Select * From Urunler

--Kolon filtreleme ile ta��ma

select p.ProductID,p.ProductName,p.UnitPrice,p.UnitsInStock,p.CategoryID Into Urunler From Products  p
  

--3) DELETE : Bir tablodan kay�t silmek i�in kullan�l�r, Update gibi dikket edilmesi gerekir. T�m g�venlik kurallar� buradada ge�erlidir.

/*
	Delete From <tabload�> where ....
*/

Select * From Urunler

Delete From Urunler 

Drop Table Urunler

Select * From Urunler u Where u.ProductID = 25

--Delete From Urunler Where ProductID = 25


-------------------------- View ---------------------

/* View'ler genel olarak 2 ama� i�in kullan�l�r
1) Karma��k sorgular� basitle�tirmek i�in
2) Tablo eri�imini kullan�c� baz�nda k�s�tlamak i�in. */

--Bir sipari�in hangi �al��an taraf�ndan, hangi m��teriye, hangi kategorideki �r�nden, hangi fiyattan ka� adet sat�ld���n� listeleyiniz..

--�al��an�n ad�,soyad�,�nvan�,g�revi,i�e ba�lama tarihi
--M��terinin firmaad�,temsilcisini ve telefonunu 
--�r�nad�, stokmiktar�, birim fiyat�
--Sipari� adedi ve sat�� fiyat�n�
--Kategori ad�

Select * FRom Employees --employeeID
Select * From Customers --customerID
Select * From Products --produstID, categoryID
Select * From Orders --OrderID,CustomerID,employeeID
Select * From [Order Details] --OrderID,productID
Select * From Categories --categoryID

Create View SatisRaporu as
Select 
	(e.FirstName + ' ' + e.LastName) as '�al��an',
	e.TitleOfCourtesy as [�nvan],
	e.Title as G�revi,
	e.HireDate as '��e Ba�lama Tarihi',
	c.CompanyName as 'Firma Ad�',
	c.ContactName as 'Yetkili Ki�i',
	c.Phone as [M��teri Tel],
	p.ProductName as '�r�n Ad�',
	p.UnitsInStock as 'Stok Miktar�',
	od.UnitPrice as 'Birim Fiyat',
	o.OrderID as SiparisID,
	od.Quantity as 'Sipari� Adedi',
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

Create View Kategoriler -- Yeni Bir view Tan�mlad�k
As
Select 
	CategoryName,
	Description
From 
	Categories 

Select * From Kategoriler

--View �zerinden insert komutuda kullanabilirsiniz.
Insert Into Kategoriler(CategoryName,Description) Values('Mercedes','Bir Alman Araba Markas�')

Select * From Kategoriler --View bir tablo gibi �al���r

--View G�ncelleme
Alter View Kategoriler
As
	Select 
	CategoryID as [NO],
	CategoryName,
	Description
From 
	Categories 

Select * From Kategoriler 

--View ile With Check Option Kullan�m

--1.Ad�m View olu�turma
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
--2.Ad�m View'i ed�i�tirmek => City Bilgisi 'London' olanlar
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
--3.Ad�m View �zerinden Kay�t eklemek

Insert Into CalisanBilgileri(FirstName,LastName,Title,TitleOfCourtesy,City)
Values ('Halil','�zt�rk','Bilgi ��lem','Sistem Y�neticisi','�stanbul')

Select * FRom Employees

--4.Ad�m View G�ncelleme View �zerinden insert yapt���m�zda View ile belirlenen filtreye uygun �ekilde View yap�s�nda de�i�iklik yapal�m ve istenmeyen �ehir bilgisi hatas� verdirelim.
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
With Check Option -- Art�k insert i�leminde Where kriterine uygun kay�tlar� kabul edecek

Insert Into CalisanBilgileri(FirstName,LastName,Title,TitleOfCourtesy,City)
Values ('Halil','�zt�rk','Bilgi ��lem','Sistem Y�neticisi','�stanbul') --Bu kay�t art�k view'e eklenmez, ��nk� �ehir bilgisi kritere uymuyor.

Select * FRom Employees

-- With Schema Binding Kullan�m�

--Sorgular�m�zda base olarak ald���n�z tablolar�n i�erinde herhangi bir de�i�iklik yap�lmas�n� istemiyorsan�z (kolonlar ve kolonlar�n veri tipleri) With Schema Binding  kullanabilirsiniz. Dikkat edilmesi gereken bir di�er noktada select sorgumuzda From'dan sonra tablo ad�n�n ba��nda "dbo." yaz�larak sorgu �al��mas� gerekmektedir.

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

--VIEW ile With Encryption Kullan�m�
--View'� olu�turan kodlar�n ba�kalar� taraf�ndan g�r�nt�lenmesini istemiyorsak bu kodlar� �ifreleyebiliriz.

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

--Kilit A�mak

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


-------------CREATOR -- VER� TABANI OLU�TURMA ------------------------

use master
Create DataBase KUTUPHANE
ON PRIMARY
(
	NAME = 'DataFile', -- veri dosyas�
	SIZE = 6MB, --db ilk olu�turuldu�undaki kaplayaca�� yer ve alan�
	FILENAME = 'C:\Veritaban�\Kutuphane.mdf', --Master Data File
	MAXSIZE = 100MB,
	FILEGROWTH = 3MB -- her yer doldu�unda 3'er mb l�k bu db i�in yer a��lacak	
)
LOG ON
(
	NAME = 'LogFile',
	SIZE = 1MB,
	FILENAME = 'C:\Veritaban�\Kutuphane.ldf',
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

ALTER AUTHORIZATION ON DATABASE::Kutuphane To [sa]; --Database �zerinde sa user�n�n diagram yetkisi yoksa bu kod blo�u �al��t�r�l�r.

Create Table Cevirmen
(
	CevirmenID int not null Primary Key identity(1,1),
	Ad nvarchar(10) NOT NULL,
	SoyAd nvarchar(20) NOT NULL
)

--Bir tabloya sonradan kolon ilave edebiliriz
Alter Table Cevirmen
Add Mail varchar(100) NULL

--Ekledi�iniz kolon tipini g�ncelleyebilirsiniz.

Alter Table Cevirmen
Alter Column Mail nvarchar(MAX) NULL

--Kolon Silme

Alter Table Cevirmen
Drop Column Mail

---------------STORED PROCEDURE (Sakl� Yordamlar)----------------------
--TSQL komutlar� ile haz�rlad���m�z i�lemler b�t�n�n�n �al��t�r�lma an�nda derlenmesi ile size bir sonu� �reten sql server bile�enidir.

--�al��t�r�lma an�nda planlama sa�lar ve tekrar tekrar kullan�labilir.
--Query'lerinize otomatik parametrelendirme getirir.
--Uygulamalar aras�nda ortak kullan�labilir yap�dad�r.
--G�venli data modifikasyonu sa�lar.
--Network Bandwidth'inden tasarruf sa�lar.
--Jop Olarak tan�mlanabilir.
--Database objelerine g�venli eri�im sa�lar.

use Northwind
Create Procedure sp_CalisanlariGetir -- Stored Procedure'�n olu�turlmas�
as -- Bu Procedure a�a��daki sorguyu i�erecek
Select 
		FirstName,
		LastName,
		Title
From Northwind..Employees 
Where City IS NOT NULL

Execute sp_CalisanlariGetir --Stored Procedure �al��t�r�lmas� i�lemi

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
	@catID int --Proc'e parametre aktar�yoruz. Parametreler yaz�l�rken, �nce parametre ad� (ba��nda @ ile beraber), daha sonra ise parametrenin tipi yaz�l�r.
AS
Select 
	*
From 
	Products p
Where 
	p.CategoryID = @catID --Burada tan�mlad���m�z parametreyi at�yoruz.

exec sp_UrunlerByKategori 2

exec sp_UrunlerByKategori @catID = 2

--Ad�na ve Soyad�na g�re �al��anlar�n t�m bilgilerini getiren procedure'� yazal�m

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

--sp G�ncelleme 

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

-- Kullan�c�n�n belirtti�i katoriyi e�er kategoriler tablosunda yok ise ekleyen SP yi yaz�n�z. Kullan�c� SP'yi �al��t�r�p sadece kategori ad� ve a��klamas�n� girecek. E�er istenen kategori Categories tablosunda varsa 'bu kategori �nceden eklenmi�' uyar�s�n� verip sadece eklenmek istenen kategorinin a��klamas�n� g�ncelleyece�iz.

Create Proc sp_KategoriEkle
	@categoryName nvarchar(15),
	@description ntext
AS
--IF EXISTS yap�s� ile belirtilen kayd�n tabloda olup olmad���n� sorgulayabiliriz.
IF EXISTS (Select Categories.CategoryName From Categories Where Categories.CategoryName = @categoryName)
	BEGIN 
	Update Categories 
		Set Description = @description
	Where CategoryName = @categoryName
	Print 'Bu kategori daha �nceden eklenmi�tir.Bu y�zden kategoriye ait a��klama bilgisi g�ncellenmi�tir.'
	END
ELSE
	BEGIN
		Insert Into Categories (CategoryName,Description)
		Values (@categoryName,@description)
	END

---De�i�ken Tan�mlama

Create Proc sp_SayilariTopla
	@sayi1 int,
	@sayi2 int,
	@sayi3 int
AS
BEGIN
	Declare @toplam int --int tipinde ad� @toplam olan bir de�i�ken tan�mlad�k. (De�i�kenler Declare keyword'� ile tan�mlan�r)
	Set @toplam = @sayi1 + @sayi2 + @sayi3 -- Bir de�i�kene de�er atamas� iki �ekilde yap�l�r. SET ve SELECT. Aralar�ndaki fark �udur: Set ile tek bir de�i�kene de�er atan�rken, Select ile birden fazla de�i�kene de�er atanabilir.
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

--�dev �lkeler,�ehirler,il�eler tablolar� i�eren Bir Db olu�turun

/*
	Bir Procedure yaz�lacak ve bu procedure �lkeAd�,�ehir Ad� ve �l�e ad� verilecek
	�lke kontrol� yap�l�p varsa idsi yakalanacak yoksa eklenip idsi al�nacak
	�ehir kontrol� yap�lacak varsa idsi yakalanacak yoksa �lke idsi ile birlikte eklenip idsi al�nacak 
	�l�e kontrol� yap�lacak varsa idsi yakalanacak ve bu il�e zaten kay�tl�d�r uyar�s� verecek yoksa yakalanan �lke ve		�ehir idsiile birlekte yeni kay�t yap�lacak.
*/

--SP kullanarak �r�n ve kategori ekleme (e�er kategori daha �nceden eklenmi� ise yeniden eklemek yerine kategorinin ID bilgisini kullanaca��z)

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
			Select @kategoriId = @@IDENTITY --Girilen son kayd�n ID bilgisini d�nd�ren Sql Server'da tan�ml� global de�i�ken 
		END

	Insert Into Products(ProductName,CategoryID)
				Values(@urunAdi,@kategoriId)
		Set @girilenUrunId = @@IDENTITY
END


Declare @id int
Exec sp_UrunveKategori 'S�priz Yumurta','�ikolata',@id out
Print 'Son girilen �r�n ID: ' + CAST(@id as nvarchar)

Select * From Categories order by CategoryID desc
Select * From Products order by ProductID desc
--Delete From Products Where ProductID = 78
--Delete From Categories Where CategoryID = 23

--Bir Proc i�erisinden ba�ka bir Proc �a��rma
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
			Print('Bu �r�n daha �nceden eklendi�i i�in, Product tablosu �zrinde herhangi bir kay�t i�lemi yap�lamad�')
		END
	ELSE
		BEGIN
			Declare @categoryId int
			Exec sp_InsertCategory @categoryName,@categoryId out --Ba�ka Bir SP �a��rd�k
			Insert Into Products (ProductName,CategoryID,UnitPrice)
				Values(@producytName,@categoryId,@unitprice)
			Print('Belirtti�iniz �r�n Product tablosuna eklenmi�tir. �r�n�n kay�t numaras�: ' + CAST(@@Identity as nvarchar))
		END
Exec sp_InsertProduct 'C200 AMG Coupe','Mercedes',250000

----------
/*
	TRIGGER
	Bir tablo �zerinde insert,update ve delete i�lemlerinden biri yap�ld���nda otomatik olarak devreye girmesini istedi�imizi�lemlerimiz varsa bunu trigger kullanarak ger�ekle�tirebilirsiniz.

		Bu i�lemde bize yard�mc� olan iki sanal tablo vard�r. INSERTED ve DELETED

	2 �e�it Trigger vard�r.
	1) DDL Triggerlar (Data Defination Language)
	2) DML Triggerlar (Data Manupilation Language)
	--2.1) After Trigger (For)
	--2.2) Instead Of Trigger
	
	After Trigger: Bir i�lem ger�ekle�tikten sonra tetiklenir. �rn: Insert i�lemi yap�ld�ktan sonra

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


----Order Details Tablosundan kay�t silindi�inde Product tablosunda g�ncelleme yapan Trigger'� yaz�n�z...
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

	Select @yeniMiktar = Quantity,@urunId = ProductID From inserted --G�ncelleme ile girece�im yeni adet ve �r�nId bilgilerini �ekiyoruz.
	Select @eskiMiktar = Quantity from deleted -- Update i�leminde update edilecek �r�n�n adet miktar�n� �ekiyoruz.

	Update Products 
		Set UnitsInStock = UnitsInStock + (@eskiMiktar - @yeniMiktar)
		Where ProductID = @urunId
END

select * From [Order Details]

Update [Order Details] Set Quantity = 10 
Where OrderID = 10248 and ProductID = 14
Select * From Products Where ProductID = 14

---INSTEAD OF TRIGGER ----
--Bir �al��an� silmek istersek ger�ekten o �al��an silinmemeli, Employees tablosuna eklemi� oldu�umuz silindimi kolonu true yap�lmal�d�r. Ger�ekten bir �al��an� silmek mant�kl�  bir hareket de�ildir. O �al��an�n i�eride sipari�ler vs vard�r.

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

--Not: Instead Of Trigger'� bir tablo �zerinde insert,update ve delete  i�lemleri i�in sadece birer sefer kullanabilirsiniz.

------------------------------------------------------------------
---- Kullan�c� Tan�ml� Fonksiyonlar (UDF - User Defined Functions)
--Fonksiyonlar geriye de�er d�nd�ren yap�sal birimlerdir. Parametre alabilirler. ayn� C# ve Stored Procedure'ler gibi �nceden derlenmi�lerdir ve bu nedenle daha h�zl� �al���rlar.

--Fonksiyonlar geriye veri tiplerin tek bir de�er veya bir tablo d�nd�rebilirler.
--View'ler aras�ndaki fark view parametre almazken functionlar parametre alabilirler.

--De�er d�nd�ren fonksiyonlara 'Scalar Function', Tablo d�nd�ren fonksiyonlarada 'Table Value Functions' denir.

/*
	SCALAR FONKSIYONLAR
	* Geriye tek bir de�er d�nd�r�rler. Genellikle matematiksel i�lemlerde kullan�l�rlar.
	* RETURNS <tip> ile geriye hangi tipte de�er d�nd�r�lece�i bildirilmelidir.
	* RETURN ifadesi ile de geriye fonksiyonun d�nd�rece�i de�er belirtilir.
	* Fonksiyonu olu�turan kod blo�u BEGIN-END aras�nda yaz�l�r ve kullan�l�rken tablo �emas�da belirtilir.
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

--KDV Oran�n� hesaplayan UDF
Create Function KDVHesapla(@fiyat money)
	RETURNS money
BEGIN
	RETURN @fiyat * 1.18 -- geriye function'�n d�nd�rece�i de�eri belirtiyoruz.
END
--Sorguda Function Kullan�m�
Select 
	p.ProductName as UrunAdi,
	c.CategoryName as Kategori,
	p.UnitPrice as BirimFiyat,
	dbo.KDVHesapla(p.UnitPrice) as KDVDahil
From 
	Products p
Inner Join Categories c On c.CategoryID = p.CategoryID

--Ki�ilerin ya�lar�n� hesaplayacak bir UDF yazal�m.
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
	Table Value Function - Tablo d�nd�ren Fonksiyonlar
	
	* Scaler fonksiyonlar gibi d��ar�dan parametre alabilirler 
	* Begin - End Kullan�lmaz
	* Fonksiyon kulln�m�nda �ema ismi kullanmaya gerek yok.
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
	NAME = 'DataFile', -- veri dosyas�
	SIZE = 6MB, --db ilk olu�turuldu�undaki kaplayaca�� yer ve alan�
	FILENAME = 'C:\Veritaban�\BatanBank.mdf', --Master Data File
	FILEGROWTH = 3MB -- her yer doldu�unda 3'er mb l�k bu db i�in yer a��lacak	
)
LOG ON
(
	NAME = 'LogFile',
	SIZE = 1MB,
	FILENAME = 'C:\Veritaban�\BatanBank.ldf',
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

Insert Into Sube (SubeAd,Adres) Values ('Bak�rk�y','�stanbul')
Insert Into Sube (SubeAd,Adres) Values ('Fatih','�stanbul')
Insert Into Sube (SubeAd,Adres) Values ('Merter','�stanbul')

Set DateFormat DMY -- Tarih Format�n� g�n ay y�l olarak de�i�tirdim.

Insert Into Musteri(Ad,SoyAd,TCKN,DogumTarihi) Values ('Bilal','YILMAZ',52180385002,'12-05-1982')

Insert Into Musteri(Ad,SoyAd,TCKN,DogumTarihi) Values ('Veysel','SEV�M',27529579844,'15-08-1995')

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
							Print 'i�lemler Yap�l�rken bir hata olu�tu.'
					END CATCH
				END
			ELSE
				BEGIN
					Print('Yetersiz Bakiye')
				END
		END
	ELSE
		BEGIN
			Print('Girmi� oldu�unuz hesap bilgilerine ula��lamad�. L�tfen Hesap numaralar�n�z� kontrol ediniz!....')
		END
END


Exec HavaleGonder 54321,12345,100

Select * From Hesaplar

/* 1- Clustered index (F�Z�KSEL �NDEX)
			 Genelde unique ve say�sal alanlarda tavsiye edilir. E�er unique bir alan d���nda kullan�rsak ve alan i�erisinde tekrar eden veriler varsa index i�in server taraf�ndan bir index belirlenir ve buda performans kayb�na neden olur.Ayr�ca Clustered index olarak belirleyece�imiz alan�n g�ncellenebilen alan olmamas�na dikkat etmemiz gerekir. Her g�ncellemede indexleme mekanizmas� s�ralama i�in g�ncelleme yapaca�� i�in yine performans kayb� ya�anacakt�r.  Clustered Index her tabloda bir tane olmak zorundad�r.
			
			�nemli : Zaten her tabloda primary key olarak i�aretledi�imiz alanlar, otomatik clustered index olurlar. Tablomuzda primary key yoksa ve clustered index yap�s� olu�mayaca��na g�re eklemek i�in tablo sekmemizden indexes sekmesinden sa� t�k new clustered index diyerek istedi�imiz kolonu primary key yapabiliriz. E�er tablomuzda bir index varsa veya Clustered Index tan�ml�ysa bu sekme aktif olmayacakt�r. 
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

/*2- Non-clustered (Fiziksel olmayan) Index => Ayn� Clustered Indexte oldu�u gibi E�er unique bir alan d���nda kullan�rsak ve alan i�erisinde tekrar eden veriler varsa index i�in server taraf�ndan bir index belirlenir ve buda performans kayb�na neden olur.Ayr�ca Non-Clustered index olarak belirleyece�imiz alan�n g�ncellenebilen alan olmamas�na dikkat etmemiz gerekir.  Tablomuza Non-clustered index eklemek i�in tablo sekmemizden indexes sekmesinden sa� t�k new Non-clustered index diyerek istedi�imiz kolonu se�ip ekleyebiliriz.

		 Non-Clustered index yap�s�n� ni�in kullan�r�z;
			 1 * tek bir clustered index yap�s� kulland���m�z i�in.(primary key tan�mlad���m�z zaman otomatik tan�mlan�yor)
			 2 * Pk d���ndaki di�er alanlar�m�za da filtreleme uygulad��m�z i�in
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