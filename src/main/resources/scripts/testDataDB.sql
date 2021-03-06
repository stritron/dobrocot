
delete from color where true;
alter sequence color_id_seq restart ;
INSERT INTO public.color (name)
VALUES
('red'),
('green'),
('blue'),
('black'),
('white'),
('purple');

delete from engine where true;
alter sequence engine_id_seq restart ;
INSERT INTO public.engine (name)
VALUES
('0.8'),
('1.0'),
('1.2'),
('1.5'),
('1.8'),
('2.0'),
('2.5'),
('3.0'),
('7.0');

delete from mark where true;
alter sequence mark_id_seq restart ;
INSERT INTO public.mark (name)
VALUES
('BMV'),
('Mercedes'),
('Audi'),
('Honda'),
('Skoda');

delete from model where true;
alter sequence model_id_seq restart ;
INSERT INTO public.model (id_mark, name)
VALUES
(1,'3-series'),
(1,'5-series'),
(1,'7-series'),
(2,'Benz'),
(2,'AMG'),
(3,'100'),
(3,'200'),
(3,'300'),
(4,'Civic'),
(4,'Accord'),
(4,'Pilot'),
(5,'Octavia'),
(5,'Rapid');

delete from car where true;
alter sequence car_id_seq restart ;
INSERT INTO public.car (owner_id, mark_id, model_id, assembledate, engine_id, numberofseats, color_id, dayprice)
VALUES
(1,1,2,'1999-01-09',2,4,1,100),
(2,1,3,'1998-04-12',3,2,2,100),
(3,1,1,'2000-06-01',4,6,3,100),
(4,2,3,'2012-04-12',6,5,4,100),
(6,2,4,'1993-12-12',1,4,5,100),
(7,3,7,'2008-04-12',2,3,6,100),
(8,4,9,'2017-12-01',3,6,3,100),
(9,4,10,'2005-10-12',4,8,1,100);

delete from person where true;
alter sequence person_id_seq restart ;
INSERT INTO public.person(name)
VALUES ('Valuev'),
       ('Zabidova'),
       ('Kim'),
       ('Kruglov'),
       ('Novikov'),
       ('Lupandin'),
       ('Murtuzaaliev'),
       ('Useinov'),
       ('Tonguzova'),
       ('Lapshin');


delete from _order where true;
alter sequence order_id_seq restart ;
INSERT INTO public._order (date, seller, customer, car, begindate, enddate)
VALUES
('1999-01-09',2,4,1,'1999-01-09','2999-01-09'),
('1998-04-12',3,2,2,'1998-04-12','2998-04-12'),
('2000-06-01',4,6,3,'2000-06-01','3000-06-01'),
('2012-04-12',6,5,4,'2012-04-12','3012-04-12'),
('1993-12-12',1,4,5,'1993-12-12','2993-12-12'),
('2008-04-12',2,3,6,'2008-04-12','3008-04-12'),
('2017-12-01',3,6,3,'2017-12-01','3017-12-01'),
('2005-10-12',4,8,1,'2005-10-12','3005-10-12');

