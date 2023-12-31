use PracTest3


-- create tables
CREATE TABLE staff (
	staff_id int IDENTITY(1,1) PRIMARY KEY,
	fName varchar(30) NOT NULL,
	lName varchar(60) NOT NULL,
	role varchar(60)
)
CREATE TABLE client (
	client_id int IDENTITY(1,1) PRIMARY KEY, 
	fName varchar(30) NOT NULL,
	lName varchar(60) NOT NULL,
	phone varchar(14) NOT NULL,
	email varchar(60),
	CHECK (email LIKE '%@%.%' OR email LIKE ''),
	street varchar(60),
	suburb varchar(60),
	town varchar(60)
)
CREATE TABLE animal (
	animal_id int IDENTITY(1,1) PRIMARY KEY,
	name varchar(30) NOT NULL,
	sex varchar(6), -- male female
	dob date NOT NULL,
	breed varchar(60),
	category varchar(60) NOT NULL,
	owner_id int NOT NULL,
	FOREIGN KEY (owner_id) REFERENCES client,
	check (sex = 'female' or sex = 'male')
)
CREATE TABLE invoice (
	invoice_id int IDENTITY(1,1) PRIMARY KEY,
	amount int,
	invoiceDate date,
	paidDate date
)
CREATE TABLE appointment (
	appointment_id int IDENTITY(1,1) PRIMARY KEY,
	illness varchar(1000),
	confirmed bit default 0 NOT NULL, --0 or 1, resolves to true or false
	animalWeight int,
	animal_id int NOT NULL,
	invoice_id int NOT NULL,
	FOREIGN KEY (animal_id) REFERENCES animal,
	FOREIGN KEY (invoice_id) REFERENCES invoice
)
CREATE TABLE scheduleSlot (
	slot_id int IDENTITY(1,1) PRIMARY KEY,
	room char(1) NOT NULL,
	dayDate date NOT NULL,
	startTime time(0) NOT NULL,
	endTime time(0) NOT NULL,
	appointment_id int,
	staff_id int,
	FOREIGN KEY (appointment_id) REFERENCES appointment,
	FOREIGN KEY (staff_id) REFERENCES staff
)

GO

