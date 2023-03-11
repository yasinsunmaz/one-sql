/*
  Tüm sorgular Northwind veri tabanı üzerinden kullanılarak hazırlanmıştır. Eksik konular eklenecektir.
  Website: www.yasinsunmaz.com
  Veri tabanı indirme linki: www.yasinsunmaz.com
  Yazar: yasinsunmaz
*/
USE Northwind
GO
/*
  --1. Opertörler
  --2. SELECT ve Operatörlerin Kullanımı
  --3. LIKE Kullanımı
  --4. SQL Komutları
  --5. SQL Sayısal Fonksiyonlar ve İşlemler
  --6. SQL Metinsel Fonksiyonlar ve İşlemler
  --7. SQL Tarihsel Fonksiyonlar ve İşlemler
  --8. EXPECT Kullanımı
  --9. INTERSECT Kullanımı
  --10. CASE WHEN Kullanımı
  --11. ISNULL Kullanımı
  --12. IS NOT NULL Kullanımı
  --13. GROUP BY, HAVING Kullanımı
  --14. WHILE Kullanımı
  --15. Kolon Adı Arama
  --16. CURSOR Kullanımı
  --17. SQL'de Aynı Tablo İçerisindeki Verileri Yeniden Ekleme
  --18. Tablo Adı Değiştirme
  --19. INSERT Kayıt Ekleme
  --20. OUTPUT KULLANIMI
  --21. UPDATE Kayıt Güncelleme
  --22. DELETE Kayıt Silme
  --23. DROP Komutu Kullanımı
  --24. TRUNCATE Komutu Kullanımı
  --25. EXITS ve NOT EXITS Kullanımı
  --26. SYNONYM Kullanımı
  --27. ROW_NUMBER() Kullanımı
  --28. ROW_NUMBER(), RANK(), DENSE_RANK() Kullanımı
  --29. CUME_DIST() Kullanımı
  --30. FIRST_VALUE() Kullanımı
  --31. LAST_VALUE() Kullanımı
  --32. LEAD() Kullanımı
  --33. LAG() Kullanımı
  */

BEGIN--Operatörler
/*
=	Eşit
<>	Eşit Değil. "!=" kullanılabilir.
>	Büyüktür
<	Küçüktür
>=	Büyük Eşit
<=	Küçük Eşit
BETWEEN Arasında
LIKE İçinde Arama
IN İçerir
NOT IN İçermez
AND Ve
OR Veya
*/
--Operatörler Bitiş
END

BEGIN--SELECT ve Operatörlerin Kullanımı
  --Veri çekme, listleme ve fonksiyon gibi bir çok işlemleri çalıştırmak için kullanılır.
  SELECT
    *
  FROM Employees

  SELECT
    Employees.*
  FROM Employees
  --AS Kullanımı | Tablo isimlerini kısaltmak veya sorgu sonuçlarında sütunlara belirli adlar vermek için kullanılan ALIASES yani geçici bir addır.
  SELECT
    e.FirstName AS Ad
   ,e.LastName AS Soyad
  FROM Employees AS e

  --WHERE Kullanımı | Koşul ifadesidir.
  SELECT
    *
  FROM Employees AS e
  WHERE e.Country = 'USA'

  --AND Kullanılımı | Her iki koşulun da doğru olması gerektiği durumlarda kullanılır
  SELECT
    *
  FROM Employees AS e
  WHERE e.City = 'London'
  AND e.TitleOfCourtesy = 'Mr.'

  --OR Kullanımı | Birinci veya ikinci koşuldan biri doğru olması gerektiği durumlarda kullanılır
  SELECT
    *
  FROM Employees AS e
  WHERE e.City = 'London'
  OR e.TitleOfCourtesy = 'Mr.'
  --ORDER BY Kullanımı(Artan veya azalan değerler belirtmek için kullanılır.)
  SELECT
    *
  FROM Employees AS e
  ORDER BY e.FirstName

  --DESC eklediğinde azalarak devam eder
  SELECT
    *
  FROM Employees AS e
  ORDER BY e.FirstName DESC

  --IN Kullanımı | Bir sütun için birden çok olası değerleri belirtmek için kullanılır.
  SELECT
    *
  FROM Employees AS e
  WHERE e.City IN ('London', 'Redmond')

  --NOT IN Kullanımı | Bir sütun için birden çok değerin barındırmaması için kullanılan koşuldur.
  SELECT
    *
  FROM Employees AS e
  WHERE e.City NOT IN ('London', 'Redmond')

  --BETWEEN Kullanımı | Belirli kriterler arasındaki değerleri getirir.
  SELECT
    *
  FROM Employees AS e
  WHERE e.Extension BETWEEN 3000 AND 4000

  SELECT
    *
  FROM Employees
  WHERE FirstName BETWEEN 'S' AND 'T'

  --NOT BETWEEN Kullanımı | Belirli kriterler dışındaki değerleri getirir.
  SELECT
    *
  FROM Employees AS e
  WHERE e.Extension NOT BETWEEN 3000 AND 4000

  SELECT
    *
  FROM Employees
  WHERE FirstName NOT BETWEEN 'S' AND 'T'

END

BEGIN--LIKE Kullanımı
  --Belirtilen bir değeri aramak için kullanılır.
  --A ile başlayan isimleri listeler
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName LIKE 'A%'

  --T ile biten isimleri listeler
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName LIKE '%T'

  --İçinde "G" harfi geçen isimleri listeler
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName LIKE '%G%'

  --LIKE Yer Tutucular
  --İstenilen alandaki karakterleri belirleyip diğerleri fark etmezsizin listeleme yapar
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName LIKE '_an__'

  --Adı A,N veya J ile başlayanları listeler
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName LIKE '[ANJ]%'

  --Adı A,N veya J ile başlamayanları listeler
  SELECT
    *
  FROM Employees AS e
  WHERE e.FirstName NOT LIKE '[ANJ]%'
--LIKE Kullanımı Son
END

BEGIN--SQL Genel Komutları
  --NEWID() Kullanımı(Yeni id değeri oluşturur)
  SELECT
    NEWID() AS YeniID

  --COUNT() Kullanımı | Kayıt sayısı döndürür.
  SELECT
    COUNT(*) AS UrunSayisi
  FROM Products AS p

  --TOP() Kullanımı | İlk 5 kaydı getirir.
  SELECT TOP 5
    *
  FROM Employees

  --DISTINCT Kullanımı | Verileri filtereme işlemi yapar. 
  SELECT DISTINCT
    e.City
  FROM Employees AS e

  --Kaç farklı şehir olduğunu döndürür.
  SELECT
    COUNT(DISTINCT e.City) AS SehirSayisi
  FROM Employees AS e

  --AVG Kullanımı | Sütunun ortalama değerini döndürür.
  SELECT
    AVG(p.UnitPrice) AS OrtalamaUcret
  FROM Products AS p

  --Tablodaki ortama fiyattan büyük olan kayıtları getirir.
  SELECT
    *
  FROM Products AS p
  WHERE p.UnitPrice > (SELECT
      AVG(p.UnitPrice)
    FROM Products AS p)

  --MAX() Kullanımı | En büyük değeri döndürür.
  SELECT
    MAX(p.UnitPrice) AS EnPahaliUrun
  FROM Products AS p

  --MIN() Kullanımı | En küçük değeri döndürür.
  SELECT
    MIN(p.UnitPrice) AS EnUcuzUrun
  FROM Products AS p

  --MAX ve MIN
  SELECT
    MAX(p.UnitPrice) AS EnPahaliUrun
   ,MIN(p.UnitPrice) AS EnUcuzUrun
  FROM Products AS p
--SQL Komutları Son
END

