select*
from ushouseholdincome;

select*
from ushouseholdincome_statistics;

alter table ushouseholdincome_statistics rename column `ï»¿id` to `id`;

select count(id)
from ushouseholdincome;

select count(id)
from ushouseholdincome_statistics;

select id, count(id)
from ushouseholdincome
group by id 
having count(id) > 1;

select*,
row_number() over(
partition by id) as row_num
from ushouseholdincome;

CREATE TABLE `ushouseholdincome2` (
  `row_id` int DEFAULT NULL,
  `id` int DEFAULT NULL,
  `State_Code` int DEFAULT NULL,
  `State_Name` text,
  `State_ab` text,
  `County` text,
  `City` text,
  `Place` text,
  `Type` text,
  `Primary` text,
  `Zip_Code` int DEFAULT NULL,
  `Area_Code` int DEFAULT NULL,
  `ALand` int DEFAULT NULL,
  `AWater` int DEFAULT NULL,
  `Lat` double DEFAULT NULL,
  `Lon` double DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from ushouseholdincome2;

with duplicate_cte as
(
select*,
row_number() over(
partition by id) as row_num
from ushouseholdincome
)
select* from duplicate_cte
where row_num > 1;

insert into ushouseholdincome2
select*,
row_number() over(
partition by id) as row_num
from ushouseholdincome;

select*
from ushouseholdincome2;

select*
from ushouseholdincome2
where row_num > 1;

delete 
from ushouseholdincome2
where row_num > 1;

select*
from ushouseholdincome2
where row_num > 1;

select*
from ushouseholdincome2;

select id, count(id)
from ushouseholdincome_statistics
group by id 
having count(id) > 1;

select state_name, count(state_name)
from ushouseholdincome2
group by state_name;

select distinct state_name
from ushouseholdincome2
order by 1;

update ushouseholdincome2
set state_name = 'Georgia'
where state_name = 'georia';

select state_name
from ushouseholdincome2
group by state_name;

select*
from ushouseholdincome2;

update ushouseholdincome2
set state_name = 'Alabama'
where state_name = 'alabama';

select*
from ushouseholdincome2;

select*
from ushouseholdincome2
where place = '';

select*
from ushouseholdincome2
where County = 'Autauga County';

update ushouseholdincome2
set Place = 'Autaugaville'
where Place = 'Pine Level';

update ushouseholdincome2
set Place = 'Autaugaville'
where Place = '';

select*
from ushouseholdincome2
where place = 'Pine Level';

select*
from ushouseholdincome2;

select type, count(type)
from ushouseholdincome2
group by type
#order by 1
;

update ushouseholdincome2
set type = 'Borough'
where type = 'Boroughs';

select Aland, Awater 
from ushouseholdincome2 
where aland = '0' or awater = '0';

select Aland, Awater 
from ushouseholdincome2 
where aland = '0' and awater = '0';

select Aland, Awater 
from ushouseholdincome2 
where aland = '0' is null or awater = '0' is null;

