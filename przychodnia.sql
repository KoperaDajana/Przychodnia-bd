-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 25 Mar 2018, 18:46
-- Wersja serwera: 5.5.59-0+deb8u1
-- Wersja PHP: 5.6.33-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `magbudz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Choroba`
--

CREATE TABLE IF NOT EXISTS `Choroba` (
  `nazwa_choroby` char(20) NOT NULL,
  `stan` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Choroba`
--

INSERT INTO `Choroba` (`nazwa_choroby`, `stan`) VALUES
('Bialaczka', 'Tak'),
('Bolerioza', 'Nie'),
('Cukrzyca', 'Nie'),
('Nadcisnienie', 'Nie'),
('Schizofrenia', 'Tak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Gabinet`
--

CREATE TABLE IF NOT EXISTS `Gabinet` (
  `nr_gabinetu` char(20) NOT NULL,
  `nazwa_oddzialu` char(50) NOT NULL,
  `id_przychodni` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Gabinet`
--

INSERT INTO `Gabinet` (`nr_gabinetu`, `nazwa_oddzialu`, `id_przychodni`) VALUES
('1', 'Kardiologia', '1'),
('3', 'Onkologia', '3'),
('2', 'Pediatria', '2'),
('6', 'Psychiatria', '4'),
('8', 'Rehabilitacja', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Karta_pacjenta`
--

CREATE TABLE IF NOT EXISTS `Karta_pacjenta` (
  `id_karty` char(20) NOT NULL,
  `nazwa_oddzialu` char(50) NOT NULL,
  `pesel` char(20) NOT NULL,
  `id_przychodni` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Karta_pacjenta`
--

INSERT INTO `Karta_pacjenta` (`id_karty`, `nazwa_oddzialu`, `pesel`, `id_przychodni`) VALUES
('1', 'Kardiologia', '850426854', '1'),
('2', 'Onkologia', '730229877', '3'),
('3', 'Pediatria', '965882111', '2'),
('4', 'Psychiatria', '741258896', '4'),
('5', 'Rehabilitacja', '990552888', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Lek`
--

CREATE TABLE IF NOT EXISTS `Lek` (
  `nazwa_leku` char(20) NOT NULL,
  `firma` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Lek`
--

INSERT INTO `Lek` (`nazwa_leku`, `firma`) VALUES
('Belissa', 'Bayern'),
('Flegamina', 'Teva'),
('Flexit', 'Trec'),
('Ibum', 'Teva'),
('Nurofen', 'Bayern');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Lekarz`
--

CREATE TABLE IF NOT EXISTS `Lekarz` (
  `imie_lekarza` char(20) NOT NULL,
  `nazwisko_lekarza` char(20) NOT NULL,
  `nazwa_oddzialu` char(50) NOT NULL,
  `id_lekarza` char(20) NOT NULL,
  `id_przychodni` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Lekarz`
--

INSERT INTO `Lekarz` (`imie_lekarza`, `nazwisko_lekarza`, `nazwa_oddzialu`, `id_lekarza`, `id_przychodni`) VALUES
('Tomasz', 'Lis', 'Kardiologia', '1', '1'),
('Kaja', 'Wojnikowska', 'Pediatria', '2', '2'),
('Wiktoria', 'Pos', 'Onkologia', '3', '3'),
('Abelard', 'Siwy', 'Psychiatria', '4', '4'),
('Maciej', 'Mak', 'Rehabilitacja', '5', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Oddzial`
--

CREATE TABLE IF NOT EXISTS `Oddzial` (
  `nazwa_oddzialu` char(50) NOT NULL,
  `id_przychodni` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Oddzial`
--

INSERT INTO `Oddzial` (`nazwa_oddzialu`, `id_przychodni`) VALUES
('Ginekologia', '1'),
('Kardiologia', '1'),
('Psychiatria', '1'),
('Urologia', '1'),
('Pediatria', '2'),
('Onkologia', '3'),
('Psychiatria', '4'),
('Rehabilitacja', '5'),
('Pediatria', '6'),
('Psychiatria', '6'),
('Rehabilitacja', '6');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Pacjent`
--

CREATE TABLE IF NOT EXISTS `Pacjent` (
  `imie` char(20) NOT NULL,
  `nazwisko` char(20) NOT NULL,
  `adres_zamieszkania` char(20) NOT NULL,
  `adres_zameldowania` char(20) DEFAULT NULL,
  `telefon_kontaktowy` char(20) DEFAULT NULL,
  `pesel` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Pacjent`
--

INSERT INTO `Pacjent` (`imie`, `nazwisko`, `adres_zamieszkania`, `adres_zameldowania`, `telefon_kontaktowy`, `pesel`) VALUES
('Malgorzata', 'Kloc', 'Swinoujscie', 'Krakow', '745896321', '730229877'),
('Andrzej', 'Dudek', 'Krakow', 'Krakow', '888888888', '741258896'),
('Grzegorz', 'Stolarczyk', 'Warszawa', 'Poznan', '558965231', '850426854'),
('Magdalena', 'Kotek', 'Warszawa', 'Warszawa', '895745147', '960508178'),
('Konrad', 'Kolodziejczyk', 'Znamirowice', 'Krakow', '789456125', '965547785'),
('Ewa', 'Kopacz', 'Lisia Gora', 'Rzeszow', '700856321', '965882111'),
('Pawel', 'Pawlowicz', 'Lublin', 'Wroclaw', '856325896', '990552888');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Posiadana_specjalnosc`
--

CREATE TABLE IF NOT EXISTS `Posiadana_specjalnosc` (
  `nazwa_specjalnosci` char(20) NOT NULL,
  `id_lekarza` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Posiadana_specjalnosc`
--

INSERT INTO `Posiadana_specjalnosc` (`nazwa_specjalnosci`, `id_lekarza`) VALUES
('Chirurgia', '1'),
('Epidemiologia', '2'),
('Poloznictwo', '3'),
('Psychiatria', '4'),
('Toksykologia', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Przepisanie_leku`
--

CREATE TABLE IF NOT EXISTS `Przepisanie_leku` (
  `id_recepty` char(20) NOT NULL,
  `nazwa_leku` char(20) NOT NULL,
  `firma` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Przepisanie_leku`
--

INSERT INTO `Przepisanie_leku` (`id_recepty`, `nazwa_leku`, `firma`) VALUES
('3', 'Belissa', 'Bayern'),
('4', 'Flegamina', 'Teva'),
('5', 'Flexit', 'Trec'),
('2', 'Ibum', 'Teva'),
('1', 'Nurofen', 'Bayern');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Przychodnia`
--

CREATE TABLE IF NOT EXISTS `Przychodnia` (
  `ulica` char(50) NOT NULL,
  `numer_budynku` int(11) NOT NULL,
  `miasto` char(50) NOT NULL,
  `id_przychodni` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Przychodnia`
--

INSERT INTO `Przychodnia` (`ulica`, `numer_budynku`, `miasto`, `id_przychodni`) VALUES
('Zdrowa', 55, 'Kraków', '1'),
('Krakowska', 10, 'Wroclaw', '2'),
('Mickiewicza', 8, 'Warszawa', '3'),
('Tyska', 19, 'Katowice', '4'),
('Dluga', 8, 'Rzeszow', '5'),
('Zdrowa', 25, 'Gdansk', '6');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Recepta`
--

CREATE TABLE IF NOT EXISTS `Recepta` (
  `id_recepty` char(20) NOT NULL,
  `id_wizyty` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Recepta`
--

INSERT INTO `Recepta` (`id_recepty`, `id_wizyty`) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Rodzaj_sprzetu`
--

CREATE TABLE IF NOT EXISTS `Rodzaj_sprzetu` (
  `nazwa_sprzetu` char(20) NOT NULL,
  `firma` char(20) NOT NULL,
  `id_sprzetu` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Rodzaj_sprzetu`
--

INSERT INTO `Rodzaj_sprzetu` (`nazwa_sprzetu`, `firma`, `id_sprzetu`) VALUES
('Defibrylator', 'Samsung', '1'),
('Strzykawki', 'Fiat', '2'),
('PC', 'PSP', '3'),
('Fotel', 'Ikea', '4'),
('USG', 'LLG', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Rozpoznanie_choroby`
--

CREATE TABLE IF NOT EXISTS `Rozpoznanie_choroby` (
  `nazwa_choroby` char(20) NOT NULL,
  `id_choroby` char(20) NOT NULL,
  `id_wizyty` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Rozpoznanie_choroby`
--

INSERT INTO `Rozpoznanie_choroby` (`nazwa_choroby`, `id_choroby`, `id_wizyty`) VALUES
('Schizofrenia', '1', '1'),
('Cukrzyca', '2', '2'),
('Bolerioza', '3', '3'),
('Bialaczka', '4', '4'),
('Nadcisnienie', '5', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Specjalnosc`
--

CREATE TABLE IF NOT EXISTS `Specjalnosc` (
  `nazwa_specjalnosci` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Specjalnosc`
--

INSERT INTO `Specjalnosc` (`nazwa_specjalnosci`) VALUES
('Chirurgia'),
('Epidemiologia'),
('Poloznictwo'),
('Psychiatria'),
('Toksykologia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Sprzet`
--

CREATE TABLE IF NOT EXISTS `Sprzet` (
  `nr_gabinetu` char(20) NOT NULL,
  `nazwa_oddzialu` char(50) NOT NULL,
  `sprawnosc` tinyint(1) NOT NULL,
  `id_przychodni` char(20) NOT NULL,
  `id_sprzetu` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Sprzet`
--

INSERT INTO `Sprzet` (`nr_gabinetu`, `nazwa_oddzialu`, `sprawnosc`, `id_przychodni`, `id_sprzetu`) VALUES
('1', 'Kardiologia', 0, '1', '1'),
('2', 'Pediatria', 0, '2', '2'),
('3', 'Onkologia', 1, '3', '3'),
('6', 'Psychiatria', 1, '4', '4'),
('8', 'Rehabilitacja', 0, '5', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Wizyta`
--

CREATE TABLE IF NOT EXISTS `Wizyta` (
  `data_wizyty` char(20) NOT NULL,
  `godzina_wizyty` char(20) NOT NULL,
  `id_karty` char(20) NOT NULL,
  `id_lekarza` char(20) NOT NULL,
  `id_wizyty` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `Wizyta`
--

INSERT INTO `Wizyta` (`data_wizyty`, `godzina_wizyty`, `id_karty`, `id_lekarza`, `id_wizyty`) VALUES
('2017-02-27', '17:30', '1', '1', '1'),
('2017-12-24', '19:00', '1', '1', '10'),
('2017-05-31', '18:30', '1', '5', '100'),
('2017-05-28', '20:00', '5', '1', '101'),
('2017-06-12', '11:00', '2', '2', '2'),
('2017-05-04', '14:30', '3', '3', '3'),
('2017-12-05', '08:00', '4', '4', '4'),
('2017-05-26', '21:59', '5', '5', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Zapytanie`
--

CREATE TABLE IF NOT EXISTS `Zapytanie` (
  `nazwisko_lekarza` char(1) DEFAULT NULL,
  `data_wizyty` char(1) DEFAULT NULL,
  `nazwa_specjalnosci` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `Choroba`
--
ALTER TABLE `Choroba`
 ADD PRIMARY KEY (`nazwa_choroby`);

--
-- Indexes for table `Gabinet`
--
ALTER TABLE `Gabinet`
 ADD PRIMARY KEY (`nr_gabinetu`,`nazwa_oddzialu`,`id_przychodni`), ADD KEY `nazwa_oddzialu` (`nazwa_oddzialu`,`id_przychodni`);

--
-- Indexes for table `Karta_pacjenta`
--
ALTER TABLE `Karta_pacjenta`
 ADD PRIMARY KEY (`id_karty`), ADD KEY `nazwa_oddzialu` (`nazwa_oddzialu`,`id_przychodni`), ADD KEY `pesel` (`pesel`);

--
-- Indexes for table `Lek`
--
ALTER TABLE `Lek`
 ADD PRIMARY KEY (`nazwa_leku`,`firma`);

--
-- Indexes for table `Lekarz`
--
ALTER TABLE `Lekarz`
 ADD PRIMARY KEY (`id_lekarza`), ADD KEY `nazwa_oddzialu` (`nazwa_oddzialu`,`id_przychodni`);

--
-- Indexes for table `Oddzial`
--
ALTER TABLE `Oddzial`
 ADD PRIMARY KEY (`nazwa_oddzialu`,`id_przychodni`), ADD KEY `id_przychodni` (`id_przychodni`);

--
-- Indexes for table `Pacjent`
--
ALTER TABLE `Pacjent`
 ADD PRIMARY KEY (`pesel`);

--
-- Indexes for table `Posiadana_specjalnosc`
--
ALTER TABLE `Posiadana_specjalnosc`
 ADD PRIMARY KEY (`nazwa_specjalnosci`,`id_lekarza`), ADD KEY `id_lekarza` (`id_lekarza`);

--
-- Indexes for table `Przepisanie_leku`
--
ALTER TABLE `Przepisanie_leku`
 ADD PRIMARY KEY (`id_recepty`,`nazwa_leku`,`firma`), ADD KEY `nazwa_leku` (`nazwa_leku`,`firma`);

--
-- Indexes for table `Przychodnia`
--
ALTER TABLE `Przychodnia`
 ADD PRIMARY KEY (`id_przychodni`);

--
-- Indexes for table `Recepta`
--
ALTER TABLE `Recepta`
 ADD PRIMARY KEY (`id_recepty`), ADD KEY `id_wizyty` (`id_wizyty`);

--
-- Indexes for table `Rodzaj_sprzetu`
--
ALTER TABLE `Rodzaj_sprzetu`
 ADD PRIMARY KEY (`id_sprzetu`);

--
-- Indexes for table `Rozpoznanie_choroby`
--
ALTER TABLE `Rozpoznanie_choroby`
 ADD PRIMARY KEY (`id_choroby`), ADD KEY `id_wizyty` (`id_wizyty`), ADD KEY `nazwa_choroby` (`nazwa_choroby`);

--
-- Indexes for table `Specjalnosc`
--
ALTER TABLE `Specjalnosc`
 ADD PRIMARY KEY (`nazwa_specjalnosci`);

--
-- Indexes for table `Sprzet`
--
ALTER TABLE `Sprzet`
 ADD PRIMARY KEY (`nr_gabinetu`,`nazwa_oddzialu`,`id_przychodni`,`id_sprzetu`), ADD KEY `id_sprzetu` (`id_sprzetu`);

--
-- Indexes for table `Wizyta`
--
ALTER TABLE `Wizyta`
 ADD PRIMARY KEY (`id_wizyty`), ADD KEY `id_karty` (`id_karty`), ADD KEY `id_lekarza` (`id_lekarza`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Gabinet`
--
ALTER TABLE `Gabinet`
ADD CONSTRAINT `Gabinet_ibfk_1` FOREIGN KEY (`nazwa_oddzialu`, `id_przychodni`) REFERENCES `Oddzial` (`nazwa_oddzialu`, `id_przychodni`);

--
-- Ograniczenia dla tabeli `Karta_pacjenta`
--
ALTER TABLE `Karta_pacjenta`
ADD CONSTRAINT `Karta_pacjenta_ibfk_1` FOREIGN KEY (`nazwa_oddzialu`, `id_przychodni`) REFERENCES `Oddzial` (`nazwa_oddzialu`, `id_przychodni`),
ADD CONSTRAINT `Karta_pacjenta_ibfk_2` FOREIGN KEY (`pesel`) REFERENCES `Pacjent` (`pesel`);

--
-- Ograniczenia dla tabeli `Lekarz`
--
ALTER TABLE `Lekarz`
ADD CONSTRAINT `Lekarz_ibfk_1` FOREIGN KEY (`nazwa_oddzialu`, `id_przychodni`) REFERENCES `Oddzial` (`nazwa_oddzialu`, `id_przychodni`);

--
-- Ograniczenia dla tabeli `Oddzial`
--
ALTER TABLE `Oddzial`
ADD CONSTRAINT `Oddzial_ibfk_1` FOREIGN KEY (`id_przychodni`) REFERENCES `Przychodnia` (`id_przychodni`);

--
-- Ograniczenia dla tabeli `Posiadana_specjalnosc`
--
ALTER TABLE `Posiadana_specjalnosc`
ADD CONSTRAINT `Posiadana_specjalnosc_ibfk_1` FOREIGN KEY (`id_lekarza`) REFERENCES `Lekarz` (`id_lekarza`),
ADD CONSTRAINT `Posiadana_specjalnosc_ibfk_2` FOREIGN KEY (`nazwa_specjalnosci`) REFERENCES `Specjalnosc` (`nazwa_specjalnosci`);

--
-- Ograniczenia dla tabeli `Przepisanie_leku`
--
ALTER TABLE `Przepisanie_leku`
ADD CONSTRAINT `Przepisanie_leku_ibfk_1` FOREIGN KEY (`id_recepty`) REFERENCES `Recepta` (`id_recepty`),
ADD CONSTRAINT `Przepisanie_leku_ibfk_2` FOREIGN KEY (`nazwa_leku`, `firma`) REFERENCES `Lek` (`nazwa_leku`, `firma`),
ADD CONSTRAINT `Przepisanie_leku_ibfk_3` FOREIGN KEY (`nazwa_leku`, `firma`) REFERENCES `Lek` (`nazwa_leku`, `firma`);

--
-- Ograniczenia dla tabeli `Recepta`
--
ALTER TABLE `Recepta`
ADD CONSTRAINT `Recepta_ibfk_1` FOREIGN KEY (`id_wizyty`) REFERENCES `Wizyta` (`id_wizyty`);

--
-- Ograniczenia dla tabeli `Rozpoznanie_choroby`
--
ALTER TABLE `Rozpoznanie_choroby`
ADD CONSTRAINT `Rozpoznanie_choroby_ibfk_1` FOREIGN KEY (`id_wizyty`) REFERENCES `Wizyta` (`id_wizyty`),
ADD CONSTRAINT `Rozpoznanie_choroby_ibfk_2` FOREIGN KEY (`nazwa_choroby`) REFERENCES `Choroba` (`nazwa_choroby`);

--
-- Ograniczenia dla tabeli `Sprzet`
--
ALTER TABLE `Sprzet`
ADD CONSTRAINT `Sprzet_ibfk_1` FOREIGN KEY (`nr_gabinetu`, `nazwa_oddzialu`, `id_przychodni`) REFERENCES `Gabinet` (`nr_gabinetu`, `nazwa_oddzialu`, `id_przychodni`),
ADD CONSTRAINT `Sprzet_ibfk_2` FOREIGN KEY (`id_sprzetu`) REFERENCES `Rodzaj_sprzetu` (`id_sprzetu`);

--
-- Ograniczenia dla tabeli `Wizyta`
--
ALTER TABLE `Wizyta`
ADD CONSTRAINT `Wizyta_ibfk_1` FOREIGN KEY (`id_karty`) REFERENCES `Karta_pacjenta` (`id_karty`),
ADD CONSTRAINT `Wizyta_ibfk_2` FOREIGN KEY (`id_lekarza`) REFERENCES `Lekarz` (`id_lekarza`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