--Populate tables 
GO
INSERT INTO staff VALUES ('Mark','Apperley','Equine Specialist')
INSERT INTO staff VALUES ('David','Bainbridge','Receptionist')
INSERT INTO staff VALUES ('Judy','Bowen','Feline Specialist')
INSERT INTO staff VALUES ('Sally Jo','Cunningham','Serpentine Specialist')
INSERT INTO staff VALUES ('Tim','Elphick','Veterinary Surgeon')
INSERT INTO staff VALUES ('Eibe','Frank','Canine Specialist')
INSERT INTO staff VALUES ('Tomás','García Ferrari','Avian Specialist')
INSERT INTO staff VALUES ('Annika','Hinze','Tea Attendant')
INSERT INTO staff VALUES ('Nilesh','Kanji','Veterinary Surgeon')
INSERT INTO staff VALUES ('Te Taka','Keegan','Tea Attendant')
INSERT INTO staff VALUES ('Ryan','Ko','Serpentine Specialist')
INSERT INTO staff VALUES ('Vimal','Kumar','Porcine Specialist')
INSERT INTO staff VALUES ('Justin','Kurland','Feline Specialist')
INSERT INTO staff VALUES ('Simon','Laing','Anthropod Specialist')
INSERT INTO staff VALUES ('Matthew','Luckie','Equine Specialist')
INSERT INTO staff VALUES ('Robi','Malik','Porcine Specialist')
INSERT INTO staff VALUES ('Michael','Mayo','Piscine Specialist')
INSERT INTO staff VALUES ('Richard','Nelson','Porcine Specialist')
INSERT INTO staff VALUES ('David','Nichols','Canine Specialist')
INSERT INTO staff VALUES ('Bernhard','Pfahringer','Bovine Specialist')
INSERT INTO staff VALUES ('Bronwyn','Poki','Veterinary Surgeon')
INSERT INTO staff VALUES ('Steve','Reeves','Avian Specialist')
INSERT INTO staff VALUES ('Tania','Robinson','Chief Executive')
INSERT INTO staff VALUES ('Bill','Rogers','Bovine Specialist')
INSERT INTO staff VALUES ('Tony','Smith','Avian Specialist')
INSERT INTO staff VALUES ('Keith','Soo','Equine Specialist')
INSERT INTO staff VALUES ('Claire','Timpany','Bovine Specialist')
INSERT INTO staff VALUES ('Phil','Treweek','Veterinary Surgeon')
INSERT INTO staff VALUES ('Emmanuel','Turner','Canine Specialist')
INSERT INTO staff VALUES ('Nic','Vanderschantz','Piscine Specialist')
INSERT INTO staff VALUES ('Bronwyn','Webster','Board Chairperson')
INSERT INTO staff VALUES ('Ian','Witten','Feline Specialist')
INSERT INTO staff VALUES ('Shaoqun','Wu','Anthropod Specialist')
INSERT INTO client VALUES ('Charles ','Babbage','243-9867','Cabbage@gmail.com','8583 Bayberry Court ','Silverdale','Hamilton')
INSERT INTO client VALUES ('Tim','Berners-Lee','687-4485','www@gmail.com','8 Trout St. ','Melville','Hamilton')
INSERT INTO client VALUES ('George ','Boole','305-9019','TrueFalse@gmail.com','6 Oak Meadow Street ','Leamington','Cambridge')
INSERT INTO client VALUES ('Kathleen ','Booth','553-5269','Boothy@gmail.com','267 South Fairfield Street ','Hillcrest','Hamilton')
INSERT INTO client VALUES ('Vannevar ','Bush','909-2253','van@gmail.com','9822 Mammoth Street ','Leamington','Cambridge')
INSERT INTO client VALUES ('Vint ','Cerf','216-9215','cert@gmail.com','784 Mill Pond Lane ','Rototuna','Hamilton')
INSERT INTO client VALUES ('Noam ','Chomsky','769-2386','sky@gmail.com','88 South Sutor St. ','Rotokauri','Hamilton')
INSERT INTO client VALUES ('Edsger ','Dijkstra','697-2124','telescopes@gmail.com','43 Pennington Ave. ','Silverdale','Hamilton')
INSERT INTO client VALUES ('Grace ','Hopper','405-4124','stars@gmail.com','7679 Arch Court ','Pirongia','Te Awamutu')
INSERT INTO client VALUES ('Kenneth','Iverson','316-9038','kennyG@gmail.com','624 N. Hamilton Ave. ','Kihikihi','Te Awamutu')
INSERT INTO client VALUES ('Ada ','Lovelace','552-4701','ada@gmail.com','9 Wellington Drive ','Pirongia','Te Awamutu')
INSERT INTO client VALUES ('Yoshiro ','Nakamatsu','978-7838','yo@gmail.com','154 William Drive ','Rotokauri','Hamilton')
INSERT INTO client VALUES ('John ','Neumann','937-4321','cpu@gmail.com','164 West Morris St. ','Leamington','Cambridge')
INSERT INTO client VALUES ('Blaise ','Pascal','274-1777','pascal@gmail.com','626 Westminster Ave. ','Glenview','Hamilton')
INSERT INTO client VALUES ('Richard ','Stallman','678-0774','stally@gmail.com','7997 Hillcrest St. ','Ōhaupō','Te Awamutu')
INSERT INTO client VALUES ('Alan ','Turing','454-6431','enigma@gmail.com','9544 6th St. ','Ruakura','Hamilton')
INSERT INTO client VALUES ('Linus ','Torvalds','212-9632','linux@gmail.com','93 Hall Drive ','Ocean Beach','Raglan')
INSERT INTO client VALUES ('Konrad ','Zuse','319-1541','konny@gmail.com','211 Valley Farms Street ','Glenview','Hamilton')
INSERT INTO client VALUES ('Ken ','Thompson','505-4125','KT@gmail.com','84 Shady St. ','Ruakura','Hamilton')
INSERT INTO client VALUES ('Herbert ','Simon','948-5415','herb@gmail.com','15 Manor Drive ','Silverdale','Hamilton')
INSERT INTO client VALUES ('Akira ','Nakashima','811-1475','Naka1@gmail.com','8255 Pennington Drive ','Hillcrest','Hamilton')
INSERT INTO client VALUES ('Satoshi ','Nakamoto','572-6770','Naka2@gmail.com','21 Holly Dr. ','Studholme','Morrinsville')
INSERT INTO client VALUES ('Al','Jazari','276-1431','CallMeAl@gmail.com','164 Lakewood Lane ','Silverdale','Hamilton')
INSERT INTO client VALUES ('Kenneth ','Iverson','291-9755','KennyG2@gmail.com','7905 Cobblestone Road ','Glenview','Hamilton')
INSERT INTO client VALUES ('Herman ','Hollerith','869-8131','Heme@gmail.com','728 Wakehurst St. ','Kihikihi','Te Awamutu')
INSERT INTO client VALUES ('Betty ','Holberton','946-3790','BettyBoo@gmail.com','236 West Leatherwood St. ','Studholme','Morrinsville')
INSERT INTO client VALUES ('Howard ','Aiken','739-1616','How@gmail.com','8133 Clinton Drive ','Hautapu','Cambridge')
INSERT INTO client VALUES ('Larry ','Page','589-2571','Google1@gmail.com','9280 Pin Oak Rd. ','Hillcrest','Hamilton')
INSERT INTO client VALUES ('Sergey ','Brin','894-3847','Google2@gmail.com','27 South Cross St. ','Melville','Hamilton')
INSERT INTO client VALUES ('Steve ','Wozniak','574-6889','Wozzie@gmail.com','883 SW. Highland St. ','Hautapu','Cambridge')
INSERT INTO client VALUES ('Donald ','Knuth','255-1038','Donna@gmail.com','7928 Theatre Drive ','Hillcrest','Hamilton')
INSERT INTO client VALUES ('James ','Gosling','979-8347','Hemi@gmail.com','192 Yukon Drive ','Rototuna','Hamilton')
INSERT INTO client VALUES ('Larry ','Wall','400-9264','Walls@gmail.com','953 Tallwood Ave. ','Hautapu','Cambridge')
INSERT INTO client VALUES ('Claude ','Shannon','123-5432','uncle@gmail.com','8778 Nut Swamp Street ','Coronation','Morrinsville')
INSERT INTO animal VALUES ('Blaze','male','2010-09-01','Appaloosa','Horse','23')
INSERT INTO animal VALUES ('Mocha','female','2010-01-20','Oxford','Sheep','3')
INSERT INTO animal VALUES ('Blossom','female','2001-04-02','Brown','Snake','6')
INSERT INTO animal VALUES ('Kevin Bacon','female','2015-01-17','Hampshire','Pig','8')
INSERT INTO animal VALUES ('Baaartok','female','2013-02-23','Merino','Sheep','16')
INSERT INTO animal VALUES ('Amber','female','2014-10-02','Lincoln','Sheep','3')
INSERT INTO animal VALUES ('Bella','female','2006-11-17','Angus','Cow','16')
INSERT INTO animal VALUES ('Cocoa','female','2023-02-28','Jersey','Cow','15')
INSERT INTO animal VALUES ('Gertie','female','2015-10-24','Hereford','Cow','2')
INSERT INTO animal VALUES ('Kaka','female','2023-05-14','Kereru','Bird','7')
INSERT INTO animal VALUES ('Princess','female','2007-05-11','Jersey','Cow','25')
INSERT INTO animal VALUES ('Humphry','female','2004-06-05','Jersey','Cow','24')
INSERT INTO animal VALUES ('Curly','female','2007-08-06','Leicester','Sheep','22')
INSERT INTO animal VALUES ('Miss Piggy','female','2015-09-21','Hampshire','Pig','8')
INSERT INTO animal VALUES ('Fluffy','female','2008-05-23','Leicester','Sheep','22')
INSERT INTO animal VALUES ('Buddy','female','2000-09-18','Boxer','Dog','4')
INSERT INTO animal VALUES ('Green','male','2008-11-06','Cricket','Insect','9')
INSERT INTO animal VALUES ('Sugar','female','2004-09-29','Jersey','Cow','25')
INSERT INTO animal VALUES ('Coco','male','2001-11-28','American Shorthair','Cat','6')
INSERT INTO animal VALUES ('Whero','female','2013-12-30','Tui','Bird','7')
INSERT INTO animal VALUES ('Bella','female','2006-06-22','Labrador Retriever','Dog','14')
INSERT INTO animal VALUES ('Sam','female','2014-07-07','Persian','Cat','18')
INSERT INTO animal VALUES ('Fishy','female','2005-11-21','Catfish','Fish','12')
INSERT INTO animal VALUES ('Smokey','female','2005-01-28','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Ineda Bunn','female','2009-10-16','Jersey','Cow','27')
INSERT INTO animal VALUES ('Daisy','male','2006-11-23','Labrador Retriever','Dog','20')
INSERT INTO animal VALUES ('Charlie','female','2015-05-21','Morgan','Horse','5')
INSERT INTO animal VALUES ('Sunny','female','2017-05-01','Hereford','Cow','2')
INSERT INTO animal VALUES ('Cowlick','female','2008-11-03','Jersey','Cow','27')
INSERT INTO animal VALUES ('Baaartholemew','female','2013-01-10','Merino','Sheep','16')
INSERT INTO animal VALUES ('BigFish','female','2001-05-26','Guppy','Fish','30')
INSERT INTO animal VALUES ('Duke','male','2005-01-11','Dachshund','Dog','19')
INSERT INTO animal VALUES ('Simba','female','2015-09-09','Bengal','Cat','10')
INSERT INTO animal VALUES ('Buddy','female','2005-06-24','Arabian','Horse','12')
INSERT INTO animal VALUES ('Hamburger','female','2012-08-11','Friesian','Cow','29')
INSERT INTO animal VALUES ('Buttercup','female','2001-11-17','Brown','Snake','33')
INSERT INTO animal VALUES ('Baaalthazar','female','2014-03-14','Merino','Sheep','29')
INSERT INTO animal VALUES ('Cream','female','2023-06-18','Merino','Sheep','28')
INSERT INTO animal VALUES ('Snow White','female','2015-05-07','Merino','Sheep','28')
INSERT INTO animal VALUES ('Fuzzy','female','2008-09-10','Leicester','Sheep','22')
INSERT INTO animal VALUES ('Sacha','female','2017-09-26','Himalayan','Cat','17')
INSERT INTO animal VALUES ('Cookie','female','2016-03-26','Hereford','Cow','2')
INSERT INTO animal VALUES ('Shadow','female','2007-04-02','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Baaa-rbra Anne','female','2009-12-24','Merino','Sheep','6')
INSERT INTO animal VALUES ('Sunshine','female','2017-07-29','Hereford','Cow','2')
INSERT INTO animal VALUES ('Lola','male','2009-05-05','Chihuahua','Dog','13')
INSERT INTO animal VALUES ('Molly','female','2023-08-25','American Shorthair','Cat','24')
INSERT INTO animal VALUES ('Hamlet','female','2012-10-10','Hampshire','Pig','8')
INSERT INTO animal VALUES ('Cinnamon','female','2014-11-27','Lincoln','Sheep','3')
INSERT INTO animal VALUES ('Bubbles','female','2001-08-20','Angelfish','Fish','30')
INSERT INTO animal VALUES ('Brownie','female','2014-03-08','Lincoln','Sheep','3')
INSERT INTO animal VALUES ('Snowball','female','2002-06-08','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Kura','female','2011-09-03','Falcon','Bird','34')
INSERT INTO animal VALUES ('Oliver','female','2002-05-25','Dachshund','Dog','19')
INSERT INTO animal VALUES ('Jack','female','2005-07-09','Thoroughbred','Horse','12')
INSERT INTO animal VALUES ('Atlantis','female','2023-07-14','Guppy','Fish','12')
INSERT INTO animal VALUES ('Brown Cow','female','2004-05-01','Jersey','Cow','24')
INSERT INTO animal VALUES ('Boss Hogg','female','2010-09-16','Yorkshire','Pig','8')
INSERT INTO animal VALUES ('Piglet','female','2001-02-16','Spotted','Pig','6')
INSERT INTO animal VALUES ('Piggly Wiggly','male','2023-01-19','Spotted','Pig','32')
INSERT INTO animal VALUES ('Moscow','female','2000-08-08','Jersey','Cow','6')
INSERT INTO animal VALUES ('Hogwarts','male','2013-12-09','Hampshire','Pig','8')
INSERT INTO animal VALUES ('Tiger','male','2014-06-02','Persian','Cat','18')
INSERT INTO animal VALUES ('Annabelle','female','2015-01-28','Hereford','Cow','2')
INSERT INTO animal VALUES ('Baaarack','female','2014-04-30','Merino','Sheep','29')
INSERT INTO animal VALUES ('Elvis Pigsley','female','2012-10-02','Hampshire','Pig','8')
INSERT INTO animal VALUES ('Chris P Bacon','female','2011-12-07','Yorkshire','Pig','8')
INSERT INTO animal VALUES ('Fluffers','female','2008-10-01','Leicester','Sheep','22')
INSERT INTO animal VALUES ('Kahu','male','2011-07-18','Falcon','Bird','6')
INSERT INTO animal VALUES ('Tim','female','2004-08-26','Kiwi','Bird','11')
INSERT INTO animal VALUES ('Calypso','male','2003-10-08','Angelfish','Fish','31')
INSERT INTO animal VALUES ('Charlie','female','2017-09-02','Beagle','Dog','4')
INSERT INTO animal VALUES ('Finley','female','2004-07-02','Angelfish','Fish','31')
INSERT INTO animal VALUES ('oneybun','female','2008-11-28','Charolais','Cow','15')
INSERT INTO animal VALUES ('Cocoa','female','2011-11-02','Lincoln','Sheep','3')
INSERT INTO animal VALUES ('Milo','female','2002-01-05','Arabian','Horse','6')
INSERT INTO animal VALUES ('Teddy','female','2009-10-26','Appaloosa','Horse','5')
INSERT INTO animal VALUES ('Haurangi','male','2017-12-11','Tui','Bird','7')
INSERT INTO animal VALUES ('Cody','female','2015-01-12','Appaloosa','Horse','23')
INSERT INTO animal VALUES ('John','female','2011-07-07','Grasshopper','Insect','6')
INSERT INTO animal VALUES ('Henrietta','female','2012-10-06','Hereford','Cow','2')
INSERT INTO animal VALUES ('Fred','female','2005-06-21','Kiwi','Bird','17')
INSERT INTO animal VALUES ('Big Mac','female','2011-02-01','Friesian','Cow','24')
INSERT INTO animal VALUES ('Snowflake','female','2017-04-29','Merino','Sheep','28')
INSERT INTO animal VALUES ('Bear','female','2003-10-22','Dachshund','Dog','19')
INSERT INTO animal VALUES ('Daisy','female','2016-10-20','Merino','Sheep','28')
INSERT INTO animal VALUES ('MilkyWay','female','2003-06-10','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Piggie Smalls','female','2017-09-18','Spotted','Pig','32')
INSERT INTO animal VALUES ('Caramel','female','2016-05-11','Beagle','Dog','16')
INSERT INTO animal VALUES ('Monty the Python','male','2003-09-22','Black Mamba','Snake','9')
INSERT INTO animal VALUES ('Madonna','female','2011-04-11','Friesian','Cow','24')
INSERT INTO animal VALUES ('Emma','female','2005-11-22','Angus','Cow','1')
INSERT INTO animal VALUES ('Molly','female','2007-10-03','Angus','Cow','27')
INSERT INTO animal VALUES ('Bertha','female','2012-03-27','Friesian','Cow','27')
INSERT INTO animal VALUES ('Chance','female','2007-07-10','Thoroughbred','Horse','28')
INSERT INTO animal VALUES ('Serpico','female','2006-11-16','Python','Snake','9')
INSERT INTO animal VALUES ('Jiminey','female','2007-07-07','Cricket','Insect','9')
INSERT INTO animal VALUES ('Sweetie','female','2009-07-16','Charolais','Cow','15')
INSERT INTO animal VALUES ('Chloe','female','2016-08-18','Bengal','Cat','10')
INSERT INTO animal VALUES ('Chewbacon','male','2011-04-19','Yorkshire','Pig','8')
INSERT INTO animal VALUES ('Oinkers','female','2016-03-09','Spotted','Pig','10')
INSERT INTO animal VALUES ('MooMoo','female','2008-05-24','Jersey','Cow','25')
INSERT INTO animal VALUES ('Stormy','female','2005-05-02','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Rumplesnakeskin','male','2006-04-19','Python','Snake','9')
INSERT INTO animal VALUES ('Toffee','female','2016-05-28','Beagle','Dog','19')
INSERT INTO animal VALUES ('Bessie','female','2001-12-25','Angus','Cow','15')
INSERT INTO animal VALUES ('George','female','2002-04-01','Kereru','Bird','7')
INSERT INTO animal VALUES ('Coco','male','2016-02-18','Bengal','Cat','10')
INSERT INTO animal VALUES ('Baby','female','2010-04-13','Friesian','Cow','24')
INSERT INTO animal VALUES ('Shrimp','female','2004-04-20','Jersey','Cow','24')
INSERT INTO animal VALUES ('Atlantic','male','2023-03-10','Morgan','Horse','18')
INSERT INTO animal VALUES ('Fin','female','2004-04-08','Angelfish','Fish','31')
INSERT INTO animal VALUES ('Fish','female','2005-03-26','Catfish','Fish','30')
INSERT INTO animal VALUES ('Bob','female','2009-02-28','Kihikihi','Insect','9')
INSERT INTO animal VALUES ('Max','female','2017-06-13','Beagle','Dog','19')
INSERT INTO animal VALUES ('Jack','female','2017-03-02','Morgan','Horse','5')
INSERT INTO animal VALUES ('Peppa Pig','female','2016-12-31','Spotted','Pig','10')
INSERT INTO animal VALUES ('Lucy','female','2006-08-19','Labrador Retriever','Dog','20')
INSERT INTO animal VALUES ('Cuddles','male','2002-10-11','Rattle','Snake','34')
INSERT INTO animal VALUES ('Jack','female','2001-05-25','Boxer','Dog','4')
INSERT INTO animal VALUES ('Rocky','female','2006-05-17','Thoroughbred','Horse','29')
INSERT INTO animal VALUES ('Babe','male','2009-05-09','Yorkshire','Pig','8')
INSERT INTO animal VALUES ('Penelope','female','2006-10-03','Angus','Cow','1')
INSERT INTO animal VALUES ('frenchie','female','2005-11-11','Catfish','Fish','32')
INSERT INTO animal VALUES ('Max','female','2000-12-01','American Shorthair','Cat','24')
INSERT INTO animal VALUES ('Misty','female','2014-10-24','Persian','Cat','18')
INSERT INTO animal VALUES ('Bait','female','2023-12-07','Guppy','Fish','12')
INSERT INTO animal VALUES ('Fluffy','female','2003-04-09','Rattle','Snake','34')
INSERT INTO animal VALUES ('Bubbly','female','2003-04-17','Angelfish','Fish','30')
INSERT INTO animal VALUES ('Baaarnabas','female','2010-06-02','Merino','Sheep','16')
INSERT INTO animal VALUES ('Tigger','female','2004-09-16','Arabian','Horse','5')
INSERT INTO animal VALUES ('Max','male','2006-05-04','Thoroughbred','Horse','29')
INSERT INTO animal VALUES ('Harry','female','2011-01-22','Kihikihi','Insect','33')
INSERT INTO animal VALUES ('Coffee','female','2011-02-28','Oxford','Sheep','3')
INSERT INTO animal VALUES ('Bier','female','2013-07-27','Tui','Bird','7')
INSERT INTO animal VALUES ('Midnight','female','2004-03-06','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Cupcake','female','2010-04-10','Friesian','Cow','24')
INSERT INTO animal VALUES ('Smiles','male','2007-04-24','Cricket','Insect','9')
INSERT INTO animal VALUES ('Cloud','female','2017-09-23','Merino','Sheep','28')
INSERT INTO animal VALUES ('Lucy','female','2017-08-04','Bengal','Cat','10')
INSERT INTO animal VALUES ('Joking','male','2013-09-04','Tui','Bird','7')
INSERT INTO animal VALUES ('Cooper','male','2017-12-06','Boxer','Dog','4')
INSERT INTO animal VALUES ('Barbie Q Sandwich','female','2010-04-09','Yorkshire','Pig','8')
INSERT INTO animal VALUES ('Beau','female','2006-07-11','Thoroughbred','Horse','28')
INSERT INTO animal VALUES ('Licorice','female','2005-07-12','Corriedale','Sheep','21')
INSERT INTO animal VALUES ('Cuddles','female','2008-01-04','Leicester','Sheep','2')
INSERT INTO animal VALUES ('Mud Pie','female','2001-12-06','Jersey','Cow','24')
INSERT INTO animal VALUES ('James','female','2011-05-20','Grasshopper','Insect','33')
INSERT INTO animal VALUES ('Angel','male','2002-11-14','Arabian','Horse','5')
INSERT INTO animal VALUES ('Missy','female','2005-05-19','Arabian','Horse','11')
INSERT INTO animal VALUES ('Henry','male','2001-05-08','Kereru','Bird','7')
INSERT INTO animal VALUES ('Snowy','female','2014-05-03','Merino','Sheep','28')
INSERT INTO animal VALUES ('Beau','female','2013-02-21','Appaloosa','Horse','23')
INSERT INTO animal VALUES ('Booboo','female','2007-03-19','Jersey','Cow','25')
INSERT INTO animal VALUES ('Latte','female','2008-11-10','Leicester','Sheep','22')
INSERT INTO animal VALUES ('Luna','female','2009-04-17','Chihuahua','Dog','20')
INSERT INTO animal VALUES ('Bella','female','2006-09-28','Thoroughbred','Horse','28')
INSERT INTO animal VALUES ('Waffles','female','2012-05-28','Friesian','Cow','29')
INSERT INTO animal VALUES ('Milky','female','2017-10-27','Merino','Sheep','28')
INSERT INTO animal VALUES ('Penelope','female','2016-12-26','Spotted','Pig','10')
INSERT INTO animal VALUES ('Sandy','male','2016-05-20','Beagle','Dog','19')
INSERT INTO animal VALUES ('Baaachus','female','2013-04-05','Merino','Sheep','29')
INSERT INTO animal VALUES ('Lala','female','2005-06-22','Arabian','Horse','11')
INSERT INTO animal VALUES ('Bella','female','2023-08-22','Himalayan','Cat','17')
INSERT INTO animal VALUES ('Oscar','female','2010-07-06','Persian','Cat','13')
INSERT INTO animal VALUES ('Rocky','male','2002-01-28','Dachshund','Dog','4')
INSERT INTO animal VALUES ('Goldie','female','2007-04-27','Catfish','Fish','12')
INSERT INTO animal VALUES ('Nettie','female','2014-05-28','Hereford','Cow','2')
INSERT INTO animal VALUES ('Max','female','2013-06-03','Persian','Cat','13')
INSERT INTO animal VALUES ('LovaBull','female','2009-09-02','Friesian','Cow','15')
INSERT INTO animal VALUES ('Blue','female','2009-03-26','Appaloosa','Horse','5')
INSERT INTO animal VALUES ('Muffin','female','2023-03-12','Jersey','Cow','15')
INSERT INTO animal VALUES ('Pete','male','2010-11-05','Kihikihi','Insect','33')
INSERT INTO animal VALUES ('Chief','female','2017-03-09','Morgan','Horse','18')
INSERT INTO animal VALUES ('Clarabelle','female','2012-08-16','Hereford','Cow','15')
INSERT INTO animal VALUES ('Muffy','female','2005-06-23','King Cobra','Snake','9')
INSERT INTO animal VALUES ('Kuku','female','2001-02-02','Kereru','Bird','7')
INSERT INTO animal VALUES ('Holden','male','2002-12-14','Kiwi','Bird','11')
INSERT INTO animal VALUES ('Tucker','female','2006-03-30','Labrador Retriever','Dog','6')
INSERT INTO animal VALUES ('Sadie','female','2010-04-15','Chihuahua','Dog','13')
INSERT INTO animal VALUES ('Red','male','2013-04-03','Falcon','Bird','34')
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-1', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-1', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-1', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-1', '15:30', '16:00'); 
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-2', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-2', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-2', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-2', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-3', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-3', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-3', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-3', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-4', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-4', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-4', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-4', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-5', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-5', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-5', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-5', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-6', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-6', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-6', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-6', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-7', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-7', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-7', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-7', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-8', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-8', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-8', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-8', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-9', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-9', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-9', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-9', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-10', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-10', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-10', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-10', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-11', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-11', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-11', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-11', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-12', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-12', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-12', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-12', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-13', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-13', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-13', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-13', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-14', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-14', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-14', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-14', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-15', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-15', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-15', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-15', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-16', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-16', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-16', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-16', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-17', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-17', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-17', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-17', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-18', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-18', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-18', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-18', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-19', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-19', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-19', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-19', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-20', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-20', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-20', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-20', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-21', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-21', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-21', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-21', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-22', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-22', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-22', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-22', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-23', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-23', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-23', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-23', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-24', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-24', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-24', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-24', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-25', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-25', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-25', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-25', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-26', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-26', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-26', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-26', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-27', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-27', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-27', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-27', '15:30', '16:00'); 
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-28', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-28', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-28', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-28', '15:30', '16:00'); 
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-29', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-29', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-29', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-29', '15:30', '16:00'); 
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-30', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-30', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-30', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-30', '15:30', '16:00'); 
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('1', '2023-5-31', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('2', '2023-5-31', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('3', '2023-5-31', '15:30', '16:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '8:00', '8:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '8:30', '9:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '9:00', '9:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '9:30', '10:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '10:00', '10:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '10:30', '11:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '11:00', '11:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '11:30', '12:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '12:00', '12:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '12:30', '13:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '13:00', '13:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '13:30', '14:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '14:00', '14:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '14:30', '15:00');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '15:00', '15:30');
INSERT INTO scheduleSlot(room, dayDate, startTime, endTime) VALUES ('4', '2023-5-31', '15:30', '16:00');
update scheduleSlot set staff_id = 20 where slot_id = 1
update scheduleSlot set staff_id = 20 where slot_id = 2
update scheduleSlot set staff_id = 20 where slot_id = 3
update scheduleSlot set staff_id = 20 where slot_id = 4
update scheduleSlot set staff_id = 20 where slot_id = 5
update scheduleSlot set staff_id = 20 where slot_id = 6
update scheduleSlot set staff_id = 20 where slot_id = 7
update scheduleSlot set staff_id = 17 where slot_id = 8
update scheduleSlot set staff_id = 17 where slot_id = 9
update scheduleSlot set staff_id = 17 where slot_id = 10
update scheduleSlot set staff_id = 17 where slot_id = 11
update scheduleSlot set staff_id = 17 where slot_id = 12
update scheduleSlot set staff_id = 17 where slot_id = 13
update scheduleSlot set staff_id = 17 where slot_id = 14
update scheduleSlot set staff_id = 17 where slot_id = 15
update scheduleSlot set staff_id = 17 where slot_id = 16
update scheduleSlot set staff_id = 6 where slot_id = 17
update scheduleSlot set staff_id = 6 where slot_id = 18
update scheduleSlot set staff_id = 6 where slot_id = 19
update scheduleSlot set staff_id = 6 where slot_id = 20
update scheduleSlot set staff_id = 6 where slot_id = 21
update scheduleSlot set staff_id = 6 where slot_id = 22
update scheduleSlot set staff_id = 6 where slot_id = 23
update scheduleSlot set staff_id = 12 where slot_id = 24
update scheduleSlot set staff_id = 12 where slot_id = 25
update scheduleSlot set staff_id = 12 where slot_id = 26
update scheduleSlot set staff_id = 12 where slot_id = 27
update scheduleSlot set staff_id = 12 where slot_id = 28
update scheduleSlot set staff_id = 12 where slot_id = 29
update scheduleSlot set staff_id = 12 where slot_id = 30
update scheduleSlot set staff_id = 12 where slot_id = 31
update scheduleSlot set staff_id = 12 where slot_id = 32
update scheduleSlot set staff_id = 1 where slot_id = 33
update scheduleSlot set staff_id = 1 where slot_id = 34
update scheduleSlot set staff_id = 1 where slot_id = 35
update scheduleSlot set staff_id = 1 where slot_id = 36
update scheduleSlot set staff_id = 1 where slot_id = 37
update scheduleSlot set staff_id = 1 where slot_id = 38
update scheduleSlot set staff_id = 1 where slot_id = 39
update scheduleSlot set staff_id = 1 where slot_id = 40
update scheduleSlot set staff_id = 4 where slot_id = 41
update scheduleSlot set staff_id = 4 where slot_id = 42
update scheduleSlot set staff_id = 4 where slot_id = 43
update scheduleSlot set staff_id = 4 where slot_id = 44
update scheduleSlot set staff_id = 4 where slot_id = 45
update scheduleSlot set staff_id = 4 where slot_id = 46
update scheduleSlot set staff_id = 4 where slot_id = 47
update scheduleSlot set staff_id = 4 where slot_id = 48
update scheduleSlot set staff_id = 3 where slot_id = 49
update scheduleSlot set staff_id = 3 where slot_id = 50
update scheduleSlot set staff_id = 3 where slot_id = 51
update scheduleSlot set staff_id = 3 where slot_id = 52
update scheduleSlot set staff_id = 3 where slot_id = 53
update scheduleSlot set staff_id = 3 where slot_id = 54
update scheduleSlot set staff_id = 3 where slot_id = 55
update scheduleSlot set staff_id = 3 where slot_id = 56
update scheduleSlot set staff_id = 5 where slot_id = 57
update scheduleSlot set staff_id = 5 where slot_id = 58
update scheduleSlot set staff_id = 5 where slot_id = 59
update scheduleSlot set staff_id = 5 where slot_id = 60
update scheduleSlot set staff_id = 5 where slot_id = 61
update scheduleSlot set staff_id = 5 where slot_id = 62
update scheduleSlot set staff_id = 5 where slot_id = 63
update scheduleSlot set staff_id = 5 where slot_id = 64
update scheduleSlot set staff_id = 20 where slot_id = 65
update scheduleSlot set staff_id = 20 where slot_id = 66
update scheduleSlot set staff_id = 20 where slot_id = 67
update scheduleSlot set staff_id = 20 where slot_id = 68
update scheduleSlot set staff_id = 20 where slot_id = 69
update scheduleSlot set staff_id = 20 where slot_id = 70
update scheduleSlot set staff_id = 20 where slot_id = 71
update scheduleSlot set staff_id = 17 where slot_id = 72
update scheduleSlot set staff_id = 17 where slot_id = 73
update scheduleSlot set staff_id = 17 where slot_id = 74
update scheduleSlot set staff_id = 17 where slot_id = 75
update scheduleSlot set staff_id = 17 where slot_id = 76
update scheduleSlot set staff_id = 17 where slot_id = 77
update scheduleSlot set staff_id = 17 where slot_id = 78
update scheduleSlot set staff_id = 17 where slot_id = 79
update scheduleSlot set staff_id = 17 where slot_id = 80
update scheduleSlot set staff_id = 6 where slot_id = 81
update scheduleSlot set staff_id = 6 where slot_id = 82
update scheduleSlot set staff_id = 6 where slot_id = 83
update scheduleSlot set staff_id = 6 where slot_id = 84
update scheduleSlot set staff_id = 6 where slot_id = 85
update scheduleSlot set staff_id = 6 where slot_id = 86
update scheduleSlot set staff_id = 6 where slot_id = 87
update scheduleSlot set staff_id = 12 where slot_id = 88
update scheduleSlot set staff_id = 12 where slot_id = 89
update scheduleSlot set staff_id = 12 where slot_id = 90
update scheduleSlot set staff_id = 12 where slot_id = 91
update scheduleSlot set staff_id = 12 where slot_id = 92
update scheduleSlot set staff_id = 12 where slot_id = 93
update scheduleSlot set staff_id = 12 where slot_id = 94
update scheduleSlot set staff_id = 12 where slot_id = 95
update scheduleSlot set staff_id = 12 where slot_id = 96
update scheduleSlot set staff_id = 1 where slot_id = 97
update scheduleSlot set staff_id = 1 where slot_id = 98
update scheduleSlot set staff_id = 1 where slot_id = 99
update scheduleSlot set staff_id = 1 where slot_id = 100
update scheduleSlot set staff_id = 1 where slot_id = 101
update scheduleSlot set staff_id = 1 where slot_id = 102
update scheduleSlot set staff_id = 1 where slot_id = 103
update scheduleSlot set staff_id = 1 where slot_id = 104
update scheduleSlot set staff_id = 4 where slot_id = 105
update scheduleSlot set staff_id = 4 where slot_id = 106
update scheduleSlot set staff_id = 4 where slot_id = 107
update scheduleSlot set staff_id = 4 where slot_id = 108
update scheduleSlot set staff_id = 4 where slot_id = 109
update scheduleSlot set staff_id = 4 where slot_id = 110
update scheduleSlot set staff_id = 4 where slot_id = 111
update scheduleSlot set staff_id = 4 where slot_id = 112
update scheduleSlot set staff_id = 3 where slot_id = 113
update scheduleSlot set staff_id = 3 where slot_id = 114
update scheduleSlot set staff_id = 3 where slot_id = 115
update scheduleSlot set staff_id = 3 where slot_id = 116
update scheduleSlot set staff_id = 3 where slot_id = 117
update scheduleSlot set staff_id = 3 where slot_id = 118
update scheduleSlot set staff_id = 3 where slot_id = 119
update scheduleSlot set staff_id = 3 where slot_id = 120
update scheduleSlot set staff_id = 5 where slot_id = 121
update scheduleSlot set staff_id = 5 where slot_id = 122
update scheduleSlot set staff_id = 5 where slot_id = 123
update scheduleSlot set staff_id = 5 where slot_id = 124
update scheduleSlot set staff_id = 5 where slot_id = 125
update scheduleSlot set staff_id = 5 where slot_id = 126
update scheduleSlot set staff_id = 5 where slot_id = 127
update scheduleSlot set staff_id = 5 where slot_id = 128
update scheduleSlot set staff_id = 20 where slot_id = 129
update scheduleSlot set staff_id = 20 where slot_id = 130
update scheduleSlot set staff_id = 20 where slot_id = 131
update scheduleSlot set staff_id = 20 where slot_id = 132
update scheduleSlot set staff_id = 20 where slot_id = 133
update scheduleSlot set staff_id = 20 where slot_id = 134
update scheduleSlot set staff_id = 20 where slot_id = 135
update scheduleSlot set staff_id = 17 where slot_id = 136
update scheduleSlot set staff_id = 17 where slot_id = 137
update scheduleSlot set staff_id = 17 where slot_id = 138
update scheduleSlot set staff_id = 17 where slot_id = 139
update scheduleSlot set staff_id = 17 where slot_id = 140
update scheduleSlot set staff_id = 17 where slot_id = 141
update scheduleSlot set staff_id = 17 where slot_id = 142
update scheduleSlot set staff_id = 17 where slot_id = 143
update scheduleSlot set staff_id = 17 where slot_id = 144
update scheduleSlot set staff_id = 6 where slot_id = 145
update scheduleSlot set staff_id = 6 where slot_id = 146
update scheduleSlot set staff_id = 6 where slot_id = 147
update scheduleSlot set staff_id = 6 where slot_id = 148
update scheduleSlot set staff_id = 6 where slot_id = 149
update scheduleSlot set staff_id = 6 where slot_id = 150
update scheduleSlot set staff_id = 6 where slot_id = 151
update scheduleSlot set staff_id = 12 where slot_id = 152
update scheduleSlot set staff_id = 12 where slot_id = 153
update scheduleSlot set staff_id = 12 where slot_id = 154
update scheduleSlot set staff_id = 12 where slot_id = 155
update scheduleSlot set staff_id = 12 where slot_id = 156
update scheduleSlot set staff_id = 12 where slot_id = 157
update scheduleSlot set staff_id = 12 where slot_id = 158
update scheduleSlot set staff_id = 12 where slot_id = 159
update scheduleSlot set staff_id = 12 where slot_id = 160
update scheduleSlot set staff_id = 1 where slot_id = 161
update scheduleSlot set staff_id = 1 where slot_id = 162
update scheduleSlot set staff_id = 1 where slot_id = 163
update scheduleSlot set staff_id = 1 where slot_id = 164
update scheduleSlot set staff_id = 1 where slot_id = 165
update scheduleSlot set staff_id = 1 where slot_id = 166
update scheduleSlot set staff_id = 1 where slot_id = 167
update scheduleSlot set staff_id = 1 where slot_id = 168
update scheduleSlot set staff_id = 4 where slot_id = 169
update scheduleSlot set staff_id = 4 where slot_id = 170
update scheduleSlot set staff_id = 4 where slot_id = 171
update scheduleSlot set staff_id = 4 where slot_id = 172
update scheduleSlot set staff_id = 4 where slot_id = 173
update scheduleSlot set staff_id = 4 where slot_id = 174
update scheduleSlot set staff_id = 4 where slot_id = 175
update scheduleSlot set staff_id = 4 where slot_id = 176
update scheduleSlot set staff_id = 3 where slot_id = 177
update scheduleSlot set staff_id = 3 where slot_id = 178
update scheduleSlot set staff_id = 3 where slot_id = 179
update scheduleSlot set staff_id = 3 where slot_id = 180
update scheduleSlot set staff_id = 3 where slot_id = 181
update scheduleSlot set staff_id = 3 where slot_id = 182
update scheduleSlot set staff_id = 3 where slot_id = 183
update scheduleSlot set staff_id = 3 where slot_id = 184
update scheduleSlot set staff_id = 5 where slot_id = 185
update scheduleSlot set staff_id = 5 where slot_id = 186
update scheduleSlot set staff_id = 5 where slot_id = 187
update scheduleSlot set staff_id = 5 where slot_id = 188
update scheduleSlot set staff_id = 5 where slot_id = 189
update scheduleSlot set staff_id = 5 where slot_id = 190
update scheduleSlot set staff_id = 5 where slot_id = 191
update scheduleSlot set staff_id = 5 where slot_id = 192
update scheduleSlot set staff_id = 24 where slot_id = 193
update scheduleSlot set staff_id = 24 where slot_id = 194
update scheduleSlot set staff_id = 24 where slot_id = 195
update scheduleSlot set staff_id = 24 where slot_id = 196
update scheduleSlot set staff_id = 24 where slot_id = 197
update scheduleSlot set staff_id = 24 where slot_id = 198
update scheduleSlot set staff_id = 24 where slot_id = 199
update scheduleSlot set staff_id = 24 where slot_id = 200
update scheduleSlot set staff_id = 30 where slot_id = 201
update scheduleSlot set staff_id = 30 where slot_id = 202
update scheduleSlot set staff_id = 30 where slot_id = 203
update scheduleSlot set staff_id = 30 where slot_id = 204
update scheduleSlot set staff_id = 30 where slot_id = 205
update scheduleSlot set staff_id = 30 where slot_id = 206
update scheduleSlot set staff_id = 30 where slot_id = 207
update scheduleSlot set staff_id = 30 where slot_id = 208
update scheduleSlot set staff_id = 19 where slot_id = 209
update scheduleSlot set staff_id = 19 where slot_id = 210
update scheduleSlot set staff_id = 19 where slot_id = 211
update scheduleSlot set staff_id = 19 where slot_id = 212
update scheduleSlot set staff_id = 19 where slot_id = 213
update scheduleSlot set staff_id = 19 where slot_id = 214
update scheduleSlot set staff_id = 19 where slot_id = 215
update scheduleSlot set staff_id = 19 where slot_id = 216
update scheduleSlot set staff_id = 16 where slot_id = 217
update scheduleSlot set staff_id = 16 where slot_id = 218
update scheduleSlot set staff_id = 16 where slot_id = 219
update scheduleSlot set staff_id = 16 where slot_id = 220
update scheduleSlot set staff_id = 16 where slot_id = 221
update scheduleSlot set staff_id = 16 where slot_id = 222
update scheduleSlot set staff_id = 16 where slot_id = 223
update scheduleSlot set staff_id = 16 where slot_id = 224
update scheduleSlot set staff_id = 15 where slot_id = 225
update scheduleSlot set staff_id = 15 where slot_id = 226
update scheduleSlot set staff_id = 15 where slot_id = 227
update scheduleSlot set staff_id = 15 where slot_id = 228
update scheduleSlot set staff_id = 15 where slot_id = 229
update scheduleSlot set staff_id = 15 where slot_id = 230
update scheduleSlot set staff_id = 15 where slot_id = 231
update scheduleSlot set staff_id = 15 where slot_id = 232
update scheduleSlot set staff_id = 11 where slot_id = 233
update scheduleSlot set staff_id = 11 where slot_id = 234
update scheduleSlot set staff_id = 11 where slot_id = 235
update scheduleSlot set staff_id = 11 where slot_id = 236
update scheduleSlot set staff_id = 11 where slot_id = 237
update scheduleSlot set staff_id = 11 where slot_id = 238
update scheduleSlot set staff_id = 11 where slot_id = 239
update scheduleSlot set staff_id = 11 where slot_id = 240
update scheduleSlot set staff_id = 13 where slot_id = 241
update scheduleSlot set staff_id = 13 where slot_id = 242
update scheduleSlot set staff_id = 13 where slot_id = 243
update scheduleSlot set staff_id = 13 where slot_id = 244
update scheduleSlot set staff_id = 13 where slot_id = 245
update scheduleSlot set staff_id = 13 where slot_id = 246
update scheduleSlot set staff_id = 13 where slot_id = 247
update scheduleSlot set staff_id = 13 where slot_id = 248
update scheduleSlot set staff_id = 9 where slot_id = 249
update scheduleSlot set staff_id = 9 where slot_id = 250
update scheduleSlot set staff_id = 9 where slot_id = 251
update scheduleSlot set staff_id = 9 where slot_id = 252
update scheduleSlot set staff_id = 9 where slot_id = 253
update scheduleSlot set staff_id = 9 where slot_id = 254
update scheduleSlot set staff_id = 9 where slot_id = 255
update scheduleSlot set staff_id = 9 where slot_id = 256

update scheduleSlot set staff_id = 24 where slot_id = 259
update scheduleSlot set staff_id = 24 where slot_id = 260
update scheduleSlot set staff_id = 24 where slot_id = 261
update scheduleSlot set staff_id = 24 where slot_id = 262
update scheduleSlot set staff_id = 24 where slot_id = 263
update scheduleSlot set staff_id = 24 where slot_id = 264
update scheduleSlot set staff_id = 30 where slot_id = 265
update scheduleSlot set staff_id = 30 where slot_id = 266
update scheduleSlot set staff_id = 30 where slot_id = 267
update scheduleSlot set staff_id = 30 where slot_id = 268

update scheduleSlot set staff_id = 19 where slot_id = 275
update scheduleSlot set staff_id = 19 where slot_id = 276
update scheduleSlot set staff_id = 19 where slot_id = 277
update scheduleSlot set staff_id = 19 where slot_id = 278
update scheduleSlot set staff_id = 19 where slot_id = 279
update scheduleSlot set staff_id = 19 where slot_id = 280
update scheduleSlot set staff_id = 16 where slot_id = 281
update scheduleSlot set staff_id = 16 where slot_id = 282
update scheduleSlot set staff_id = 16 where slot_id = 283
update scheduleSlot set staff_id = 16 where slot_id = 284

update scheduleSlot set staff_id = 15 where slot_id = 291
update scheduleSlot set staff_id = 15 where slot_id = 292
update scheduleSlot set staff_id = 15 where slot_id = 293
update scheduleSlot set staff_id = 15 where slot_id = 294
update scheduleSlot set staff_id = 15 where slot_id = 295
update scheduleSlot set staff_id = 15 where slot_id = 296
update scheduleSlot set staff_id = 11 where slot_id = 297
update scheduleSlot set staff_id = 11 where slot_id = 298
update scheduleSlot set staff_id = 11 where slot_id = 299
update scheduleSlot set staff_id = 11 where slot_id = 300

update scheduleSlot set staff_id = 13 where slot_id = 307
update scheduleSlot set staff_id = 13 where slot_id = 308
update scheduleSlot set staff_id = 13 where slot_id = 309
update scheduleSlot set staff_id = 13 where slot_id = 310
update scheduleSlot set staff_id = 13 where slot_id = 311
update scheduleSlot set staff_id = 13 where slot_id = 312
update scheduleSlot set staff_id = 9 where slot_id = 313
update scheduleSlot set staff_id = 9 where slot_id = 314
update scheduleSlot set staff_id = 9 where slot_id = 315
update scheduleSlot set staff_id = 9 where slot_id = 316

update scheduleSlot set staff_id = 27 where slot_id = 385
update scheduleSlot set staff_id = 27 where slot_id = 386
update scheduleSlot set staff_id = 27 where slot_id = 387
update scheduleSlot set staff_id = 27 where slot_id = 388
update scheduleSlot set staff_id = 27 where slot_id = 389
update scheduleSlot set staff_id = 27 where slot_id = 390
update scheduleSlot set staff_id = 27 where slot_id = 391
update scheduleSlot set staff_id = 27 where slot_id = 392
update scheduleSlot set staff_id = 17 where slot_id = 393
update scheduleSlot set staff_id = 17 where slot_id = 394
update scheduleSlot set staff_id = 17 where slot_id = 395
update scheduleSlot set staff_id = 17 where slot_id = 396
update scheduleSlot set staff_id = 17 where slot_id = 397
update scheduleSlot set staff_id = 17 where slot_id = 398
update scheduleSlot set staff_id = 17 where slot_id = 399
update scheduleSlot set staff_id = 17 where slot_id = 400
update scheduleSlot set staff_id = 29 where slot_id = 401
update scheduleSlot set staff_id = 29 where slot_id = 402
update scheduleSlot set staff_id = 29 where slot_id = 403
update scheduleSlot set staff_id = 29 where slot_id = 404
update scheduleSlot set staff_id = 29 where slot_id = 405
update scheduleSlot set staff_id = 29 where slot_id = 406
update scheduleSlot set staff_id = 29 where slot_id = 407
update scheduleSlot set staff_id = 29 where slot_id = 408
update scheduleSlot set staff_id = 18 where slot_id = 409
update scheduleSlot set staff_id = 18 where slot_id = 410
update scheduleSlot set staff_id = 18 where slot_id = 411
update scheduleSlot set staff_id = 18 where slot_id = 412
update scheduleSlot set staff_id = 18 where slot_id = 413
update scheduleSlot set staff_id = 18 where slot_id = 414
update scheduleSlot set staff_id = 18 where slot_id = 415
update scheduleSlot set staff_id = 18 where slot_id = 416
update scheduleSlot set staff_id = 26 where slot_id = 417
update scheduleSlot set staff_id = 26 where slot_id = 418
update scheduleSlot set staff_id = 26 where slot_id = 419
update scheduleSlot set staff_id = 26 where slot_id = 420
update scheduleSlot set staff_id = 26 where slot_id = 421
update scheduleSlot set staff_id = 26 where slot_id = 422
update scheduleSlot set staff_id = 26 where slot_id = 423
update scheduleSlot set staff_id = 26 where slot_id = 424
update scheduleSlot set staff_id = 28 where slot_id = 425
update scheduleSlot set staff_id = 28 where slot_id = 426
update scheduleSlot set staff_id = 28 where slot_id = 427
update scheduleSlot set staff_id = 28 where slot_id = 428
update scheduleSlot set staff_id = 28 where slot_id = 429
update scheduleSlot set staff_id = 28 where slot_id = 430
update scheduleSlot set staff_id = 28 where slot_id = 431
update scheduleSlot set staff_id = 28 where slot_id = 432
update scheduleSlot set staff_id = 32 where slot_id = 433
update scheduleSlot set staff_id = 32 where slot_id = 434
update scheduleSlot set staff_id = 32 where slot_id = 435
update scheduleSlot set staff_id = 32 where slot_id = 436
update scheduleSlot set staff_id = 32 where slot_id = 437
update scheduleSlot set staff_id = 32 where slot_id = 438
update scheduleSlot set staff_id = 32 where slot_id = 439
update scheduleSlot set staff_id = 32 where slot_id = 440
update scheduleSlot set staff_id = 21 where slot_id = 441
update scheduleSlot set staff_id = 21 where slot_id = 442
update scheduleSlot set staff_id = 21 where slot_id = 443
update scheduleSlot set staff_id = 21 where slot_id = 444
update scheduleSlot set staff_id = 21 where slot_id = 445
update scheduleSlot set staff_id = 21 where slot_id = 446
update scheduleSlot set staff_id = 21 where slot_id = 447
update scheduleSlot set staff_id = 21 where slot_id = 448
update scheduleSlot set staff_id = 27 where slot_id = 449
update scheduleSlot set staff_id = 27 where slot_id = 450
update scheduleSlot set staff_id = 27 where slot_id = 451
update scheduleSlot set staff_id = 27 where slot_id = 452
update scheduleSlot set staff_id = 27 where slot_id = 453
update scheduleSlot set staff_id = 27 where slot_id = 454
update scheduleSlot set staff_id = 27 where slot_id = 455
update scheduleSlot set staff_id = 27 where slot_id = 456
update scheduleSlot set staff_id = 17 where slot_id = 457
update scheduleSlot set staff_id = 17 where slot_id = 458
update scheduleSlot set staff_id = 17 where slot_id = 459
update scheduleSlot set staff_id = 17 where slot_id = 460
update scheduleSlot set staff_id = 17 where slot_id = 461
update scheduleSlot set staff_id = 17 where slot_id = 462
update scheduleSlot set staff_id = 17 where slot_id = 463
update scheduleSlot set staff_id = 17 where slot_id = 464
update scheduleSlot set staff_id = 29 where slot_id = 465
update scheduleSlot set staff_id = 29 where slot_id = 466
update scheduleSlot set staff_id = 29 where slot_id = 467
update scheduleSlot set staff_id = 29 where slot_id = 468
update scheduleSlot set staff_id = 29 where slot_id = 469
update scheduleSlot set staff_id = 29 where slot_id = 470
update scheduleSlot set staff_id = 29 where slot_id = 471
update scheduleSlot set staff_id = 29 where slot_id = 472
update scheduleSlot set staff_id = 18 where slot_id = 473
update scheduleSlot set staff_id = 18 where slot_id = 474
update scheduleSlot set staff_id = 18 where slot_id = 475
update scheduleSlot set staff_id = 18 where slot_id = 476
update scheduleSlot set staff_id = 18 where slot_id = 477
update scheduleSlot set staff_id = 18 where slot_id = 478
update scheduleSlot set staff_id = 18 where slot_id = 479
update scheduleSlot set staff_id = 18 where slot_id = 480
update scheduleSlot set staff_id = 26 where slot_id = 481
update scheduleSlot set staff_id = 26 where slot_id = 482
update scheduleSlot set staff_id = 26 where slot_id = 483
update scheduleSlot set staff_id = 26 where slot_id = 484
update scheduleSlot set staff_id = 26 where slot_id = 485
update scheduleSlot set staff_id = 26 where slot_id = 486
update scheduleSlot set staff_id = 26 where slot_id = 487
update scheduleSlot set staff_id = 26 where slot_id = 488
update scheduleSlot set staff_id = 28 where slot_id = 489
update scheduleSlot set staff_id = 28 where slot_id = 490
update scheduleSlot set staff_id = 28 where slot_id = 491
update scheduleSlot set staff_id = 28 where slot_id = 492
update scheduleSlot set staff_id = 28 where slot_id = 493
update scheduleSlot set staff_id = 28 where slot_id = 494
update scheduleSlot set staff_id = 28 where slot_id = 495
update scheduleSlot set staff_id = 28 where slot_id = 496
update scheduleSlot set staff_id = 32 where slot_id = 497
update scheduleSlot set staff_id = 32 where slot_id = 498
update scheduleSlot set staff_id = 32 where slot_id = 499
update scheduleSlot set staff_id = 32 where slot_id = 500
update scheduleSlot set staff_id = 32 where slot_id = 501
update scheduleSlot set staff_id = 32 where slot_id = 502
update scheduleSlot set staff_id = 32 where slot_id = 503
update scheduleSlot set staff_id = 32 where slot_id = 504
update scheduleSlot set staff_id = 21 where slot_id = 505
update scheduleSlot set staff_id = 21 where slot_id = 506
update scheduleSlot set staff_id = 21 where slot_id = 507
update scheduleSlot set staff_id = 21 where slot_id = 508
update scheduleSlot set staff_id = 21 where slot_id = 509
update scheduleSlot set staff_id = 21 where slot_id = 510
update scheduleSlot set staff_id = 21 where slot_id = 511
update scheduleSlot set staff_id = 21 where slot_id = 512
update scheduleSlot set staff_id = 27 where slot_id = 513
update scheduleSlot set staff_id = 27 where slot_id = 514
update scheduleSlot set staff_id = 27 where slot_id = 515
update scheduleSlot set staff_id = 27 where slot_id = 516
update scheduleSlot set staff_id = 27 where slot_id = 517
update scheduleSlot set staff_id = 27 where slot_id = 518
update scheduleSlot set staff_id = 27 where slot_id = 519
update scheduleSlot set staff_id = 27 where slot_id = 520
update scheduleSlot set staff_id = 17 where slot_id = 521
update scheduleSlot set staff_id = 17 where slot_id = 522
update scheduleSlot set staff_id = 17 where slot_id = 523
update scheduleSlot set staff_id = 17 where slot_id = 524
update scheduleSlot set staff_id = 17 where slot_id = 525
update scheduleSlot set staff_id = 17 where slot_id = 526
update scheduleSlot set staff_id = 17 where slot_id = 527
update scheduleSlot set staff_id = 17 where slot_id = 528
update scheduleSlot set staff_id = 29 where slot_id = 529
update scheduleSlot set staff_id = 29 where slot_id = 530
update scheduleSlot set staff_id = 29 where slot_id = 531
update scheduleSlot set staff_id = 29 where slot_id = 532
update scheduleSlot set staff_id = 29 where slot_id = 533
update scheduleSlot set staff_id = 29 where slot_id = 534
update scheduleSlot set staff_id = 29 where slot_id = 535
update scheduleSlot set staff_id = 29 where slot_id = 536
update scheduleSlot set staff_id = 18 where slot_id = 537
update scheduleSlot set staff_id = 18 where slot_id = 538
update scheduleSlot set staff_id = 18 where slot_id = 539
update scheduleSlot set staff_id = 18 where slot_id = 540
update scheduleSlot set staff_id = 18 where slot_id = 541
update scheduleSlot set staff_id = 18 where slot_id = 542
update scheduleSlot set staff_id = 18 where slot_id = 543
update scheduleSlot set staff_id = 18 where slot_id = 544
update scheduleSlot set staff_id = 26 where slot_id = 545
update scheduleSlot set staff_id = 26 where slot_id = 546
update scheduleSlot set staff_id = 26 where slot_id = 547
update scheduleSlot set staff_id = 26 where slot_id = 548
update scheduleSlot set staff_id = 26 where slot_id = 549
update scheduleSlot set staff_id = 26 where slot_id = 550
update scheduleSlot set staff_id = 26 where slot_id = 551
update scheduleSlot set staff_id = 26 where slot_id = 552
update scheduleSlot set staff_id = 28 where slot_id = 553
update scheduleSlot set staff_id = 28 where slot_id = 554
update scheduleSlot set staff_id = 28 where slot_id = 555
update scheduleSlot set staff_id = 28 where slot_id = 556
update scheduleSlot set staff_id = 28 where slot_id = 557
update scheduleSlot set staff_id = 28 where slot_id = 558
update scheduleSlot set staff_id = 28 where slot_id = 559
update scheduleSlot set staff_id = 28 where slot_id = 560
update scheduleSlot set staff_id = 32 where slot_id = 561
update scheduleSlot set staff_id = 32 where slot_id = 562
update scheduleSlot set staff_id = 32 where slot_id = 563
update scheduleSlot set staff_id = 32 where slot_id = 564
update scheduleSlot set staff_id = 32 where slot_id = 565
update scheduleSlot set staff_id = 32 where slot_id = 566
update scheduleSlot set staff_id = 32 where slot_id = 567
update scheduleSlot set staff_id = 32 where slot_id = 568
update scheduleSlot set staff_id = 21 where slot_id = 569
update scheduleSlot set staff_id = 21 where slot_id = 570
update scheduleSlot set staff_id = 21 where slot_id = 571
update scheduleSlot set staff_id = 21 where slot_id = 572
update scheduleSlot set staff_id = 21 where slot_id = 573
update scheduleSlot set staff_id = 21 where slot_id = 574
update scheduleSlot set staff_id = 21 where slot_id = 575
update scheduleSlot set staff_id = 21 where slot_id = 576
update scheduleSlot set staff_id = 20 where slot_id = 577
update scheduleSlot set staff_id = 20 where slot_id = 578
update scheduleSlot set staff_id = 20 where slot_id = 579
update scheduleSlot set staff_id = 20 where slot_id = 580
update scheduleSlot set staff_id = 20 where slot_id = 581
update scheduleSlot set staff_id = 20 where slot_id = 582
update scheduleSlot set staff_id = 20 where slot_id = 583
update scheduleSlot set staff_id = 17 where slot_id = 584
update scheduleSlot set staff_id = 17 where slot_id = 585
update scheduleSlot set staff_id = 17 where slot_id = 586
update scheduleSlot set staff_id = 17 where slot_id = 587
update scheduleSlot set staff_id = 17 where slot_id = 588
update scheduleSlot set staff_id = 17 where slot_id = 589
update scheduleSlot set staff_id = 17 where slot_id = 590
update scheduleSlot set staff_id = 17 where slot_id = 591
update scheduleSlot set staff_id = 17 where slot_id = 592
update scheduleSlot set staff_id = 6 where slot_id = 593
update scheduleSlot set staff_id = 6 where slot_id = 594
update scheduleSlot set staff_id = 6 where slot_id = 595
update scheduleSlot set staff_id = 6 where slot_id = 596
update scheduleSlot set staff_id = 6 where slot_id = 597
update scheduleSlot set staff_id = 6 where slot_id = 598
update scheduleSlot set staff_id = 6 where slot_id = 599
update scheduleSlot set staff_id = 12 where slot_id = 600
update scheduleSlot set staff_id = 12 where slot_id = 601
update scheduleSlot set staff_id = 12 where slot_id = 602
update scheduleSlot set staff_id = 12 where slot_id = 603
update scheduleSlot set staff_id = 12 where slot_id = 604
update scheduleSlot set staff_id = 12 where slot_id = 605
update scheduleSlot set staff_id = 12 where slot_id = 606
update scheduleSlot set staff_id = 12 where slot_id = 607
update scheduleSlot set staff_id = 12 where slot_id = 608
update scheduleSlot set staff_id = 1 where slot_id = 609
update scheduleSlot set staff_id = 1 where slot_id = 610
update scheduleSlot set staff_id = 1 where slot_id = 611
update scheduleSlot set staff_id = 1 where slot_id = 612
update scheduleSlot set staff_id = 1 where slot_id = 613
update scheduleSlot set staff_id = 1 where slot_id = 614
update scheduleSlot set staff_id = 1 where slot_id = 615
update scheduleSlot set staff_id = 1 where slot_id = 616
update scheduleSlot set staff_id = 4 where slot_id = 617
update scheduleSlot set staff_id = 4 where slot_id = 618
update scheduleSlot set staff_id = 4 where slot_id = 619
update scheduleSlot set staff_id = 4 where slot_id = 620
update scheduleSlot set staff_id = 4 where slot_id = 621
update scheduleSlot set staff_id = 4 where slot_id = 622
update scheduleSlot set staff_id = 4 where slot_id = 623
update scheduleSlot set staff_id = 4 where slot_id = 624
update scheduleSlot set staff_id = 3 where slot_id = 625
update scheduleSlot set staff_id = 3 where slot_id = 626
update scheduleSlot set staff_id = 3 where slot_id = 627
update scheduleSlot set staff_id = 3 where slot_id = 628
update scheduleSlot set staff_id = 3 where slot_id = 629
update scheduleSlot set staff_id = 3 where slot_id = 630
update scheduleSlot set staff_id = 3 where slot_id = 631
update scheduleSlot set staff_id = 3 where slot_id = 632
update scheduleSlot set staff_id = 5 where slot_id = 633
update scheduleSlot set staff_id = 5 where slot_id = 634
update scheduleSlot set staff_id = 5 where slot_id = 635
update scheduleSlot set staff_id = 5 where slot_id = 636
update scheduleSlot set staff_id = 5 where slot_id = 637
update scheduleSlot set staff_id = 5 where slot_id = 638
update scheduleSlot set staff_id = 5 where slot_id = 639
update scheduleSlot set staff_id = 5 where slot_id = 640
update scheduleSlot set staff_id = 20 where slot_id = 641
update scheduleSlot set staff_id = 20 where slot_id = 642
update scheduleSlot set staff_id = 20 where slot_id = 643
update scheduleSlot set staff_id = 20 where slot_id = 644
update scheduleSlot set staff_id = 20 where slot_id = 645
update scheduleSlot set staff_id = 20 where slot_id = 646
update scheduleSlot set staff_id = 20 where slot_id = 647
update scheduleSlot set staff_id = 17 where slot_id = 648
update scheduleSlot set staff_id = 17 where slot_id = 649
update scheduleSlot set staff_id = 17 where slot_id = 650
update scheduleSlot set staff_id = 17 where slot_id = 651
update scheduleSlot set staff_id = 17 where slot_id = 652
update scheduleSlot set staff_id = 17 where slot_id = 653
update scheduleSlot set staff_id = 17 where slot_id = 654
update scheduleSlot set staff_id = 17 where slot_id = 655
update scheduleSlot set staff_id = 17 where slot_id = 656
update scheduleSlot set staff_id = 6 where slot_id = 657
update scheduleSlot set staff_id = 6 where slot_id = 658
update scheduleSlot set staff_id = 6 where slot_id = 659
update scheduleSlot set staff_id = 6 where slot_id = 660
update scheduleSlot set staff_id = 6 where slot_id = 661
update scheduleSlot set staff_id = 6 where slot_id = 662
update scheduleSlot set staff_id = 6 where slot_id = 663
update scheduleSlot set staff_id = 12 where slot_id = 664
update scheduleSlot set staff_id = 12 where slot_id = 665
update scheduleSlot set staff_id = 12 where slot_id = 666
update scheduleSlot set staff_id = 12 where slot_id = 667
update scheduleSlot set staff_id = 12 where slot_id = 668
update scheduleSlot set staff_id = 12 where slot_id = 669
update scheduleSlot set staff_id = 12 where slot_id = 670
update scheduleSlot set staff_id = 12 where slot_id = 671
update scheduleSlot set staff_id = 12 where slot_id = 672
update scheduleSlot set staff_id = 1 where slot_id = 673
update scheduleSlot set staff_id = 1 where slot_id = 674
update scheduleSlot set staff_id = 1 where slot_id = 675
update scheduleSlot set staff_id = 1 where slot_id = 676
update scheduleSlot set staff_id = 1 where slot_id = 677
update scheduleSlot set staff_id = 1 where slot_id = 678
update scheduleSlot set staff_id = 1 where slot_id = 679
update scheduleSlot set staff_id = 1 where slot_id = 680
update scheduleSlot set staff_id = 4 where slot_id = 681
update scheduleSlot set staff_id = 4 where slot_id = 682
update scheduleSlot set staff_id = 4 where slot_id = 683
update scheduleSlot set staff_id = 4 where slot_id = 684
update scheduleSlot set staff_id = 4 where slot_id = 685
update scheduleSlot set staff_id = 4 where slot_id = 686
update scheduleSlot set staff_id = 4 where slot_id = 687
update scheduleSlot set staff_id = 4 where slot_id = 688
update scheduleSlot set staff_id = 3 where slot_id = 689
update scheduleSlot set staff_id = 3 where slot_id = 690
update scheduleSlot set staff_id = 3 where slot_id = 691
update scheduleSlot set staff_id = 3 where slot_id = 692
update scheduleSlot set staff_id = 3 where slot_id = 693
update scheduleSlot set staff_id = 3 where slot_id = 694
update scheduleSlot set staff_id = 3 where slot_id = 695
update scheduleSlot set staff_id = 3 where slot_id = 696
update scheduleSlot set staff_id = 5 where slot_id = 697
update scheduleSlot set staff_id = 5 where slot_id = 698
update scheduleSlot set staff_id = 5 where slot_id = 699
update scheduleSlot set staff_id = 5 where slot_id = 700
update scheduleSlot set staff_id = 5 where slot_id = 701
update scheduleSlot set staff_id = 5 where slot_id = 702
update scheduleSlot set staff_id = 5 where slot_id = 703
update scheduleSlot set staff_id = 5 where slot_id = 704

update scheduleSlot set staff_id = 20 where slot_id = 707
update scheduleSlot set staff_id = 20 where slot_id = 708
update scheduleSlot set staff_id = 20 where slot_id = 709
update scheduleSlot set staff_id = 20 where slot_id = 710
update scheduleSlot set staff_id = 20 where slot_id = 711
update scheduleSlot set staff_id = 17 where slot_id = 712
update scheduleSlot set staff_id = 17 where slot_id = 713
update scheduleSlot set staff_id = 17 where slot_id = 714
update scheduleSlot set staff_id = 17 where slot_id = 715
update scheduleSlot set staff_id = 17 where slot_id = 716

update scheduleSlot set staff_id = 6 where slot_id = 723
update scheduleSlot set staff_id = 6 where slot_id = 724
update scheduleSlot set staff_id = 6 where slot_id = 725
update scheduleSlot set staff_id = 6 where slot_id = 726
update scheduleSlot set staff_id = 6 where slot_id = 727
update scheduleSlot set staff_id = 12 where slot_id = 728
update scheduleSlot set staff_id = 12 where slot_id = 729
update scheduleSlot set staff_id = 12 where slot_id = 730
update scheduleSlot set staff_id = 12 where slot_id = 731
update scheduleSlot set staff_id = 12 where slot_id = 732

update scheduleSlot set staff_id = 1 where slot_id = 739
update scheduleSlot set staff_id = 1 where slot_id = 740
update scheduleSlot set staff_id = 1 where slot_id = 741
update scheduleSlot set staff_id = 1 where slot_id = 742
update scheduleSlot set staff_id = 1 where slot_id = 743
update scheduleSlot set staff_id = 1 where slot_id = 744
update scheduleSlot set staff_id = 4 where slot_id = 745
update scheduleSlot set staff_id = 4 where slot_id = 746
update scheduleSlot set staff_id = 4 where slot_id = 747
update scheduleSlot set staff_id = 4 where slot_id = 748

update scheduleSlot set staff_id = 3 where slot_id = 755
update scheduleSlot set staff_id = 3 where slot_id = 756
update scheduleSlot set staff_id = 3 where slot_id = 757
update scheduleSlot set staff_id = 3 where slot_id = 758
update scheduleSlot set staff_id = 3 where slot_id = 759
update scheduleSlot set staff_id = 3 where slot_id = 760
update scheduleSlot set staff_id = 5 where slot_id = 761
update scheduleSlot set staff_id = 5 where slot_id = 762
update scheduleSlot set staff_id = 5 where slot_id = 763
update scheduleSlot set staff_id = 5 where slot_id = 764

update scheduleSlot set staff_id = 24 where slot_id = 833
update scheduleSlot set staff_id = 24 where slot_id = 834
update scheduleSlot set staff_id = 24 where slot_id = 835
update scheduleSlot set staff_id = 24 where slot_id = 836
update scheduleSlot set staff_id = 24 where slot_id = 837
update scheduleSlot set staff_id = 24 where slot_id = 838
update scheduleSlot set staff_id = 24 where slot_id = 839
update scheduleSlot set staff_id = 24 where slot_id = 840
update scheduleSlot set staff_id = 30 where slot_id = 841
update scheduleSlot set staff_id = 30 where slot_id = 842
update scheduleSlot set staff_id = 30 where slot_id = 843
update scheduleSlot set staff_id = 30 where slot_id = 844
update scheduleSlot set staff_id = 30 where slot_id = 845
update scheduleSlot set staff_id = 30 where slot_id = 846
update scheduleSlot set staff_id = 30 where slot_id = 847
update scheduleSlot set staff_id = 30 where slot_id = 848
update scheduleSlot set staff_id = 19 where slot_id = 849
update scheduleSlot set staff_id = 19 where slot_id = 850
update scheduleSlot set staff_id = 19 where slot_id = 851
update scheduleSlot set staff_id = 19 where slot_id = 852
update scheduleSlot set staff_id = 19 where slot_id = 853
update scheduleSlot set staff_id = 19 where slot_id = 854
update scheduleSlot set staff_id = 19 where slot_id = 855
update scheduleSlot set staff_id = 19 where slot_id = 856
update scheduleSlot set staff_id = 16 where slot_id = 857
update scheduleSlot set staff_id = 16 where slot_id = 858
update scheduleSlot set staff_id = 16 where slot_id = 859
update scheduleSlot set staff_id = 16 where slot_id = 860
update scheduleSlot set staff_id = 16 where slot_id = 861
update scheduleSlot set staff_id = 16 where slot_id = 862
update scheduleSlot set staff_id = 16 where slot_id = 863
update scheduleSlot set staff_id = 16 where slot_id = 864
update scheduleSlot set staff_id = 15 where slot_id = 865
update scheduleSlot set staff_id = 15 where slot_id = 866
update scheduleSlot set staff_id = 15 where slot_id = 867
update scheduleSlot set staff_id = 15 where slot_id = 868
update scheduleSlot set staff_id = 15 where slot_id = 869
update scheduleSlot set staff_id = 15 where slot_id = 870
update scheduleSlot set staff_id = 15 where slot_id = 871
update scheduleSlot set staff_id = 15 where slot_id = 872
update scheduleSlot set staff_id = 11 where slot_id = 873
update scheduleSlot set staff_id = 11 where slot_id = 874
update scheduleSlot set staff_id = 11 where slot_id = 875
update scheduleSlot set staff_id = 11 where slot_id = 876
update scheduleSlot set staff_id = 11 where slot_id = 877
update scheduleSlot set staff_id = 11 where slot_id = 878
update scheduleSlot set staff_id = 11 where slot_id = 879
update scheduleSlot set staff_id = 11 where slot_id = 880
update scheduleSlot set staff_id = 13 where slot_id = 881
update scheduleSlot set staff_id = 13 where slot_id = 882
update scheduleSlot set staff_id = 13 where slot_id = 883
update scheduleSlot set staff_id = 13 where slot_id = 884
update scheduleSlot set staff_id = 13 where slot_id = 885
update scheduleSlot set staff_id = 13 where slot_id = 886
update scheduleSlot set staff_id = 13 where slot_id = 887
update scheduleSlot set staff_id = 13 where slot_id = 888
update scheduleSlot set staff_id = 9 where slot_id = 889
update scheduleSlot set staff_id = 9 where slot_id = 890
update scheduleSlot set staff_id = 9 where slot_id = 891
update scheduleSlot set staff_id = 9 where slot_id = 892
update scheduleSlot set staff_id = 9 where slot_id = 893
update scheduleSlot set staff_id = 9 where slot_id = 894
update scheduleSlot set staff_id = 9 where slot_id = 895
update scheduleSlot set staff_id = 9 where slot_id = 896
update scheduleSlot set staff_id = 24 where slot_id = 897
update scheduleSlot set staff_id = 24 where slot_id = 898
update scheduleSlot set staff_id = 24 where slot_id = 899
update scheduleSlot set staff_id = 24 where slot_id = 900
update scheduleSlot set staff_id = 24 where slot_id = 901
update scheduleSlot set staff_id = 24 where slot_id = 902
update scheduleSlot set staff_id = 24 where slot_id = 903
update scheduleSlot set staff_id = 24 where slot_id = 904
update scheduleSlot set staff_id = 30 where slot_id = 905
update scheduleSlot set staff_id = 30 where slot_id = 906
update scheduleSlot set staff_id = 30 where slot_id = 907
update scheduleSlot set staff_id = 30 where slot_id = 908
update scheduleSlot set staff_id = 30 where slot_id = 909
update scheduleSlot set staff_id = 30 where slot_id = 910
update scheduleSlot set staff_id = 30 where slot_id = 911
update scheduleSlot set staff_id = 30 where slot_id = 912
update scheduleSlot set staff_id = 19 where slot_id = 913
update scheduleSlot set staff_id = 19 where slot_id = 914
update scheduleSlot set staff_id = 19 where slot_id = 915
update scheduleSlot set staff_id = 19 where slot_id = 916
update scheduleSlot set staff_id = 19 where slot_id = 917
update scheduleSlot set staff_id = 19 where slot_id = 918
update scheduleSlot set staff_id = 19 where slot_id = 919
update scheduleSlot set staff_id = 19 where slot_id = 920
update scheduleSlot set staff_id = 16 where slot_id = 921
update scheduleSlot set staff_id = 16 where slot_id = 922
update scheduleSlot set staff_id = 16 where slot_id = 923
update scheduleSlot set staff_id = 16 where slot_id = 924
update scheduleSlot set staff_id = 16 where slot_id = 925
update scheduleSlot set staff_id = 16 where slot_id = 926
update scheduleSlot set staff_id = 16 where slot_id = 927
update scheduleSlot set staff_id = 16 where slot_id = 928
update scheduleSlot set staff_id = 15 where slot_id = 929
update scheduleSlot set staff_id = 15 where slot_id = 930
update scheduleSlot set staff_id = 15 where slot_id = 931
update scheduleSlot set staff_id = 15 where slot_id = 932
update scheduleSlot set staff_id = 15 where slot_id = 933
update scheduleSlot set staff_id = 15 where slot_id = 934
update scheduleSlot set staff_id = 15 where slot_id = 935
update scheduleSlot set staff_id = 15 where slot_id = 936
update scheduleSlot set staff_id = 11 where slot_id = 937
update scheduleSlot set staff_id = 11 where slot_id = 938
update scheduleSlot set staff_id = 11 where slot_id = 939
update scheduleSlot set staff_id = 11 where slot_id = 940
update scheduleSlot set staff_id = 11 where slot_id = 941
update scheduleSlot set staff_id = 11 where slot_id = 942
update scheduleSlot set staff_id = 11 where slot_id = 943
update scheduleSlot set staff_id = 11 where slot_id = 944
update scheduleSlot set staff_id = 13 where slot_id = 945
update scheduleSlot set staff_id = 13 where slot_id = 946
update scheduleSlot set staff_id = 13 where slot_id = 947
update scheduleSlot set staff_id = 13 where slot_id = 948
update scheduleSlot set staff_id = 13 where slot_id = 949
update scheduleSlot set staff_id = 13 where slot_id = 950
update scheduleSlot set staff_id = 13 where slot_id = 951
update scheduleSlot set staff_id = 13 where slot_id = 952
update scheduleSlot set staff_id = 9 where slot_id = 953
update scheduleSlot set staff_id = 9 where slot_id = 954
update scheduleSlot set staff_id = 9 where slot_id = 955
update scheduleSlot set staff_id = 9 where slot_id = 956
update scheduleSlot set staff_id = 9 where slot_id = 957
update scheduleSlot set staff_id = 9 where slot_id = 958
update scheduleSlot set staff_id = 9 where slot_id = 959
update scheduleSlot set staff_id = 9 where slot_id = 960
update scheduleSlot set staff_id = 27 where slot_id = 961
update scheduleSlot set staff_id = 27 where slot_id = 962
update scheduleSlot set staff_id = 27 where slot_id = 963
update scheduleSlot set staff_id = 27 where slot_id = 964
update scheduleSlot set staff_id = 27 where slot_id = 965
update scheduleSlot set staff_id = 27 where slot_id = 966
update scheduleSlot set staff_id = 27 where slot_id = 967
update scheduleSlot set staff_id = 27 where slot_id = 968
update scheduleSlot set staff_id = 17 where slot_id = 969
update scheduleSlot set staff_id = 17 where slot_id = 970
update scheduleSlot set staff_id = 17 where slot_id = 971
update scheduleSlot set staff_id = 17 where slot_id = 972
update scheduleSlot set staff_id = 17 where slot_id = 973
update scheduleSlot set staff_id = 17 where slot_id = 974
update scheduleSlot set staff_id = 17 where slot_id = 975
update scheduleSlot set staff_id = 17 where slot_id = 976
update scheduleSlot set staff_id = 29 where slot_id = 977
update scheduleSlot set staff_id = 29 where slot_id = 978
update scheduleSlot set staff_id = 29 where slot_id = 979
update scheduleSlot set staff_id = 29 where slot_id = 980
update scheduleSlot set staff_id = 29 where slot_id = 981
update scheduleSlot set staff_id = 29 where slot_id = 982
update scheduleSlot set staff_id = 29 where slot_id = 983
update scheduleSlot set staff_id = 29 where slot_id = 984
update scheduleSlot set staff_id = 18 where slot_id = 985
update scheduleSlot set staff_id = 18 where slot_id = 986
update scheduleSlot set staff_id = 18 where slot_id = 987
update scheduleSlot set staff_id = 18 where slot_id = 988
update scheduleSlot set staff_id = 18 where slot_id = 989
update scheduleSlot set staff_id = 18 where slot_id = 990
update scheduleSlot set staff_id = 18 where slot_id = 991
update scheduleSlot set staff_id = 18 where slot_id = 992
update scheduleSlot set staff_id = 26 where slot_id = 993
update scheduleSlot set staff_id = 26 where slot_id = 994
update scheduleSlot set staff_id = 26 where slot_id = 995
update scheduleSlot set staff_id = 26 where slot_id = 996
update scheduleSlot set staff_id = 26 where slot_id = 997
update scheduleSlot set staff_id = 26 where slot_id = 998
update scheduleSlot set staff_id = 26 where slot_id = 999
update scheduleSlot set staff_id = 26 where slot_id = 1000
update scheduleSlot set staff_id = 28 where slot_id = 1001
update scheduleSlot set staff_id = 28 where slot_id = 1002
update scheduleSlot set staff_id = 28 where slot_id = 1003
update scheduleSlot set staff_id = 28 where slot_id = 1004
update scheduleSlot set staff_id = 28 where slot_id = 1005
update scheduleSlot set staff_id = 28 where slot_id = 1006
update scheduleSlot set staff_id = 28 where slot_id = 1007
update scheduleSlot set staff_id = 28 where slot_id = 1008
update scheduleSlot set staff_id = 32 where slot_id = 1009
update scheduleSlot set staff_id = 32 where slot_id = 1010
update scheduleSlot set staff_id = 32 where slot_id = 1011
update scheduleSlot set staff_id = 32 where slot_id = 1012
update scheduleSlot set staff_id = 32 where slot_id = 1013
update scheduleSlot set staff_id = 32 where slot_id = 1014
update scheduleSlot set staff_id = 32 where slot_id = 1015
update scheduleSlot set staff_id = 32 where slot_id = 1016
update scheduleSlot set staff_id = 21 where slot_id = 1017
update scheduleSlot set staff_id = 21 where slot_id = 1018
update scheduleSlot set staff_id = 21 where slot_id = 1019
update scheduleSlot set staff_id = 21 where slot_id = 1020
update scheduleSlot set staff_id = 21 where slot_id = 1021
update scheduleSlot set staff_id = 21 where slot_id = 1022
update scheduleSlot set staff_id = 21 where slot_id = 1023
update scheduleSlot set staff_id = 21 where slot_id = 1024
update scheduleSlot set staff_id = 27 where slot_id = 1025
update scheduleSlot set staff_id = 27 where slot_id = 1026
update scheduleSlot set staff_id = 27 where slot_id = 1027
update scheduleSlot set staff_id = 27 where slot_id = 1028
update scheduleSlot set staff_id = 27 where slot_id = 1029
update scheduleSlot set staff_id = 27 where slot_id = 1030
update scheduleSlot set staff_id = 27 where slot_id = 1031
update scheduleSlot set staff_id = 27 where slot_id = 1032
update scheduleSlot set staff_id = 17 where slot_id = 1033
update scheduleSlot set staff_id = 17 where slot_id = 1034
update scheduleSlot set staff_id = 17 where slot_id = 1035
update scheduleSlot set staff_id = 17 where slot_id = 1036
update scheduleSlot set staff_id = 17 where slot_id = 1037
update scheduleSlot set staff_id = 17 where slot_id = 1038
update scheduleSlot set staff_id = 17 where slot_id = 1039
update scheduleSlot set staff_id = 17 where slot_id = 1040
update scheduleSlot set staff_id = 29 where slot_id = 1041
update scheduleSlot set staff_id = 29 where slot_id = 1042
update scheduleSlot set staff_id = 29 where slot_id = 1043
update scheduleSlot set staff_id = 29 where slot_id = 1044
update scheduleSlot set staff_id = 29 where slot_id = 1045
update scheduleSlot set staff_id = 29 where slot_id = 1046
update scheduleSlot set staff_id = 29 where slot_id = 1047
update scheduleSlot set staff_id = 29 where slot_id = 1048
update scheduleSlot set staff_id = 18 where slot_id = 1049
update scheduleSlot set staff_id = 18 where slot_id = 1050
update scheduleSlot set staff_id = 18 where slot_id = 1051
update scheduleSlot set staff_id = 18 where slot_id = 1052
update scheduleSlot set staff_id = 18 where slot_id = 1053
update scheduleSlot set staff_id = 18 where slot_id = 1054
update scheduleSlot set staff_id = 18 where slot_id = 1055
update scheduleSlot set staff_id = 18 where slot_id = 1056
update scheduleSlot set staff_id = 26 where slot_id = 1057
update scheduleSlot set staff_id = 26 where slot_id = 1058
update scheduleSlot set staff_id = 26 where slot_id = 1059
update scheduleSlot set staff_id = 26 where slot_id = 1060
update scheduleSlot set staff_id = 26 where slot_id = 1061
update scheduleSlot set staff_id = 26 where slot_id = 1062
update scheduleSlot set staff_id = 26 where slot_id = 1063
update scheduleSlot set staff_id = 26 where slot_id = 1064
update scheduleSlot set staff_id = 28 where slot_id = 1065
update scheduleSlot set staff_id = 28 where slot_id = 1066
update scheduleSlot set staff_id = 28 where slot_id = 1067
update scheduleSlot set staff_id = 28 where slot_id = 1068
update scheduleSlot set staff_id = 28 where slot_id = 1069
update scheduleSlot set staff_id = 28 where slot_id = 1070
update scheduleSlot set staff_id = 28 where slot_id = 1071
update scheduleSlot set staff_id = 28 where slot_id = 1072
update scheduleSlot set staff_id = 32 where slot_id = 1073
update scheduleSlot set staff_id = 32 where slot_id = 1074
update scheduleSlot set staff_id = 32 where slot_id = 1075
update scheduleSlot set staff_id = 32 where slot_id = 1076
update scheduleSlot set staff_id = 32 where slot_id = 1077
update scheduleSlot set staff_id = 32 where slot_id = 1078
update scheduleSlot set staff_id = 32 where slot_id = 1079
update scheduleSlot set staff_id = 32 where slot_id = 1080
update scheduleSlot set staff_id = 21 where slot_id = 1081
update scheduleSlot set staff_id = 21 where slot_id = 1082
update scheduleSlot set staff_id = 21 where slot_id = 1083
update scheduleSlot set staff_id = 21 where slot_id = 1084
update scheduleSlot set staff_id = 21 where slot_id = 1085
update scheduleSlot set staff_id = 21 where slot_id = 1086
update scheduleSlot set staff_id = 21 where slot_id = 1087
update scheduleSlot set staff_id = 21 where slot_id = 1088
update scheduleSlot set staff_id = 27 where slot_id = 1089
update scheduleSlot set staff_id = 27 where slot_id = 1090
update scheduleSlot set staff_id = 27 where slot_id = 1091
update scheduleSlot set staff_id = 27 where slot_id = 1092
update scheduleSlot set staff_id = 27 where slot_id = 1093
update scheduleSlot set staff_id = 27 where slot_id = 1094
update scheduleSlot set staff_id = 27 where slot_id = 1095
update scheduleSlot set staff_id = 27 where slot_id = 1096
update scheduleSlot set staff_id = 17 where slot_id = 1097
update scheduleSlot set staff_id = 17 where slot_id = 1098
update scheduleSlot set staff_id = 17 where slot_id = 1099
update scheduleSlot set staff_id = 17 where slot_id = 1100
update scheduleSlot set staff_id = 17 where slot_id = 1101
update scheduleSlot set staff_id = 17 where slot_id = 1102
update scheduleSlot set staff_id = 17 where slot_id = 1103
update scheduleSlot set staff_id = 17 where slot_id = 1104
update scheduleSlot set staff_id = 29 where slot_id = 1105
update scheduleSlot set staff_id = 29 where slot_id = 1106
update scheduleSlot set staff_id = 29 where slot_id = 1107
update scheduleSlot set staff_id = 29 where slot_id = 1108
update scheduleSlot set staff_id = 29 where slot_id = 1109
update scheduleSlot set staff_id = 29 where slot_id = 1110
update scheduleSlot set staff_id = 29 where slot_id = 1111
update scheduleSlot set staff_id = 29 where slot_id = 1112
update scheduleSlot set staff_id = 18 where slot_id = 1113
update scheduleSlot set staff_id = 18 where slot_id = 1114
update scheduleSlot set staff_id = 18 where slot_id = 1115
update scheduleSlot set staff_id = 18 where slot_id = 1116
update scheduleSlot set staff_id = 18 where slot_id = 1117
update scheduleSlot set staff_id = 18 where slot_id = 1118
update scheduleSlot set staff_id = 18 where slot_id = 1119
update scheduleSlot set staff_id = 18 where slot_id = 1120
update scheduleSlot set staff_id = 26 where slot_id = 1121
update scheduleSlot set staff_id = 26 where slot_id = 1122
update scheduleSlot set staff_id = 26 where slot_id = 1123
update scheduleSlot set staff_id = 26 where slot_id = 1124
update scheduleSlot set staff_id = 26 where slot_id = 1125
update scheduleSlot set staff_id = 26 where slot_id = 1126
update scheduleSlot set staff_id = 26 where slot_id = 1127
update scheduleSlot set staff_id = 26 where slot_id = 1128
update scheduleSlot set staff_id = 28 where slot_id = 1129
update scheduleSlot set staff_id = 28 where slot_id = 1130
update scheduleSlot set staff_id = 28 where slot_id = 1131
update scheduleSlot set staff_id = 28 where slot_id = 1132
update scheduleSlot set staff_id = 28 where slot_id = 1133
update scheduleSlot set staff_id = 28 where slot_id = 1134
update scheduleSlot set staff_id = 28 where slot_id = 1135
update scheduleSlot set staff_id = 28 where slot_id = 1136
update scheduleSlot set staff_id = 32 where slot_id = 1137
update scheduleSlot set staff_id = 32 where slot_id = 1138
update scheduleSlot set staff_id = 32 where slot_id = 1139
update scheduleSlot set staff_id = 32 where slot_id = 1140
update scheduleSlot set staff_id = 32 where slot_id = 1141
update scheduleSlot set staff_id = 32 where slot_id = 1142
update scheduleSlot set staff_id = 32 where slot_id = 1143
update scheduleSlot set staff_id = 32 where slot_id = 1144
update scheduleSlot set staff_id = 21 where slot_id = 1145
update scheduleSlot set staff_id = 21 where slot_id = 1146
update scheduleSlot set staff_id = 21 where slot_id = 1147
update scheduleSlot set staff_id = 21 where slot_id = 1148
update scheduleSlot set staff_id = 21 where slot_id = 1149
update scheduleSlot set staff_id = 21 where slot_id = 1150
update scheduleSlot set staff_id = 21 where slot_id = 1151
update scheduleSlot set staff_id = 21 where slot_id = 1152

update scheduleSlot set staff_id = 20 where slot_id = 1155
update scheduleSlot set staff_id = 20 where slot_id = 1156
update scheduleSlot set staff_id = 20 where slot_id = 1157
update scheduleSlot set staff_id = 20 where slot_id = 1158
update scheduleSlot set staff_id = 20 where slot_id = 1159
update scheduleSlot set staff_id = 17 where slot_id = 1160
update scheduleSlot set staff_id = 17 where slot_id = 1161
update scheduleSlot set staff_id = 17 where slot_id = 1162
update scheduleSlot set staff_id = 17 where slot_id = 1163
update scheduleSlot set staff_id = 17 where slot_id = 1164

update scheduleSlot set staff_id = 6 where slot_id = 1171
update scheduleSlot set staff_id = 6 where slot_id = 1172
update scheduleSlot set staff_id = 6 where slot_id = 1173
update scheduleSlot set staff_id = 6 where slot_id = 1174
update scheduleSlot set staff_id = 6 where slot_id = 1175
update scheduleSlot set staff_id = 12 where slot_id = 1176
update scheduleSlot set staff_id = 12 where slot_id = 1177
update scheduleSlot set staff_id = 12 where slot_id = 1178
update scheduleSlot set staff_id = 12 where slot_id = 1179
update scheduleSlot set staff_id = 12 where slot_id = 1180

update scheduleSlot set staff_id = 1 where slot_id = 1187
update scheduleSlot set staff_id = 1 where slot_id = 1188
update scheduleSlot set staff_id = 1 where slot_id = 1189
update scheduleSlot set staff_id = 1 where slot_id = 1190
update scheduleSlot set staff_id = 1 where slot_id = 1191
update scheduleSlot set staff_id = 1 where slot_id = 1192
update scheduleSlot set staff_id = 4 where slot_id = 1193
update scheduleSlot set staff_id = 4 where slot_id = 1194
update scheduleSlot set staff_id = 4 where slot_id = 1195
update scheduleSlot set staff_id = 4 where slot_id = 1196

update scheduleSlot set staff_id = 3 where slot_id = 1203
update scheduleSlot set staff_id = 3 where slot_id = 1204
update scheduleSlot set staff_id = 3 where slot_id = 1205
update scheduleSlot set staff_id = 3 where slot_id = 1206
update scheduleSlot set staff_id = 3 where slot_id = 1207
update scheduleSlot set staff_id = 3 where slot_id = 1208
update scheduleSlot set staff_id = 5 where slot_id = 1209
update scheduleSlot set staff_id = 5 where slot_id = 1210
update scheduleSlot set staff_id = 5 where slot_id = 1211
update scheduleSlot set staff_id = 5 where slot_id = 1212

update scheduleSlot set staff_id = 20 where slot_id = 1281
update scheduleSlot set staff_id = 20 where slot_id = 1282
update scheduleSlot set staff_id = 20 where slot_id = 1283
update scheduleSlot set staff_id = 20 where slot_id = 1284
update scheduleSlot set staff_id = 20 where slot_id = 1285
update scheduleSlot set staff_id = 20 where slot_id = 1286
update scheduleSlot set staff_id = 20 where slot_id = 1287
update scheduleSlot set staff_id = 17 where slot_id = 1288
update scheduleSlot set staff_id = 17 where slot_id = 1289
update scheduleSlot set staff_id = 17 where slot_id = 1290
update scheduleSlot set staff_id = 17 where slot_id = 1291
update scheduleSlot set staff_id = 17 where slot_id = 1292
update scheduleSlot set staff_id = 17 where slot_id = 1293
update scheduleSlot set staff_id = 17 where slot_id = 1294
update scheduleSlot set staff_id = 17 where slot_id = 1295
update scheduleSlot set staff_id = 17 where slot_id = 1296
update scheduleSlot set staff_id = 6 where slot_id = 1297
update scheduleSlot set staff_id = 6 where slot_id = 1298
update scheduleSlot set staff_id = 6 where slot_id = 1299
update scheduleSlot set staff_id = 6 where slot_id = 1300
update scheduleSlot set staff_id = 6 where slot_id = 1301
update scheduleSlot set staff_id = 6 where slot_id = 1302
update scheduleSlot set staff_id = 6 where slot_id = 1303
update scheduleSlot set staff_id = 12 where slot_id = 1304
update scheduleSlot set staff_id = 12 where slot_id = 1305
update scheduleSlot set staff_id = 12 where slot_id = 1306
update scheduleSlot set staff_id = 12 where slot_id = 1307
update scheduleSlot set staff_id = 12 where slot_id = 1308
update scheduleSlot set staff_id = 12 where slot_id = 1309
update scheduleSlot set staff_id = 12 where slot_id = 1310
update scheduleSlot set staff_id = 12 where slot_id = 1311
update scheduleSlot set staff_id = 12 where slot_id = 1312
update scheduleSlot set staff_id = 1 where slot_id = 1313
update scheduleSlot set staff_id = 1 where slot_id = 1314
update scheduleSlot set staff_id = 1 where slot_id = 1315
update scheduleSlot set staff_id = 1 where slot_id = 1316
update scheduleSlot set staff_id = 1 where slot_id = 1317
update scheduleSlot set staff_id = 1 where slot_id = 1318
update scheduleSlot set staff_id = 1 where slot_id = 1319
update scheduleSlot set staff_id = 1 where slot_id = 1320
update scheduleSlot set staff_id = 4 where slot_id = 1321
update scheduleSlot set staff_id = 4 where slot_id = 1322
update scheduleSlot set staff_id = 4 where slot_id = 1323
update scheduleSlot set staff_id = 4 where slot_id = 1324
update scheduleSlot set staff_id = 4 where slot_id = 1325
update scheduleSlot set staff_id = 4 where slot_id = 1326
update scheduleSlot set staff_id = 4 where slot_id = 1327
update scheduleSlot set staff_id = 4 where slot_id = 1328
update scheduleSlot set staff_id = 3 where slot_id = 1329
update scheduleSlot set staff_id = 3 where slot_id = 1330
update scheduleSlot set staff_id = 3 where slot_id = 1331
update scheduleSlot set staff_id = 3 where slot_id = 1332
update scheduleSlot set staff_id = 3 where slot_id = 1333
update scheduleSlot set staff_id = 3 where slot_id = 1334
update scheduleSlot set staff_id = 3 where slot_id = 1335
update scheduleSlot set staff_id = 3 where slot_id = 1336
update scheduleSlot set staff_id = 5 where slot_id = 1337
update scheduleSlot set staff_id = 5 where slot_id = 1338
update scheduleSlot set staff_id = 5 where slot_id = 1339
update scheduleSlot set staff_id = 5 where slot_id = 1340
update scheduleSlot set staff_id = 5 where slot_id = 1341
update scheduleSlot set staff_id = 5 where slot_id = 1342
update scheduleSlot set staff_id = 5 where slot_id = 1343
update scheduleSlot set staff_id = 5 where slot_id = 1344
update scheduleSlot set staff_id = 24 where slot_id = 1345
update scheduleSlot set staff_id = 24 where slot_id = 1346
update scheduleSlot set staff_id = 24 where slot_id = 1347
update scheduleSlot set staff_id = 24 where slot_id = 1348
update scheduleSlot set staff_id = 24 where slot_id = 1349
update scheduleSlot set staff_id = 24 where slot_id = 1350
update scheduleSlot set staff_id = 24 where slot_id = 1351
update scheduleSlot set staff_id = 24 where slot_id = 1352
update scheduleSlot set staff_id = 30 where slot_id = 1353
update scheduleSlot set staff_id = 30 where slot_id = 1354
update scheduleSlot set staff_id = 30 where slot_id = 1355
update scheduleSlot set staff_id = 30 where slot_id = 1356
update scheduleSlot set staff_id = 30 where slot_id = 1357
update scheduleSlot set staff_id = 30 where slot_id = 1358
update scheduleSlot set staff_id = 30 where slot_id = 1359
update scheduleSlot set staff_id = 30 where slot_id = 1360
update scheduleSlot set staff_id = 19 where slot_id = 1361
update scheduleSlot set staff_id = 19 where slot_id = 1362
update scheduleSlot set staff_id = 19 where slot_id = 1363
update scheduleSlot set staff_id = 19 where slot_id = 1364
update scheduleSlot set staff_id = 19 where slot_id = 1365
update scheduleSlot set staff_id = 19 where slot_id = 1366
update scheduleSlot set staff_id = 19 where slot_id = 1367
update scheduleSlot set staff_id = 19 where slot_id = 1368
update scheduleSlot set staff_id = 16 where slot_id = 1369
update scheduleSlot set staff_id = 16 where slot_id = 1370
update scheduleSlot set staff_id = 16 where slot_id = 1371
update scheduleSlot set staff_id = 16 where slot_id = 1372
update scheduleSlot set staff_id = 16 where slot_id = 1373
update scheduleSlot set staff_id = 16 where slot_id = 1374
update scheduleSlot set staff_id = 16 where slot_id = 1375
update scheduleSlot set staff_id = 16 where slot_id = 1376
update scheduleSlot set staff_id = 15 where slot_id = 1377
update scheduleSlot set staff_id = 15 where slot_id = 1378
update scheduleSlot set staff_id = 15 where slot_id = 1379
update scheduleSlot set staff_id = 15 where slot_id = 1380
update scheduleSlot set staff_id = 15 where slot_id = 1381
update scheduleSlot set staff_id = 15 where slot_id = 1382
update scheduleSlot set staff_id = 15 where slot_id = 1383
update scheduleSlot set staff_id = 15 where slot_id = 1384
update scheduleSlot set staff_id = 11 where slot_id = 1385
update scheduleSlot set staff_id = 11 where slot_id = 1386
update scheduleSlot set staff_id = 11 where slot_id = 1387
update scheduleSlot set staff_id = 11 where slot_id = 1388
update scheduleSlot set staff_id = 11 where slot_id = 1389
update scheduleSlot set staff_id = 11 where slot_id = 1390
update scheduleSlot set staff_id = 11 where slot_id = 1391
update scheduleSlot set staff_id = 11 where slot_id = 1392
update scheduleSlot set staff_id = 13 where slot_id = 1393
update scheduleSlot set staff_id = 13 where slot_id = 1394
update scheduleSlot set staff_id = 13 where slot_id = 1395
update scheduleSlot set staff_id = 13 where slot_id = 1396
update scheduleSlot set staff_id = 13 where slot_id = 1397
update scheduleSlot set staff_id = 13 where slot_id = 1398
update scheduleSlot set staff_id = 13 where slot_id = 1399
update scheduleSlot set staff_id = 13 where slot_id = 1400
update scheduleSlot set staff_id = 9 where slot_id = 1401
update scheduleSlot set staff_id = 9 where slot_id = 1402
update scheduleSlot set staff_id = 9 where slot_id = 1403
update scheduleSlot set staff_id = 9 where slot_id = 1404
update scheduleSlot set staff_id = 9 where slot_id = 1405
update scheduleSlot set staff_id = 9 where slot_id = 1406
update scheduleSlot set staff_id = 9 where slot_id = 1407
update scheduleSlot set staff_id = 9 where slot_id = 1408
update scheduleSlot set staff_id = 24 where slot_id = 1409
update scheduleSlot set staff_id = 24 where slot_id = 1410
update scheduleSlot set staff_id = 24 where slot_id = 1411
update scheduleSlot set staff_id = 24 where slot_id = 1412
update scheduleSlot set staff_id = 24 where slot_id = 1413
update scheduleSlot set staff_id = 24 where slot_id = 1414
update scheduleSlot set staff_id = 24 where slot_id = 1415
update scheduleSlot set staff_id = 24 where slot_id = 1416
update scheduleSlot set staff_id = 30 where slot_id = 1417
update scheduleSlot set staff_id = 30 where slot_id = 1418
update scheduleSlot set staff_id = 30 where slot_id = 1419
update scheduleSlot set staff_id = 30 where slot_id = 1420
update scheduleSlot set staff_id = 30 where slot_id = 1421
update scheduleSlot set staff_id = 30 where slot_id = 1422
update scheduleSlot set staff_id = 30 where slot_id = 1423
update scheduleSlot set staff_id = 30 where slot_id = 1424
update scheduleSlot set staff_id = 19 where slot_id = 1425
update scheduleSlot set staff_id = 19 where slot_id = 1426
update scheduleSlot set staff_id = 19 where slot_id = 1427
update scheduleSlot set staff_id = 19 where slot_id = 1428
update scheduleSlot set staff_id = 19 where slot_id = 1429
update scheduleSlot set staff_id = 19 where slot_id = 1430
update scheduleSlot set staff_id = 19 where slot_id = 1431
update scheduleSlot set staff_id = 19 where slot_id = 1432
update scheduleSlot set staff_id = 16 where slot_id = 1433
update scheduleSlot set staff_id = 16 where slot_id = 1434
update scheduleSlot set staff_id = 16 where slot_id = 1435
update scheduleSlot set staff_id = 16 where slot_id = 1436
update scheduleSlot set staff_id = 16 where slot_id = 1437
update scheduleSlot set staff_id = 16 where slot_id = 1438
update scheduleSlot set staff_id = 16 where slot_id = 1439
update scheduleSlot set staff_id = 16 where slot_id = 1440
update scheduleSlot set staff_id = 15 where slot_id = 1441
update scheduleSlot set staff_id = 15 where slot_id = 1442
update scheduleSlot set staff_id = 15 where slot_id = 1443
update scheduleSlot set staff_id = 15 where slot_id = 1444
update scheduleSlot set staff_id = 15 where slot_id = 1445
update scheduleSlot set staff_id = 15 where slot_id = 1446
update scheduleSlot set staff_id = 15 where slot_id = 1447
update scheduleSlot set staff_id = 15 where slot_id = 1448
update scheduleSlot set staff_id = 11 where slot_id = 1449
update scheduleSlot set staff_id = 11 where slot_id = 1450
update scheduleSlot set staff_id = 11 where slot_id = 1451
update scheduleSlot set staff_id = 11 where slot_id = 1452
update scheduleSlot set staff_id = 11 where slot_id = 1453
update scheduleSlot set staff_id = 11 where slot_id = 1454
update scheduleSlot set staff_id = 11 where slot_id = 1455
update scheduleSlot set staff_id = 11 where slot_id = 1456
update scheduleSlot set staff_id = 13 where slot_id = 1457
update scheduleSlot set staff_id = 13 where slot_id = 1458
update scheduleSlot set staff_id = 13 where slot_id = 1459
update scheduleSlot set staff_id = 13 where slot_id = 1460
update scheduleSlot set staff_id = 13 where slot_id = 1461
update scheduleSlot set staff_id = 13 where slot_id = 1462
update scheduleSlot set staff_id = 13 where slot_id = 1463
update scheduleSlot set staff_id = 13 where slot_id = 1464
update scheduleSlot set staff_id = 9 where slot_id = 1465
update scheduleSlot set staff_id = 9 where slot_id = 1466
update scheduleSlot set staff_id = 9 where slot_id = 1467
update scheduleSlot set staff_id = 9 where slot_id = 1468
update scheduleSlot set staff_id = 9 where slot_id = 1469
update scheduleSlot set staff_id = 9 where slot_id = 1470
update scheduleSlot set staff_id = 9 where slot_id = 1471
update scheduleSlot set staff_id = 9 where slot_id = 1472
update scheduleSlot set staff_id = 24 where slot_id = 1473
update scheduleSlot set staff_id = 24 where slot_id = 1474
update scheduleSlot set staff_id = 24 where slot_id = 1475
update scheduleSlot set staff_id = 24 where slot_id = 1476
update scheduleSlot set staff_id = 24 where slot_id = 1477
update scheduleSlot set staff_id = 24 where slot_id = 1478
update scheduleSlot set staff_id = 24 where slot_id = 1479
update scheduleSlot set staff_id = 24 where slot_id = 1480
update scheduleSlot set staff_id = 30 where slot_id = 1481
update scheduleSlot set staff_id = 30 where slot_id = 1482
update scheduleSlot set staff_id = 30 where slot_id = 1483
update scheduleSlot set staff_id = 30 where slot_id = 1484
update scheduleSlot set staff_id = 30 where slot_id = 1485
update scheduleSlot set staff_id = 30 where slot_id = 1486
update scheduleSlot set staff_id = 30 where slot_id = 1487
update scheduleSlot set staff_id = 30 where slot_id = 1488
update scheduleSlot set staff_id = 19 where slot_id = 1489
update scheduleSlot set staff_id = 19 where slot_id = 1490
update scheduleSlot set staff_id = 19 where slot_id = 1491
update scheduleSlot set staff_id = 19 where slot_id = 1492
update scheduleSlot set staff_id = 19 where slot_id = 1493
update scheduleSlot set staff_id = 19 where slot_id = 1494
update scheduleSlot set staff_id = 19 where slot_id = 1495
update scheduleSlot set staff_id = 19 where slot_id = 1496
update scheduleSlot set staff_id = 16 where slot_id = 1497
update scheduleSlot set staff_id = 16 where slot_id = 1498
update scheduleSlot set staff_id = 16 where slot_id = 1499
update scheduleSlot set staff_id = 16 where slot_id = 1500
update scheduleSlot set staff_id = 16 where slot_id = 1501
update scheduleSlot set staff_id = 16 where slot_id = 1502
update scheduleSlot set staff_id = 16 where slot_id = 1503
update scheduleSlot set staff_id = 16 where slot_id = 1504
update scheduleSlot set staff_id = 15 where slot_id = 1505
update scheduleSlot set staff_id = 15 where slot_id = 1506
update scheduleSlot set staff_id = 15 where slot_id = 1507
update scheduleSlot set staff_id = 15 where slot_id = 1508
update scheduleSlot set staff_id = 15 where slot_id = 1509
update scheduleSlot set staff_id = 15 where slot_id = 1510
update scheduleSlot set staff_id = 15 where slot_id = 1511
update scheduleSlot set staff_id = 15 where slot_id = 1512
update scheduleSlot set staff_id = 11 where slot_id = 1513
update scheduleSlot set staff_id = 11 where slot_id = 1514
update scheduleSlot set staff_id = 11 where slot_id = 1515
update scheduleSlot set staff_id = 11 where slot_id = 1516
update scheduleSlot set staff_id = 11 where slot_id = 1517
update scheduleSlot set staff_id = 11 where slot_id = 1518
update scheduleSlot set staff_id = 11 where slot_id = 1519
update scheduleSlot set staff_id = 11 where slot_id = 1520
update scheduleSlot set staff_id = 13 where slot_id = 1521
update scheduleSlot set staff_id = 13 where slot_id = 1522
update scheduleSlot set staff_id = 13 where slot_id = 1523
update scheduleSlot set staff_id = 13 where slot_id = 1524
update scheduleSlot set staff_id = 13 where slot_id = 1525
update scheduleSlot set staff_id = 13 where slot_id = 1526
update scheduleSlot set staff_id = 13 where slot_id = 1527
update scheduleSlot set staff_id = 13 where slot_id = 1528
update scheduleSlot set staff_id = 9 where slot_id = 1529
update scheduleSlot set staff_id = 9 where slot_id = 1530
update scheduleSlot set staff_id = 9 where slot_id = 1531
update scheduleSlot set staff_id = 9 where slot_id = 1532
update scheduleSlot set staff_id = 9 where slot_id = 1533
update scheduleSlot set staff_id = 9 where slot_id = 1534
update scheduleSlot set staff_id = 9 where slot_id = 1535
update scheduleSlot set staff_id = 9 where slot_id = 1536
update scheduleSlot set staff_id = 27 where slot_id = 1537
update scheduleSlot set staff_id = 27 where slot_id = 1538
update scheduleSlot set staff_id = 27 where slot_id = 1539
update scheduleSlot set staff_id = 27 where slot_id = 1540
update scheduleSlot set staff_id = 27 where slot_id = 1541
update scheduleSlot set staff_id = 27 where slot_id = 1542
update scheduleSlot set staff_id = 27 where slot_id = 1543
update scheduleSlot set staff_id = 27 where slot_id = 1544
update scheduleSlot set staff_id = 17 where slot_id = 1545
update scheduleSlot set staff_id = 17 where slot_id = 1546
update scheduleSlot set staff_id = 17 where slot_id = 1547
update scheduleSlot set staff_id = 17 where slot_id = 1548
update scheduleSlot set staff_id = 17 where slot_id = 1549
update scheduleSlot set staff_id = 17 where slot_id = 1550
update scheduleSlot set staff_id = 17 where slot_id = 1551
update scheduleSlot set staff_id = 17 where slot_id = 1552
update scheduleSlot set staff_id = 29 where slot_id = 1553
update scheduleSlot set staff_id = 29 where slot_id = 1554
update scheduleSlot set staff_id = 29 where slot_id = 1555
update scheduleSlot set staff_id = 29 where slot_id = 1556
update scheduleSlot set staff_id = 29 where slot_id = 1557
update scheduleSlot set staff_id = 29 where slot_id = 1558
update scheduleSlot set staff_id = 29 where slot_id = 1559
update scheduleSlot set staff_id = 29 where slot_id = 1560
update scheduleSlot set staff_id = 18 where slot_id = 1561
update scheduleSlot set staff_id = 18 where slot_id = 1562
update scheduleSlot set staff_id = 18 where slot_id = 1563
update scheduleSlot set staff_id = 18 where slot_id = 1564
update scheduleSlot set staff_id = 18 where slot_id = 1565
update scheduleSlot set staff_id = 18 where slot_id = 1566
update scheduleSlot set staff_id = 18 where slot_id = 1567
update scheduleSlot set staff_id = 18 where slot_id = 1568
update scheduleSlot set staff_id = 26 where slot_id = 1569
update scheduleSlot set staff_id = 26 where slot_id = 1570
update scheduleSlot set staff_id = 26 where slot_id = 1571
update scheduleSlot set staff_id = 26 where slot_id = 1572
update scheduleSlot set staff_id = 26 where slot_id = 1573
update scheduleSlot set staff_id = 26 where slot_id = 1574
update scheduleSlot set staff_id = 26 where slot_id = 1575
update scheduleSlot set staff_id = 26 where slot_id = 1576
update scheduleSlot set staff_id = 28 where slot_id = 1577
update scheduleSlot set staff_id = 28 where slot_id = 1578
update scheduleSlot set staff_id = 28 where slot_id = 1579
update scheduleSlot set staff_id = 28 where slot_id = 1580
update scheduleSlot set staff_id = 28 where slot_id = 1581
update scheduleSlot set staff_id = 28 where slot_id = 1582
update scheduleSlot set staff_id = 28 where slot_id = 1583
update scheduleSlot set staff_id = 28 where slot_id = 1584
update scheduleSlot set staff_id = 32 where slot_id = 1585
update scheduleSlot set staff_id = 32 where slot_id = 1586
update scheduleSlot set staff_id = 32 where slot_id = 1587
update scheduleSlot set staff_id = 32 where slot_id = 1588
update scheduleSlot set staff_id = 32 where slot_id = 1589
update scheduleSlot set staff_id = 32 where slot_id = 1590
update scheduleSlot set staff_id = 32 where slot_id = 1591
update scheduleSlot set staff_id = 32 where slot_id = 1592
update scheduleSlot set staff_id = 21 where slot_id = 1593
update scheduleSlot set staff_id = 21 where slot_id = 1594
update scheduleSlot set staff_id = 21 where slot_id = 1595
update scheduleSlot set staff_id = 21 where slot_id = 1596
update scheduleSlot set staff_id = 21 where slot_id = 1597
update scheduleSlot set staff_id = 21 where slot_id = 1598
update scheduleSlot set staff_id = 21 where slot_id = 1599
update scheduleSlot set staff_id = 21 where slot_id = 1600

update scheduleSlot set staff_id = 27 where slot_id = 1603
update scheduleSlot set staff_id = 27 where slot_id = 1604
update scheduleSlot set staff_id = 27 where slot_id = 1605
update scheduleSlot set staff_id = 27 where slot_id = 1606
update scheduleSlot set staff_id = 27 where slot_id = 1607
update scheduleSlot set staff_id = 27 where slot_id = 1608
update scheduleSlot set staff_id = 17 where slot_id = 1609
update scheduleSlot set staff_id = 17 where slot_id = 1610
update scheduleSlot set staff_id = 17 where slot_id = 1611
update scheduleSlot set staff_id = 17 where slot_id = 1612

update scheduleSlot set staff_id = 29 where slot_id = 1619
update scheduleSlot set staff_id = 29 where slot_id = 1620
update scheduleSlot set staff_id = 29 where slot_id = 1621
update scheduleSlot set staff_id = 29 where slot_id = 1622
update scheduleSlot set staff_id = 29 where slot_id = 1623
update scheduleSlot set staff_id = 29 where slot_id = 1624
update scheduleSlot set staff_id = 18 where slot_id = 1625
update scheduleSlot set staff_id = 18 where slot_id = 1626
update scheduleSlot set staff_id = 18 where slot_id = 1627
update scheduleSlot set staff_id = 18 where slot_id = 1628

update scheduleSlot set staff_id = 26 where slot_id = 1635
update scheduleSlot set staff_id = 26 where slot_id = 1636
update scheduleSlot set staff_id = 26 where slot_id = 1637
update scheduleSlot set staff_id = 26 where slot_id = 1638
update scheduleSlot set staff_id = 26 where slot_id = 1639
update scheduleSlot set staff_id = 26 where slot_id = 1640
update scheduleSlot set staff_id = 28 where slot_id = 1641
update scheduleSlot set staff_id = 28 where slot_id = 1642
update scheduleSlot set staff_id = 28 where slot_id = 1643
update scheduleSlot set staff_id = 28 where slot_id = 1644

update scheduleSlot set staff_id = 32 where slot_id = 1651
update scheduleSlot set staff_id = 32 where slot_id = 1652
update scheduleSlot set staff_id = 32 where slot_id = 1653
update scheduleSlot set staff_id = 32 where slot_id = 1654
update scheduleSlot set staff_id = 32 where slot_id = 1655
update scheduleSlot set staff_id = 32 where slot_id = 1656
update scheduleSlot set staff_id = 21 where slot_id = 1657
update scheduleSlot set staff_id = 21 where slot_id = 1658
update scheduleSlot set staff_id = 21 where slot_id = 1659
update scheduleSlot set staff_id = 21 where slot_id = 1660

update scheduleSlot set staff_id = 20 where slot_id = 1729
update scheduleSlot set staff_id = 20 where slot_id = 1730
update scheduleSlot set staff_id = 20 where slot_id = 1731
update scheduleSlot set staff_id = 20 where slot_id = 1732
update scheduleSlot set staff_id = 20 where slot_id = 1733
update scheduleSlot set staff_id = 20 where slot_id = 1734
update scheduleSlot set staff_id = 20 where slot_id = 1735
update scheduleSlot set staff_id = 17 where slot_id = 1736
update scheduleSlot set staff_id = 17 where slot_id = 1737
update scheduleSlot set staff_id = 17 where slot_id = 1738
update scheduleSlot set staff_id = 17 where slot_id = 1739
update scheduleSlot set staff_id = 17 where slot_id = 1740
update scheduleSlot set staff_id = 17 where slot_id = 1741
update scheduleSlot set staff_id = 17 where slot_id = 1742
update scheduleSlot set staff_id = 17 where slot_id = 1743
update scheduleSlot set staff_id = 17 where slot_id = 1744
update scheduleSlot set staff_id = 6 where slot_id = 1745
update scheduleSlot set staff_id = 6 where slot_id = 1746
update scheduleSlot set staff_id = 6 where slot_id = 1747
update scheduleSlot set staff_id = 6 where slot_id = 1748
update scheduleSlot set staff_id = 6 where slot_id = 1749
update scheduleSlot set staff_id = 6 where slot_id = 1750
update scheduleSlot set staff_id = 6 where slot_id = 1751
update scheduleSlot set staff_id = 12 where slot_id = 1752
update scheduleSlot set staff_id = 12 where slot_id = 1753
update scheduleSlot set staff_id = 12 where slot_id = 1754
update scheduleSlot set staff_id = 12 where slot_id = 1755
update scheduleSlot set staff_id = 12 where slot_id = 1756
update scheduleSlot set staff_id = 12 where slot_id = 1757
update scheduleSlot set staff_id = 12 where slot_id = 1758
update scheduleSlot set staff_id = 12 where slot_id = 1759
update scheduleSlot set staff_id = 12 where slot_id = 1760
update scheduleSlot set staff_id = 1 where slot_id = 1761
update scheduleSlot set staff_id = 1 where slot_id = 1762
update scheduleSlot set staff_id = 1 where slot_id = 1763
update scheduleSlot set staff_id = 1 where slot_id = 1764
update scheduleSlot set staff_id = 1 where slot_id = 1765
update scheduleSlot set staff_id = 1 where slot_id = 1766
update scheduleSlot set staff_id = 1 where slot_id = 1767
update scheduleSlot set staff_id = 1 where slot_id = 1768
update scheduleSlot set staff_id = 4 where slot_id = 1769
update scheduleSlot set staff_id = 4 where slot_id = 1770
update scheduleSlot set staff_id = 4 where slot_id = 1771
update scheduleSlot set staff_id = 4 where slot_id = 1772
update scheduleSlot set staff_id = 4 where slot_id = 1773
update scheduleSlot set staff_id = 4 where slot_id = 1774
update scheduleSlot set staff_id = 4 where slot_id = 1775
update scheduleSlot set staff_id = 4 where slot_id = 1776
update scheduleSlot set staff_id = 3 where slot_id = 1777
update scheduleSlot set staff_id = 3 where slot_id = 1778
update scheduleSlot set staff_id = 3 where slot_id = 1779
update scheduleSlot set staff_id = 3 where slot_id = 1780
update scheduleSlot set staff_id = 3 where slot_id = 1781
update scheduleSlot set staff_id = 3 where slot_id = 1782
update scheduleSlot set staff_id = 3 where slot_id = 1783
update scheduleSlot set staff_id = 3 where slot_id = 1784
update scheduleSlot set staff_id = 5 where slot_id = 1785
update scheduleSlot set staff_id = 5 where slot_id = 1786
update scheduleSlot set staff_id = 5 where slot_id = 1787
update scheduleSlot set staff_id = 5 where slot_id = 1788
update scheduleSlot set staff_id = 5 where slot_id = 1789
update scheduleSlot set staff_id = 5 where slot_id = 1790
update scheduleSlot set staff_id = 5 where slot_id = 1791
update scheduleSlot set staff_id = 5 where slot_id = 1792
update scheduleSlot set staff_id = 20 where slot_id = 1793
update scheduleSlot set staff_id = 20 where slot_id = 1794
update scheduleSlot set staff_id = 20 where slot_id = 1795
update scheduleSlot set staff_id = 20 where slot_id = 1796
update scheduleSlot set staff_id = 20 where slot_id = 1797
update scheduleSlot set staff_id = 20 where slot_id = 1798
update scheduleSlot set staff_id = 20 where slot_id = 1799
update scheduleSlot set staff_id = 17 where slot_id = 1800
update scheduleSlot set staff_id = 17 where slot_id = 1801
update scheduleSlot set staff_id = 17 where slot_id = 1802
update scheduleSlot set staff_id = 17 where slot_id = 1803
update scheduleSlot set staff_id = 17 where slot_id = 1804
update scheduleSlot set staff_id = 17 where slot_id = 1805
update scheduleSlot set staff_id = 17 where slot_id = 1806
update scheduleSlot set staff_id = 17 where slot_id = 1807
update scheduleSlot set staff_id = 17 where slot_id = 1808
update scheduleSlot set staff_id = 6 where slot_id = 1809
update scheduleSlot set staff_id = 6 where slot_id = 1810
update scheduleSlot set staff_id = 6 where slot_id = 1811
update scheduleSlot set staff_id = 6 where slot_id = 1812
update scheduleSlot set staff_id = 6 where slot_id = 1813
update scheduleSlot set staff_id = 6 where slot_id = 1814
update scheduleSlot set staff_id = 6 where slot_id = 1815
update scheduleSlot set staff_id = 12 where slot_id = 1816
update scheduleSlot set staff_id = 12 where slot_id = 1817
update scheduleSlot set staff_id = 12 where slot_id = 1818
update scheduleSlot set staff_id = 12 where slot_id = 1819
update scheduleSlot set staff_id = 12 where slot_id = 1820
update scheduleSlot set staff_id = 12 where slot_id = 1821
update scheduleSlot set staff_id = 12 where slot_id = 1822
update scheduleSlot set staff_id = 12 where slot_id = 1823
update scheduleSlot set staff_id = 12 where slot_id = 1824
update scheduleSlot set staff_id = 1 where slot_id = 1825
update scheduleSlot set staff_id = 1 where slot_id = 1826
update scheduleSlot set staff_id = 1 where slot_id = 1827
update scheduleSlot set staff_id = 1 where slot_id = 1828
update scheduleSlot set staff_id = 1 where slot_id = 1829
update scheduleSlot set staff_id = 1 where slot_id = 1830
update scheduleSlot set staff_id = 1 where slot_id = 1831
update scheduleSlot set staff_id = 1 where slot_id = 1832
update scheduleSlot set staff_id = 4 where slot_id = 1833
update scheduleSlot set staff_id = 4 where slot_id = 1834
update scheduleSlot set staff_id = 4 where slot_id = 1835
update scheduleSlot set staff_id = 4 where slot_id = 1836
update scheduleSlot set staff_id = 4 where slot_id = 1837
update scheduleSlot set staff_id = 4 where slot_id = 1838
update scheduleSlot set staff_id = 4 where slot_id = 1839
update scheduleSlot set staff_id = 4 where slot_id = 1840
update scheduleSlot set staff_id = 3 where slot_id = 1841
update scheduleSlot set staff_id = 3 where slot_id = 1842
update scheduleSlot set staff_id = 3 where slot_id = 1843
update scheduleSlot set staff_id = 3 where slot_id = 1844
update scheduleSlot set staff_id = 3 where slot_id = 1845
update scheduleSlot set staff_id = 3 where slot_id = 1846
update scheduleSlot set staff_id = 3 where slot_id = 1847
update scheduleSlot set staff_id = 3 where slot_id = 1848
update scheduleSlot set staff_id = 5 where slot_id = 1849
update scheduleSlot set staff_id = 5 where slot_id = 1850
update scheduleSlot set staff_id = 5 where slot_id = 1851
update scheduleSlot set staff_id = 5 where slot_id = 1852
update scheduleSlot set staff_id = 5 where slot_id = 1853
update scheduleSlot set staff_id = 5 where slot_id = 1854
update scheduleSlot set staff_id = 5 where slot_id = 1855
update scheduleSlot set staff_id = 5 where slot_id = 1856
update scheduleSlot set staff_id = 20 where slot_id = 1857
update scheduleSlot set staff_id = 20 where slot_id = 1858
update scheduleSlot set staff_id = 20 where slot_id = 1859
update scheduleSlot set staff_id = 20 where slot_id = 1860
update scheduleSlot set staff_id = 20 where slot_id = 1861
update scheduleSlot set staff_id = 20 where slot_id = 1862
update scheduleSlot set staff_id = 20 where slot_id = 1863
update scheduleSlot set staff_id = 17 where slot_id = 1864
update scheduleSlot set staff_id = 17 where slot_id = 1865
update scheduleSlot set staff_id = 17 where slot_id = 1866
update scheduleSlot set staff_id = 17 where slot_id = 1867
update scheduleSlot set staff_id = 17 where slot_id = 1868
update scheduleSlot set staff_id = 17 where slot_id = 1869
update scheduleSlot set staff_id = 17 where slot_id = 1870
update scheduleSlot set staff_id = 17 where slot_id = 1871
update scheduleSlot set staff_id = 17 where slot_id = 1872
update scheduleSlot set staff_id = 6 where slot_id = 1873
update scheduleSlot set staff_id = 6 where slot_id = 1874
update scheduleSlot set staff_id = 6 where slot_id = 1875
update scheduleSlot set staff_id = 6 where slot_id = 1876
update scheduleSlot set staff_id = 6 where slot_id = 1877
update scheduleSlot set staff_id = 6 where slot_id = 1878
update scheduleSlot set staff_id = 6 where slot_id = 1879
update scheduleSlot set staff_id = 12 where slot_id = 1880
update scheduleSlot set staff_id = 12 where slot_id = 1881
update scheduleSlot set staff_id = 12 where slot_id = 1882
update scheduleSlot set staff_id = 12 where slot_id = 1883
update scheduleSlot set staff_id = 12 where slot_id = 1884
update scheduleSlot set staff_id = 12 where slot_id = 1885
update scheduleSlot set staff_id = 12 where slot_id = 1886
update scheduleSlot set staff_id = 12 where slot_id = 1887
update scheduleSlot set staff_id = 12 where slot_id = 1888
update scheduleSlot set staff_id = 1 where slot_id = 1889
update scheduleSlot set staff_id = 1 where slot_id = 1890
update scheduleSlot set staff_id = 1 where slot_id = 1891
update scheduleSlot set staff_id = 1 where slot_id = 1892
update scheduleSlot set staff_id = 1 where slot_id = 1893
update scheduleSlot set staff_id = 1 where slot_id = 1894
update scheduleSlot set staff_id = 1 where slot_id = 1895
update scheduleSlot set staff_id = 1 where slot_id = 1896
update scheduleSlot set staff_id = 4 where slot_id = 1897
update scheduleSlot set staff_id = 4 where slot_id = 1898
update scheduleSlot set staff_id = 4 where slot_id = 1899
update scheduleSlot set staff_id = 4 where slot_id = 1900
update scheduleSlot set staff_id = 4 where slot_id = 1901
update scheduleSlot set staff_id = 4 where slot_id = 1902
update scheduleSlot set staff_id = 4 where slot_id = 1903
update scheduleSlot set staff_id = 4 where slot_id = 1904
update scheduleSlot set staff_id = 3 where slot_id = 1905
update scheduleSlot set staff_id = 3 where slot_id = 1906
update scheduleSlot set staff_id = 3 where slot_id = 1907
update scheduleSlot set staff_id = 3 where slot_id = 1908
update scheduleSlot set staff_id = 3 where slot_id = 1909
update scheduleSlot set staff_id = 3 where slot_id = 1910
update scheduleSlot set staff_id = 3 where slot_id = 1911
update scheduleSlot set staff_id = 3 where slot_id = 1912
update scheduleSlot set staff_id = 5 where slot_id = 1913
update scheduleSlot set staff_id = 5 where slot_id = 1914
update scheduleSlot set staff_id = 5 where slot_id = 1915
update scheduleSlot set staff_id = 5 where slot_id = 1916
update scheduleSlot set staff_id = 5 where slot_id = 1917
update scheduleSlot set staff_id = 5 where slot_id = 1918
update scheduleSlot set staff_id = 5 where slot_id = 1919
update scheduleSlot set staff_id = 5 where slot_id = 1920
update scheduleSlot set staff_id = 24 where slot_id = 1921
update scheduleSlot set staff_id = 24 where slot_id = 1922
update scheduleSlot set staff_id = 24 where slot_id = 1923
update scheduleSlot set staff_id = 24 where slot_id = 1924
update scheduleSlot set staff_id = 24 where slot_id = 1925
update scheduleSlot set staff_id = 24 where slot_id = 1926
update scheduleSlot set staff_id = 24 where slot_id = 1927
update scheduleSlot set staff_id = 24 where slot_id = 1928
update scheduleSlot set staff_id = 30 where slot_id = 1929
update scheduleSlot set staff_id = 30 where slot_id = 1930
update scheduleSlot set staff_id = 30 where slot_id = 1931
update scheduleSlot set staff_id = 30 where slot_id = 1932
update scheduleSlot set staff_id = 30 where slot_id = 1933
update scheduleSlot set staff_id = 30 where slot_id = 1934
update scheduleSlot set staff_id = 30 where slot_id = 1935
update scheduleSlot set staff_id = 30 where slot_id = 1936
update scheduleSlot set staff_id = 19 where slot_id = 1937
update scheduleSlot set staff_id = 19 where slot_id = 1938
update scheduleSlot set staff_id = 19 where slot_id = 1939
update scheduleSlot set staff_id = 19 where slot_id = 1940
update scheduleSlot set staff_id = 19 where slot_id = 1941
update scheduleSlot set staff_id = 19 where slot_id = 1942
update scheduleSlot set staff_id = 19 where slot_id = 1943
update scheduleSlot set staff_id = 19 where slot_id = 1944
update scheduleSlot set staff_id = 16 where slot_id = 1945
update scheduleSlot set staff_id = 16 where slot_id = 1946
update scheduleSlot set staff_id = 16 where slot_id = 1947
update scheduleSlot set staff_id = 16 where slot_id = 1948
update scheduleSlot set staff_id = 16 where slot_id = 1949
update scheduleSlot set staff_id = 16 where slot_id = 1950
update scheduleSlot set staff_id = 16 where slot_id = 1951
update scheduleSlot set staff_id = 16 where slot_id = 1952
update scheduleSlot set staff_id = 15 where slot_id = 1953
update scheduleSlot set staff_id = 15 where slot_id = 1954
update scheduleSlot set staff_id = 15 where slot_id = 1955
update scheduleSlot set staff_id = 15 where slot_id = 1956
update scheduleSlot set staff_id = 15 where slot_id = 1957
update scheduleSlot set staff_id = 15 where slot_id = 1958
update scheduleSlot set staff_id = 15 where slot_id = 1959
update scheduleSlot set staff_id = 15 where slot_id = 1960
update scheduleSlot set staff_id = 11 where slot_id = 1961
update scheduleSlot set staff_id = 11 where slot_id = 1962
update scheduleSlot set staff_id = 11 where slot_id = 1963
update scheduleSlot set staff_id = 11 where slot_id = 1964
update scheduleSlot set staff_id = 11 where slot_id = 1965
update scheduleSlot set staff_id = 11 where slot_id = 1966
update scheduleSlot set staff_id = 11 where slot_id = 1967
update scheduleSlot set staff_id = 11 where slot_id = 1968
update scheduleSlot set staff_id = 13 where slot_id = 1969
update scheduleSlot set staff_id = 13 where slot_id = 1970
update scheduleSlot set staff_id = 13 where slot_id = 1971
update scheduleSlot set staff_id = 13 where slot_id = 1972
update scheduleSlot set staff_id = 13 where slot_id = 1973
update scheduleSlot set staff_id = 13 where slot_id = 1974
update scheduleSlot set staff_id = 13 where slot_id = 1975
update scheduleSlot set staff_id = 13 where slot_id = 1976
update scheduleSlot set staff_id = 9 where slot_id = 1977
update scheduleSlot set staff_id = 9 where slot_id = 1978
update scheduleSlot set staff_id = 9 where slot_id = 1979
update scheduleSlot set staff_id = 9 where slot_id = 1980
update scheduleSlot set staff_id = 9 where slot_id = 1981
update scheduleSlot set staff_id = 9 where slot_id = 1982
update scheduleSlot set staff_id = 9 where slot_id = 1983
update scheduleSlot set staff_id = 9 where slot_id = 1984

INSERT INTO invoice VALUES ('80','2023-05-01','2023-05-15')
INSERT INTO invoice VALUES ('80','2023-05-01',Null)
INSERT INTO invoice VALUES ('80','2023-05-01',Null)
INSERT INTO invoice VALUES ('85','2023-05-01','2023-05-01')
INSERT INTO invoice VALUES ('85','2023-05-01','2023-05-15')
INSERT INTO invoice VALUES ('75','2023-05-01','2023-05-07')
INSERT INTO invoice VALUES ('75','2023-05-01','2023-05-06')
INSERT INTO invoice VALUES ('85','2023-05-01',Null)
INSERT INTO invoice VALUES ('85','2023-05-01','2023-05-15')
INSERT INTO invoice VALUES ('80','2023-05-01','2023-05-01')
INSERT INTO invoice VALUES ('90','2023-05-01','2023-05-02')
INSERT INTO invoice VALUES ('90','2023-05-01','2023-05-08')
INSERT INTO invoice VALUES ('75','2023-05-01',Null)
INSERT INTO invoice VALUES ('75','2023-05-01','2023-05-01')
INSERT INTO invoice VALUES ('180','2023-05-01',Null)
INSERT INTO invoice VALUES ('180','2023-05-01',Null)
INSERT INTO invoice VALUES ('180','2023-05-01','2023-05-08')
INSERT INTO invoice VALUES ('80','2023-05-02','2023-05-02')
INSERT INTO invoice VALUES ('80','2023-05-02',Null)
INSERT INTO invoice VALUES ('80','2023-05-02',Null)
INSERT INTO invoice VALUES ('85','2023-05-02',Null)
INSERT INTO invoice VALUES ('85','2023-05-02','2023-05-16')
INSERT INTO invoice VALUES ('75','2023-05-02',Null)
INSERT INTO invoice VALUES ('75','2023-05-02','2023-05-02')
INSERT INTO invoice VALUES ('85','2023-05-02','2023-05-16')
INSERT INTO invoice VALUES ('85','2023-05-02','2023-05-02')
INSERT INTO invoice VALUES ('85','2023-05-02','2023-05-16')
INSERT INTO invoice VALUES ('85','2023-05-02',Null)
INSERT INTO invoice VALUES ('85','2023-05-02',Null)
INSERT INTO invoice VALUES ('80','2023-05-02',Null)
INSERT INTO invoice VALUES ('80','2023-05-02',Null)
INSERT INTO invoice VALUES ('80','2023-05-02','2023-05-16')
INSERT INTO invoice VALUES ('90','2023-05-02','2023-05-02')
INSERT INTO invoice VALUES ('90','2023-05-02','2023-05-02')
INSERT INTO invoice VALUES ('75','2023-05-02','2023-05-07')
INSERT INTO invoice VALUES ('75','2023-05-02',Null)
INSERT INTO invoice VALUES ('180','2023-05-02','2023-05-05')
INSERT INTO invoice VALUES ('80','2023-05-03',Null)
INSERT INTO invoice VALUES ('80','2023-05-03',Null)
INSERT INTO invoice VALUES ('85','2023-05-03','2023-05-17')
INSERT INTO invoice VALUES ('75','2023-05-03',Null)
INSERT INTO invoice VALUES ('75','2023-05-03',Null)
INSERT INTO invoice VALUES ('85','2023-05-03',Null)
INSERT INTO invoice VALUES ('85','2023-05-03','2023-05-03')
INSERT INTO invoice VALUES ('85','2023-05-03',Null)
INSERT INTO invoice VALUES ('85','2023-05-03','2023-05-06')
INSERT INTO invoice VALUES ('85','2023-05-03','2023-05-17')
INSERT INTO invoice VALUES ('80','2023-05-03','2023-05-17')
INSERT INTO invoice VALUES ('80','2023-05-03',Null)
INSERT INTO invoice VALUES ('80','2023-05-03','2023-05-17')
INSERT INTO invoice VALUES ('90','2023-05-03','2023-05-17')
INSERT INTO invoice VALUES ('90','2023-05-03','2023-05-03')
INSERT INTO invoice VALUES ('90','2023-05-03','2023-05-07')
INSERT INTO invoice VALUES ('75','2023-05-03','2023-05-04')
INSERT INTO invoice VALUES ('180','2023-05-03',Null)
INSERT INTO invoice VALUES ('180','2023-05-03',Null)
INSERT INTO invoice VALUES ('180','2023-05-03','2023-05-03')
INSERT INTO invoice VALUES ('80','2023-05-04',Null)
INSERT INTO invoice VALUES ('85','2023-05-04',Null)
INSERT INTO invoice VALUES ('75','2023-05-04',Null)
INSERT INTO invoice VALUES ('75','2023-05-04','2023-05-10')
INSERT INTO invoice VALUES ('85','2023-05-04',Null)
INSERT INTO invoice VALUES ('80','2023-05-04',Null)
INSERT INTO invoice VALUES ('80','2023-05-04',Null)
INSERT INTO invoice VALUES ('80','2023-05-04','2023-05-04')
INSERT INTO invoice VALUES ('80','2023-05-04',Null)
INSERT INTO invoice VALUES ('90','2023-05-04','2023-05-09')
INSERT INTO invoice VALUES ('75','2023-05-04',Null)
INSERT INTO invoice VALUES ('75','2023-05-04',Null)
INSERT INTO invoice VALUES ('180','2023-05-04','2023-05-18')
INSERT INTO invoice VALUES ('180','2023-05-04','2023-05-09')
INSERT INTO invoice VALUES ('180','2023-05-04','2023-05-04')
INSERT INTO invoice VALUES ('80','2023-05-05','2023-05-19')
INSERT INTO invoice VALUES ('80','2023-05-05','2023-05-19')
INSERT INTO invoice VALUES ('85','2023-05-05','2023-05-19')
INSERT INTO invoice VALUES ('85','2023-05-05',Null)
INSERT INTO invoice VALUES ('85','2023-05-05','2023-05-19')
INSERT INTO invoice VALUES ('85','2023-05-05','2023-05-05')
INSERT INTO invoice VALUES ('80','2023-05-05',Null)
INSERT INTO invoice VALUES ('75','2023-05-05','2023-05-11')
INSERT INTO invoice VALUES ('75','2023-05-05',Null)
INSERT INTO invoice VALUES ('80','2023-05-07','2023-05-12')
INSERT INTO invoice VALUES ('85','2023-05-07','2023-05-07')
INSERT INTO invoice VALUES ('75','2023-05-07',Null)
INSERT INTO invoice VALUES ('80','2023-05-07',Null)
INSERT INTO invoice VALUES ('180','2023-05-07','2023-05-12')
INSERT INTO invoice VALUES ('180','2023-05-07','2023-05-21')
INSERT INTO invoice VALUES ('75','2023-05-07','2023-05-07')
INSERT INTO invoice VALUES ('75','2023-05-07',Null)
INSERT INTO invoice VALUES ('180','2023-05-07','2023-05-07')
INSERT INTO invoice VALUES ('80','2023-05-08','2023-05-08')
INSERT INTO invoice VALUES ('85','2023-05-08',Null)
INSERT INTO invoice VALUES ('85','2023-05-08','2023-05-22')
INSERT INTO invoice VALUES ('180','2023-05-08',Null)
INSERT INTO invoice VALUES ('180','2023-05-08','2023-05-22')
INSERT INTO invoice VALUES ('180','2023-05-08',Null)
INSERT INTO invoice VALUES ('180','2023-05-08','2023-05-22')
INSERT INTO invoice VALUES ('80','2023-05-09','2023-05-09')
INSERT INTO invoice VALUES ('80','2023-05-09',Null)
INSERT INTO invoice VALUES ('80','2023-05-09',Null)
INSERT INTO invoice VALUES ('85','2023-05-09',Null)
INSERT INTO invoice VALUES ('75','2023-05-09',Null)
INSERT INTO invoice VALUES ('85','2023-05-09',Null)
INSERT INTO invoice VALUES ('85','2023-05-09','2023-05-09')
INSERT INTO invoice VALUES ('85','2023-05-09','2023-05-09')
INSERT INTO invoice VALUES ('80','2023-05-09',Null)
INSERT INTO invoice VALUES ('80','2023-05-09','2023-05-09')
INSERT INTO invoice VALUES ('180','2023-05-09',Null)
INSERT INTO invoice VALUES ('180','2023-05-09','2023-05-23')
INSERT INTO invoice VALUES ('80','2023-05-10','2023-05-24')
INSERT INTO invoice VALUES ('80','2023-05-10','2023-05-13')
INSERT INTO invoice VALUES ('80','2023-05-10',Null)
INSERT INTO invoice VALUES ('85','2023-05-10',Null)
INSERT INTO invoice VALUES ('75','2023-05-10','2023-05-17')
INSERT INTO invoice VALUES ('75','2023-05-10','2023-05-10')
INSERT INTO invoice VALUES ('85','2023-05-10','2023-05-17')
INSERT INTO invoice VALUES ('85','2023-05-10','2023-05-24')
INSERT INTO invoice VALUES ('85','2023-05-10',Null)
INSERT INTO invoice VALUES ('80','2023-05-10','2023-05-10')
INSERT INTO invoice VALUES ('90','2023-05-10',Null)
INSERT INTO invoice VALUES ('75','2023-05-10','2023-05-10')
INSERT INTO invoice VALUES ('75','2023-05-10',Null)
INSERT INTO invoice VALUES ('180','2023-05-10',Null)
INSERT INTO invoice VALUES ('80','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('80','2023-05-11',Null)
INSERT INTO invoice VALUES ('80','2023-05-11','2023-05-18')
INSERT INTO invoice VALUES ('85','2023-05-11',Null)
INSERT INTO invoice VALUES ('85','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('75','2023-05-11','2023-05-13')
INSERT INTO invoice VALUES ('80','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('80','2023-05-11',Null)
INSERT INTO invoice VALUES ('80','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('90','2023-05-11',Null)
INSERT INTO invoice VALUES ('90','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('75','2023-05-11','2023-05-11')
INSERT INTO invoice VALUES ('85','2023-05-12',Null)
INSERT INTO invoice VALUES ('75','2023-05-12',Null)
INSERT INTO invoice VALUES ('80','2023-05-12','2023-05-12')
INSERT INTO invoice VALUES ('90','2023-05-12','2023-05-26')
INSERT INTO invoice VALUES ('90','2023-05-12','2023-05-26')
INSERT INTO invoice VALUES ('75','2023-05-12','2023-05-26')
INSERT INTO invoice VALUES ('75','2023-05-12','2023-05-16')
INSERT INTO invoice VALUES ('75','2023-05-14',Null)
INSERT INTO invoice VALUES ('75','2023-05-14',Null)
INSERT INTO invoice VALUES ('85','2023-05-14',Null)
INSERT INTO invoice VALUES ('80','2023-05-14','2023-05-19')
INSERT INTO invoice VALUES ('80','2023-05-14','2023-05-17')
INSERT INTO invoice VALUES ('80','2023-05-14',Null)
INSERT INTO invoice VALUES ('75','2023-05-14',Null)
INSERT INTO invoice VALUES ('75','2023-05-14',Null)
INSERT INTO invoice VALUES ('85','2023-05-15','2023-05-15')
INSERT INTO invoice VALUES ('85','2023-05-15','2023-05-19')
INSERT INTO invoice VALUES ('75','2023-05-15',Null)
INSERT INTO invoice VALUES ('85','2023-05-15',Null)
INSERT INTO invoice VALUES ('90','2023-05-15','2023-05-15')
INSERT INTO invoice VALUES ('75','2023-05-15','2023-05-21')
INSERT INTO invoice VALUES ('75','2023-05-15',Null)
INSERT INTO invoice VALUES ('180','2023-05-15',Null)
INSERT INTO invoice VALUES ('80','2023-05-16',Null)
INSERT INTO invoice VALUES ('85','2023-05-16','2023-05-16')
INSERT INTO invoice VALUES ('75','2023-05-16',Null)
INSERT INTO invoice VALUES ('75','2023-05-16','2023-05-17')
INSERT INTO invoice VALUES ('80','2023-05-16',Null)
INSERT INTO invoice VALUES ('75','2023-05-16',Null)
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-18')
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-20')
INSERT INTO invoice VALUES ('75','2023-05-17','2023-05-17')
INSERT INTO invoice VALUES ('85','2023-05-17','2023-05-17')
INSERT INTO invoice VALUES ('85','2023-05-17','2023-05-31')
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-20')
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-23')
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-31')
INSERT INTO invoice VALUES ('80','2023-05-17',Null)
INSERT INTO invoice VALUES ('80','2023-05-17','2023-05-31')
INSERT INTO invoice VALUES ('180','2023-05-17',Null)
INSERT INTO invoice VALUES ('75','2023-05-17','2023-05-31')
INSERT INTO invoice VALUES ('75','2023-05-17','2023-05-22')
INSERT INTO invoice VALUES ('75','2023-05-17','2023-05-22')
INSERT INTO invoice VALUES ('180','2023-05-17',Null)
INSERT INTO invoice VALUES ('180','2023-05-17','2023-05-17')
INSERT INTO invoice VALUES ('180','2023-05-17','2023-05-21')
INSERT INTO invoice VALUES ('80','2023-05-18','2023-05-23')
INSERT INTO invoice VALUES ('80','2023-05-18','2023-06-01')
INSERT INTO invoice VALUES ('85','2023-05-18',Null)
INSERT INTO invoice VALUES ('75','2023-05-18','2023-06-01')
INSERT INTO invoice VALUES ('75','2023-05-18','2023-06-01')
INSERT INTO invoice VALUES ('85','2023-05-18','2023-05-24')
INSERT INTO invoice VALUES ('85','2023-05-18','2023-05-18')
INSERT INTO invoice VALUES ('180','2023-05-18','2023-05-23')
INSERT INTO invoice VALUES ('75','2023-05-18',Null)
INSERT INTO invoice VALUES ('180','2023-05-18','2023-05-18')
INSERT INTO invoice VALUES ('80','2023-05-19',Null)
INSERT INTO invoice VALUES ('80','2023-05-19','2023-05-19')
INSERT INTO invoice VALUES ('85','2023-05-19','2023-06-02')
INSERT INTO invoice VALUES ('80','2023-05-19','2023-05-19')
INSERT INTO invoice VALUES ('90','2023-05-19','2023-05-19')
INSERT INTO invoice VALUES ('75','2023-05-19',Null)
INSERT INTO invoice VALUES ('180','2023-05-19',Null)
INSERT INTO invoice VALUES ('80','2023-05-21',Null)
INSERT INTO invoice VALUES ('85','2023-05-21','2023-05-21')
INSERT INTO invoice VALUES ('85','2023-05-21','2023-05-21')
INSERT INTO invoice VALUES ('80','2023-05-21','2023-05-27')
INSERT INTO invoice VALUES ('80','2023-05-21',Null)
INSERT INTO invoice VALUES ('90','2023-05-21','2023-05-21')
INSERT INTO invoice VALUES ('90','2023-05-21','2023-05-21')
INSERT INTO invoice VALUES ('180','2023-05-21','2023-06-04')
INSERT INTO invoice VALUES ('85','2023-05-22',Null)
INSERT INTO invoice VALUES ('85','2023-05-22','2023-05-22')
INSERT INTO invoice VALUES ('85','2023-05-22',Null)
INSERT INTO invoice VALUES ('85','2023-05-22',Null)
INSERT INTO invoice VALUES ('85','2023-05-22',Null)
INSERT INTO invoice VALUES ('80','2023-05-22',Null)
INSERT INTO invoice VALUES ('80','2023-05-22','2023-06-05')
INSERT INTO invoice VALUES ('90','2023-05-22','2023-05-22')
INSERT INTO invoice VALUES ('90','2023-05-22',Null)
INSERT INTO invoice VALUES ('75','2023-05-22','2023-06-05')
INSERT INTO invoice VALUES ('180','2023-05-22','2023-05-22')
INSERT INTO invoice VALUES ('80','2023-05-23','2023-05-24')
INSERT INTO invoice VALUES ('85','2023-05-23',Null)
INSERT INTO invoice VALUES ('85','2023-05-23','2023-05-23')
INSERT INTO invoice VALUES ('85','2023-05-23',Null)
INSERT INTO invoice VALUES ('85','2023-05-23','2023-06-06')
INSERT INTO invoice VALUES ('85','2023-05-23','2023-05-29')
INSERT INTO invoice VALUES ('80','2023-05-23',Null)
INSERT INTO invoice VALUES ('80','2023-05-23',Null)
INSERT INTO invoice VALUES ('90','2023-05-23',Null)
INSERT INTO invoice VALUES ('90','2023-05-23',Null)
INSERT INTO invoice VALUES ('90','2023-05-23','2023-06-06')
INSERT INTO invoice VALUES ('180','2023-05-23','2023-06-06')
INSERT INTO invoice VALUES ('180','2023-05-23','2023-05-23')
INSERT INTO invoice VALUES ('80','2023-05-24',Null)
INSERT INTO invoice VALUES ('85','2023-05-24',Null)
INSERT INTO invoice VALUES ('85','2023-05-24',Null)
INSERT INTO invoice VALUES ('75','2023-05-24','2023-06-07')
INSERT INTO invoice VALUES ('75','2023-05-24','2023-05-24')
INSERT INTO invoice VALUES ('85','2023-05-24',Null)
INSERT INTO invoice VALUES ('85','2023-05-24',Null)
INSERT INTO invoice VALUES ('85','2023-05-24','2023-05-24')
INSERT INTO invoice VALUES ('85','2023-05-24',Null)
INSERT INTO invoice VALUES ('80','2023-05-24',Null)
INSERT INTO invoice VALUES ('90','2023-05-24',Null)
INSERT INTO invoice VALUES ('75','2023-05-24','2023-05-24')
INSERT INTO invoice VALUES ('180','2023-05-24','2023-05-24')
INSERT INTO invoice VALUES ('180','2023-05-24','2023-05-24')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-05-25')
INSERT INTO invoice VALUES ('85','2023-05-25','2023-05-27')
INSERT INTO invoice VALUES ('75','2023-05-25',Null)
INSERT INTO invoice VALUES ('85','2023-05-25',Null)
INSERT INTO invoice VALUES ('80','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-05-30')
INSERT INTO invoice VALUES ('80','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('180','2023-05-25',Null)
INSERT INTO invoice VALUES ('180','2023-05-25','2023-05-25')
INSERT INTO invoice VALUES ('75','2023-05-25','2023-05-25')
INSERT INTO invoice VALUES ('75','2023-05-25',Null)
INSERT INTO invoice VALUES ('75','2023-05-25','2023-05-27')
INSERT INTO invoice VALUES ('75','2023-05-25','2023-06-08')
INSERT INTO invoice VALUES ('180','2023-05-25',Null)
INSERT INTO invoice VALUES ('85','2023-05-26',Null)
INSERT INTO invoice VALUES ('75','2023-05-26','2023-05-26')
INSERT INTO invoice VALUES ('85','2023-05-26','2023-06-09')
INSERT INTO invoice VALUES ('80','2023-05-26',Null)
INSERT INTO invoice VALUES ('180','2023-05-26',Null)
INSERT INTO invoice VALUES ('75','2023-05-26','2023-05-31')
INSERT INTO invoice VALUES ('180','2023-05-26',Null)
INSERT INTO invoice VALUES ('80','2023-05-28','2023-06-01')
INSERT INTO invoice VALUES ('85','2023-05-28','2023-05-28')
INSERT INTO invoice VALUES ('85','2023-05-28','2023-06-11')
INSERT INTO invoice VALUES ('75','2023-05-28','2023-06-03')
INSERT INTO invoice VALUES ('80','2023-05-28','2023-05-29')
INSERT INTO invoice VALUES ('80','2023-05-28','2023-05-30')
INSERT INTO invoice VALUES ('80','2023-05-28',Null)
INSERT INTO invoice VALUES ('90','2023-05-28',Null)
INSERT INTO invoice VALUES ('90','2023-05-28','2023-06-11')
INSERT INTO invoice VALUES ('75','2023-05-28','2023-06-11')
INSERT INTO invoice VALUES ('75','2023-05-28',Null)
INSERT INTO invoice VALUES ('80','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('80','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('85','2023-05-29','2023-05-29')
INSERT INTO invoice VALUES ('75','2023-05-29','2023-05-31')
INSERT INTO invoice VALUES ('75','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('75','2023-05-29',Null)
INSERT INTO invoice VALUES ('90','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('90','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('75','2023-05-29',Null)
INSERT INTO invoice VALUES ('75','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('75','2023-05-29','2023-06-01')
INSERT INTO invoice VALUES ('75','2023-05-29','2023-06-05')
INSERT INTO invoice VALUES ('180','2023-05-29','2023-06-12')
INSERT INTO invoice VALUES ('80','2023-05-30','2023-06-05')
INSERT INTO invoice VALUES ('85','2023-05-30','2023-06-01')
INSERT INTO invoice VALUES ('85','2023-05-30','2023-06-04')
INSERT INTO invoice VALUES ('85','2023-05-30',Null)
INSERT INTO invoice VALUES ('85','2023-05-30','2023-06-04')
INSERT INTO invoice VALUES ('85','2023-05-30','2023-05-31')
INSERT INTO invoice VALUES ('85','2023-05-30',Null)
INSERT INTO invoice VALUES ('85','2023-05-30','2023-05-30')
INSERT INTO invoice VALUES ('80','2023-05-30','2023-06-05')
INSERT INTO invoice VALUES ('90','2023-05-30',Null)
INSERT INTO invoice VALUES ('90','2023-05-30','2023-06-13')
INSERT INTO invoice VALUES ('75','2023-05-30',Null)
INSERT INTO invoice VALUES ('180','2023-05-30','2023-06-13')
INSERT INTO invoice VALUES ('180','2023-05-30','2023-06-06')
INSERT INTO invoice VALUES ('80','2023-05-31','2023-05-31')
INSERT INTO invoice VALUES ('85','2023-05-31','2023-06-04')
INSERT INTO invoice VALUES ('85','2023-05-31',Null)
INSERT INTO invoice VALUES ('75','2023-05-31','2023-06-03')
INSERT INTO invoice VALUES ('85','2023-05-31','2023-06-07')
INSERT INTO invoice VALUES ('85','2023-05-31',Null)
INSERT INTO invoice VALUES ('90','2023-05-31','2023-06-14')
INSERT INTO invoice VALUES ('90','2023-05-31',Null)
INSERT INTO invoice VALUES ('180','2023-05-31','2023-06-07')
INSERT INTO invoice VALUES ('180','2023-05-31','2023-05-31')
INSERT INTO appointment VALUES ('thinks it is an aeroplane',1,92,31,1)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,49,64,2)
INSERT INTO appointment VALUES ('Parrot Fever',1,39,141,3)
INSERT INTO appointment VALUES ('foot and mouth',1,68,145,4)
INSERT INTO appointment VALUES ('augumentative',1,23,66,5)
INSERT INTO appointment VALUES ('Hyperthyroidism',1,53,47,6)
INSERT INTO appointment VALUES ('obesity',1,33,72,7)
INSERT INTO appointment VALUES ('missing leg',1,49,114,8)
INSERT INTO appointment VALUES ('cleptomaniac',1,95,100,9)
INSERT INTO appointment VALUES ('gets confused easily',1,70,133,10)
INSERT INTO appointment VALUES ('identity crisis',1,33,58,11)
INSERT INTO appointment VALUES ('has issues talking to other sheep',1,83,103,12)
INSERT INTO appointment VALUES ('Ugly fur',1,63,108,13)
INSERT INTO appointment VALUES ('ringworm',1,85,1,14)
INSERT INTO appointment VALUES ('Dystocia',1,24,162,15)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,67,83,16)
INSERT INTO appointment VALUES ('mud fever',1,40,34,17)
INSERT INTO appointment VALUES ('interrupts too much',1,100,76,18)
INSERT INTO appointment VALUES ('will not eat apples',1,23,104,19)
INSERT INTO appointment VALUES ('lazy',1,95,101,20)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,74,81,21)
INSERT INTO appointment VALUES ('lack of intelligence',1,93,2,22)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,54,102,23)
INSERT INTO appointment VALUES ('trouble swimming',1,96,23,24)
INSERT INTO appointment VALUES ('too fat',1,30,117,25)
INSERT INTO appointment VALUES ('interrupts too much',1,53,144,26)
INSERT INTO appointment VALUES ('out of synch body clock',1,51,59,27)
INSERT INTO appointment VALUES ('foot in mouth',1,92,146,28)
INSERT INTO appointment VALUES ('keeps sleeping',1,83,97,29)
INSERT INTO appointment VALUES ('keeps running backwards',1,91,111,30)
INSERT INTO appointment VALUES ('too naughter',1,44,179,31)
INSERT INTO appointment VALUES ('doesnt like fruit',1,47,180,32)
INSERT INTO appointment VALUES ('ringworm',1,21,116,33)
INSERT INTO appointment VALUES ('can not ride a bike',1,40,130,34)
INSERT INTO appointment VALUES ('funny baaaa',1,20,134,35)
INSERT INTO appointment VALUES ('kennel cough',1,33,46,36)
INSERT INTO appointment VALUES ('Parrot Wasting Syndrome',1,60,10,37)
INSERT INTO appointment VALUES ('crows like a rooster',1,69,60,38)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,37,106,39)
INSERT INTO appointment VALUES ('not fat enough',1,87,122,40)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,98,7,41)
INSERT INTO appointment VALUES ('Dental disease',1,89,63,42)
INSERT INTO appointment VALUES ('copper toxit',1,22,49,43)
INSERT INTO appointment VALUES ('sweet itch',1,86,55,44)
INSERT INTO appointment VALUES ('doesnt like to wash',1,55,50,45)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,90,147,46)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,86,110,47)
INSERT INTO appointment VALUES ('Ugly fur',1,59,108,48)
INSERT INTO appointment VALUES ('funny maaaa',1,79,136,49)
INSERT INTO appointment VALUES ('Chronic renal (kidney) disease',1,72,19,50)
INSERT INTO appointment VALUES ('too slippery',1,83,3,51)
INSERT INTO appointment VALUES ('Parrot Fever',1,27,82,52)
INSERT INTO appointment VALUES ('flys too much',1,79,4,53)
INSERT INTO appointment VALUES ('keeps following others',1,32,86,54)
INSERT INTO appointment VALUES ('mastitutus',1,95,154,55)
INSERT INTO appointment VALUES ('lockjaw',1,88,121,56)
INSERT INTO appointment VALUES ('bloat',1,99,158,57)
INSERT INTO appointment VALUES ('can not ride a bike',1,29,30,58)
INSERT INTO appointment VALUES ('Diabetes mellitus',1,90,33,59)
INSERT INTO appointment VALUES ('thinks it is an alarm clock',1,91,164,60)
INSERT INTO appointment VALUES ('tail is not curley',1,28,62,61)
INSERT INTO appointment VALUES ('foot rot',1,96,65,62)
INSERT INTO appointment VALUES ('wont play with other pigs',1,29,48,63)
INSERT INTO appointment VALUES ('Lice',1,73,129,64)
INSERT INTO appointment VALUES ('will not keep quiet',1,71,77,65)
INSERT INTO appointment VALUES ('sisses too much',1,97,96,66)
INSERT INTO appointment VALUES ('purr is too loud',1,27,165,67)
INSERT INTO appointment VALUES ('will not jump fence',1,85,6,68)
INSERT INTO appointment VALUES ('Psittacine Beak and Feather Disease',1,63,53,69)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,37,8,70)
INSERT INTO appointment VALUES ('too noisy',1,69,17,71)
INSERT INTO appointment VALUES ('keeps getting lost',1,39,5,72)
INSERT INTO appointment VALUES ('easily scared by cats',1,74,21,73)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,64,45,74)
INSERT INTO appointment VALUES ('will not jump fence',1,59,84,75)
INSERT INTO appointment VALUES ('mud fever',1,36,131,76)
INSERT INTO appointment VALUES ('tied in a knot',1,76,119,77)
INSERT INTO appointment VALUES ('bad swimmer',1,41,167,78)
INSERT INTO appointment VALUES ('Hyperthyroidism',1,34,47,79)
INSERT INTO appointment VALUES ('Candida',1,46,70,80)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,38,109,81)
INSERT INTO appointment VALUES ('answers back',1,93,32,82)
INSERT INTO appointment VALUES ('anxious when alone',1,95,79,83)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,87,18,84)
INSERT INTO appointment VALUES ('too quiet',1,50,80,85)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,63,57,86)
INSERT INTO appointment VALUES ('thinks it is a sheep dog',1,73,36,87)
INSERT INTO appointment VALUES ('bloat',1,68,168,88)
INSERT INTO appointment VALUES ('heart worm',1,53,54,89)
INSERT INTO appointment VALUES ('wants to be on tv',1,73,26,90)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,75,98,91)
INSERT INTO appointment VALUES ('pathetic bark',1,86,89,92)
INSERT INTO appointment VALUES ('will not keep quiet',1,23,149,93)
INSERT INTO appointment VALUES ('will not grow wool',1,98,87,94)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,100,94,95)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,63,35,96)
INSERT INTO appointment VALUES ('answers back',1,39,118,97)
INSERT INTO appointment VALUES ('easily scared by cats',1,78,105,98)
INSERT INTO appointment VALUES ('kennel cough',1,65,120,99)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,62,12,100)
INSERT INTO appointment VALUES ('keeps following others',1,34,13,101)
INSERT INTO appointment VALUES ('sweet itch',1,51,132,102)
INSERT INTO appointment VALUES ('keeps running backwards',1,26,157,103)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,48,91,104)
INSERT INTO appointment VALUES ('doesnt like to get dirty',1,57,14,105)
INSERT INTO appointment VALUES ('ringworm',1,35,1,106)
INSERT INTO appointment VALUES ('sweats too much',1,84,163,107)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,92,25,108)
INSERT INTO appointment VALUES ('keeps getting lost',1,65,75,109)
INSERT INTO appointment VALUES ('gets tired easily',1,42,128,110)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,20,123,111)
INSERT INTO appointment VALUES ('lack of intelligence',1,56,2,112)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,30,29,113)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,45,28,114)
INSERT INTO appointment VALUES ('rickets',1,89,51,115)
INSERT INTO appointment VALUES ('has issues talking to other sheep',1,89,24,116)
INSERT INTO appointment VALUES ('wants to be on tv',1,41,115,117)
INSERT INTO appointment VALUES ('Polyomavirus',1,92,69,118)
INSERT INTO appointment VALUES ('looks at me funny',1,32,171,119)
INSERT INTO appointment VALUES ('anxious when alone',1,58,150,120)
INSERT INTO appointment VALUES ('Anchor Worm',1,46,112,121)
INSERT INTO appointment VALUES ('heart worm',1,76,142,122)
INSERT INTO appointment VALUES ('lost his sting',1,75,176,123)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,44,137,124)
INSERT INTO appointment VALUES ('keeps getting lost',1,56,56,125)
INSERT INTO appointment VALUES ('doesnt like bacon',1,44,143,126)
INSERT INTO appointment VALUES ('Parrot Wasting Syndrome',1,68,135,127)
INSERT INTO appointment VALUES ('thinks it is a fire engine',1,49,153,128)
INSERT INTO appointment VALUES ('will not grow wool',1,25,15,129)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,60,61,130)
INSERT INTO appointment VALUES ('has a negative attitude',1,58,174,131)
INSERT INTO appointment VALUES ('bloat',1,91,158,132)
INSERT INTO appointment VALUES ('flys too much',1,28,4,133)
INSERT INTO appointment VALUES ('Dystocia',1,47,52,134)
INSERT INTO appointment VALUES ('slime disease',1,81,113,135)
INSERT INTO appointment VALUES ('funny baaaa',1,20,37,136)
INSERT INTO appointment VALUES ('kennel cough',1,64,46,137)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,100,8,138)
INSERT INTO appointment VALUES ('Hole in Head Disease ',1,39,124,139)
INSERT INTO appointment VALUES ('depression',1,34,138,140)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,69,42,141)
INSERT INTO appointment VALUES ('pokes out tongue too much',1,98,139,142)
INSERT INTO appointment VALUES ('can not ride a bike',1,64,30,143)
INSERT INTO appointment VALUES ('funny maaaa',1,47,38,144)
INSERT INTO appointment VALUES ('foot rot',1,93,65,145)
INSERT INTO appointment VALUES ('bloat',1,64,168,146)
INSERT INTO appointment VALUES ('Parrot Wasting Syndrome',1,58,78,147)
INSERT INTO appointment VALUES ('too slippery',1,31,3,148)
INSERT INTO appointment VALUES ('foot in mouth',1,78,43,149)
INSERT INTO appointment VALUES ('Leech',1,26,127,150)
INSERT INTO appointment VALUES ('not sleeping',1,42,125,151)
INSERT INTO appointment VALUES ('pokes out tongue too much',1,58,39,152)
INSERT INTO appointment VALUES ('too naughter',1,88,179,153)
INSERT INTO appointment VALUES ('foot and mouth',1,44,40,154)
INSERT INTO appointment VALUES ('doesnt like fruit',1,79,180,155)
INSERT INTO appointment VALUES ('blue tongue',1,68,152,156)
INSERT INTO appointment VALUES ('interrupts too much',1,37,76,157)
INSERT INTO appointment VALUES ('thinks he is a fire engine',1,40,95,158)
INSERT INTO appointment VALUES ('finrot',1,90,71,159)
INSERT INTO appointment VALUES ('doesnt like to wash',1,38,50,160)
INSERT INTO appointment VALUES ('easily scared by cats',1,100,21,161)
INSERT INTO appointment VALUES ('watches too much tv',1,97,126,162)
INSERT INTO appointment VALUES ('Parrot Fever',1,96,20,163)
INSERT INTO appointment VALUES ('copper toxit',1,58,155,164)
INSERT INTO appointment VALUES ('wants to be on tv',1,78,26,165)
INSERT INTO appointment VALUES ('Septicemia',1,96,73,166)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,81,81,167)
INSERT INTO appointment VALUES ('heart worm',1,100,54,168)
INSERT INTO appointment VALUES ('Psittacine Beak and Feather Disease',1,55,107,169)
INSERT INTO appointment VALUES ('keeps getting lost',1,65,5,170)
INSERT INTO appointment VALUES ('Dystocia',1,59,162,171)
INSERT INTO appointment VALUES ('wont play with other pigs',1,66,48,172)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,65,11,173)
INSERT INTO appointment VALUES ('rickets',1,46,159,174)
INSERT INTO appointment VALUES ('has issues talking to other sheep',1,27,103,175)
INSERT INTO appointment VALUES ('Dental disease',1,82,63,176)
INSERT INTO appointment VALUES ('crows like a rooster',1,39,60,177)
INSERT INTO appointment VALUES ('blue tongue',1,77,44,178)
INSERT INTO appointment VALUES ('cleptomaniac',1,36,100,179)
INSERT INTO appointment VALUES ('lockjaw',1,88,27,180)
INSERT INTO appointment VALUES ('answers back',1,68,32,181)
INSERT INTO appointment VALUES ('will not eat apples',1,83,104,182)
INSERT INTO appointment VALUES ('keeps sleeping',1,21,97,183)
INSERT INTO appointment VALUES ('augumentative',1,54,66,184)
INSERT INTO appointment VALUES ('anxious when alone',1,36,79,185)
INSERT INTO appointment VALUES ('out of synch body clock',1,85,59,186)
INSERT INTO appointment VALUES ('foot rot',1,72,65,187)
INSERT INTO appointment VALUES ('thinks it is a sheep dog',1,93,36,188)
INSERT INTO appointment VALUES ('will not jump fence',1,27,84,189)
INSERT INTO appointment VALUES ('Parrot Fever',1,87,82,190)
INSERT INTO appointment VALUES ('cancer',1,30,85,191)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,35,64,192)
INSERT INTO appointment VALUES ('identity crisis',1,64,58,193)
INSERT INTO appointment VALUES ('too slippery',1,56,3,194)
INSERT INTO appointment VALUES ('Arthritis',1,77,41,195)
INSERT INTO appointment VALUES ('keeps getting lost',1,87,56,196)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,64,12,197)
INSERT INTO appointment VALUES ('lost his voice',1,47,178,198)
INSERT INTO appointment VALUES ('will not keep quiet',1,86,160,199)
INSERT INTO appointment VALUES ('anxiety',1,95,148,200)
INSERT INTO appointment VALUES ('pathetic bark',1,64,16,201)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,45,106,202)
INSERT INTO appointment VALUES ('lazy',1,32,101,203)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,96,35,204)
INSERT INTO appointment VALUES ('Dystocia',1,20,52,205)
INSERT INTO appointment VALUES ('can not ride a bike',1,82,130,206)
INSERT INTO appointment VALUES ('keeps following others',1,85,86,207)
INSERT INTO appointment VALUES ('thinks it is a dog',1,41,140,208)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,24,74,209)
INSERT INTO appointment VALUES ('mud fever',1,59,34,210)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,33,83,211)
INSERT INTO appointment VALUES ('keeps running backwards',1,88,111,212)
INSERT INTO appointment VALUES ('ringworm',1,45,116,213)
INSERT INTO appointment VALUES ('lockjaw',1,42,121,214)
INSERT INTO appointment VALUES ('Parrot Fever',1,77,20,215)
INSERT INTO appointment VALUES ('easily scared by cats',1,98,105,216)
INSERT INTO appointment VALUES ('Chronic renal (kidney) disease',1,54,19,217)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,30,91,218)
INSERT INTO appointment VALUES ('answers back too much',1,59,67,219)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',1,78,7,220)
INSERT INTO appointment VALUES ('has issues talking to other sheep',1,47,24,221)
INSERT INTO appointment VALUES ('keeps following others',1,47,13,222)
INSERT INTO appointment VALUES ('trouble swimming',1,74,23,223)
INSERT INTO appointment VALUES ('doesnt like to get dirty',1,93,14,224)
INSERT INTO appointment VALUES ('Parrot Fever',1,37,141,225)
INSERT INTO appointment VALUES ('pathetic tweet',1,84,151,226)
INSERT INTO appointment VALUES ('mud fever',1,67,131,227)
INSERT INTO appointment VALUES ('wants to be on tv',1,55,115,228)
INSERT INTO appointment VALUES ('will not grow wool',1,50,87,229)
INSERT INTO appointment VALUES ('cancer',1,42,85,230)
INSERT INTO appointment VALUES ('Candida',1,75,70,231)
INSERT INTO appointment VALUES ('sweet itch',1,87,132,232)
INSERT INTO appointment VALUES ('will not keep quiet',1,29,77,233)
INSERT INTO appointment VALUES ('lack of intelligence',1,42,2,234)
INSERT INTO appointment VALUES ('foot and mouth',1,52,145,235)
INSERT INTO appointment VALUES ('cleptomaniac',1,26,100,236)
INSERT INTO appointment VALUES ('heart disease',1,94,173,237)
INSERT INTO appointment VALUES ('foot in mouth',1,99,146,238)
INSERT INTO appointment VALUES ('will not jump fence',1,78,6,239)
INSERT INTO appointment VALUES ('Cancer',1,57,99,240)
INSERT INTO appointment VALUES ('too noisy',1,41,17,241)
INSERT INTO appointment VALUES ('cleptomaniac',1,62,100,242)
INSERT INTO appointment VALUES ('answers back',1,97,118,243)
INSERT INTO appointment VALUES ('ringworm',1,28,1,244)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,39,45,245)
INSERT INTO appointment VALUES ('Dystocia',1,71,162,246)
INSERT INTO appointment VALUES ('thinks it is an aeroplane',1,38,31,247)
INSERT INTO appointment VALUES ('flys too much',1,23,4,248)
INSERT INTO appointment VALUES ('copper toxit',1,46,49,249)
INSERT INTO appointment VALUES ('funny baaaa',1,76,134,250)
INSERT INTO appointment VALUES ('funny maaaa',1,24,136,251)
INSERT INTO appointment VALUES ('kennel cough',1,39,46,252)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,41,109,253)
INSERT INTO appointment VALUES ('pokes out tongue too much',1,25,139,254)
INSERT INTO appointment VALUES ('foot and mouth',1,99,40,255)
INSERT INTO appointment VALUES ('kennel cough',1,79,120,256)
INSERT INTO appointment VALUES ('tail is not curley',1,100,62,257)
INSERT INTO appointment VALUES ('lack of intelligence',1,36,68,258)
INSERT INTO appointment VALUES ('tail too long',1,86,170,259)
INSERT INTO appointment VALUES ('having trouble sleeping',1,39,172,260)
INSERT INTO appointment VALUES ('thinks it is a rooster',1,37,175,261)
INSERT INTO appointment VALUES ('forker tongue',1,78,90,262)
INSERT INTO appointment VALUES ('purr is too quiet',1,99,169,263)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,37,29,264)
INSERT INTO appointment VALUES ('tied in a knot',1,84,119,265)
INSERT INTO appointment VALUES ('Lice',1,27,129,266)
INSERT INTO appointment VALUES ('Polyomavirus',1,84,69,267)
INSERT INTO appointment VALUES ('will not grow wool',1,73,15,268)
INSERT INTO appointment VALUES ('lazy',1,39,101,269)
INSERT INTO appointment VALUES ('cant fly',1,29,181,270)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,87,42,271)
INSERT INTO appointment VALUES ('pokes out tongue too much',1,33,39,272)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,25,98,273)
INSERT INTO appointment VALUES ('keeps sleeping',1,43,97,274)
INSERT INTO appointment VALUES ('thinks it is a fire engine',1,79,95,275)
INSERT INTO appointment VALUES ('lockjaw',1,81,27,276)
INSERT INTO appointment VALUES ('funny baaaa',1,30,37,277)
INSERT INTO appointment VALUES ('foot in mouth',1,37,43,278)
INSERT INTO appointment VALUES ('gets tired easily',1,100,128,279)
INSERT INTO appointment VALUES ('augumentative',1,52,66,280)
INSERT INTO appointment VALUES ('funny maaaa',1,87,38,281)
INSERT INTO appointment VALUES ('missing leg',1,72,114,282)
INSERT INTO appointment VALUES ('interrupts too much',1,90,144,283)
INSERT INTO appointment VALUES ('heart worm',1,28,142,284)
INSERT INTO appointment VALUES ('bad swimmer',1,82,167,285)
INSERT INTO appointment VALUES ('Septicemia',1,51,73,286)
INSERT INTO appointment VALUES ('Parrot Wasting Syndrome',1,25,78,287)
INSERT INTO appointment VALUES ('will not keep quiet',1,88,149,288)
INSERT INTO appointment VALUES ('anxious when alone',1,26,150,289)
INSERT INTO appointment VALUES ('blue tongue',1,26,44,290)
INSERT INTO appointment VALUES ('keeps following others',1,40,86,291)
INSERT INTO appointment VALUES ('sweet itch',1,92,55,292)
INSERT INTO appointment VALUES ('answers back too much',1,72,67,293)
INSERT INTO appointment VALUES ('keeps getting lost',1,100,75,294)
INSERT INTO appointment VALUES ('rickets',1,79,51,295)
INSERT INTO appointment VALUES ('will not keep quiet',1,97,160,296)
INSERT INTO appointment VALUES ('Parrot Wasting Syndrome',1,70,10,297)
INSERT INTO appointment VALUES ('gets confused easily',1,94,133,298)
INSERT INTO appointment VALUES ('purr is too quiet',1,97,169,299)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,87,57,300)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,98,137,301)
INSERT INTO appointment VALUES ('answers back too much',1,24,67,302)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,88,28,303)
INSERT INTO appointment VALUES ('Psittacine Beak and Feather Disease',1,96,53,304)
INSERT INTO appointment VALUES ('smoking',1,99,177,305)
INSERT INTO appointment VALUES ('out of synch body clock',1,91,59,306)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,85,92,307)
INSERT INTO appointment VALUES ('answers back',1,40,32,308)
INSERT INTO appointment VALUES ('Mycoplasma bovis',1,32,61,309)
INSERT INTO appointment VALUES ('obesity',1,61,72,310)
INSERT INTO appointment VALUES ('thinks it is a fire engine',0,85,153,311)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',0,42,7,312)
INSERT INTO appointment VALUES ('Bovine Respiratory Disease Complex',0,68,11,313)
INSERT INTO appointment VALUES ('pathetic bark',0,83,89,314)
INSERT INTO appointment VALUES ('funny maaaa',0,50,38,315)
INSERT INTO appointment VALUES ('Arthritis',0,46,41,316)
update scheduleSlot set appointment_id = 1 where slot_id = 3
update scheduleSlot set appointment_id = 2 where slot_id = 4
update scheduleSlot set appointment_id = 3 where slot_id = 6
update scheduleSlot set appointment_id = 4 where slot_id = 14
update scheduleSlot set appointment_id = 5 where slot_id = 15
update scheduleSlot set appointment_id = 6 where slot_id = 21
update scheduleSlot set appointment_id = 7 where slot_id = 23
update scheduleSlot set appointment_id = 8 where slot_id = 28
update scheduleSlot set appointment_id = 9 where slot_id = 32
update scheduleSlot set appointment_id = 10 where slot_id = 40
update scheduleSlot set appointment_id = 11 where slot_id = 41
update scheduleSlot set appointment_id = 12 where slot_id = 45
update scheduleSlot set appointment_id = 13 where slot_id = 50
update scheduleSlot set appointment_id = 14 where slot_id = 55
update scheduleSlot set appointment_id = 15 where slot_id = 62
update scheduleSlot set appointment_id = 16 where slot_id = 63
update scheduleSlot set appointment_id = 17 where slot_id = 64
update scheduleSlot set appointment_id = 18 where slot_id = 67
update scheduleSlot set appointment_id = 19 where slot_id = 69
update scheduleSlot set appointment_id = 20 where slot_id = 71
update scheduleSlot set appointment_id = 21 where slot_id = 75
update scheduleSlot set appointment_id = 22 where slot_id = 77
update scheduleSlot set appointment_id = 23 where slot_id = 81
update scheduleSlot set appointment_id = 24 where slot_id = 86
update scheduleSlot set appointment_id = 25 where slot_id = 90
update scheduleSlot set appointment_id = 26 where slot_id = 91
update scheduleSlot set appointment_id = 27 where slot_id = 93
update scheduleSlot set appointment_id = 28 where slot_id = 95
update scheduleSlot set appointment_id = 29 where slot_id = 96
update scheduleSlot set appointment_id = 30 where slot_id = 98
update scheduleSlot set appointment_id = 31 where slot_id = 100
update scheduleSlot set appointment_id = 32 where slot_id = 101
update scheduleSlot set appointment_id = 33 where slot_id = 110
update scheduleSlot set appointment_id = 34 where slot_id = 112
update scheduleSlot set appointment_id = 35 where slot_id = 115
update scheduleSlot set appointment_id = 36 where slot_id = 118
update scheduleSlot set appointment_id = 37 where slot_id = 124
update scheduleSlot set appointment_id = 38 where slot_id = 130
update scheduleSlot set appointment_id = 39 where slot_id = 131
update scheduleSlot set appointment_id = 40 where slot_id = 141
update scheduleSlot set appointment_id = 41 where slot_id = 150
update scheduleSlot set appointment_id = 42 where slot_id = 152
update scheduleSlot set appointment_id = 43 where slot_id = 153
update scheduleSlot set appointment_id = 44 where slot_id = 154
update scheduleSlot set appointment_id = 45 where slot_id = 155
update scheduleSlot set appointment_id = 46 where slot_id = 157
update scheduleSlot set appointment_id = 47 where slot_id = 159
update scheduleSlot set appointment_id = 48 where slot_id = 161
update scheduleSlot set appointment_id = 49 where slot_id = 165
update scheduleSlot set appointment_id = 50 where slot_id = 166
update scheduleSlot set appointment_id = 51 where slot_id = 174
update scheduleSlot set appointment_id = 52 where slot_id = 175
update scheduleSlot set appointment_id = 53 where slot_id = 176
update scheduleSlot set appointment_id = 54 where slot_id = 177
update scheduleSlot set appointment_id = 55 where slot_id = 185
update scheduleSlot set appointment_id = 56 where slot_id = 188
update scheduleSlot set appointment_id = 57 where slot_id = 189
update scheduleSlot set appointment_id = 58 where slot_id = 197
update scheduleSlot set appointment_id = 59 where slot_id = 203
update scheduleSlot set appointment_id = 60 where slot_id = 212
update scheduleSlot set appointment_id = 61 where slot_id = 215
update scheduleSlot set appointment_id = 62 where slot_id = 223
update scheduleSlot set appointment_id = 63 where slot_id = 225
update scheduleSlot set appointment_id = 64 where slot_id = 226
update scheduleSlot set appointment_id = 65 where slot_id = 228
update scheduleSlot set appointment_id = 66 where slot_id = 232
update scheduleSlot set appointment_id = 67 where slot_id = 237
update scheduleSlot set appointment_id = 68 where slot_id = 244
update scheduleSlot set appointment_id = 69 where slot_id = 246
update scheduleSlot set appointment_id = 70 where slot_id = 249
update scheduleSlot set appointment_id = 71 where slot_id = 253
update scheduleSlot set appointment_id = 72 where slot_id = 254
update scheduleSlot set appointment_id = 73 where slot_id = 259
update scheduleSlot set appointment_id = 74 where slot_id = 261
update scheduleSlot set appointment_id = 75 where slot_id = 263
update scheduleSlot set appointment_id = 76 where slot_id = 264
update scheduleSlot set appointment_id = 77 where slot_id = 275
update scheduleSlot set appointment_id = 78 where slot_id = 276
update scheduleSlot set appointment_id = 79 where slot_id = 279
update scheduleSlot set appointment_id = 80 where slot_id = 291
update scheduleSlot set appointment_id = 81 where slot_id = 292
update scheduleSlot set appointment_id = 82 where slot_id = 297
update scheduleSlot set appointment_id = 83 where slot_id = 309
update scheduleSlot set appointment_id = 84 where slot_id = 316
update scheduleSlot set appointment_id = 85 where slot_id = 385
update scheduleSlot set appointment_id = 86 where slot_id = 386
update scheduleSlot set appointment_id = 87 where slot_id = 387
update scheduleSlot set appointment_id = 88 where slot_id = 390
update scheduleSlot set appointment_id = 89 where slot_id = 391
update scheduleSlot set appointment_id = 90 where slot_id = 392
update scheduleSlot set appointment_id = 91 where slot_id = 393
update scheduleSlot set appointment_id = 92 where slot_id = 395
update scheduleSlot set appointment_id = 93 where slot_id = 396
update scheduleSlot set appointment_id = 94 where slot_id = 406
update scheduleSlot set appointment_id = 95 where slot_id = 408
update scheduleSlot set appointment_id = 96 where slot_id = 421
update scheduleSlot set appointment_id = 97 where slot_id = 424
update scheduleSlot set appointment_id = 98 where slot_id = 426
update scheduleSlot set appointment_id = 99 where slot_id = 429
update scheduleSlot set appointment_id = 100 where slot_id = 430
update scheduleSlot set appointment_id = 101 where slot_id = 435
update scheduleSlot set appointment_id = 102 where slot_id = 447
update scheduleSlot set appointment_id = 103 where slot_id = 450
update scheduleSlot set appointment_id = 104 where slot_id = 454
update scheduleSlot set appointment_id = 105 where slot_id = 455
update scheduleSlot set appointment_id = 106 where slot_id = 461
update scheduleSlot set appointment_id = 107 where slot_id = 463
update scheduleSlot set appointment_id = 108 where slot_id = 468
update scheduleSlot set appointment_id = 109 where slot_id = 469
update scheduleSlot set appointment_id = 110 where slot_id = 489
update scheduleSlot set appointment_id = 111 where slot_id = 490
update scheduleSlot set appointment_id = 112 where slot_id = 493
update scheduleSlot set appointment_id = 113 where slot_id = 497
update scheduleSlot set appointment_id = 114 where slot_id = 505
update scheduleSlot set appointment_id = 115 where slot_id = 508
update scheduleSlot set appointment_id = 116 where slot_id = 513
update scheduleSlot set appointment_id = 117 where slot_id = 516
update scheduleSlot set appointment_id = 118 where slot_id = 517
update scheduleSlot set appointment_id = 119 where slot_id = 527
update scheduleSlot set appointment_id = 120 where slot_id = 531
update scheduleSlot set appointment_id = 121 where slot_id = 538
update scheduleSlot set appointment_id = 122 where slot_id = 539
update scheduleSlot set appointment_id = 123 where slot_id = 548
update scheduleSlot set appointment_id = 124 where slot_id = 554
update scheduleSlot set appointment_id = 125 where slot_id = 555
update scheduleSlot set appointment_id = 126 where slot_id = 560
update scheduleSlot set appointment_id = 127 where slot_id = 565
update scheduleSlot set appointment_id = 128 where slot_id = 568
update scheduleSlot set appointment_id = 129 where slot_id = 574
update scheduleSlot set appointment_id = 130 where slot_id = 586
update scheduleSlot set appointment_id = 131 where slot_id = 588
update scheduleSlot set appointment_id = 132 where slot_id = 589
update scheduleSlot set appointment_id = 133 where slot_id = 593
update scheduleSlot set appointment_id = 134 where slot_id = 598
update scheduleSlot set appointment_id = 135 where slot_id = 605
update scheduleSlot set appointment_id = 136 where slot_id = 626
update scheduleSlot set appointment_id = 137 where slot_id = 631
update scheduleSlot set appointment_id = 138 where slot_id = 640
update scheduleSlot set appointment_id = 139 where slot_id = 644
update scheduleSlot set appointment_id = 140 where slot_id = 646
update scheduleSlot set appointment_id = 141 where slot_id = 650
update scheduleSlot set appointment_id = 142 where slot_id = 652
update scheduleSlot set appointment_id = 143 where slot_id = 673
update scheduleSlot set appointment_id = 144 where slot_id = 675
update scheduleSlot set appointment_id = 145 where slot_id = 684
update scheduleSlot set appointment_id = 146 where slot_id = 692
update scheduleSlot set appointment_id = 147 where slot_id = 695
update scheduleSlot set appointment_id = 148 where slot_id = 696
update scheduleSlot set appointment_id = 149 where slot_id = 707
update scheduleSlot set appointment_id = 150 where slot_id = 712
update scheduleSlot set appointment_id = 151 where slot_id = 729
update scheduleSlot set appointment_id = 152 where slot_id = 740
update scheduleSlot set appointment_id = 153 where slot_id = 741
update scheduleSlot set appointment_id = 154 where slot_id = 755
update scheduleSlot set appointment_id = 155 where slot_id = 761
update scheduleSlot set appointment_id = 156 where slot_id = 833
update scheduleSlot set appointment_id = 157 where slot_id = 834
update scheduleSlot set appointment_id = 158 where slot_id = 835
update scheduleSlot set appointment_id = 159 where slot_id = 836
update scheduleSlot set appointment_id = 160 where slot_id = 837
update scheduleSlot set appointment_id = 161 where slot_id = 838
update scheduleSlot set appointment_id = 162 where slot_id = 839
update scheduleSlot set appointment_id = 163 where slot_id = 840
update scheduleSlot set appointment_id = 164 where slot_id = 850
update scheduleSlot set appointment_id = 165 where slot_id = 855
update scheduleSlot set appointment_id = 166 where slot_id = 856
update scheduleSlot set appointment_id = 167 where slot_id = 868
update scheduleSlot set appointment_id = 168 where slot_id = 877
update scheduleSlot set appointment_id = 169 where slot_id = 879
update scheduleSlot set appointment_id = 170 where slot_id = 882
update scheduleSlot set appointment_id = 171 where slot_id = 884
update scheduleSlot set appointment_id = 172 where slot_id = 886
update scheduleSlot set appointment_id = 173 where slot_id = 887
update scheduleSlot set appointment_id = 174 where slot_id = 888
update scheduleSlot set appointment_id = 175 where slot_id = 891
update scheduleSlot set appointment_id = 176 where slot_id = 897
update scheduleSlot set appointment_id = 177 where slot_id = 899
update scheduleSlot set appointment_id = 178 where slot_id = 904
update scheduleSlot set appointment_id = 179 where slot_id = 905
update scheduleSlot set appointment_id = 180 where slot_id = 907
update scheduleSlot set appointment_id = 181 where slot_id = 912
update scheduleSlot set appointment_id = 182 where slot_id = 918
update scheduleSlot set appointment_id = 183 where slot_id = 920
update scheduleSlot set appointment_id = 184 where slot_id = 923
update scheduleSlot set appointment_id = 185 where slot_id = 933
update scheduleSlot set appointment_id = 186 where slot_id = 935
update scheduleSlot set appointment_id = 187 where slot_id = 939
update scheduleSlot set appointment_id = 188 where slot_id = 944
update scheduleSlot set appointment_id = 189 where slot_id = 953
update scheduleSlot set appointment_id = 190 where slot_id = 964
update scheduleSlot set appointment_id = 191 where slot_id = 976
update scheduleSlot set appointment_id = 192 where slot_id = 979
update scheduleSlot set appointment_id = 193 where slot_id = 980
update scheduleSlot set appointment_id = 194 where slot_id = 996
update scheduleSlot set appointment_id = 195 where slot_id = 1002
update scheduleSlot set appointment_id = 196 where slot_id = 1006
update scheduleSlot set appointment_id = 197 where slot_id = 1008
update scheduleSlot set appointment_id = 198 where slot_id = 1016
update scheduleSlot set appointment_id = 199 where slot_id = 1017
update scheduleSlot set appointment_id = 200 where slot_id = 1027
update scheduleSlot set appointment_id = 201 where slot_id = 1030
update scheduleSlot set appointment_id = 202 where slot_id = 1051
update scheduleSlot set appointment_id = 203 where slot_id = 1055
update scheduleSlot set appointment_id = 204 where slot_id = 1060
update scheduleSlot set appointment_id = 205 where slot_id = 1061
update scheduleSlot set appointment_id = 206 where slot_id = 1074
update scheduleSlot set appointment_id = 207 where slot_id = 1090
update scheduleSlot set appointment_id = 208 where slot_id = 1095
update scheduleSlot set appointment_id = 209 where slot_id = 1106
update scheduleSlot set appointment_id = 210 where slot_id = 1107
update scheduleSlot set appointment_id = 211 where slot_id = 1109
update scheduleSlot set appointment_id = 212 where slot_id = 1113
update scheduleSlot set appointment_id = 213 where slot_id = 1115
update scheduleSlot set appointment_id = 214 where slot_id = 1124
update scheduleSlot set appointment_id = 215 where slot_id = 1127
update scheduleSlot set appointment_id = 216 where slot_id = 1129
update scheduleSlot set appointment_id = 217 where slot_id = 1143
update scheduleSlot set appointment_id = 218 where slot_id = 1151
update scheduleSlot set appointment_id = 219 where slot_id = 1155
update scheduleSlot set appointment_id = 220 where slot_id = 1156
update scheduleSlot set appointment_id = 221 where slot_id = 1157
update scheduleSlot set appointment_id = 222 where slot_id = 1159
update scheduleSlot set appointment_id = 223 where slot_id = 1171
update scheduleSlot set appointment_id = 224 where slot_id = 1187
update scheduleSlot set appointment_id = 225 where slot_id = 1188
update scheduleSlot set appointment_id = 226 where slot_id = 1189
update scheduleSlot set appointment_id = 227 where slot_id = 1191
update scheduleSlot set appointment_id = 228 where slot_id = 1192
update scheduleSlot set appointment_id = 229 where slot_id = 1205
update scheduleSlot set appointment_id = 230 where slot_id = 1206
update scheduleSlot set appointment_id = 231 where slot_id = 1211
update scheduleSlot set appointment_id = 232 where slot_id = 1281
update scheduleSlot set appointment_id = 233 where slot_id = 1282
update scheduleSlot set appointment_id = 234 where slot_id = 1283
update scheduleSlot set appointment_id = 235 where slot_id = 1284
update scheduleSlot set appointment_id = 236 where slot_id = 1285
update scheduleSlot set appointment_id = 237 where slot_id = 1286
update scheduleSlot set appointment_id = 238 where slot_id = 1287
update scheduleSlot set appointment_id = 239 where slot_id = 1288
update scheduleSlot set appointment_id = 240 where slot_id = 1289
update scheduleSlot set appointment_id = 241 where slot_id = 1290
update scheduleSlot set appointment_id = 242 where slot_id = 1291
update scheduleSlot set appointment_id = 243 where slot_id = 1292
update scheduleSlot set appointment_id = 244 where slot_id = 1293
update scheduleSlot set appointment_id = 245 where slot_id = 1294
update scheduleSlot set appointment_id = 246 where slot_id = 1295
update scheduleSlot set appointment_id = 247 where slot_id = 1296
update scheduleSlot set appointment_id = 248 where slot_id = 1297
update scheduleSlot set appointment_id = 249 where slot_id = 1298
update scheduleSlot set appointment_id = 250 where slot_id = 1299
update scheduleSlot set appointment_id = 251 where slot_id = 1305
update scheduleSlot set appointment_id = 252 where slot_id = 1306
update scheduleSlot set appointment_id = 253 where slot_id = 1309
update scheduleSlot set appointment_id = 254 where slot_id = 1310
update scheduleSlot set appointment_id = 255 where slot_id = 1317
update scheduleSlot set appointment_id = 256 where slot_id = 1319
update scheduleSlot set appointment_id = 257 where slot_id = 1322
update scheduleSlot set appointment_id = 258 where slot_id = 1326
update scheduleSlot set appointment_id = 259 where slot_id = 1327
update scheduleSlot set appointment_id = 260 where slot_id = 1328
update scheduleSlot set appointment_id = 261 where slot_id = 1330
update scheduleSlot set appointment_id = 262 where slot_id = 1346
update scheduleSlot set appointment_id = 263 where slot_id = 1351
update scheduleSlot set appointment_id = 264 where slot_id = 1355
update scheduleSlot set appointment_id = 265 where slot_id = 1358
update scheduleSlot set appointment_id = 266 where slot_id = 1365
update scheduleSlot set appointment_id = 267 where slot_id = 1372
update scheduleSlot set appointment_id = 268 where slot_id = 1376
update scheduleSlot set appointment_id = 269 where slot_id = 1380
update scheduleSlot set appointment_id = 270 where slot_id = 1389
update scheduleSlot set appointment_id = 271 where slot_id = 1390
update scheduleSlot set appointment_id = 272 where slot_id = 1396
update scheduleSlot set appointment_id = 273 where slot_id = 1413
update scheduleSlot set appointment_id = 274 where slot_id = 1414
update scheduleSlot set appointment_id = 275 where slot_id = 1415
update scheduleSlot set appointment_id = 276 where slot_id = 1421
update scheduleSlot set appointment_id = 277 where slot_id = 1422
update scheduleSlot set appointment_id = 278 where slot_id = 1427
update scheduleSlot set appointment_id = 279 where slot_id = 1430
update scheduleSlot set appointment_id = 280 where slot_id = 1441
update scheduleSlot set appointment_id = 281 where slot_id = 1448
update scheduleSlot set appointment_id = 282 where slot_id = 1454
update scheduleSlot set appointment_id = 283 where slot_id = 1458
update scheduleSlot set appointment_id = 284 where slot_id = 1460
update scheduleSlot set appointment_id = 285 where slot_id = 1461
update scheduleSlot set appointment_id = 286 where slot_id = 1484
update scheduleSlot set appointment_id = 287 where slot_id = 1486
update scheduleSlot set appointment_id = 288 where slot_id = 1490
update scheduleSlot set appointment_id = 289 where slot_id = 1492
update scheduleSlot set appointment_id = 290 where slot_id = 1493
update scheduleSlot set appointment_id = 291 where slot_id = 1496
update scheduleSlot set appointment_id = 292 where slot_id = 1504
update scheduleSlot set appointment_id = 293 where slot_id = 1511
update scheduleSlot set appointment_id = 294 where slot_id = 1513
update scheduleSlot set appointment_id = 295 where slot_id = 1515
update scheduleSlot set appointment_id = 296 where slot_id = 1516
update scheduleSlot set appointment_id = 297 where slot_id = 1517
update scheduleSlot set appointment_id = 298 where slot_id = 1519
update scheduleSlot set appointment_id = 299 where slot_id = 1531
update scheduleSlot set appointment_id = 300 where slot_id = 1532
update scheduleSlot set appointment_id = 301 where slot_id = 1540
update scheduleSlot set appointment_id = 302 where slot_id = 1546
update scheduleSlot set appointment_id = 303 where slot_id = 1549
update scheduleSlot set appointment_id = 304 where slot_id = 1554
update scheduleSlot set appointment_id = 305 where slot_id = 1561
update scheduleSlot set appointment_id = 306 where slot_id = 1567
update scheduleSlot set appointment_id = 307 where slot_id = 1571
update scheduleSlot set appointment_id = 308 where slot_id = 1577
update scheduleSlot set appointment_id = 309 where slot_id = 1580
update scheduleSlot set appointment_id = 310 where slot_id = 1585
update scheduleSlot set appointment_id = 311 where slot_id = 1593
update scheduleSlot set appointment_id = 312 where slot_id = 1597
update scheduleSlot set appointment_id = 313 where slot_id = 1610
update scheduleSlot set appointment_id = 314 where slot_id = 1611
update scheduleSlot set appointment_id = 315 where slot_id = 1612
update scheduleSlot set appointment_id = 316 where slot_id = 1613