BEGIN--SQL Sayısal Fonksiyonlar ve İşlemler
  --SELECT İle 4 İşlem

  SELECT
    p.UnitPrice
   ,p.UnitPrice + 10 AS UrunGuncelFiyati
  FROM Products AS p
  WHERE p.UnitPrice > 20

  --Mod Kullanımı
  SELECT
    p.UnitPrice
   ,p.UnitPrice % 100 AS ModSonucu
  FROM Products AS p
  WHERE p.UnitPrice > 20

  --ROUND Kullanımı | Ondalık sayıyı yuvarlamak için kullanılır.
  SELECT
    p.UnitPrice
   ,ROUND(p.UnitPrice, 0) AS YeniFiyat
  FROM Products AS p

  --CEILING() Kullanımı | Ondalık sayıyı bir üst sayıya yuvarlamak için kullanılır.
  SELECT
    CEILING(1.33) AS Sonuc

  --FLOOR() Kullanımı | Ondalık sayıyı bir alt sayıya yuvarlamak için kullanılır.
  SELECT
    FLOOR(1.33) AS Sonuc

  --ABS() Kullanımı | Sayının mutlak değerini döndürür.
  SELECT
    p.UnitPrice
   ,ABS(p.UnitPrice) AS MutlakDegerSonucu
  FROM Products AS p

  --SQUARE() Kullanımı | Sayının karesini alır.
  SELECT
    p.UnitPrice
   ,SQUARE(p.UnitPrice) AS SayininKaresi
  FROM Products AS p

  --RAND() Kullanımı | 0 ve 1 arasında rastgele ondalıklı değer üretir. Eğer aralığı arttırmak isterseniz yanına max değeri yazabilirsiniz.
  SELECT
    RAND() * 100 AS RastgeleSayi

  --PI() Kullanımı | Pi sayısını listeler.
  SELECT
    PI() AS PISayisi

  --SQRT Kullanımı | Sayının karekökünü alır.
  SELECT
    SQRT(4) AS Karekoku

  --POWER Kullanımı | Sayının belirtilen sayı kadar üssünü alır. İki parametreli olarak değer almaktadır.
  SELECT
    POWER(5, 3) AS Sonuc

  --SIGN() Kullanımı | Sayı pozitif ise 1, negatif ise -1 ve 0 girilirse de 0 döndürür.
  SELECT
    SIGN(-50) AS Sayiİsareti

  --LOG() Kullanımı | Sayının logaritmasını alır.
  SELECT
    LOG(10) AS Sonuc

  --LOG10() Kullanımı | Sayının 10'luk logaritmasını alır.
  SELECT
    LOG10(10) AS Sonuc

  --ISNUMERIC() Kullanımı | Veri türünün sayısal olup olmadığını verir. Sayısal ise 1 değilse 0 değeri döndürür.
  SELECT
    ISNUMERIC('yasin') AS Sonuc

--5. SQL Sayısal Fonksiyonlar ve İşlemler Son
END

BEGIN--SQL Metinsel Fonksiyonlar ve İşlemler
  --ASCII() Kullanımı | Karakter yerine bir metin girilirse metnin ilk karakterini ASCII değerini verir.
  SELECT
    e.FirstName
   ,ASCII(e.FirstName) AS ASCIIKarsiligi
  FROM Employees AS e

  --CHAR() Kullanımı | 0-255 arası girilen tam sayının ASCII tablosundaki karşılığı olan karakteri verir. Girilen sayı bu aralık dışındaysa NULL değeri döner.
  SELECT
    e.FirstName
   ,CHAR(77) AS ASCIISonucu
  FROM Employees AS e

  --ASCII() ve CHAR() Mantığı
  SELECT
    e.FirstName
   ,ASCII(e.FirstName) AS ASCIIKarsiligi
   ,CHAR(ASCII(e.FirstName)) AS ASCIISonucu
  FROM Employees AS e

  --CHARINDEX() Kullanımı | Geriye dönen değer bulunan değerin kaçıncı karakterden itibaren başladığını döndürür.
  SELECT
    e.FirstName
   ,CHARINDEX('e', e.FirstName) AS eHarfiKacinciKarakterdenBasliyor
  FROM Employees AS e

  --CHARINDEX() Kullanımı | 2 parametreli olarak ya da 3 parametreli olarak kullanılabilir. 
  --3. parametre isteğe bağlı kullanılır. Aramaya kaçıncı karakterden başlanacağı belirtilir. Eğer kullanılmazsa ilk karakterden arama başlatılır.
  SELECT
    e.FirstName
   ,CHARINDEX('e', e.FirstName, 5) AS eHarfi5KarakterdenSonrakiler
  FROM Employees AS e

  --NCHAR() Kullanımı | Verilen bir tamsayı kodu karşılığı olan Unicode karakteri döndürür. 0-65535 arası değer alabilir.
  SELECT
    NCHAR(1249) AS UnicodeKarsiligi

  --PATINDEX() Kullanımı | Verilen bir paterne uyan  metnin başındaki karakterin pozisyonunu geri döndürür. Eğer verilen paterne uyan bir metin bulunamazsa "0" değeri dönecektir.
  SELECT
    e.FirstName
   ,PATINDEX('%ar%', e.FirstName) AS arBarindiranAdlar
  FROM Employees AS e

  --REPLACE() Kullanımı | Bu fonksiyon parametre olarak verilen birinci metin içerisinde ikinci metni gördüğü yerde ikinci metni silerek verilen üçüncü parametredeki metni yerleştirir.
  SELECT
    e.FirstName
   ,REPLACE(e.FirstName, 'an', 'AN') AS arBarindiranAdlar
  FROM Employees AS e

  --REPLICATE() Kullanımı | Bir karakteri belirli sayıda  tekrar ettirmek için kullanılır.
  SELECT
    REPLICATE('+', 10) AS TekrarEttirilenAlan

  --REVERSE() Kullanımı | Verilen metni ters çevirmek için kullanılır.
  SELECT
    e.FirstName
   ,REVERSE(e.FirstName) AS arBarindiranAdlar
  FROM Employees AS e

  --LEFT() Kullanımı | Bir metnin soldan itibaren istenilen sayıda karakterlerini geri döndürür.
  SELECT
    e.FirstName
   ,LEFT(e.FirstName, 5) AS Soldan5KarakterGetir
  FROM Employees AS e

  --RIGHT() Kullanımı | Bir metnin sağdan itibaren istenilen sayıda karakterlerini geri döndürür.
  SELECT
    e.FirstName
   ,RIGHT(e.FirstName, 5) AS Sagdan5KarakterGetir
  FROM Employees AS e

  --SPACE() Kullanımı | Belirli sayıda boşluk karakteri oluşturmak için kullanılan metinsel fonksiyondur.
  SELECT
    e.FirstName + '' + SPACE(5) + '' + e.LastName AS AdSoyadOrtada5KarakterBosluk
  FROM Employees AS e

  --LEN Kullanımı | Metin alanındaki değerin uzunluğunu döndürür.
  SELECT
    e.FirstName
   ,LEN(e.FirstName) AS AdUzunlugu
  FROM Employees AS e

  --DATALENGTH() Kullanımı | Bir ifadenin uzunluğunu bay cinsinden döndürür.
  SELECT
    e.FirstName
   ,DATALENGTH(e.FirstName) AS BaytUzunluk
  FROM Employees AS e

  --STUFF() Kullanımı | Bir ifadeden başlangıç ve bitiş karakter sayısı ile karakterleri siler ve sonra dizeye başka bir karakter dizisi ekler.
  SELECT
    e.FirstName
   ,STUFF(e.FirstName, 2, 2, '') AS BaytUzunluk
  FROM Employees AS e

  --LOWER() Kullanımı | İstenilen alanı küçük harfli olarak gösterir.
  SELECT
    e.FirstName
   ,LOWER(e.FirstName) AS YeniAd
  FROM Employees AS e

  --UPPER() Kullanımı | İstenilen alanı büyük harfli olarak gösterir.
  SELECT
    e.FirstName
   ,UPPER(e.FirstName) AS YeniAd
  FROM Employees AS e

  --Substring Kullanımı | İstenilen verinin bir parçasını göstermek için kullanılır.
  SELECT
    e.FirstName
   ,SUBSTRING(e.FirstName, 3, 3) AS SeciliAdinParcasi
  FROM Employees AS e

  SELECT
    e.FirstName
   ,UPPER(SUBSTRING(e.FirstName, 4, 3)) AS SeciliAdinParcasi
  FROM Employees AS e

  --LTRIM() Kullanımı | Soldan boşlukları temizler.
  SELECT
    LTRIM(e.FirstName)
  FROM Employees AS e

  --RTRIM() Kullanımı | Sağdan boşlukları temizler.
  SELECT
    RTRIM(e.FirstName)
  FROM Employees AS e

  --TRIM() Kullanımı | Her iki taraftan boşlukları temizler.
  SELECT
    TRIM(e.FirstName)
  FROM Employees AS e

  --COALESCE() Kullanımı | Birden fazla null koşuluna göre değer atamak için kullanılır. İstediğiniz kadar alan tanımlanabilmektedir.
  -->Önce Title alanındaki değere boş ise Region alanındaki değeri getirir o da boş ise bizim belirlediğimiz değeri getitir.
  SELECT
    COALESCE(Title, Region, 'Kayıt Yok')
   ,*
  FROM Employees AS e
--SQL Metinsel Fonksiyonlar ve İşlemler Bitiş
END

