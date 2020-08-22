-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 May 2020, 12:07:57
-- Sunucu sürümü: 10.1.36-MariaDB
-- PHP Sürümü: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `market`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alacaklar`
--

CREATE TABLE `alacaklar` (
  `Alacakid` int(11) NOT NULL,
  `Cari_id` int(11) NOT NULL,
  `Alacak_tarihi` date NOT NULL,
  `Alacak_Tutari` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolumler`
--

CREATE TABLE `bolumler` (
  `Bolum_id` int(11) NOT NULL,
  `Bolum_adi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `Lokasyon` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `borclar`
--

CREATE TABLE `borclar` (
  `Borc_id` int(11) NOT NULL,
  `Tedarikci_id` int(11) NOT NULL,
  `Borc_tutari` double NOT NULL,
  `Borc_Tarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cariler`
--

CREATE TABLE `cariler` (
  `Cari_id` int(11) NOT NULL,
  `Cari_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Telefon` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `Adres` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem_turleri`
--

CREATE TABLE `islem_turleri` (
  `Islem_turu_id` int(11) NOT NULL,
  `Islem_turu_adi` varchar(20) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `Kullanici_id` int(11) NOT NULL,
  `Adi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `Soyadi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `Tc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `Telefon` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `Adress` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `main`
--

CREATE TABLE `main` (
  `Kayit_id` int(11) NOT NULL,
  `Kullanici_id` int(11) NOT NULL,
  `Urun_id` int(11) NOT NULL,
  `Tarih` date NOT NULL,
  `Islem_turu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedarikciler`
--

CREATE TABLE `tedarikciler` (
  `Tedarikci_id` int(11) NOT NULL,
  `Tedarikci_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Hesap_no` varchar(26) COLLATE utf8_turkish_ci DEFAULT NULL,
  `Adres` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `Telefon` varchar(11) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `Urun_id` int(11) NOT NULL,
  `Urun_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `Alis_fiyati` double NOT NULL,
  `Satis_fiyati` double NOT NULL,
  `Urun_turu_id` int(11) NOT NULL,
  `Stok_miktari` int(11) NOT NULL,
  `Bolum_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_turleri`
--

CREATE TABLE `urun_turleri` (
  `Urun_turu_id` int(11) NOT NULL,
  `Urun_Turu` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `Aciklama` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alacaklar`
--
ALTER TABLE `alacaklar`
  ADD PRIMARY KEY (`Alacakid`),
  ADD UNIQUE KEY `Cari_id` (`Cari_id`);

--
-- Tablo için indeksler `bolumler`
--
ALTER TABLE `bolumler`
  ADD PRIMARY KEY (`Bolum_id`);

--
-- Tablo için indeksler `borclar`
--
ALTER TABLE `borclar`
  ADD PRIMARY KEY (`Borc_id`),
  ADD UNIQUE KEY `Tedarikci_id` (`Tedarikci_id`);

--
-- Tablo için indeksler `cariler`
--
ALTER TABLE `cariler`
  ADD PRIMARY KEY (`Cari_id`);

--
-- Tablo için indeksler `islem_turleri`
--
ALTER TABLE `islem_turleri`
  ADD PRIMARY KEY (`Islem_turu_id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`Kullanici_id`);

--
-- Tablo için indeksler `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`Kayit_id`),
  ADD UNIQUE KEY `Kullanici_id` (`Kullanici_id`,`Urun_id`,`Islem_turu_id`),
  ADD KEY `Urun_id` (`Urun_id`),
  ADD KEY `Islem_turu_id` (`Islem_turu_id`);

--
-- Tablo için indeksler `tedarikciler`
--
ALTER TABLE `tedarikciler`
  ADD PRIMARY KEY (`Tedarikci_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`Urun_id`),
  ADD UNIQUE KEY `Urun_turu_id` (`Urun_turu_id`,`Bolum_id`),
  ADD KEY `Bolum_id` (`Bolum_id`);

--
-- Tablo için indeksler `urun_turleri`
--
ALTER TABLE `urun_turleri`
  ADD PRIMARY KEY (`Urun_turu_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `alacaklar`
--
ALTER TABLE `alacaklar`
  MODIFY `Alacakid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `bolumler`
--
ALTER TABLE `bolumler`
  MODIFY `Bolum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `borclar`
--
ALTER TABLE `borclar`
  MODIFY `Borc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `cariler`
--
ALTER TABLE `cariler`
  MODIFY `Cari_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `islem_turleri`
--
ALTER TABLE `islem_turleri`
  MODIFY `Islem_turu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `Kullanici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `main`
--
ALTER TABLE `main`
  MODIFY `Kayit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `tedarikciler`
--
ALTER TABLE `tedarikciler`
  MODIFY `Tedarikci_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `Urun_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `urun_turleri`
--
ALTER TABLE `urun_turleri`
  MODIFY `Urun_turu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `alacaklar`
--
ALTER TABLE `alacaklar`
  ADD CONSTRAINT `alacaklar_ibfk_1` FOREIGN KEY (`Cari_id`) REFERENCES `cariler` (`Cari_id`);

--
-- Tablo kısıtlamaları `main`
--
ALTER TABLE `main`
  ADD CONSTRAINT `main_ibfk_1` FOREIGN KEY (`Urun_id`) REFERENCES `urunler` (`Urun_id`),
  ADD CONSTRAINT `main_ibfk_2` FOREIGN KEY (`Islem_turu_id`) REFERENCES `islem_turleri` (`Islem_turu_id`),
  ADD CONSTRAINT `main_ibfk_3` FOREIGN KEY (`Kullanici_id`) REFERENCES `kullanicilar` (`Kullanici_id`);

--
-- Tablo kısıtlamaları `tedarikciler`
--
ALTER TABLE `tedarikciler`
  ADD CONSTRAINT `tedarikciler_ibfk_1` FOREIGN KEY (`Tedarikci_id`) REFERENCES `borclar` (`Tedarikci_id`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`Bolum_id`) REFERENCES `bolumler` (`Bolum_id`),
  ADD CONSTRAINT `urunler_ibfk_2` FOREIGN KEY (`Urun_turu_id`) REFERENCES `urun_turleri` (`Urun_turu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
