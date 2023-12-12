create database literacy_demographic;

select*from dataset1;
select*from dataset2;

--get number of rows of the dataset 

select COUNT(*) as num_of_rows from dataset1;

select COUNT(*)as  num_of_rows  from dataset2;
 

 -- get the data from jharkhand and bihar

 select *from dataset1
 where State in ('Jharkhand','Bihar');

 --get the population of india

 select*from dataset2;

 select SUM(Population) as total_population from dataset2;

 --get the avg growth of all states with district

 select District,State,
 Avg(Growth) as avg_growth 
 from dataset1
 group by District,State;

 --which district is having the highest Area_km2 .Get the district

 select District ,MAX(Area_km2) as max_area from dataset2
 group by District
 order by max_area desc;


 -- Get the state which is having more than 80% 

 select State from dataset1 where Literacy >80;

 --get the less area_km2 states with district with population 

 select District,State ,Population from dataset2 where Area_km2 <120;
 

 --Get the duplicate values are present in the dataset1

 SELECT District,State,Growth,Sex_Ratio,Literacy, COUNT(*) as count
FROM dataset1
GROUP BY District,State,Growth,Sex_Ratio,Literacy
HAVING COUNT(*) > 1;

select*from dataset2;
 
 --Get the duplicate values are present in the dataset2

 SELECT District,State,Area_km2,Population,COUNT(*) as count
FROM dataset2
GROUP BY District,State,District,State,Area_km2,Population
HAVING COUNT(*) > 1;

--Get the avg literacy rate of the states

select State,round (AVG(Literacy),0) as avg_literacy_rate from dataset1 group by State 
having round (AVG(Literacy),0)>90 order by avg_literacy_rate desc; 


select top 2 State,round (AVG(Literacy),0) as avg_literacy_rate from dataset1 group by State
;


--Get top 1 state which is having good growth and literacy 

select top 1 State,Growth,Literacy
from dataset1
order by Literacy Desc;

 -- Get Avg sex ratio top 5 from dataset1

 select top 5 State,Sex_Ratio,
 round(Avg(Sex_Ratio),0) as Avg_Sex_Ratio
 from dataset1
 group by State,Sex_Ratio;

 --Get the state which is having less population and less Area_km2 with only 3 states

 select 
 top 3
 State,
 MIN(Population) as min_population,
 min(Area_km2) as min_Area_km2
 from dataset2
 group by State ;