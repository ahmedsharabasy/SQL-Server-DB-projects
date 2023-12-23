--**SQL problems – Part2**
----------------------------------------------------------------
--1- Display all cities that belong to Egypt.

select distinct [Name] from [dbo].[City] where [CountryCode] in (
    select [Code] from [dbo].[Country] where [Name] = 'Egypt');

----------------------------------------------------------------
--2- Display all countries that have cities with population more than 5 million.

select [Name] from [dbo].[Country] where [Code] in (
select [CountryCode] from [dbo].[City] where [Population]> 5000000);

----------------------------------------------------------------
--3- Display all countries that speak “Dutch” as a secondary language.

select [Name] from [dbo].[Country] where [Code] in (
select [CountryCode] from [dbo].[CountryLanguage] where [Language] ='Dutch' and [IsOfficial]=0);

----------------------------------------------------------------
--4- Display all countries names along with their official language.

select distinct c.[Name] , l.[Language] 
from [dbo].[Country] c
join [dbo].[CountryLanguage] l
on c.Code = l.CountryCode
where l.IsOfficial =1;

----------------------------------------------------------------
--5- Display all cities that have the same district name.

select [District], [Name]
from [dbo].[City]
group by [District], [Name]
having count([District]) > 1;

----------------------------------------------------------------
--6- Display African countries names along with number of cities in each country.

select c.[Name],
(select count(*) from [dbo].[City] ct where ct.CountryCode = c.Code group by [CountryCode]) as 'number of cities'
from [dbo].[Country] c
where c.Continent = 'Africa'

----------------------------------------------------------------
--7- Display countries names with number of non-official languages.

select c.[Name] , 
(select count(*) from [dbo].[CountryLanguage] l 
 where l.CountryCode = c.Code and l.IsOfficial =0
 group by [CountryCode] ) as 'number of non-official languages'
from [dbo].[Country] c;

----------------------------------------------------------------
--8- Display countries names who has more than one official language.

select [Name]  
from [dbo].[Country] 
where [Code] in (
select [CountryCode] from [dbo].[CountryLanguage] 
where [IsOfficial] =1
group by [CountryCode]
having count(*)>1);

----------------------------------------------------------------
--9- Display the most country whose inhabitants are expected to die early.

select top 1 [Name] from [dbo].[Country]
order by [LifeExpectancy] asc;

----------------------------------------------------------------
--10-Display countries names with number of cities only if its cities population exceed 100 million.

select c.[Name], count(*) as 'NumberOfCities'
from [dbo].[Country] c
join [dbo].[City] ci on c.[Code] = ci.[CountryCode]
where ci.[Population] > 100000000
group by c.[Name]
having count(*) > 0;

----------------------------------------------------------------
--11- Display country with the highest city population.

select [Name]
from [dbo].[Country]
where code in (
select top 1 [CountryCode] from [dbo].[City] order by [Population] desc);

----------------------------------------------------------------
--12- Create new table “WaterResource” containing water resources for different countries. The table must have the following fields:
--    •	ID
--    •	CountryCode.
--    •	Type (e.g.: River, Sea, Ocean, Channel….etc.)
--    •	Name. 

create table WaterResource(
id int primary key,
CountryCode varchar(10),
[type] varchar(50),
[name] varchar(50)
);

----------------------------------------------------------------
--13- Insert data in the created table for Egypt.

insert into WaterResource
values (1, 'EGY', 'river', 'nile');