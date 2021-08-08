# SAS-Driving-Licence-PL

* [Dane](#Dane)
* [Uruchomienie kodu](#Uruchomienie_kodu)
* [Prezentacja wyników](#Wyniki)
* [Wykorzystana technologia](#Technologia)

## Dane

Informacje o liczbie, wieku i płci kursantów z pozytwnym wynikiem państwowego testu na prawo jazdy kategorii B zostały pobrane z serwisu <b> OTWARTE DANE</b> dostępnego 
pod linkiem: https://dane.gov.pl/pl . 

Bezpośredni link do danych: https://api.dane.gov.pl/media/resources/20210428/NOWE_PJ_A_2021_II.csv

Wystawiony plik przedstawia dane za okres 01.02.2021 - 28.02.2021.

## Uruchomienie_kodu

By uruchomić kod wystarczy zmienić na odpowiednie ścieżki eksportu wykresów i lokalizacji pobranego pliku - wyszczególnione na początku programu.

## Wyniki

![wykres zdobytych praw jazdy na województwo](https://github.com/WHHY100/SAS-Driving-Licence-PL/blob/main/IMG/Driv_Lic_Per_Area.jpg?raw=true)

Województwa w których w badanym okresie najwięcej kursantów uzyskało uprawnienia do kierowania pojazdami kategorii B to: mazowieckie, dolnośląskie i śląskie.
Liczba osób z pozytywnym wynikiem testu państwowego to odpowiednio: 93, 89 i 89. Najmniej nowych kierowców przybyło w województwie podkarpackim, opolskim i podlaskim
kolejno: 74, 71 i 68.

![sredni wiek adepta na województwo](https://github.com/WHHY100/SAS-Driving-Licence-PL/blob/main/IMG/Driv_Lic_Per_Area_Age.jpg?raw=true)

Na powyższym wykresie zaprezentowany jest średni wiek młodego kierowcy w podziale na województwa. Najmłodsi kursaci, którzy uzyskali pozytywny wynik testu uprawniającego
do kierowania pojazdami zamieszkiwali województwo podlaskie. Średni wiek młodego kierowcy na tym terenie wynosił 34 lata. Przeciętnie najstarsi adepci podchodzili do egzaminu
na terenie województwa mazowieckiego, gdzie wartość ta wyniosła 40 lat.

Średni wiek osób uzyskujących uprawnienia do kierowania pojazdami może być zawyżany przez osoby powtórnie zdające egzamin w wyniku utraty uprawnień do kierowania.

![podział kursantów względem płci](https://github.com/WHHY100/SAS-Driving-Licence-PL/blob/main/IMG/Driv_Lic_Per_Gender.jpg?raw=true)

Powyższy wykres prezentuje kursantów, którzy uzyskali prawo jazdy kategorii B w podziale na płeć. W okresie 01.02.2021 - 28.02.2021 prawie 700 kobiet w Polsce uzyskało
uprawnienia do kierowania pojazdami, mężczyzn w tym gronie było prawie 100 mniej.

![podzial kursantów względem wieku i płci](https://github.com/WHHY100/SAS-Driving-Licence-PL/blob/main/IMG/Driv_Lic_Per_Gender_Age.jpg?raw=true)

Średni wiek mężczyzn, którzy uzyskali prawo jazdy kategorii B w Polsce wyniósł 35 lat, kobiet zaś prawie 40. Przeciętny mężczyzna zdaje w Polsce prawo jazdy w młodszym wieku 
niż kobieta
 
## Technologia

Oprogramowanie: *SAS Studio* ® w SAS® OnDemand

Wersja: *9.4_M6*
