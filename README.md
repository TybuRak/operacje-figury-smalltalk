# Działania na obiektach figur w smalltalk

Projekt realizowany w ramach przedmiotu **Języki programowania** na uczelni **Politechnika Gdańska**.


# Zespół

**Paweł Tyburski**
**Nikodem Czachorowski**
**Jakub Czujko**

## Jak korzystać

Do testowania programu najprościej jest użyć środowiska online. Np. https://www.tutorialspoint.com/execute_smalltalk_online.php

## Spis treści
1. [Wprowadzenie](#wprowadzenie)
2. [Struktura projektu](#struktura-projektu)
3. [Klasy i hierarchia](#klasy-i-hierarchia)
4. [Szczegóły implementacji](#szczegóły-implementacji)
5. [Funkcjonalności](#funkcjonalności)
6. [Przykłady użycia](#przykłady-użycia)
7. [Testy](#testy)

## Wprowadzenie
Projekt implementuje system do obsługi figur geometrycznych w języku Smalltalk. Umożliwia tworzenie, manipulację i wykonywanie obliczeń na różnych figurach geometrycznych, takich jak kwadraty i trapezy prostokątne.

## Struktura projektu
```
projekt/
├── wielokat.st         # Główny plik źródłowy
└── README.md          # Ten plik dokumentacji
```

## Klasy i hierarchia
Projekt wykorzystuje następującą hierarchię klas:

```
Wielokat (klasa bazowa)
├── Kwadrat
└── TrapezProstokatny
```

### Wielokat (klasa bazowa)
Podstawowa klasa reprezentująca wielokąt z funkcjonalnościami:
- Przechowywanie wierzchołków
- Zarządzanie nazwą figury
- Podstawowe operacje geometryczne

### Kwadrat
Specjalizacja wielokąta implementująca:
- Automatyczne tworzenie kwadratu o zadanym boku
- Obliczanie pola
- Operacje arytmetyczne

### TrapezProstokatny
Specjalizacja wielokąta implementująca:
- Tworzenie trapezu prostokątnego o zadanych wymiarach
- Obliczanie pola
- Operacje arytmetyczne

## Szczegóły implementacji

### Wielokat
#### Zmienne instancji:
- `wierzcholki` - tablica punktów reprezentujących wierzchołki
- `nazwa` - nazwa figury

#### Główne metody:
```smalltalk
initialize: liczbaWierzcholkow name: nowaNazwa
nazwa
nazwa: nowa_nazwa
skaluj: skala
drukuj
```

### Kwadrat
#### Główne metody:
```smalltalk
initialize: bok
pole
+ argument
```

### TrapezProstokatny
#### Główne metody:
```smalltalk
initialize: podstawaA with: podstawaB with: wysokosc
pole
+ argument
```

## Funkcjonalności

### 1. Zarządzanie wierzchołkami
- Dynamiczne tworzenie tablicy wierzchołków
- Automatyczne ustawianie współrzędnych
- Manipulacja położeniem wierzchołków

### 2. Operacje geometryczne
- Skalowanie figur (metoda `skaluj:`)
- Obliczanie pola (metoda `pole`)
- Operacje arytmetyczne (dodawanie figur i liczb)

### 3. Funkcje pomocnicze
- Wyświetlanie informacji o figurze (metoda `drukuj`)
- Sprawdzanie typu obiektu (metoda `checkIfWielokat:`)
- Obsługa błędów przy nieprawidłowych operacjach

## Przykłady użycia

### Tworzenie i skalowanie kwadratu
```smalltalk
kwadrat := Kwadrat new initialize: 4.
kwadrat skaluj: 2.
kwadrat drukuj.
```

### Tworzenie i operacje na trapezie
```smalltalk
trapez := TrapezProstokatny new initialize: 5 with: 7 with: 4.
trapez skaluj: 3.
trapez drukuj.
```

### Dodawanie liczby do figury
```smalltalk
suma := kwadrat + 16.0.
```

## Testy

Projekt zawiera kompleksowy zestaw testów sprawdzających:
1. Podstawowe operacje na kwadracie
2. Podstawowe operacje na trapezie
3. Sprawdzanie typu obiektu
4. Operacje arytmetyczne
5. Obsługę błędów

### Przykład testu
```smalltalk
"Test dodawania liczby do kwadratu"
kwadrat := Kwadrat new initialize: 4.0.
liczba := 16.0.
suma := kwadrat + liczba.
```

## Uwagi końcowe
- Projekt wykorzystuje zaawansowane mechanizmy języka Smalltalk
- Implementacja jest rozszerzalna - łatwo można dodać nowe typy figur
- Kod zawiera pełną obsługę błędów
- Wszystkie operacje są dokumentowane w konsoli Transcript

---
*Dokumentacja wygenerowana dla projektu Figury Geometryczne w Smalltalk*
