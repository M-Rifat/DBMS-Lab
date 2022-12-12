
select * from titles
select * from publishers
select * from authors
select * from titleauthor

--1
select au_lname,title_id from authors join titleauthor on authors.au_id=titleauthor.au_id
--2
select au_lname,pub_name from authors,publishers 
--3
select * from titles where royalty=(select avg(royalty) from titles)

--Task1.1
select title,au_lname from authors  inner join  titleauthor on authors.au_id=titleauthor.au_id inner join titles on titleauthor.title_id=titles.title_id
--Task1.2
select title,au_lname,pub_name from authors  inner join  titleauthor on authors.au_id=titleauthor.au_id inner join titles on titleauthor.title_id=titles.title_id inner join publishers on titles.pub_id=publishers.pub_id
--Task2
select au_lname,authors.city,pub_name from authors,publishers where authors.city=publishers.city
--Task3
select au_lname from authors join  titleauthor on authors.au_id=titleauthor.au_id join titles on titleauthor.title_id=titles.title_id where royalty = (select max(royalty) from titles)