GO

SELECT * FROM staff
SELECT * FROM client
SELECT * FROM animal
SELECT * FROM appointment
SELECT * FROM invoice
SELECT * FROM scheduleSlot
GO

-- Name: Ethan MacLeod
-- ID: 1577310
--
-- Answer Q1 Below
-- Select * from CambridgeCats
go
Drop view CambridgeCats
go
Create view CambridgeCats As
SELECT DISTINCT(an.name), an.breed, a.illness, c.fname, c.lname
FROM animal an, appointment a, client c
WHERE a.animal_id = an.animal_id
AND an.owner_id = c.client_id
AND an.category = 'Cat'
and c.town = 'Cambridge'

Select * from CambridgeCats


-- Answer Q2 Below
-- Select * from Canine where startTime > '10:00'

go
drop view Canine
go
create view Canine as
select s.fName, s.lName, s.role, a.appointment_id as 'app', ss.dayDate, ss.startTime, ss.endTime
from scheduleSlot ss, staff s, appointment a
where ss.appointment_id = a.appointment_id
and ss.staff_id = s.staff_id
and role = 'Canine Specialist'

Select * from Canine where startTime > '10:00'



-- Answer Q3 Below
-- Select * from SickDog

go
drop view SickDog
go
create view SickDog as
Select c.fName, c.lName, an.category, an.breed, an.name, a.illness
FROM Canine c, appointment a, animal an
where c.app = a.appointment_id
and a.animal_id = an.animal_id
and a.confirmed = 1


