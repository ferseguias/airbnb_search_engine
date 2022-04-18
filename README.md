# project_2_airbnb_map_search_engine
![portada](https://viajesparanico.com.ar/wp-content/uploads/2020/05/airbnb00-678x381.jpg)

# Objetive 🎯
Given the recent popularity of turistic apartments in big cities, my intention is to provive a software (app alike) in which users can perform in-map Airbnb data exploration according to their interest.

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

# Dashboards created in Tableau Public 📈
1. Reviews dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_explore_map/dashboard_explore_map/4_3.png)

2. Reviews dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_reviews/dashboard_other_stats/4_3.png)

3. Availability dashboard preview:

![image](https://public.tableau.com/static/images/ai/airbnb_project_2_calendar/dashboard_calendar/4_3.png)

[Tableau Public myprofile](https://public.tableau.com/app/profile/fernando.seguias): to use all of them, please go to my Tableau Public profile (I recommend to use 27" screen to see correct format).

# Files structure 📦
1. listings: all apartments listed in Madrid (17.831 apartments listed) 👀
2. neighborhoods: spatial data for all neighborhoods and municipalities in Madrid Capital.
3. hosts: list of hosts which have listed apartments in airbnb. There is the category "superhost" given by Aribnb according to their scores and frequency.
4. reviews: all reviews posted per each listing.
5. calendar: all 2022 calendar availability for selected listings (take into account calendar data is 365 times bigger than listings, this is why I selected most relevant hosts) 

To get a better understanding of the data relationship between tables, see SQL Workbench diagram below.

![image](https://raw.githubusercontent.com/ferseguias/project_2/main/sql_files/Screenshot%202022-04-18%20at%2016.38.03.png)

# Learnings 💡
- It's great to combine three different tools such as python, SQL and Tableau to create interactive dashboards.

- An amazing business as Airbnb is just an amazing idea, well executed though. However if you just create a data base filled by people who is interested in renting their apartments and then create the interface to interact with people interested in having cheap and better holidays rent, then you have your own Airbnb - I'm not underestimating Airbnb achievements but working on these dashboards I realize the power of these tools in online business.

- Don't forget to check out worst reviews captured in data, people get mad. It's hilarious! 🤣

# Tools 🔧
[sqlalchemy](https://pypi.org/project/SQLAlchemy/)

[getpass](https://docs.python.org/3/library/getpass.html)

[pandas](https://pandas.pydata.org/)

[geopandas](https://geopandas.org/en/stable/)

SQL Workbench (desktop app)

Tableau Public (desktop app)