--**SQL problems – Part1**
----------------------------------------------------------------
--1- Display all data for all the countries.

use World;

select * from [dbo].[Country];

----------------------------------------------------------------
--2- Display all the languages you have. (Remove redundant data)

select distinct [Language] from [dbo].[CountryLanguage];

----------------------------------------------------------------
--3- Display all countries that lie in Africa sorted Area.

select * from [dbo].[Country] where Continent = 'Africa' order by [SurfaceArea];

----------------------------------------------------------------
--4- Display all cities that have population more than 2 million.

select [Name] from [dbo].[City] where [Population] > 2000000;

----------------------------------------------------------------
--5- Display all countries that became independent from 1920 t0 1990

select [Name] from [dbo].[Country] where [IndepYear] between 1920 and 1990;

----------------------------------------------------------------
--6- Display all countries that have no independence year.

select [Name] from [dbo].[Country] where [IndepYear] is NULL;

----------------------------------------------------------------
--7- Display all countries that have any kind of ‘Republic’ government form.

select [Name] from [dbo].[Country] where [GovernmentForm] = 'Republic';

----------------------------------------------------------------
--8- Display all countries that lie in Asia and have population more than 100 million.

select [Name] from [dbo].[Country] where [Continent] = 'Asia' and [Population] > 100000000;

----------------------------------------------------------------
--9- Display country code for all those speak Spanish as an official language.

select [CountryCode] from [dbo].[CountryLanguage] where [Language] = 'Spanish' and [IsOfficial] = 1;

----------------------------------------------------------------
--10- Display country code for all those speak more than 2 languages.

select distinct [CountryCode] from [dbo].[CountryLanguage] 
group by [CountryCode] having count( distinct [Language])>2;
--having count([CountryCode])>2;

----------------------------------------------------------------
--11- Display the number of people on earth.

select sum(cast([Population] as bigint)) from [dbo].[Country];

----------------------------------------------------------------
--12- Display all Continents along with the number of countries 
--    and total population in each continent.

select distinct [Continent],
(select count([Code]) from [dbo].[Country] c1
 where c1.[Continent] = c.[Continent] group by [Continent]) as 'number of countries',
(select sum(cast([Population] as bigint)) from [dbo].[Country] c2
 where c2.[Continent] = c.[Continent] group by [Continent])as 'total population'
from [dbo].[Country] c; 

--or

select [Continent],
       count([Code]) as 'number of countries',
	   sum(cast([Population] as bigint)) as 'total population'
from [dbo].[Country]
group by [Continent];

----------------------------------------------------------------
--13- You have just discovered a new country, Add it to your database. 
--    (Of course, your country have some cities and languages)

insert into [dbo].[Country] 
values ('www', 'Egypta', 'Africa', 'Northern Africa', 6520900, 1934, 2720000, 45.9, 
         5975, 7984, 'Egypta', 'Republic', 'Mohammad Omar',	56,	'AA');

insert into [dbo].[CountryLanguage]
values ('www', 'Arabic', 1, 81.2);

insert into [dbo].[City]
values (99999, 'Domyaat','www','Zuid-Hollan',440900);

----------------------------------------------------------------
--14- In your country, increase life expectation by 5 years.

update [dbo].[Country]
set [LifeExpectancy] = [LifeExpectancy] + 5
where [Name] = 'Egypt';

----------------------------------------------------------------
--15- Try to delete your country, what happens?

delete from [dbo].[Country]
where [Name] = 'Egypt';

-- >> it give me an error >> because their are independent tables depend on the Country table.