Select * from SickDog


-- Answer Q4 Below
-- Exec AnimalsOwnedBy 
-- Exec AnimalsOwnedBy Amber, Page
-- Exec AnimalsOwnedBy Larry, Bird
-- Exec AnimalsOwnedBy Larry, Page

go
Drop Procedure AnimalsOwnedBy
go
Create Procedure AnimalsOwnedBy @fname VARCHAR(50) = NULL, @sname VARCHAR(50) = NULL AS
IF @sname is NULL 
Begin
	PRINT 'Please enter the first and last name of a registered client'
	return
END
IF NOT EXISTS (select * from client where fName = @fname) BEGIN
	PRINT 'No customer with first name ' + @fname
	return
END
IF NOT EXISTS (select * from client where lName = @sname) BEGIN
	PRINT 'No customer with last name ' + @sname
	return
END
DECLARE @count int
Set @count = (Select count(*) from animal a, client c where a.owner_id = c.client_id and c.fname = @fname and c.lName = @sname)
PRINT @fname + ' ' + @sname + ' has ' + str(@count, 2) + ' animals.'

Exec AnimalsOwnedBy 
Exec AnimalsOwnedBy Amber, Page
Exec AnimalsOwnedBy Larry, Bird
Exec AnimalsOwnedBy Larry, Page



