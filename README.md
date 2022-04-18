# project_2_airbnb_map_search_engine
![portada](https://viajesparanico.com.ar/wp-content/uploads/2020/05/airbnb00-678x381.jpg)

# Objetive 🎯
Given the recent popularity of turistic apartments in big cities, my intention is to provive a software in which users can perform in-map Airbnb data exploration according to their interest.

# Scope and extra information 🔎
In this work I've selected Madrid because Madrid Rocks! 🤘🏽

However, I've found that Inside Airbnb website provides same information for different cities around the world, check the link in data sources right below.

![image](https://p4.wallpaperbetter.com/wallpaper/1019/2/543/monuments-puerta-de-alcala-wallpaper-preview.jpg)

# Data sources 📊
[Kaggle](https://www.kaggle.com/datasets/rusiano/madrid-airbnb-data?select=calendar.csv): to get Airbnb data for Madrid (csv format).

[Inside Airbnb](http://insideairbnb.com/get-the-data/): to get latest Airbnb data for several cities around the world.

# Step by step 🏃🏽‍♂️

1. Download csv data from data sources.

2. Reshaping and cleaning performed in python (tables: listings, neighborhoods, hosts, reviews, calendar).

3. SQL Workbench database and diagram creation.

4. Data insert in SQL database through SQL Alchemy (python library).

5. Perform SQL queries in python to obtain desired dataframes exported to csv.

6. Create database in Tableau Public with those csv files - relationships between tables 🔗.

7. Use combined data to develop three different dashboards with three different perspectives (price, reviews, calendar avalability).

# Dashboards created in Tableau Public:

1. Reviews dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_explore_map/dashboard_explore_map/4_3.png)

2. Reviews dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_reviews/dashboard_other_stats/4_3.png)

3. Availability dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_calendar/dashboard_calendar/4_3.png)

[Tableau Public myprofile](https://public.tableau.com/app/profile/fernando.seguias): to use all of them, please go to my Tableau Public profile 

# Files structure 📦

1. listings: all apartments listed in Madrid (17.831 apartments listed) 👀
2. neighborhoods: spatial data for all neighborhoods and municipalities in Madrid Capital.
3. hosts: list of hosts which have listed apartments in airbnb. There is the category "superhost" given by Aribnb according to their scores and frequency.
4. reviews: all reviews posted per each listing.
5. calendar: all 2022 calendar availability for selected listings (take into account calendar data is 365 times bigger than listings, this is why I selected most relevant hosts) 

To get a better understanding of the data conexions between tables, see SQL Workbench diagram below.

![image]()

# Learnings 📈

- Analyzing historical data we can obtain insights of the market (in real time if desired) and improve our decisions. It's generaly accepted that patters repeat over time

- There are many opportunities in this industry, but as reflected in all charts, there is still a lot of volatility/risk

- As it is a young industry, the growth is supernatural. The less marketcap, the more volatility. It can be taken as an advantage or you get rekt!

- News clearly impact the market

- Don't forget to check out worst reviews captured in data, people get mad. It's hilarious! 🤣

# Tools 🔧

[sys](https://docs.python.org/3/library/sys.html)

[os](https://docs.python.org/3/library/os.html)

[pandas](https://pandas.pydata.org/)

[pycoingeckoAPI](https://www.coingecko.com/en/api/documentation)

[datetime](https://docs.python.org/3/library/datetime.html)

[time](https://docs.python.org/3/library/time.html)

[matplotlib](https://matplotlib.org/)

[pycoingecko](https://www.coingecko.com/en/api/documentation)