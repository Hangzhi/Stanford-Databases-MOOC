-- q1
insert into reviewer values( 209, 'Roger Ebert')

-- q2
update movie
set year = year + 25
where mid in
	( select mid 
	 from rating
	 group by mid having avg(stars)>=4
		)

-- q3
delete from rating
where mid in (select mid from movie where year < 1970 or year > 2000)
	and stars < 4