BEGIN--SQL Tarihsel Fonksiyonlar ve İşlemler
  --GETDATE() Kullanımı (Şimdiki zamanı detaylı gösterimi)
  SELECT
    GETDATE() AS GetDateResult

  --GETUTCDATE() Kullanımı (Şimdiki zamanı detaylı gösterimi)
  SELECT
    GETUTCDATE() AS GetUtcDateResult

  --CURRENT_TIMESTAMP Kullanımı (Şimdiki zamanı detaylı gösterimi)
  SELECT
    CURRENT_TIMESTAMP AS CurrentTimeStampResult

  --ISDATE() Kullanımı(Nvarchar tipindeki verinin tarih olup olmadığına bakar. Tarih ise 1 değilse 0 döndürür.)
  SELECT
    ISDATE('20220113') AS TarihMi

  --DATENAME() Kullanımı(Gün, ay ve yılın adını verir)
  SELECT
    DATENAME(MONTH, CURRENT_TIMESTAMP) AS TarihAdi

  --SYSDATETIME() Kullanımı(Sql Server’ın çalıştığı bilgisayarın tarih ve saat bilgisini verir)
  SELECT
    SYSDATETIME() AS SimdikiZamanBilgisi

  --SYSDATETIMEOFFSET() Kullanımı(Sql Server’ın çalıştığı bilgisayarın tarih, saat ve GTM bilgisini verir)
  SELECT
    SYSDATETIMEOFFSET() AS GTMBilgisi

  --DATEDIF Kullanımı(İki tarih arasında farkı istenilen zaman tipinde verir)
  --YEAR, MONTH, WEEK, DAY, HOUR, MİNUTE,SECOND, MILLISECOND parametreleri ile kullanılır
  SELECT
    e.BirthDate AS DogumTarihi
   ,DATEDIFF(YEAR, e.BirthDate, GETDATE()) AS Yasi
  FROM Employees AS e

  --DAY(), MONTH() ve YEAR() Kullanımı(Belirli tarihin gün, ay ve yıl bilgisini verir)
  SELECT
    e.FirstName + ' ' + e.LastName AS AdSoyad
   ,DAY(e.BirthDate) AS Gun
   ,MONTH(e.BirthDate) AS Ay
   ,YEAR(e.BirthDate) AS Yil
  FROM Employees AS e

  --DATEADD() Kullanımı(Tarihe belli gün, ay veya yıl eklemek için kullanılır)
  --DD: Gün, MM: Ay, YY: Yıl
  --year yy, yyyy
  --quarter	q, qq
  --month	m, mm
  --dayofyear	y, dy
  --day	d, dd
  --week	wk, ww
  --weekday	w, dw
  --hour	hh
  --minute	n, mi
  --second	s, ss
  --millisecond	ms
  --microsecond	mcs
  --nanosecond	ns
  SELECT
    e.BirthDate AS DogumTarihi
   ,DATEADD(DD, 1, e.BirthDate) AS YeniDogumTarihi
  FROM Employees AS e

  --DATEPART() Kullanımı(DATEADD() de kullanılan parametreler ile kullanılabilir. Parametreye ait bilgi verir.)
  SELECT
    e.BirthDate AS DogumTarihi
   ,DATEPART(DD, e.BirthDate) AS Gun
  FROM Employees AS e

--SQL Tarihsel Fonksiyonlar ve İşlemler Son
END

BEGIN--EXPECT Kullanımı
  --Açıklama: İlk sorgunuzdan elde edilen veri listesi ile ikinci sorgunuzdan elde edilen veri listesini çıkarır. 
  --Sonuç olarak size ilk sorgunun sonucunda olup ikinci sorgunun sonucunda olmayan kayıtları döndürür. 
  SELECT
    p.ProductID
  FROM Products p
  EXCEPT
  SELECT
    od.ProductID
  FROM [Order Details] od

END

BEGIN--INTERSECT Kullanımı
  --Açıklama: İlk sorgunuzdan elde edilen veri listesi ile ikinci sorgunuzdan elde edilen veri listesinde ortak olanları sonuç olarak döndürür.
  SELECT
    p.ProductID
  FROM Products p
  INTERSECT
  SELECT
    od.ProductID
  FROM [Order Details] od

END

BEGIN--CASE WHEN Kullanımı

  --Belli koşula göre kullanım
  SELECT
    Country
   ,CASE
      WHEN Country = 'USA' THEN 1
      ELSE '0'
    END AS CODE
  FROM Employees e

  --Sayının 2'ye tam bölünme durumunu bulma
  SELECT
    CASE
      WHEN 11 % 2 = 0 THEN CAST(1 AS BIT)
      ELSE CAST(0 AS BIT)
    END AS Sayi2YeTamBolunurMu

  --ISNULL ile birlikte kullanım
  SELECT
    e.Region RegionValue
   ,CASE
      WHEN ISNULL(e.Region, 'YOK') = 'YOK' THEN 'Region Yok'
      WHEN ISNULL(e.Region, 'YOK') <> 'YOK' THEN e.Region
    END RegionStatus
  FROM Employees e

  --CASE yapısı farklı kullanımı
  SELECT
    e.TitleOfCourtesy TitleOfCourtesyValue
   ,CASE e.TitleOfCourtesy
      WHEN 'Mr.' THEN 'Erkek'
      WHEN 'Mrs.' THEN 'Kadın'
      ELSE 'Tanımlanamadı'
    END Cinsiyeti
  FROM Employees e

  --İç içe CASE yapısı kullanımı
  SELECT
    e.TitleOfCourtesy + ' ' + e.FirstName + '' + e.LastName Person
   ,YEAR(GETDATE()) - YEAR(e.BirthDate) Age
   ,CASE
      WHEN e.TitleOfCourtesy = 'Mr.' THEN CASE
          WHEN (YEAR(GETDATE()) - YEAR(e.BirthDate)) >= 65 THEN 'Erkek kategorisinde emekli olabilir'
          WHEN (YEAR(GETDATE()) - YEAR(e.BirthDate)) < 65 THEN 'Erkek Erkek kategorisinde emekli olamaz'

        END
      WHEN e.TitleOfCourtesy = 'Mrs.' THEN CASE
          WHEN (YEAR(GETDATE()) - YEAR(e.BirthDate)) >= 63 THEN 'Kadın kategorisinde emekli olabilir'
          WHEN (YEAR(GETDATE()) - YEAR(e.BirthDate)) < 63 THEN 'Kadın kategorisinde emekli olamaz'
        END
      ELSE 'Tanımsız unvan'
    END EmekliDurumu
  FROM Employees e

  --Koşulu sağlayanların sayısını bulma
  SELECT
    *
  --    COUNT(CASE
  --      WHEN e.Country = 'USA' THEN 1
  --    END) AS USACount
  --   ,COUNT(CASE
  --      WHEN Country = 'UK' THEN 1
  --    END) AS UKCount
  FROM Employees e

  --İlgili duruma göre sıralamayı değiştirme
  SELECT
    *
  FROM Employees e
  ORDER BY (CASE
    WHEN e.Region IS NULL THEN e.City
    ELSE e.Country
  END)

  --Koşula göre aynı sütun içerisinde iki farklı sıralama yapma
  SELECT
    *
  FROM Employees e
  ORDER BY CASE
    WHEN e.Extension > 1000 THEN e.Extension
  END DESC,
  CASE
    WHEN e.Extension < 1000 THEN e.Extension
  END ASC

END

BEGIN--ISNULL Kullanımı
  --Boş değerleri döndürür. İstenirse boş değer varsa bunu istediğiniz bir veri ile değiştirebilirsiniz.
  SELECT
    *
   ,ISNULL(c.Fax, 'YOK') AS NewFax
  FROM Customers AS c

  --ISNULL İle Tablo Alanları Seçili Listeleme
  SELECT
    c.CompanyName
   ,c.ContactName
   ,c.ContactTİtle
   ,c.Address
   ,c.City
   ,c.PostalCOde
   ,c.Country
   ,c.Phone
   ,ISNULL(c.Fax, 'YOK') AS Fax
  FROM Customers AS c

END

BEGIN--IS NOT NULL Kullanımı
  --Boş olmayan verileri döndürür.
  SELECT
    *
  FROM Customers AS c
  WHERE c.Fax IS NOT NULL

END

BEGIN--NULLIF Kullanımı
  --İlk bağımsız değişken ikinciye eşitse, NULLIF ifadesini NULL döndürür
  --İki değişken birbirinden farklı ise ilk değeri geri döndürür
  SELECT
    NULLIF(Region, Country)
   ,*
  FROM Customers AS c

  SELECT
    NULLIF(Country, Region)
   ,*
  FROM Customers AS c
END

BEGIN--GROUP BY, HAVING Kullanımı
  --Veri tekrarı olanları gruplayarak tek bir veriye dönüştürüp sonuç verir.
  --Group By kullanılan bir sorguda Where ifadesi Group By ifadesinden önce kullanılmalıdır çünkü önce kayıtlar filtrelenmeli sonra kalan kayıtlar ile gruplama yapılmalıdır. 

  SELECT
    e.City
  FROM Employees AS e
  GROUP BY e.City

  --Hangi şehirden kaç tane olduğu gösterir
  SELECT
    e.City
   ,COUNT(*)
  FROM Employees AS e
  GROUP BY e.City

  --HAVING Kullanımı 
  --Having ise grupları filtreleyeceği için gruplama işlemi yapıldıktan sonra yazılmalıdır.
  --Hangi şehirden kaç tane olduğu gösterir ama HAVING kullanımı ile koşul belirttik. Şehir sayısı 1 den fazla olanları getirecek.
  SELECT
    e.City
   ,COUNT(*)
  FROM Employees AS e
  GROUP BY e.City
  HAVING COUNT(e.City) > 1

END

