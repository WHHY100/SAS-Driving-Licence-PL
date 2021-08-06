/*pobieranie danych ze strony rządowej*/

%let downloadFile =  "/home/u45585517/sasuser.v94/DRIVING_LICENSE_PL/DATA/driving_license.csv";
%let pathImgExport = "/home/u45585517/sasuser.v94/DRIVING_LICENSE_PL/IMG/";

filename tempFile &downloadFile encoding="utf-8";
proc http
url='https://api.dane.gov.pl/media/resources/20210428/NOWE_PJ_A_2021_II.csv'
method="get" out=tempFile;
run;

/*import pliku do worka*/
proc import datafile=&downloadFile
out=tab_entry(drop=wojewodztwo)
dbms=csv
replace;
delimiter='|';
run;

/*slownik dla odpowiedniego kodu wojewodztwa*/
data tab_dict_area;
retain code area_name;
length area_name $200.;
infile datalines delimiter=','; 
input code area_name $;
datalines;
02,WOJ. DOLNOSKASKIE
04,WOJ. KUJAWSKO-POMORSKIE
06,WOJ. LUBELSKIE
08,WOJ. LUBUSKIE
10,WOJ. ŁÓDZKIE
12,WOJ. MAŁOPOLSKIE
14,WOJ. MAZOWIECKIE
16,WOJ. OPOLSKIE
18,WOJ. PODKARPACKIE
20,WOJ. PODLASKIE
22,WOJ. POMORSKIE
24,WOJ. ŚLĄSKIE
26,WOJ. ŚWIĘTOKRZYSKIE
28,WOJ. WARMIŃSKO-MAZURSKIE
30,WOJ. WIELKOPOLSKIE
32,WOJ. ZACHODNIOPOMORSKIE
;
run;

/*dane do grupowania*/
proc sql;
create table tab_data as
select
	month(data_mc) as month
	,b.area_name
	,a.plec as gender
	,a.wiek as age
from tab_entry a
left join tab_dict_area b on a.kod_woj = b.code
;quit;

/*grupowanie danych po województwach*/
proc sql;
create table tab_area_stats as
select
	area_name
	,count(*) as sum_drv_lic
from tab_data
group by area_name
order by area_name
;quit;

/*eksport liczby zrobionych praw jazdy na województwo*/
ods graphics on/ reset=index imagename='Driv_Lic_Per_Area' imagefmt=jpg;
ods listing gpath=&pathImgExport;
proc sgplot data = tab_area_stats;
title "Number of driving license in Poland in 2021.02";
vbar area_name / response=sum_drv_lic dataskin=sheen datalabel categoryorder=RespDesc;
xaxis label = "Number of driving license";
yaxis grid display=(nolabel);
run;
ods graphics off;
ods listing close;

/*grupowanie danych po płci*/
proc sql;
create table tab_gender_stats as
select
	gender
	,count(*) as sum_driv_lic
from tab_data
group by gender
order by gender
;quit;

data tab_gender_stats;
set tab_gender_stats;
if gender = 'K' then gender_eng = 'F';
else gender_eng = gender;
drop gender;
rename gender_eng = gender;
run;

/*eksport wykresu liczb zdanych praw jazdy względem płci*/
ods graphics on/ reset=index imagename='Driv_Lic_Per_Gender' imagefmt=jpg;
ods listing gpath=&pathImgExport;
proc sgplot data = tab_gender_stats;
title "Driving Licence per Gender in Poland in 2021.02";
hbar gender / response=sum_driv_lic dataskin=crisp datalabel categoryorder=RespDesc
fillattrs=(color=gold);
xaxis label = "Number of driving license per Gender";
yaxis grid display=(nolabel);
run;
ods graphics off;
ods listing close;

/*grupowanie danych po województwie, sredni wiek zdającego*/
proc sql;
create table tab_mean_area_age as
select
	area_name
	,round(mean(age)) as mean_age
from tab_data
group by area_name
order by area_name
;quit;

/*eksport wykresu sredniego wieku kurstanta, ktory zrobil prawo jazdy*/
ods graphics on/ reset=index imagename='Driv_Lic_Per_Area_Age' imagefmt=jpg;
ods listing gpath=&pathImgExport;
proc sgplot data = tab_mean_area_age;
title "Mean Age driving students in Poland in 2021.02";
hbar area_name / response=mean_age dataskin=matte datalabel categoryorder=RespAsc
fillattrs=(color=blue);
xaxis label = "Mean Age driving students";
yaxis grid display=(nolabel);
run;
ods graphics off;
ods listing close;

/*grupowanie danych ze względu na płeć i wiek kursanta*/
proc sql;
create table tab_mean_age_gender as
select
	 case 
		when gender = 'K' then 'F'
		else gender
	 end as gender
	,round(mean(age)) as mean_age
from tab_data
group by gender
;quit;

/*eksport wykresu sredniego wieku kurstanta ze wzgledu na plec*/
ods graphics on/ reset=index imagename='Driv_Lic_Per_Gender_Age' imagefmt=jpg;
ods listing gpath=&pathImgExport;
proc sgplot data = tab_mean_age_gender;
title "Mean Age driving students per Gender in Poland in 2021.02";
vbar gender / response=mean_age dataskin=pressed datalabel categoryorder=RespAsc
fillattrs=(color=STEEL);
xaxis label = "Mean Age driving students per Gender";
yaxis grid display=(nolabel);
run;
ods graphics off;
ods listing close;
