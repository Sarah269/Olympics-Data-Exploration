# Olympics-Data-Exploration

This is a Data Exploration project using Summer 2008 Olympics data.  Medals won by athletes.

<p>This analysis counts multiple medals for a team whereas the International Olympic Committee (IOC) counts only counts 1 medal for a team.  Therefore the numbers in this analysis are higher than the IOC numbers. </p>

- Oracle Live SQL Olympics database.  Oracle Database 19c.
- Olym.olym_medals_view. 29215 records.
- Olym.world_population.  215 records.
- View has data from 1896 to 2008 Olympics
- Focused on 2008 Summer Olympics. 2042 records

Tasks performed:
- Data Exploration using Oracle Live SQL
   - [Data Exploration SQL](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/Olympics_2008.txt)
   - [Table creation SQL](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/Olympics2008_AddData.txt)
- Added country and country population data using Oracle Live SQL.
- Extracted data for import into SAS Studio.
- [Generated Graphs & Macro using SAS Studio](https://github.com/Sarah269/Olympics-Data-Exploration/tree/main/SAS)
- [Created Beijing Summer Olympics 2008 Medal Winners Dashboard.](https://public.tableau.com/views/BeijingSummerOlympics2008/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

Observations:
- 86 of the 204 participating countries earned at least one medal, 41.2%.
- United States dominated earned medals.
- Aquatics, Track & Field (aka Athletics), and Rowing presented the most opportunities to earn a medal.
- Despite being small countries Cuba placed 14th and Jamaica placed 25th in earned medals.

<br></br>
<br></br>

<p>This table shows the country that received the most medals in the 2008 Beijing Olympics.  The United States received the most medals.</p>

![Country with Most Medals](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/CountryMostMedals.png)

<p>This table identifies the countries who received the most medals in each medal category and the number of medals received.  The United States received the most Gold, Silver, and Bronze medals.</p>

![Country with Most Gold, Silver, & Bronze Medals](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/CountryMostGoldSilverBronze.png)

<p>This table shows countries that won the gold, silver, and bronze medals in a sport.   China dominated Badminton.  Germany dominated Canoe/Kayak.</p>

<p> This table shows countries who won multiple medals in a sport.</p>

![Countries Won Medals in Multiple Categories in a Sport](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/CountryMultipleMedalsInSport.png)

<p>This table shows the first year women participated in the modern Olympics based on the data.  The table only shows medal winners.  It seems women only participated in two sports:  Tennis and Golf.  The Olympics from 1896 to 1904 allowed individuals in a team from different nations.  ZZX signifies a mixed team.</p>

![Earliest Year Women Participated in Olympics](https://github.com/Sarah269/Olympics-Data-Exploration/blob/main/FirstYearWomenInOlympics.png
)