-- Answer Q5 Below
-- Exec AnimalAppointments 
-- Exec AnimalAppointments Amber
-- Exec AnimalAppointments Larry

go
Drop Procedure AnimalsAppointments
go
Create Procedure AnimalAppointments @name VARCHAR(50) = NULL AS
IF @name is NULL 
Begin
	PRINT 'Please enter the name of a registered animal'
	return
END
IF NOT EXISTS (select * from animal where name = @name) BEGIN
	PRINT  @name + ' is not a registered animal name'
	return
END
select ss.room, ss.startTime as 'Start Time', ss.endTime as 'End Time', s.fname, s.lname
from scheduleSlot ss, staff s, appointment a, animal an
where ss.staff_id = s.staff_id
and ss.appointment_id = a.appointment_id
and a.animal_id = an.animal_id
and an.name = @name

Exec AnimalAppointments
Exec AnimalAppointments Amber
Exec AnimalAppointments Larry

-- Answer Q6 Below

Go
Drop trigger InvoicePaid
Go
create trigger InvoicePaid on invoice
for insert,update as
if @@ROWCOUNT = 0 return
DECLARE @pdate date, @idate date
Set @pdate = (select paidDate from inserted)
Set @idate = (select invoiceDate from inserted)
if (DATEDIFF(dayofyear, @pdate, @idate) > 0)
begin
	raiserror('This invoice was paid before it was created!', 16,1)
	rollback transaction
