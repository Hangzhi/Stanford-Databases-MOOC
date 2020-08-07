-- q1
select lk1.id1, hs1.name, hs1.grade, lk1.id2, hs2.name, hs2.grade
	from likes lk1, likes lk2, highschooler hs1, highschooler hs2
	where  lk1.id1=lk2.id2 and lk1.id2 = lk2.id1 
		and hs1.id = lk1.id1
		and hs2.id = lk1.id2


-- q2
select hs1.name, hs1.grade, hs2.name, hs2.grade
from Highschooler hs1, likes lk, Highschooler hs2
where hs1.id = lk.id1
	and hs2.id = lk.id2
	and hs1.grade - hs2.grade >=2

-- q3
select hs1.name,hs1.grade, hs2.name, hs2.grade
from Highschooler hs1, likes lk, Highschooler hs2
where hs1.id = lk.id1
	and hs2.id = lk.id2
	and hs1.name < hs2.name
	and exists (select *
			  from likes lk1
			  where lk.id1 = lk1.id2
			  	and lk.id2 = lk1.id1)

-- q4
select hs.name, hs.grade
from highschooler hs
where id not in
	(select id1 from likes union all select id2 from likes)

-- q5
select hs1.name, hs1.grade, hs2.name, hs2.grade
from highschooler hs1, likes lk, highschooler hs2
where hs1.id = lk.id1
	and hs2.id = lk.id2
	and lk.id2 not in (select id1 from likes)

-- q6
select distinct  hs.name, hs.grade
from highschooler hs
where hs.id not in
(select distinct hs1.id
		from highschooler hs2, friend lk , highschooler hs1
		where hs1.id = lk.id1
		and hs2.id = lk.id2
		and hs1.grade <> hs2.grade)
order by hs.grade, hs.name

-- q7
select hsa.name, hsa.grade, hsb.name, hsb.grade, hsc.name, hsc.grade
from  friend fda, friend fdb, likes lkab, highschooler hsa, highschooler hsb, highschooler hsc
where 
	lkab.id2 not in (select id2 from friend where id1 = lkab.id1)
	and lkab.id1 = fda.id1 and lkab.id2 = fdb.id1
	and fda.id2 = fdb.id2
	and hsa.id = fda.id1 and hsb.id = fdb.id1 and hsc.id = fda.id2

-- q8
select (select count(id) from highschooler) - (select count(hs.name) from (select distinct name from highschooler) hs)

-- q9
select distinct hs.name, hs.grade
from highschooler hs, likes lk
where lk.id2 = hs.id 
group by lk.id2 
having count(*)>1