BEGIN--WHILE Kullanımı
  -->Belli Sayıda Veri Üretmek

  DECLARE @i INT--i adında int değerinde bir değişken tanımlıyoruz
  SET @i = 0--Bu i değişkenine 0 değerini atıyoruz. Bu durumun alternatif kullanımı: DECLARE @i INT=0
  WHILE (@i < 20000)
  BEGIN
  INSERT INTO testTbl
    SELECT
      name = 'TestAd ' + CAST(@i AS NVARCHAR(50))
     ,type = @i
  SET @i = @i + 1
  END

  -->1'den 10'a Kadar Sayıları Toplama
  DECLARE @number INT = 1;
  DECLARE @sum INT = 0;

  WHILE @number <= 10
  BEGIN
  SET @sum = @sum + @number; --Sayı kısmını her döngü sonrası bir arttırıyoruz. Çünkü döngümüz @Sayi 10'a eşit ve küçük olana kadar devam edecek.
  SET @number = @number + 1;
  END;

  --Toplam değerini yazdırma 
  PRINT @sum;

  -->0'da 100'e Kadar Sayıları 3'er 3'er Yazdırmak
  DECLARE @number INT = 0
  WHILE @number < 100
  BEGIN
  PRINT @number
  SET @number = @number + 3
  END

  -->Örnek 50 Adet Mail Oluşturma
  DECLARE @count SMALLINT = 0
  WHILE @count < 50
  BEGIN
  PRINT CONCAT('user', FLOOR(RAND() * 1000), '@yasinsunmaz.com');
  SET @count = @count + 1
  END

  -->Girilen Metni Parçalayarak Yazdırmak
  DECLARE @text VARCHAR(50) = 'yasinsunmaz.com'
  DECLARE @textCount INT = LEN(@text)
  DECLARE @count INT = 0
  WHILE @count <= @textCount
  BEGIN
  PRINT SUBSTRING(@text, @count, 1)
  SET @count = @count + 1
  END

  -->Hatalı While Döngüsü(Döngüde counter değeri hiç değişmediği ve 10'dan hep küçük olacağı için sonsuz döngüye girecektir.)
  DECLARE @counter INT
  SET @counter = 1
  WHILE (@counter <= 10)
  BEGIN
  PRINT 'Sorun var beni durdur!'
  END

  -->CONTINUE Kullanımı
  DECLARE @count INT;
  DECLARE @mod INT;
  SET @count = 1;

  WHILE @count <= 10
  BEGIN
  SET @mod = @count % 2
  IF @mod = 1
  BEGIN
    PRINT '2 ye bölünmeyen sayı = ' + CONVERT(VARCHAR, @count)
    SET @count = @count + 1;
    CONTINUE
  END
  PRINT '2 ye bölünen sayı = ' + CONVERT(VARCHAR, @count)
  SET @count = @count + 1;
  END;

  -->BREAK Kullanımı | Döngü belli bir duruma geldiğinde direk durdurabilirsiniz.
  DECLARE @counter INT
  SET @counter = 1
  WHILE (@counter <= 10)
  BEGIN
  PRINT 'Sayı = ' + CONVERT(VARCHAR, @Counter)
  IF @counter >= 7
  BEGIN
    PRINT 'Sayı döngüsü sonlandı = ' + CONVERT(VARCHAR, @Counter)
    BREAK
  END
  SET @counter = @counter + 1
  END

  -->WHILE İle Tablola Verileri Üzerinde Gezinme
  DECLARE @Counter INT
         ,@MaxId INT
         ,@CountryName NVARCHAR(100)
  SELECT
    @Counter = MIN(EmployeeID)
   ,@MaxId = MAX(EmployeeID)
  FROM Employees

  WHILE (@Counter IS NOT NULL
  AND @Counter <= @MaxId)
  BEGIN
  SELECT
    @CountryName = Country
  FROM Employees
  WHERE EmployeeID = @Counter

  PRINT CONVERT(VARCHAR, @Counter) + '. ülke adı ' + @CountryName
  SET @Counter = @Counter + 1
  END

END

BEGIN--Kolon Adı Arama
  SELECT
    c.name AS 'ColumnName'
   ,t.name AS 'TableName'
  FROM sys.columns c
  JOIN sys.tables t
    ON c.object_id = t.object_id
  WHERE c.name LIKE '%ProductID%'
  ORDER BY TableName
  , ColumnName;
END

BEGIN--CURSOR Kullanımı
  --Cursordan alınacak veri
  DECLARE @ID INT;
  --Kullanmak istediğimiz para için tanımlama
  DECLARE @unitPrice MONEY = 10;

  --Cursor adını yazıyoruz
  DECLARE UnitPriceAdd CURSOR FOR
  --Product listesinde ProductID'yi getiren liste
  SELECT
    p.ProductID
  FROM Products p
  --Cursor açıyoruz
  OPEN UnitPriceAdd
  --Bu cursorda gelen kayıtlar üzerinde ilerliyoruz
  FETCH NEXT FROM UnitPriceAdd INTO @ID
  --While döngüsü ile veriler üzerinde işlem yapıyoruz
  WHILE @@FETCH_STATUS = 0
  BEGIN
  --Yapmak istediğimiz UPDATE işlemi ve koşul olarak cursordan gelen ID değeri
  UPDATE Products
  SET UnitPrice = @unitPrice
  WHERE ProductID = @ID
  --Birim fiyatı +1 yaparak arttırıyoruz
  SET @unitPrice = @unitPrice + 1
  FETCH NEXT FROM UnitPriceAdd INTO @ID
  END
  --İşlem bitince cursorü kapatıyoruz
  CLOSE UnitPriceAdd
  DEALLOCATE UnitPriceAdd

  DECLARE @Name NVARCHAR(MAX)
  DECLARE @lookupId INT = 3500;
  DECLARE LookupAdd CURSOR FOR SELECT
    mq.NAME
  FROM eaf.MODUL_QUERY mq
  OPEN LookupAdd
  FETCH NEXT FROM LookupAdd INTO @Name
  WHILE @@FETCH_STATUS = 0
  BEGIN
  SET IDENTITY_INSERT ESL.LOOKUP_LIST_ITEM_TB ON
  INSERT INTO ESL.LOOKUP_LIST_ITEM_TB (ID, LOOKUP_LIST_ID, PARENT_ID, NAME, CODE, ENABLED)
    VALUES (@lookupId, 35, NULL, @Name, NULL, CONVERT(BIT, 'True'))
  SET IDENTITY_INSERT ESL.LOOKUP_LIST_ITEM_TB OFF
  SET @lookupId = @lookupId + 1
  FETCH NEXT FROM LookupAdd INTO @Name
  END
  CLOSE LookupAdd
  DEALLOCATE LookupAdd

  -->Belli kayıtları toplu güncelleme (TC Numarasını Güncelleme)
  DECLARE @ID INT;
  DECLARE @identityNo BIGINT = 10000000001;

  DECLARE IDENTITYNO_ADD CURSOR FOR SELECT
    p.ID
  FROM ESL.PERSON p
  OPEN IDENTITYNO_ADD
  FETCH NEXT FROM IDENTITYNO_ADD INTO @ID
  WHILE @@FETCH_STATUS = 0
  BEGIN
  UPDATE ESL.PERSON
  SET IDENTITY_NO = CONVERT(NVARCHAR(64), @identityNo)
  WHERE ID = @ID

  SET @identityNo = @identityNo + 1
  FETCH NEXT FROM IDENTITYNO_ADD INTO @ID
  END
  CLOSE IDENTITYNO_ADD
  DEALLOCATE IDENTITYNO_ADD
END

BEGIN--INSERT Kayıt Ekleme
  SELECT
    *
  FROM Products p
  --Kayıt Ekleme
  INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
    VALUES (N'Patlıcan', 1, 2, N'1 kg', 8.00, 100, 10, 13, CONVERT(BIT, 'False'))

  --Belirli Id Değerine Ait Kayıt Ekleme
  SET IDENTITY_INSERT Products ON;
  INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
    VALUES (1903, N'Domates', 1, 2, N'1 kg', 9.00, 500, 10, 13, CONVERT(BIT, 'False'))
  SET IDENTITY_INSERT Products OFF;

  --Tablo Verilerini Aynı veya Başka Tabloya Kayıt Ekleme
  INSERT INTO Products (p.ProductName, p.SupplierID, p.CategoryID, p.UnitPrice, p.QuantityPerUnit)
    SELECT
      p.ProductName
     ,p.SupplierID
     ,p.CategoryID
     ,p.UnitPrice + 5
     ,p.QuantityPerUnit
    FROM Products p
    WHERE p.UnitPrice = 8

END

BEGIN--OUTPUT KULLANIMI
  --Kayıt Ekledikten Sonra Id Değerini Geri Döndürme
  INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  OUTPUT INSERTED.ProductID EklenenUrununIdDegeri
    VALUES (N'Patlıcan 2', 1, 2, N'1 kg', 8.00, 100, 10, 13, CONVERT(BIT, 'False'))

  --Kayıt Ekledikten Sonra Eklenen Kayda Ait Farklı Alanlardaki Değerleri Geri Döndürme
  INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  OUTPUT INSERTED.ProductID, INSERTED.ProductName, INSERTED.UnitPrice --Ürün eklendikten sonra ürünün Id değerini, ürün adını ve birim fiyatını geri döndürecek
    VALUES (N'Biber', 1, 2, N'1 kg', 8.00, 200, 10, 13, CONVERT(BIT, 'False'))

  --Ürün eklendikten eklenen kayda ait tüm alanları geri döndürecek.
  INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  OUTPUT INSERTED.*
    VALUES (N'Telefon', 1, 2, N'1 adet', 15000.00, 200, 10, 13, CONVERT(BIT, 'False'))

  SELECT
    *
  FROM Products
  WHERE ProductID = 81
  --Güncellenen ürüne ait yeni fiyat bilgisini geriye döndürecek
  UPDATE Products
  SET ProductName = N'Telefon'
     ,UnitPrice = UnitPrice + 2000
  OUTPUT INSERTED.UnitPrice
  WHERE ProductID = 81

  --Güncellenen ürüne ait tüm bilgileri geriye döndürecek.
  UPDATE Products
  SET ProductName = N'Telefon'
     ,UnitPrice = 19000.00
  OUTPUT INSERTED.*
  WHERE ProductID = 81

  SELECT
    *
  FROM OrderDetails

  --Silinen Sipariş Numaraları Geriye Döndürme
  DELETE od
  OUTPUT DELETED.OrderID
    FROM OrderDetails od
    JOIN Products p
      ON p.ProductID = od.ProductID
  WHERE OrderID IN (10260, 10261)
END

BEGIN--UPDATE Kayıt Güncelleme
  SELECT
    *
  FROM Products

  -->ProductID 3 olan ürünün bilgilerini güncelleme
  UPDATE Products
  SET ProductName = N'Aniseed Chai'
     ,SupplierID = 1
     ,CategoryID = 3
     ,UnitPrice = UnitPrice + 25
  WHERE ProductID = 3

END

BEGIN--DELETE Silme İşlemi
  -->ProductID 5 olan ürünü silme
  DELETE p
    FROM Products p
  WHERE ProductID = 5
END

BEGIN--DROP Komutu Kullanımı
  -->Tabloyu silme
  DROP TABLE [table_name];
  --Veritabanını silme       
  IF DB_ID('database_name') IS NOT NULL
  BEGIN
    --ALTER DATABASE [database_name] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [database_name]
  END

END

BEGIN--TRUNCATE Komutu Kullanımı
  -->Tabloyu silmeden içerisindeki verilerin tamamını ilişkilere bakmadan siler
  TRUNCATE TABLE [table_name];

END

BEGIN--EXITS ve NOT EXITS Kullanımı
  --Açıklama: EXISTS ifadesi kullanıldığında, 
  --alt sorguda istenilen şartların yerine getirildiği durumlarda ilgili kaydın listelenmesini sağlar.
  --Açıklama: NOT EXITS ise EXISTS‘in tam tersi olarak alt sorguda istenilen şartların sağlanmadığı durumlarda
  --ilgili kaydın listelenmesini sağlar.

  -->Suppliers'ın Products tablosunda olup ürünün birim fiyatı 10'dan küçük olanların CompanyName bilgisini listeler
  SELECT
    CompanyName
  FROM Suppliers s
  WHERE EXISTS (SELECT
      *
    FROM Products p
    WHERE p.SupplierID = s.SupplierID
    AND p.UnitPrice < 10)

  -->Sipariş verilmiş olan ürünleri listeleme
  SELECT
    p.ProductName
  FROM Products p
  WHERE EXISTS (SELECT
      *
    FROM OrderDetails od
    WHERE od.ProductID = p.ProductID)

  -->NOT EXITS 
  -->Suppliers'ın Products tablosunda olmayan ürünlerin birim fiyatı 10'dan küçük olanların CompanyName bilgisini listeler
  SELECT
    CompanyName
  FROM Suppliers s
  WHERE NOT EXISTS (SELECT
      *
    FROM Products p
    WHERE p.SupplierID = s.SupplierID
    AND p.UnitPrice < 10)

  -->Sipariş verilmemiş olan ürünleri listeleme
  SELECT
    p.ProductName
  FROM Products p
  WHERE NOT EXISTS (SELECT
      *
    FROM OrderDetails od
    WHERE od.ProductID = p.ProductID)
END

BEGIN--SYNONYM Kullanımı
  --Açıklama: Synonym veritabanı bazındaki bazı nesnelere alias(alternatif farklı bir isim) verilebilir. (Table, view, store procedure, function)

  --> Products tablosuna ait 'Urunler' adında bir synonym oluşturma
  CREATE SYNONYM Urunler
  FOR Products

  --> Oluşturulan 'Urunler' synonyma ait sorgulama yapma
  SELECT
    *
  FROM Urunler u

  --> Oluşturulan 'Urunler' synonymu silme
  DROP SYNONYM IF EXISTS Urunler

END

BEGIN--ROW_NUMBER() Kullanımı
  --ROW_NUMBER() fonksiyonu, yalnızca 1 ile başlayan sıralanmış kayıtların satır numarasını döndürür.
  --OVER dışında bir ORDER işlemi yapsanız da sorgu OVER içindeki sıralamaya göre sonuç getirecektir.
  SELECT
    ROW_NUMBER() OVER (ORDER BY FirstName) AS NewOrder
   ,*
  FROM Employees

  SELECT
    ROW_NUMBER() OVER (ORDER BY UnitPrice) AS NewOrder
   ,*
  FROM Products

  SELECT
    ROW_NUMBER() OVER (ORDER BY UnitPrice, ProductName DESC) AS NewOrder
   ,*
  FROM Products

  SELECT
    ROW_NUMBER() OVER (
    --PARTITION BY ProductName
    ORDER BY ProductName
    ) NewRowNumber
   ,*
  FROM Products

END

BEGIN--ROW_NUMBER(), RANK(), DENSE_RANK() Kullanımı
  --RANK() fonksiyonu, ORDER BY yan tümcesinin durumuna göre sıralanmış satırları almak için kullanılır.
  --DENSE_RANK() fonksiyonu RANK işlevine benzer, ancak DENSE_RANK işlevi, önceki kayıtların sıraları arasında bir bağ varsa herhangi bir sıra atlamaz.
  --RANK ve DENSE_RANK işlevlerinin aksine, ROW_NUMBER() fonksiyonu, yalnızca 1 ile başlayan sıralanmış kayıtların satır numarasını döndürür.

  SELECT
    ProductName
   ,UnitsInStock
   ,ROW_NUMBER() OVER (ORDER BY UnitsInStock DESC) AS ROW_NUMBER_ORDER
   ,RANK() OVER (ORDER BY UnitsInStock DESC) AS RANK_ORDER
   ,DENSE_RANK() OVER (ORDER BY UnitsInStock DESC) AS DENSE_RANK_ORDER
  FROM Products

END

BEGIN--CUME_DIST() Kullanımı
  --Açıklama: bir satırın kümülatif dağılım değeri grupdaki toplam satır sayısına bölünerek hesaplanır. 
  --WHERE şartına eklediğimiz ifadeler sonucu gelen sonuç kümesindeki veri sayısı kümülatif değerin oluşmasında etkilidir.
  --Kümülatif dağılım hesabı sonucu olarak 0’la 1 arası değerler döndürülür.

  -->UnitPrice alanına göre kümülatif dağılım hesabını bulma
  SELECT
    CUME_DIST() OVER (ORDER BY UnitPrice DESC) AS FirstProduct
   ,*
  FROM Products

END

BEGIN--FIRST_VALUE() Kullanımı
  --Açıklama: FIRST_VALUE fonksiyonu çekilen sonuç kümesi içerisinde ilk değeri elde etmemize imkan sağlar. 
  --FIRST_VALUE fonksiyonu parametre olarak bir değer almaktadır. 
  --Bu değer bir alan veya ifade olabilir. OVER üzerinde tanımlanabilen sıralama veya bölge ayarları elde edilecek değere etki eder.

  -->Products tablosunda UnitPrice alanına göre artan sıralandığında ilk değeri getirecek
  SELECT
    FIRST_VALUE(ProductName) OVER (ORDER BY UnitPrice) AS FirstProduct
   ,*
  FROM Products

  -->Products tablosunda CategoryID sıralayıp UnitPrice alanına göre artan sıralandığında ilk değeri getirecektir
  SELECT
    FIRST_VALUE(ProductName) OVER (PARTITION BY CategoryID ORDER BY UnitPrice) AS FirstProduct
   ,*
  FROM Products

END

BEGIN--LAST_VALUE() Kullanımı
  --Açıklama: LAST_VALUE fonksiyonu çekilen sonuç kümesi içerisinde son değeri elde etmemize imkan sağlar. 
  --LAST_VALUE fonksiyonu parametre olarak bir değer almaktadır. 
  --Bu değer bir alan veya ifade olabilir. OVER üzerinde tanımlanabilen sıralama veya bölge ayarları elde edilecek değere etki eder.

  -->Products tablosunda UnitPrice alanına göre artan sıralandığında ilk değeri getirecek
  SELECT
    LAST_VALUE(ProductName) OVER (ORDER BY UnitPrice) AS FirstProduct
   ,*
  FROM Products

  -->Products tablosunda CategoryID sıralayıp UnitPrice alanına göre artan sıralandığında ilk değeri getirecektir
  SELECT
    LAST_VALUE(ProductName) OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS FirstProduct
   ,*
  FROM Products

END

BEGIN--LEAD() Kullanımı
  --Açıklama: LEAD() fonksiyonu, geçerli satırdaki verilerle birlikte SONRAKİ satırlardaki verilere erişmek için kullanılır.
  --Mevcut satırdan bir ya da birkaç sonraki satırın değerini çekmek için kullanılır.
  --Kaç satır sonrasını çekeceğinizi ayarlayabiliyorsunuz.
  --Çekilen veri kümesinin son satırlarında verilen değerlere göre NULL ifadesinin görülmesi normaldir.

  --> Employees tablosunda FirstName alanı ilk durumda 1 satır sonrası, ikinci durumda 3 satır sonrası FirstName alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LEAD(FirstName, 1) OVER (ORDER BY FirstName) FirstName1LEAD
   ,LEAD(FirstName, 3) OVER (ORDER BY FirstName) FirstName3LEAD
  FROM Employees

  --> Employees tablosunda FirstName alanı ilk durumda 1 satır sonrası, ikinci durumda 3 satır sonrasını EmployeeID alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LEAD(FirstName, 1) OVER (ORDER BY EmployeeID) FirstName1LAG
   ,LEAD(FirstName, 3) OVER (ORDER BY EmployeeID) FirstName3LAG
  FROM Employees

  --> Employees tablosunda FirstName ve LastName alanı ilk durumda 1 satır sonrası, ikinci durumda 3 satır sonrasını EmployeeID alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LastName
   ,LEAD(FirstName, 1) OVER (ORDER BY EmployeeID) FirstName1LEAD
   ,LEAD(LastName, 1) OVER (ORDER BY EmployeeID) LastName1LEAD
   ,LEAD(FirstName, 3) OVER (ORDER BY EmployeeID) FirstName3LEAD
   ,LEAD(LastName, 3) OVER (ORDER BY EmployeeID) LastName3LEAD
  FROM Employees
END

BEGIN--LAG() Kullanımı
  --Açıklama: LAG() fonksiyonu, geçerli satırdaki verilerle birlikte ÖNCEKİ satırlardaki verilere erişmek için kullanılır.
  --LAG fonksiyonu LEAD fonksiyonunun tam tersidir. Mevcut satırdan bir ya da birkaç önceki satırın değerini çekmek için kullanılır.
  --Kaç satır öncesini çekeceğinizi ayarlayabiliyorsunuz.
  --Çekilen veri kümesinin ilk satırlarında verilen değerlere göre NULL ifadesinin görülmesi normaldir.

  --> Employees tablosunda FirstName alanı ilk durumda 1 satır öncesi, ikinci durumda 3 satır öncesini FirstName alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LAG(FirstName, 1) OVER (ORDER BY FirstName) FirstName1LAG
   ,LAG(FirstName, 3) OVER (ORDER BY FirstName) FirstName3LAG
  FROM Employees

  --> Employees tablosunda FirstName alanı ilk durumda 1 satır öncesi, ikinci durumda 3 satır öncesini EmployeeID alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LAG(FirstName, 1) OVER (ORDER BY EmployeeID) FirstName1LAG
   ,LAG(FirstName, 3) OVER (ORDER BY EmployeeID) FirstName3LAG
  FROM Employees

  --> Employees tablosunda FirstName ve LastName alanı ilk durumda 1 satır öncesi, ikinci durumda 3 satır öncesini EmployeeID alanının sıralamasına göre getirir
  SELECT
    FirstName
   ,LastName
   ,LAG(FirstName, 1) OVER (ORDER BY EmployeeID) FirstName1LAG
   ,LAG(LastName, 1) OVER (ORDER BY EmployeeID) LastName1LAG
   ,LAG(FirstName, 3) OVER (ORDER BY EmployeeID) FirstName3LAG
   ,LAG(LastName, 3) OVER (ORDER BY EmployeeID) LastName3LAG
  FROM Employees

END

BEGIN--Veritabanı İşlemleri
  -->Veritabanı Oluşturma
  CREATE DATABASE newDatabase_DB;

  -->Veritabanı Silme
  DROP DATABASE newDatabase_DB;

  -->Veritabanı Adını Değiştirme
  ALTER DATABASE newDatabase_DB MODIFY NAME = newDatabase2_DB

  EXEC sp_renamedb 'newDatabase2_DB'
                  ,'newDatabase_DB'

--Veritabanı Kullanma
--USE newDatabase_DB

END

BEGIN--Tablo İşlemleri
-->Tablo Oluşturma
CREATE TABLE Persons (
  Id int,    
  FirstName varchar(100),
  LastName varchar(100),
  Address varchar(255),
  City varchar(255)
)

-->Tablo Adı Değiştirme
EXEC sp_rename 'Persons'
              ,'PersonsNew'

-->Tablo Düzenleme | Yeni Alan Ekleme
ALTER TABLE Persons
ADD Email NVARCHAR(150)

-->Tablo Düzenleme | Yeni Alan Ekleme - Varsayılan olarak değer atama
  ALTER TABLE Persons
  ADD Type TEXT default '1'
  
-->Tablo Düzenleme | Tablo Sütunun Adını Değiştirme
  EXEC sp_rename 'Persons.Email' , 'Eposta', 'COLUMN'

  ALTER TABLE Persons
  --RENAME COLUMN Email to Eposta  
    
-->Tablo Düzenleme | Tablo Sütunun Veri Tipi Değiştirme
  /*  ALTER TABLE Persons
    ALTER COLUMN Email VARCHAR(50)*/

-->Tablo Düzenleme | Tablo Sütununu Silme
--ALTER TABLE Persons
--DROP COLUMN Email

-->Tablo Silme
--DROP TABLE Persons

-->Tabloyu Çekme
--SELECT * FROM Persons p

-->Tablo Sütunu Not Null(Boş geçilemez) Olarak Belirleme
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
)

