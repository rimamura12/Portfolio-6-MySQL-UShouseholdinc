SELECT * 
FROM householdincome.ushouseholdincome_statistics;

CREATE TABLE `ushouseholdincome_statistics` (
  `id` int DEFAULT NULL,
  `State_Name` text,
  `Mean` int DEFAULT NULL,
  `Median` int DEFAULT NULL,
  `Stdev` int DEFAULT NULL,
  `sum_w` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT state_name, aland, awater, county, city
FROM ushouseholdincome2;

select state_name, sum(aland), sum(awater)
from ushouseholdincome2
group by state_name
order by 2 desc
limit 10;

select state_name, sum(aland), sum(awater)
from ushouseholdincome2
group by state_name
order by 2 desc
limit 10;

select*
from ushouseholdincome2 u
join ushouseholdincome_statistics us
	on u.id = us.id;
    
select*
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id;

select*
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean = 0;

CREATE TABLE `ushouseholdincome_statistics2` (
  `id` int DEFAULT NULL,
  `State_Name` text,
  `Mean` int DEFAULT NULL,
  `Median` int DEFAULT NULL,
  `Stdev` int DEFAULT NULL,
  `sum_w` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from ushouseholdincome_statistics2;

insert into ushouseholdincome_statistics2
select*
from ushouseholdincome_statistics;

select*
from ushouseholdincome_statistics2;

select*
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0;

select u.state_name, county, `type`, `primary`, mean, median
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0;

select u.state_name, county, `type`, `primary`, mean, median
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0;

select u.state_name, round(avg(mean),1), round(avg(median),1)
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0
group by u.state_name
order by 2 desc
;

select type, count(type), round(avg(mean),1), round(avg(median),1)
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0
group by type
order by 2 desc
;

select type, count(type), round(avg(mean),1), round(avg(median),1)
from ushouseholdincome2 u
inner join ushouseholdincome_statistics us
	on u.id = us.id
where mean <> 0
group by type
having count(type) > 100
order by 2 desc
;

select u.state_name, city, round(avg(mean),1), round(avg(median),1)
from ushouseholdincome2 u
join ushouseholdincome_statistics us
	on u.id = us.id
group by u.state_name, city
order by round(avg(mean),1) desc
;


