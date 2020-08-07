-- q1
delete from highschooler
where grade = 12

-- q2
delete from likes
where id1 in
	(
		select lk1.id1
		from friend fd, likes lk1
		where fd.id1 = lk1.id1 and fd.id2 = lk1.id2 
			and not exists(
				select *
				from likes lk2
				where lk1.id1=lk2.id2 
				and lk1.id2 = lk2.id1
			)
	)

-- q3
insert into Friend
select distinct F1.ID1, F2.ID2
from Friend F1, Friend F2
where F1.ID2 = F2.ID1 and F1.ID1<>F2.ID2 
      and F1.ID1 not in (select F3.ID1 from Friend F3 where F3.ID2=F2.ID2);
 -- ref: https://stackoverflow.com/questions/14805617/sql-social-network-modification-exercises-stanford-db-open-class