-->Tablo Sütunu Not Null(Boş geçilemez) Olarak Değiştirme
--ALTER TABLE Persons
--ALTER COLUMN Age INT NOT NULL;

-->Tablo Sütunu Unique(Benzersiz) Olarak Belirleme
CREATE TABLE Persons (
Id INT NOT NULL UNIQUE
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
)

-->Tablo Sütunu Unique(Benzersiz) Adını Belirterek Oluşturma
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
CONSTRAINT UC_Person UNIQUE (Id)
)

-->Tablo Sütununa Sonradan Benzersiz Alan Ekleme
--ALTER TABLE Persons
--ADD UNIQUE (Id)

-->Tablo Sütunun Unique(Benzersiz) Durumunu Silme
--ALTER TABLE Persons2
--DROP CONSTRAINT UC_Person

--Tablo Sütununa Primary Key(Birincil Anahtar) Belirleme
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
PRIMARY KEY (Id)
);

CREATE TABLE Persons (
Id INT NOT NULL PRIMARY KEY
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
);

-->Tablo Sütunu Primary Key(Birincil Anahtar) Adını Belirterek Oluşturma
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
CONSTRAINT PK_Person PRIMARY KEY (Id)
);

-->Tablo Sütununa Sonradan Birincil Anahtar Ekleme
--ALTER TABLE Persons
--ADD PRIMARY KEY (Id)

