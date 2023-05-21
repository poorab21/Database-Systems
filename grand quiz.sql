-- a)
-- create table games(ID int(4),name TEXT,genre TEXT,released date,rating_from_10 float(5,2),price float(9,3),publisherID varchar(4),platformID int(4));
-- create table publishers(ID varchar(3),name TEXT,locationID int(4));
-- create table platform(ID int(4),name TEXT,price float(9,3));
-- create table location(ID int(4),city TEXT,country TEXT);
-- alter table games modify ID int(4) primary key;
-- alter table publishers modify ID varchar(3) primary key;
-- alter table platform modify ID int(4) primary key;
-- alter table location modify ID int(4) primary key;
-- describe games;
-- describe publishers;
-- describe platform;
-- describe location;


-- b)
-- alter table platform modify name TEXT not null;
--  alter table publishers modify name TEXT not null;

-- alter table games modify ID int(4) auto_increment;
-- alter table platform modify ID int(4) auto_increment;
-- alter table location modify ID int(4) auto_increment;

-- c)
-- alter table location modify city varchar(20) unique;
-- describe location;

-- d)
-- insert into location(city,country)
-- values("california","USA"),("Maryland","USA"),("Tokyo","Japan"),
-- ("paris","france"),("Montreuil","france"),("osaka","japan");

-- insert into platform(name,price) 
-- values("playstation 2 ",129.99),("Nintendo DS",299.99),("PC",null),
-- ("Xbox One",239.95),("Nintendo 3DS",400);

-- insert into publishers(ID,name,locationID) values("ACT","activision",5),("EAS","Electronic Arts",5),
-- ("BET","bethesda",6),("SQE","square Enix",7),("UBI","ubisoft",9),("CAP","capcom",10);

-- insert into games(name,genre,released,rating,price,publisherID,platformID)
-- values("Phoenix Wright: Ace Attorney","Adventure","2001-10-12","8.1",24.99,"CAP",2),
-- ("Assassin’s Creed","Action-Adventure","2007-11-13","8.1",19.99,"UBI",3),
-- ("Devil May Cry","Action-Adventure","2001-08-03","9.4",14.99,"CAP",1),
-- ("The Evil Within","Survival Horror","2014-10-01","6.8",9.99,"BET",3),
-- ("Fullmetal Alchemist 2","Action-RPG","2004-09-22","6.8",26.99,"SQE",1),
-- ("Watch_Dogs","Action-Adventure","2014-05-27","7.7",29.99,"UBI",3),
-- ("Apollo Justice: Ace Attorney","Adventure","2007-04-12","7.7",19.99,"CAP",2),
-- ("The Legend of Zelda","Action-Adventure","1986-02-21","7.2",55,null,null),
-- ("The Sims","Simulation","2000-02-04","6.9",9.99,null,3),
-- ("Monster Hunter: World","Action-RPG","2018-01-06","9.0",59.99,"CAP",null);

-- e)
-- alter table games add foreign key (publisherID) references publishers(ID);
-- alter table games add foreign key (platformID) references platform(ID) on delete cascade;
-- describe games;

-- f)
-- alter table publishers add foreign key (locationID) references location(ID);
-- describe publishers;

-- Q2
-- a)
-- select name,rating_from_10 from games order by rating_from_10 asc limit 3;

-- b)
-- select * from games where genre like "%Adventure%" and released<"2005-1-1";

-- c)
-- select genre,count(ID) as Total_Games from games group by genre order by Total_Games desc limit 2,1; 

-- d)
-- select name,timestampdiff(year,released,curdate()) as Game_Age from games order by Game_Age asc;

-- e)
-- select g.name,pu.name as publisher,(select name from platform p1 where p1.ID=g.platformID) as platform from games g left join publishers pu on g.publisherID=pu.ID;

-- f)
-- select publisherID,genre,count(ID) from games group by publisherID,genre having length(publisherID)>0;

-- g)
-- create temporary table FullGameInfo as 
-- (select g.ID,g.name,g.genre,pu.name as publisher,(select name from platform p1 where p1.ID=g.platformID) 
-- as platform from games g left join publishers pu on g.publisherID=pu.ID);

-- select * from FullGameInfo;

-- h)
-- delete from FullGameInfo where platform is null;
-- select * from FullGameInfo;

-- i)
-- alter table FullGameInfo drop genre,add ESRB TEXT after name;
-- select * from FullGameInfo;

-- j)
-- drop temporary table FullGameInfo;
-- select * from FullGameInfo;