end


-- Answer Q7 Below
******************************************
Begin Transaction
UPDATE invoice set paidDate = '2024-06-03' where paidDate = null
Rollback Transaction

Begin Transaction
INSERT INTO invoice VALUES ('80','2023-05-23','2023-05-20')
Rollback Transactio

-- Answer Q8 Below

Go
Drop trigger CatVet
Go
create trigger CatVet on scheduleSlot
for update as
if @@ROWCOUNT = 0 return
if ((select category from animal where animal_id = (select animal_id from inserted)) = 'Cat'
	AND (select role from staff where staff_id = (select staff_id from inserted)) !=  'Feline Specialist'
	)
begin
	raiserror('Not a feline specialist!', 16,1)
	rollback transaction
end


-- Answer Q9 Below

Begin Transaction
Update scheduleSlot set appointment_id = 23 where slot_id = 1002
Rollback Transaction

Begin Transaction
Update scheduleSlot set appointment_id = 14 where slot_id = 1002
Rollback Transaction

Begin Transaction
Update scheduleSlot set appointment_id = 35 where slot_id = 263
Rollback Transaction



-- Answer Q10 Below
-- Exec WeightChange 'Luna'
-- Exec WeightChange 'Shadow'
-- Exec WeightChange 'Blossom'
-- Exec WeightChange 'Babe'