-->Tablo Sütunun Primary Key(Birincil Anahtar) Durumunu Silme
--ALTER TABLE Persons
--DROP CONSTRAINT PK_Person;

-->Tabloya Foreign Key(Yabancıl Anahtar) Ekleme
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
,ProductId INT FOREIGN KEY REFERENCES Products (ProductID)
);

-->Tabloya Foreign Key(Yabancıl Anahtar) Adını Belirterek Ekleme
CREATE TABLE Persons4 (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
,ProductId INT
,PRIMARY KEY (Id)
,CONSTRAINT FK_Person_Product FOREIGN KEY (ProductId)
REFERENCES Products (ProductID)
);

-->Tabloya Foreign Key(Yabancıl Anahtar) Sonradan Ekleme
ALTER TABLE Persons
ADD FOREIGN KEY (ProductId) REFERENCES Products (ProductID)

-->Tabloya Foreign Key(Yabancıl Anahtar) Adını Belirterek Sonradan Ekleme
/* ALTER TABLE Persons
ADD CONSTRAINT FK_Person_Product
FOREIGN KEY (ProductId) REFERENCESProducts(ProductID)*/

-->Tablo Sütunun Foreign Key(Yabancıl Anahtar) Durumunu Silme
ALTER TABLE Persons
DROP CONSTRAINT FK_Person_Product;

