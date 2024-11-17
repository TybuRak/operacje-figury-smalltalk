"Autorzy:"
"Jakub Czujko"
"Nikodem Czachorowski"
"Paweł Tyburski"

Object subclass: #Wielokat
instanceVariableNames: 'wierzcholki nazwa'
classVariableNames: ''
poolDictionaries: ''
category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!
initialize: liczbaWierzcholkow name: nowaNazwa
    "konstruktor obiektu - wielokata"
    nazwa := nowaNazwa.
    wierzcholki := Array new: liczbaWierzcholkow.
    wierzcholki at: 1 put: 0@0.
    ^self! !

!Wielokat methodsFor: 'accessing'!
nazwa
    "podaje nazwe wielokata"
    ^nazwa!

nazwa: nowa_nazwa
    "ustawia nowa nazwe wielokata"
    nazwa := nowa_nazwa! !
    
!Wielokat class methodsFor: 'testing'!
checkIfWielokat: obiekt
    "Sprawdza czy podany obiekt jest instancją klasy Wielokat"
    ^obiekt isKindOf: Wielokat! !

!Wielokat methodsFor: 'transformations'!
skaluj: skala
    "skaluje wszystkie wierzcholki wielokata o podany wspolczynnik"
    1 to: wierzcholki size do: [:i |
        | punkt |
        punkt := wierzcholki at: i.
        wierzcholki at: i put: (punkt x * skala) @ (punkt y * skala)
    ].
    ^self! !

!Wielokat methodsFor: 'printing'!
drukuj
    "wypisuje informacje o wielokacie"
    Transcript cr; show: '=== ', nazwa, ' ==='; cr.
    Transcript show: 'Wierzchołki:'; cr.
    1 to: wierzcholki size do: [:i |
        | punkt |
        punkt := wierzcholki at: i.
        punkt isNil
            ifTrue: [Transcript show: i printString, ': nil'; cr]
            ifFalse: [
                Transcript show: i printString, ': (',
                    punkt x printString, ', ',
                    punkt y printString, ')'; cr
            ]
    ].
    (self respondsTo: #pole) ifTrue: [
        Transcript show: 'Pole: ', self pole printString; cr
    ].
    Transcript show: '================'; cr.
    ^self! !

Wielokat subclass: #Kwadrat
instanceVariableNames: ''
classVariableNames: ''
poolDictionaries: ''
category: 'JezykiProgramowania'!

!Kwadrat methodsFor: 'arithmetic'!
+ argument
    "dodaj 2 figury w sensie pola lub dodaj liczbę do pola"
    | p |
    (Wielokat checkIfWielokat: argument)
        ifTrue: [
            p := self pole + argument pole.
            ^(Kwadrat new) initialize: p sqrt.
        ]
        ifFalse: [
            (argument isKindOf: Number)
                ifTrue: [
                    ^self pole + argument
                ]
                ifFalse: [
                    self error: 'Argument musi być wielokątem lub liczbą!'
                ]
        ]! !


