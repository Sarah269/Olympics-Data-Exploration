/*My library*/

libname mylib "/home/u63413844/DataAnalysis";

/*Import extract file into SAS*/

proc import out=mylib.olym_2008_medals
  datafile="/home/u63413844/DataAnalysis/Olym_medals2.csv"
  DBMS=csv replace;
  getnames = YES;
  guessingrows=32767; 
  ;

/*Add formats to imported file*/
data mylib.olym_2008_medals;
  set mylib.olym_2008_medals;
  attrib pop_2008 format=comma15.;
  attrib country format=$char60.;
  
  

/*Define macro for displaying medals won in a sport*/
/*Input parameter for Internation Olympic country code*/

%macro medalswon(ctry_cd);
/*Find country name associated with country code*/
/*Store country name in a macro variable*/
proc sql noprint;
  select distinct country
  into :ctry_nm
  from mylib.olym_2008_medals
  where country_code = "&ctry_cd"
  ;
 
 /*List Medals won by country by sport*/

title "Cross tabulation:   Medals won by &ctry_nm";
proc freq data=mylib.olym_2008_medals;
   where country_code = "&ctry_cd";
   by country_code;
   tables sport*gender /nosparse;
run;

title;
%mend medalswon;

options mprint;
%medalswon(USA);
%medalswon(AUS);