-->Tablo CHECK kısıtlaması, bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.
--Tabloya yaşı 18'e eşit ve büyük olan durumlarda kayıt eklenebilir
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT CHECK (Age >= 18)
,ProductId INT
,PRIMARY KEY (Id)
);

CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT
,ProductId INT
,PRIMARY KEY (Id)
,CONSTRAINT CHK_PersonAge CHECK (Age >= 18)
);

-->Tablo CHECK Durumunu Düzenleme
ALTER TABLE Persons
ADD CHECK (Age >= 18);

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age >= 18)

-->Tablo CHECK Alanını Silme
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

-->Tabloda DEFAULT İle Belirli Bir Sütuna Varsayılan Değer Atama
CREATE TABLE Persons (
Id INT NOT NULL
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT DEFAULT 18
,ProductId INT
,PRIMARY KEY (Id)
);

-->Tablo DEFAULT Durumunu Düzenleme
ALTER TABLE Persons
ADD CONSTRAINT df_Age DEFAULT 20 FOR Age

-->Tablo DEFAULT Alanını Silme
    ALTER TABLE Persons
   -- ALTER COLUMN City DROP DEFAULT

-->Tabloda INDEX İle Belirli Bir Sütuna Index Atama
 /* CREATE INDEX idx_Id
  ON Persons (Id)*/

CREATE INDEX idx_pname
ON Persons (FirstName, LastName)

-->Tablo INDEX Alanı Silme
DROP INDEX Persons.idx_Id;

-->Tabloda AUTO INCREMENT İle Belirli Bir Sütuna Artan Değer Atama
--Tabloya kayıt eklediğimizde otomatik artan Id değeri kendi oluşturacaktır
CREATE TABLE Persons (
Id INT IDENTITY (1, 1) PRIMARY KEY
,FirstName VARCHAR(100) NOT NULL
,LastName VARCHAR(100) NOT NULL
,Age INT DEFAULT 18
,ProductId INT
);

END

BEGIN--VIEW Kullanımı
  -->View oluşturma
  CREATE VIEW dbo.ProductNames
  AS
  SELECT
    ProductName
  FROM Products

  -->View Çekme
  SELECT
    *
  FROM dbo.ProductNames

  -->View Silme
  DROP VIEW dbo.ProductNames

  -->View Güncelleme
  EXEC sys.sp_refreshview 'dbo.ProductNames'

END

BEGIN--ANY, ALL Kullanımı
  -->ANY ve ALL işleçleri, tek bir sütun değeri ile bir dizi başka değer arasında karşılaştırma yapmanızı sağlar.
  --ANY ve ALL komutları bir WHERE veya HAVING ifadeleri ile kullanılır.
  --ANY komutu, alt sorgu değerinden herhangi biri koşulu karşılıyorsa true döndürür.

  -->ANY Kullanımı | OrderDetails tablosunda birim fiyat 100'den fazla herhangi biri varsa ilgili ürünleri geriye döndürür
  SELECT
    ProductID
   ,ProductName
  FROM Products
  WHERE ProductID = ANY (SELECT
      ProductID
    FROM OrderDetails
    WHERE UnitPrice > 100)

  -->ALL Kullanımı | OrderDetails tablosunda tüm kayıtların birim fiyatı 100'den fazla olması durumunda ürünleri geriye döndürür
  SELECT
    ProductID
   ,ProductName
  FROM Products
  WHERE ProductID = ALL (SELECT
      ProductID
    FROM OrderDetails
    WHERE UnitPrice > 100)

  -->OrderDetails tablosunda olmayan ürünleri getirir
  SELECT
    *
  FROM Products
  LEFT JOIN OrderDetails
    ON Products.ProductID = OrderDetails.ProductID
  WHERE OrderDetails.OrderID IS NULL

  SELECT
    *
  FROM OrderDetails

  -->Olmayan bir ürünü OrderDetails tablosuna ekledikten sonra ALL komutunu kullanımı
  SELECT
    ProductID
   ,ProductName
  FROM Products
  WHERE ProductID = ALL (SELECT
      ProductID
    FROM OrderDetails
    WHERE UnitPrice > 100)
  AND ProductID = 80

END

BEGIN--UNION Kullanımı
  -->UNION operatörü, iki veya daha fazla SELECT ifadesinin sonuç kümesini birleştirmek için kullanılır.
  -->2 Tablo kayıtlarını birleştirmek
  SELECT
    ProductID
  FROM Products
  UNION
  SELECT
    ProductID
  FROM OrderDetails

  -->2 Tablo kayıtlarını yinelenenler ile beraber birleştirmek
  SELECT
    ProductID
  FROM Products
  UNION ALL
  SELECT
    ProductID
  FROM OrderDetails

END

BEGIN--Select Into Kullanımı | Tablo Kopyalama

  -->Persons tablosunu alıp PersonsNewTable olarak kopyalama
  SELECT
    * INTO PersonsNewTable
  FROM Persons;

END

BEGIN--Insert Into Select Kullanımı | SQL'de Aynı Tablo İçerisindeki Verileri Yeniden Ekleme
  INSERT INTO dbo.Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
    SELECT
      ProductName
     ,SupplierID
     ,1
     ,'1 Yeni Ürün'
     ,13
     ,UnitsInStock
     ,UnitsOnOrder
     ,ReorderLevel
     ,Discontinued
    FROM dbo.Products
    WHERE CategoryID = 1

END

BEGIN--TEMP Tablo Oluşturma
  -->Geçici tablo oluşturma
  CREATE TABLE #localPersons (
    Id INT PRIMARY KEY
   ,FirstName VARCHAR(50)
  )

  -->Geçici tablo çekme
  SELECT
    *
  FROM #localPersons

  -->Geçici tabloya kayıt ekleme
  INSERT INTO #localPersons (Id, FirstName)
    VALUES (1, 'test')

  -->Geçici tablo silme
  DROP TABLE #localPersons

  -->Geçici global temp tablosu oluşturma
  --Bu tablo oluşturulduktan sonra kalıcı bir tablo gibidir.
  --Tüm kullanıcılar için her zaman hazırdır ve toplam bağlantı geri çekilene kadar silinmez.
  CREATE TABLE ##globalPersons (
    Id INT PRIMARY KEY
   ,FirstName VARCHAR(50)
  )

END

BEGIN--Kullanıcı İşlemleri
  -->Kullanıcı girişi oluşturma
  CREATE LOGIN yasinsunmaz WITH PASSWORD = 'Yasmaz123*'

  -->Login pasife alma
  ALTER LOGIN yasinsunmaz DISABLE

  -->Login aktif etme
  ALTER LOGIN yasinsunmaz ENABLE

  -->Oluşturulan kullanıcı girişine kullanıcı ekleme
  CREATE USER yasinsunmaz FOR LOGIN yasinsunmaz

  -->Kullanıcıya rol verme
  ALTER ROLE db_owner ADD MEMBER yasinsunmaz--Yönetici rolü verme
  EXEC sp_addrolemember @rolename = 'db_datawriter'
                       ,@membername = 'yasinsunmaz'
  /*
    db_owner: yönetici
    db_datawriter: yazma
    db_datareader: okuma
    */

  -->Kullanıcı rolünü silme
  EXEC sp_droprolemember @rolename = 'db_owner'
                        ,@membername = 'yasinsunmaz'

  -->EXECUTE yetkisi verme
  GRANT EXECUTE TO yasinsunmaz

  -->Kullanıcının durumunu görme        
  SELECT
    name AS USER_NAME
   ,is_disabled AS IS_DISABLED
  FROM sys.server_principals
  WHERE name = 'yasinsunmaz'

  -->Kullanıcıya ait rolleri listeleme
  SELECT
    u.uid AS UserId
   ,u.name AS UserName
   ,l.default_database_name AS DbName
   ,dp.name AS DbRole
  FROM sys.sysusers u
  FULL JOIN sys.sql_logins AS l
    ON u.sid = l.sid
  FULL JOIN sys.database_role_members AS drm
    ON drm.member_principal_id = u.uid
  FULL JOIN sys.database_principals AS dp
    ON dp.principal_id = drm.role_principal_id
  FULL JOIN master.sys.databases d
    ON l.default_database_name = d.name
  WHERE u.name != ''
  AND u.name NOT IN ('public', 'guest', 'INFORMATION_SCHEMA', 'sys')
  AND u.name = 'yasinsunmaz'

END

BEGIN--Transaction Kullanımı
  -->Transaction ile işlem sırasında bir sorun oluştuğunda işlemleri geriye alır.
  BEGIN TRANSACTION
  --İşlemler...
  COMMIT--İşlem bitişi için COMMIT veya ROLLBACK yazılır

END

BEGIN--SCHEMA Kullanımı
  -->Sheman Oluşturma
  CREATE SCHEMA pro

  -->Yeni şemaya tablo ekleme
  CREATE TABLE pro.ProductOrder (
    ID INT
   ,CONSTRAINT PK_ProductOrder_ID PRIMARY KEY (ID)
  )

  -->Şeması olan bir tabloyu başka şemaya taşıma
  ALTER SCHEMA pro TRANSFER OBJECT::dbo.Persons;