go
Drop Procedure WeightChange
go
Create Procedure WeightChange @name VARCHAR(50) = NULL AS
IF @name is NULL 
Begin
	PRINT 'Please enter the name of a registered animal'
	return
END
IF ((select count(*) from scheduleSlot ss, animal an, appointment a where ss.appointment_id = a.appointment_id AND a.animal_id = an.animal_id AND name = @name) > 1) BEGIN
	PRINT  @name + ' hasn t had more than one appointment'
	return
END
select * from scheduleSlot ss, appointment a, animal an where ss.appointment_id = a.appointment_id and a.animal_id = an.animal_id and name = @name
DECLARE @weightchange int
Set @weightchange = ((Select MAX(animalWeight) from appointment a, animal an where a.animal_id = an.animal_id AND name = @name) - (Select MAX(animalWeight) from appointment a, animal an where a.animal_id = an.animal_id AND name = @name))
IF (@weightchange > 0)Begin
	PRINT @name + ' has increased ' + str(@weightchange, 2) + ' kilograms'
	return
end
IF (@weightchange < 0)begin
	PRINT @name + ' has decreased ' + str(@weightchange, 2) + ' kilograms'
	return
end

Exec WeightChange 'Luna'
Exec WeightChange 'Shadow'
Exec WeightChange 'Blossom'
Exec WeightChange 'Babe'


-- Answer Q11 (Bonus) Below