!Kwadrat methodsFor: 'actions'!
pole
    "licz pole kwadratu"
    ^(wierzcholki at:2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!
initialize: bok
    "tworz kwadrat o podanym boku"
    super initialize: 4 name: 'Kwadrat'.
    wierzcholki at: 2 put: bok@0.
    wierzcholki at: 3 put: bok@bok.
    wierzcholki at: 4 put: 0@bok.
    ^self! !

Wielokat subclass: #TrapezProstokatny
instanceVariableNames: ''
classVariableNames: ''
poolDictionaries: ''
category: 'JezykiProgramowania'!

!TrapezProstokatny methodsFor: 'initialize-release'!
initialize: podstawaA with: podstawaB with: wysokosc
    "Initialize a rectangular trapezoid with bases a and b, and height h"
    super initialize: 4 name: 'TrapezProstokatny'.
    wierzcholki at: 2 put: podstawaA@0.
    wierzcholki at: 3 put: podstawaB@wysokosc.
    wierzcholki at: 4 put: 0@wysokosc.
    ^self! !

!TrapezProstokatny methodsFor: 'arithmetic'!
+ argument
    "dodaj 2 figury w sensie pola lub dodaj liczbę do pola"
    | a b h p |
    (Wielokat checkIfWielokat: argument)
        ifTrue: [
            p := self pole + argument pole.
            p := p * 2.
            h := p / ((((wierzcholki at: 2) x) + ((wierzcholki at: 3) x)) * ((wierzcholki at: 3) y)) * ((wierzcholki at: 3) y).
            p := p / h.
            a := p * ((wierzcholki at: 2) x) / (((wierzcholki at: 2) x) + ((wierzcholki at:3) x)).
            b := p * ((wierzcholki at: 3) x) / (((wierzcholki at: 2) x) + ((wierzcholki at:3) x)). 
            ^(TrapezProstokatny new) initialize: a with: b with: h.
        ]
        ifFalse: [
            (argument isKindOf: Number)
                ifTrue: [
                    ^self pole + argument
                ]
                ifFalse: [
                    self error: 'Argument musi być wielokątem lub liczbą!'
                ]
        ]! !

!TrapezProstokatny methodsFor: 'actions'!
pole
    "Calculate the area of the rectangular trapezoid"
    | a b h |
    a := (wierzcholki at: 2) x.
    b := (wierzcholki at: 3) x.
    h := (wierzcholki at: 3) y.
    ^((a + b) * h) / 2! !


"============================================="
"TESTY DLA KLAS WIELOKAT, KWADRAT I TRAPEZPROSTOKATNY"
"============================================="

"--- Inicjalizacja zmiennych testowych ---"
| kwadrat1 kwadrat2 kwadrat3 trapez1 trapez2 trapez3 suma liczba |

"=== Test 1: Podstawowe operacje na kwadracie ==="
Transcript cr; show: '=== Test 1: Operacje na kwadracie ==='; cr.

"Utworzenie i wyświetlenie kwadratu"
kwadrat1 := Kwadrat new initialize: 4.
Transcript show: 'Kwadrat początkowy:'; cr.
kwadrat1 drukuj.

"Test skalowania"
Transcript show: 'Kwadrat po przeskalowaniu (x2):'; cr.
kwadrat1 skaluj: 2.
kwadrat1 drukuj.

"=== Test 2: Podstawowe operacje na trapezie ==="
Transcript cr; show: '=== Test 2: Operacje na trapezie ==='; cr.

"Utworzenie i wyświetlenie trapezu"
trapez1 := TrapezProstokatny new initialize: 5 with: 7 with: 4.
Transcript show: 'Trapez początkowy:'; cr.
trapez1 drukuj.

"Test skalowania"
Transcript show: 'Trapez po przeskalowaniu (x3):'; cr.
trapez1 skaluj: 3.
trapez1 drukuj.

"=== Test 3: Sprawdzanie typu obiektu ==="
Transcript cr; show: '=== Test 3: Sprawdzanie typu obiektu ==='; cr.

kwadrat2 := Kwadrat new initialize: 4.
liczba := 42.

Transcript show: 'Test metody checkIfWielokat:'; cr.
Transcript show: 'Dla kwadratu: '.
Transcript show: (Wielokat checkIfWielokat: kwadrat2) printString; cr.
Transcript show: 'Dla liczby: '.
Transcript show: (Wielokat checkIfWielokat: liczba) printString; cr.

"=== Test 4: Operacje arytmetyczne ==="
Transcript cr; show: '=== Test 4: Operacje arytmetyczne ==='; cr.

"Test dodawania liczby do kwadratu"
kwadrat2 := Kwadrat new initialize: 4.0.
liczba := 16.0.
Transcript show: 'Dodawanie liczby ', liczba printString, ' do kwadratu:'; cr.
suma := kwadrat2 + liczba.
Transcript show: 'Wynik: ', suma printString; cr.

"Test dodawania liczby do trapezu"
trapez2 := TrapezProstokatny new initialize: 5.0 with: 7.0 with: 4.0.
liczba := 25.0.
Transcript show: 'Dodawanie liczby ', liczba printString, ' do trapezu:'; cr.
suma := trapez2 + liczba.
Transcript show: 'Wynik: ', suma printString; cr.

"Test dodawania figury do figury"
Transcript cr; show: 'Dodawanie kwadratu do kwadratu';cr.
kwadrat3 := kwadrat1 + kwadrat2.
kwadrat3 drukuj.
Transcript cr; show: 'Dodawanie trapezu do trapezu';cr.
trapez3 := trapez1 + trapez2.
trapez3 drukuj.

"=== Test 5: Obsługa błędów ==="
Transcript cr; show: '=== Test 5: Obsługa błędów ==='; cr.

"Test dodawania nieprawidłowego typu"
Transcript show: 'Próba dodania tekstu do kwadratu:'; cr.
[kwadrat2 + 'tekst'] on: Error do: [:err | 
    Transcript show: 'Błąd (oczekiwany): '; show: err messageText; cr].

"============================================="
Transcript show: 'Testy zakończone'; cr.
"============================================="