END

BEGIN--Sequence Kullanımı
  -->Squence Oluşturma | Her çalıştırıldığında değeri 1 arttırır
  CREATE SEQUENCE item_counter
  AS INT
  START WITH 1
  INCREMENT BY 1

  CREATE SEQUENCE item_counter--Squence adını belirleme
  AS INT--Veri tipi belirtme
  START WITH 1--Başlangıç değeri
  INCREMENT BY 1--Artış değeri
  MINVALUE 1--Minumum değer
  MAXVALUE 100--Maksimum değeri
  NO CACHE--Cache yok
  NO CYCLE--Sona ulaşınca başa dönmez hata verir

  --CYCLE seçeneği, artan bir değerli bir listede azami_değer, azalan değerli bir listede asgarideğer aşıldığında tekrar başlangıca dönülmesini sağlar.
  --NO CYCLE belirtilmişse, bir nextval çağrısı bir listenin sonunda yapıldığında bir hata döndürecektir. Ne CYCLE ne de NO CYCLE belirtilmişse, NO CYCLE ön tanımlıdır.

  -->Squence Çalıştırma
  SELECT
    NEXT VALUE FOR item_counter

  -->Sequence Düzenleme
  ALTER SEQUENCE item_counter RESTART WITH 50

  -->Tüm Squence Listesi
  SELECT
    *
  FROM sys.sequences

  -->Squence Silme
  DROP SEQUENCE item_counter

END

BEGIN--OFFSET FETCH Kullanımı
  -->OFFSET: Sorgudan satır döndürmeye başlamadan önce atlanacak satır sayısını belirtir
  --FETCH: OFFSET deyimi işlendikten sonra döndürülecek satır sayısını belirtir.
  --FETCH deyimi isteğe bağlı iken OFFSET deyimi zorunludur. Ayrıca, FIRST ve NEXT sırasıyla eşanlamlıdır,
  --Benzer şekilde, FIRST ve NEXT değişmeli olarak kullanılabilir.


  -->Products tablosunda ilgili sıralamadan sonra 10 kayıtı geçtikten sonra kayıtları döndürür
  SELECT
    *
  FROM Products
  ORDER BY ProductID
  OFFSET 10 ROWS

  -->İlk 10 ürünü atlayıp sonraki 10 ürünü seçme
  SELECT
    *
  FROM Products
  ORDER BY ProductID
  OFFSET 10 ROWS
  FETCH NEXT 10 ROWS ONLY

  -->En pahalı 10 ürünü listeleme
  SELECT
    *
  FROM Products
  ORDER BY UnitPrice DESC
  OFFSET 0 ROWS
  FETCH FIRST 10 ROWS ONLY

END

BEGIN--Tekrar Eden Kayıtları Silme

END

BEGIN--ROLLUP Kullanımı
  SELECT
    *
  FROM Products


  SELECT
    SupplierID
   ,SUM(UnitPrice) AS aaaa
  FROM Products
  GROUP BY SupplierID
  WITH ROLLUP

  SELECT
    SupplierID
   ,CategoryID
   ,SUM(UnitPrice) AS aaaa
  FROM Products
  GROUP BY SupplierID
          ,CategoryID
  WITH ROLLUP
END

BEGIN--CUBE Kullanımı

END

BEGIN--MERGE Kullanımı --> Detaylar eklenecek
  --PersonsNew tablosunda yapılan değişikleri Persons tablosunda güncelleme (Silme, güncelleme veya ekleme işlemleri)
  MERGE Persons AS T
  USING PersonsNew AS S
  ON (T.Id = S.Id)
  WHEN MATCHED
    AND T.FirstName <> S.FirstName
    OR T.LastName <> S.LastName
    OR T.Address <> S.Address
    OR T.City <> S.City
    OR T.Email <> S.Email
    THEN --Herhangibir güncelleme varsa
      UPDATE
      SET T.FirstName = S.FirstName
         ,T.LastName = S.LastName
         ,T.Address = S.Address
         ,T.City = S.City
         ,T.Email = S.Email
  WHEN NOT MATCHED BY TARGET
    THEN -- Yeni eklenmiş kitaplar varsa
      INSERT (Id, FirstName, LastName, Address, City, Email)
        VALUES (S.Id, S.FirstName, S.LastName, S.Address, S.City, S.Email)
  WHEN NOT MATCHED BY SOURCE
    THEN -- Silinmiş kitaplar varsa
      DELETE
  OUTPUT $ACTION [Event]
        ,DELETED.Id AS [Target Id]
        ,DELETED.FirstName AS [Target FirstName]
        ,DELETED.LastName AS [Target LastName]
        ,DELETED.Address AS [Target Address]
        ,DELETED.City AS [Target City]
        ,DELETED.Email AS [Target Email]
        ,INSERTED.Id AS [Source Id]
        ,INSERTED.FirstName AS [Source FirstName]
        ,INSERTED.LastName AS [Source LastName]
        ,INSERTED.Address AS [Source Address]
        ,INSERTED.City AS [Source City,INSERTED.Email as [Source Email];

END

BEGIN--PIVOT Kullanımı

END

BEGIN--INNER JOIN Kullanımı

END

BEGIN--LEFT JOIN Kullanımı

END

BEGIN--RIGHT JOIN Kullanımı

END

BEGIN--FULL JOIN Kullanımı

END

BEGIN--OUTER JOIN Kullanımı

END

BEGIN--FULL OUTER JOIN Kullanımı

END

BEGIN--SELF JOIN Kullanımı

END

BEGIN--CROSS JOIN Kullanımı

END

BEGIN--OUTER APPLY Kullanımı

END

BEGIN--SUBQUERY Kullanımı | Alt Sorgular

END

BEGIN--Trigger Kullanımı

END

BEGIN--Function Kullanımı | Detaylar eklenecek
  --Geriye Değer Döndüren Fonksiyonlar
  -->Toplama işlemi yapan fonksiyon
  CREATE FUNCTION fn_Sum (@number1 INT, @number2 INT)
  RETURNS INT
  AS
  BEGIN
    DECLARE @sum INT
    SET @sum = @number1 + @number2
    RETURN @sum
  END
  --Toplama işlemi yapan fonskiyonu çağırma
  SELECT
    dbo.fn_Sum(4, 7)

  -->Ad ve soyad bilgisi birleştiren fonksiyon
  CREATE FUNCTION fn_MergeNameSurname (@name NVARCHAR(20), @surname NVARCHAR(30))
  RETURNS NVARCHAR(51)
  AS
  BEGIN
    RETURN @name + SPACE(1) + @surname
  END
  -->Ad ve soyad bilgisi birleştiren fonksiyonu çağırma
  SELECT
    dbo.fn_MergeNameSurname('Yasin', 'SUNMAZ')

  -->Tablo Döndüren Fonksiyonlar

  CREATE FUNCTION fn_GetCountryForCustomers (@Country NVARCHAR(50))
  RETURNS TABLE
  AS
    RETURN (SELECT
        CompanyName
       ,ContactName
      FROM Customers
      WHERE Country = @Country)

  -->Ülkeye müşterileri çağırma
  SELECT
    dbo.fn_GetCountryForCustomers('France')

  -->Fonksiyon silme
  DROP FUNCTION function_Name

END

BEGIN--Procedure Kullanımı
  --Procedure Ekleme | Ülkeye göre müşteri sayısını listeleme
  /*CREATE PROCEDURE sp_GetCustomersForCountry
  AS 
  BEGIN 
  SELECT
    Country,
          COUNT(CompanyName)
        FROM Customers
    GROUP BY Country 
  ORDER BY COUNT(City) DESC 
  END*/

  --Procedure Düzenleme
  /*ALTER PROCEDURE sp_GetCustomersForCountry
  AS 
  BEGIN 
  SELECT
    Country,
          COUNT(CompanyName)
        FROM Customers
    GROUP BY Country 
  ORDER BY COUNT(CompanyName) DESC 
  END*/

  --Procedure çalıştırma
  EXEC sp_GetCustomersForCountry

  --Procedure silme
  DROP PROCEDURE sp_GetCustomersForCountry

END

BEGIN--NTILE Kullanımı
  --NTILE fonksiyonu SELECT ifadenizde WHERE koşuluna uyan kayıtları OVER ve ORDER BY ile 
  --belirtilen sıralamaya göre dizilmiş şekilde sizin parametre olarak geçeceğiniz bir sayıya bölerek her bölüme bir sıra numarası verir.
  SELECT
    *
   ,NTILE(3) OVER (
    ORDER BY ProductID
    ) buckets
  FROM Products
  ORDER BY CategoryID, ProductID

  SELECT
    NTILE(3) OVER (PARTITION BY CategoryID ORDER BY CategoryID)
   ,CategoryID
  FROM Products

  SELECT
    COUNT(CategoryID)
   ,CategoryID
  FROM dbo.Products
  GROUP BY CategoryID
END


