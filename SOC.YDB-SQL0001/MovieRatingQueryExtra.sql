-- q1
select distinct name 
from movie m, reviewer re, rating ra
where re.rid=ra.rid 
	and ra.mid = m.mid
	and m.title = 'Gone with the Wind'

-- q2
select distinct name,title, stars
from movie m, reviewer re, rating ra
where m.director = re.name
	and re.rid = ra.rid
	and m.mid = ra.mid

-- q3
select *
from
(
select title as name from movie
union 
select name from reviewer
)
order by name asc

-- q4
select title
from movie
where mid not in
(
	select mid
	from reviewer re, rating ra
	where re.rid = ra.rid and re.name = 'Chris Jackson'
)

-- q5
select distinct  re1.name, re2.name
from rating ra1, rating ra2, reviewer re1, reviewer re2
where re1.name < re2.name and ra1.mid = ra2.mid and re1.rid = ra1.rid and re2.rid = ra2.rid 
order by re1.name asc

-- q6
select distinct name, title, stars
from movie m, reviewer re, rating ra
where stars = (select min(stars) from rating) and re.rid = ra.rid and m.mid = ra.mid

-- q7
select title, avg(stars) as av
from movie m, rating ra
where m.mid = ra.mid
group by m.title
order by av desc , title asc

-- q8
select re.name
from reviewer re, movie m, rating ra
where m.mid = ra.mid and re.rid = ra.rid
group by ra.rid
having count(*)>=3

-- q9
select title, director
from movie 
where director in (select director
	  	from movie
		group by director
		having count(*) > 1)
order by director, title

-- q10

-- (；′⌒`)

-- q11
select title , avg(stars) theAvg
from Rating ra, movie m
where m.mid = ra.mid
group by m.mID
having avg(stars) = (select avg(stars) as theAvg from rating group by mid order by theAvg asc limit 1 )

-- q12
select distinct director, title, stars
from movie m, rating ra,
(select director as drc, max(stars) as mxr 
 	from rating ra, movie m 
 	where ra.mid = m.mid 
 	group by m.director
)stat
where m.mid = ra.mid
and ra.stars = stat.mxr 
and m.director = stat.drc




