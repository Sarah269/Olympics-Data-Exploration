/*My library */
libname mylib "/home/u63413844/DataAnalysis";

/*Import extract file into SAS*/

proc import out=mylib.olym_2008_medals
  datafile="/home/u63413844/DataAnalysis/Olym_medals2.csv"
  DBMS=csv replace;
  getnames = YES;
  guessingrows=32767;
  ;

/* Add formats */
data mylib.olym_2008_medals;
  set mylib.olym_2008_medals;
  attrib pop_2008 format=comma15.;

proc print;run;

proc contents data=mylib.olym_2008_medals;
run;

/*Mean population of participating countries*/
title1 'Average population of countries participating in the Summer 2008 Olympics';
proc means data=mylib.olym_2008_medals;
  var pop_2008;
  run;


proc univariate data=mylib.olymm_2008_medals;
  var pop_2008;
  run ;
title;

/*Frequency Statistics*/  
title1 'Number of medals won in each sport';
proc freq data=mylib.olym_2008_medals;
  tables sport;
run;

title1 'Number of medals won by gender';
proc freq data=mylib.olym_2008_medals;
  tables gender;
run;

title1 'Number of medals won by country';
proc freq data=mylib.olym_2008_medals;
  tables country_code;
run;


title1 'Cross tabulation:  Medals won by Sport';
 proc freq data=mylib.olym_2008_medals;
   tables sport* gender;
   run;
 
title 'Cross tabulation:   Medals won by Country';
proc freq data=mylib.olym_2008_medals;
   tables country_code*gender;
run;
 
 
proc sort data=mylib.olym_2008_medals; 
by gender;
run; 
 
/* Horizontal Bar Chart*/ 
title '2008 Summer Olympics: Medals Won by Sport'; 
proc gchart data = mylib.olym_2008_medals;
  hbar sport / nostats group=gender gspace=4 space=4;
  run;
 quit;

/*Vertical Bar Chart*/ 
title '2008 Summer Olympics: Medals Won by Sport';  
proc gchart data = mylib.olym_2008_medals;
  vbar sport / nostats subgroup=gender gspace=4 space=4;
  run;
quit;

/*Pie Chart*/
title '2008 Summer Olympics: Medals Won by Sport';  
 proc gchart data=mylib.olym_2008_medals;
    pie sport / type= percent discrete group=gender noheading;
 run;
quit;

/*Donut Pie Chart*/
 title '2008 Summer Olympics: Medals Won by Sport';  
 proc gchart data=mylib.olym_2008_medals;
    donut sport / type= percent discrete subgroup=gender noheading
    value=inside slice=outside percent=arrow;
 run;
quit; 
 
/*Scatter Plot*/
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=MYLIB.OLYM_2008_MEDALS;
	title height=14pt "Medal Distribution Based on Country Population";
	scatter x=MEDAL y=POP_2008 /;
	xaxis grid label="Medals Won";
	yaxis grid label="Country Population";
run;

ods graphics / reset;
title;
 
/*Histogram*/
ods graphics / reset width=6.4in height=4.8in imagemap;
proc sgplot data=MYLIB.OLYM_2008_MEDALS;
	title height=14pt "Summer 2008 Olympics:  Medal Winner's Country Population Distributuion";
	histogram POP_2008 / nbins=7;
	density POP_2008;
	xaxis label="Country Population";
	yaxis grid;
	keylegend "DENSITY" / location=inside position=topright across=1;
run;

ods graphics / reset;
title;
  



