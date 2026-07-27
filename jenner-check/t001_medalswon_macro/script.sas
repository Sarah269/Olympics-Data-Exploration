/* My library */
libname mylib ".";

/*
 * Self-contained data load for this bundle:
 * the repo's Oracle->SAS Studio pipeline imported SAS/Olym_medals2.csv via
 * PROC IMPORT from an absolute SAS Studio path.  So this bundle runs without
 * any external file, the same real rows are loaded inline here (a curated
 * extract of SAS/Olym_medals2.csv covering USA & AUS across several sports).
 * The %medalswon macro, PROC SQL, and PROC FREQ below are the author's code,
 * unchanged.
 */
data mylib.olym_2008_medals;
  length country_code $3 country $14 sport $14 gender $6 medal $8;
  attrib pop_2008 format=comma15.;
  attrib country format=$char60.;
  infile datalines dlm='|';
  input country_code $ country $ pop_2008 sport $ gender $ medal $;
datalines;
USA|United States|304093966|Aquatics|Men|Gold
USA|United States|304093966|Aquatics|Men|Gold
USA|United States|304093966|Aquatics|Men|Gold
USA|United States|304093966|Athletics|Women|Gold
USA|United States|304093966|Athletics|Women|Silver
USA|United States|304093966|Athletics|Women|Gold
USA|United States|304093966|Basketball|Men|Gold
USA|United States|304093966|Basketball|Men|Gold
USA|United States|304093966|Basketball|Men|Gold
USA|United States|304093966|Rowing|Men|Bronze
USA|United States|304093966|Rowing|Women|Gold
USA|United States|304093966|Rowing|Men|Bronze
USA|United States|304093966|Gymnastics|Women|Silver
USA|United States|304093966|Gymnastics|Women|Silver
USA|United States|304093966|Gymnastics|Men|Bronze
USA|United States|304093966|Softball|Women|Silver
USA|United States|304093966|Softball|Women|Silver
USA|United States|304093966|Softball|Women|Silver
AUS|Australia|21249200|Aquatics|Men|Bronze
AUS|Australia|21249200|Aquatics|Men|Bronze
AUS|Australia|21249200|Aquatics|Men|Bronze
AUS|Australia|21249200|Athletics|Men|Silver
AUS|Australia|21249200|Athletics|Men|Gold
AUS|Australia|21249200|Athletics|Men|Bronze
AUS|Australia|21249200|Basketball|Women|Silver
AUS|Australia|21249200|Basketball|Women|Silver
AUS|Australia|21249200|Basketball|Women|Silver
AUS|Australia|21249200|Rowing|Men|Gold
AUS|Australia|21249200|Rowing|Men|Gold
AUS|Australia|21249200|Rowing|Men|Gold
AUS|Australia|21249200|Softball|Women|Bronze
AUS|Australia|21249200|Softball|Women|Bronze
AUS|Australia|21249200|Softball|Women|Bronze
CHN|China|1324655000|Aquatics|Men|Gold
CHN|China|1324655000|Aquatics|Men|Gold
CHN|China|1324655000|Aquatics|Women|Bronze
CHN|China|1324655000|Aquatics|Women|Bronze
GBR|United Kingdom|61773855|Aquatics|Women|Gold
GBR|United Kingdom|61773855|Aquatics|Women|Bronze
GBR|United Kingdom|61773855|Aquatics|Women|Gold
GBR|United Kingdom|61773855|Aquatics|Men|Silver
;
run;


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
