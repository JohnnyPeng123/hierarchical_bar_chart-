# panama-paper
View this visualization from:

https://htmlpreview.github.io/?https://github.com/JohnnyPeng123/panama-paper/master/index.html

![alt text](https://github.com/JohnnyPeng123/panama-paper/blob/master/screen-shot.PNG?raw=true)

Data Source:

http://mozart.diei.unipg.it/gdcontest/contest2016/topics.html

Panama paper is a leaked document which contains large amount of information about the offshore accounts opened by
big companies and wealthy individuals. Typically, these offshore accounts are in countries where tax law can be exploited
for tax evasion purpose.

There are six main marks/elements in this visualization:

1. Base World Map – This is the base map representing the world using Mercator projection, the shape file is from
the website shown on the right. https://geojson-maps.ash.ms/

2. Blue Dots – The blue dots represent countries that have entities with bank account in an offshore country (Source
Node), or the offshore countries that host bank accounts for entities from other countries (Target Node).

3. Red Edge/Line – These red lines represents an outgoing edge from the source nodes to the target node, indicating
there are entities in the source country owns bank accounts in the target country.

4. Arrows at the end of the line – This indicates the direction of the edge/line.

5. Opacity of the line and arrow – Opacity reflects the edge weights, higher the opacity indicating more entitiesfrom
the source country owns bank accounts in the target countries.

6. Bar Chart – The bar chart shows the total number of bank accounts owned by foreign entities (x-axis) in each
country (y-axis). Note that, the x-axis is mapped by square root scale due to the wide range of the x values.
From the visualization, we can clearly see that there are 6 countries with a large number of degree and incoming edges.
From left to right, they are Samoa (far left), Niue (far left), Panama (middle), Bahamas (middle), British Virgin
Islands(middle), and Seychelles (far right). These are also the top 6 countries in the bar chart (excluding “Undetermined”
country), and they are the top 6 in terms of bank accounts owned by foreign entities, so the result from the bar chart
reconcile with the result shown from the map.

# Self-evaluation

• (Strength) For read with strong geography knowledge, this visualization provides a lot of geographical information
to them, and it is able to answers the following geographically related questions very well:

o Is there a cluster of countries that are geographically close to each other and all have a large volume of
incoming/outgoing edges? Which continent has the most “tax haven”?

• (Strength) For reader that does not have a strong geography knowledge, they can still quickly identify which
countries has the most bank accounts from the foreign entities with the help of the bar chart.

• (Strength) This visualization is interactive, by hovering the mouse over the blue bars, user is able to gain a much
clear view for on all the incoming edges for this specific country. (An example shown in the next page)

• (Weakness) Given base map was projected using Mercator projection, and each projection method has its own
weakness, it might misrepresent the relativity distance between two countries.

• (Weakness) For readers with limited geographical knowledge, this visualization might not be useful. Given the
reader have no idea about the location of each country, this visualization is unable to answer a lot of important
questions for them.

• (Weakness) Both x-axis of the bar chart and the opacity of the lines are in square root scale, this might cause
confusion and mislead the reader if they are not careful.

• (Weakness) Some of the countries are too close to each other, so the countries with smaller degree tends to get
covered or dominated visually by the countries with higher degree.

