create table Region(
	region varchar(40) primary key
);

create table Incomegroup(
	incomegroup varchar(30) primary key
);

create table Coutnry(
	countrycode char(3) primary key,
	country varchar,
	region varcha(40),
	incomegroup varchar(30)
	foreign key(region) references Region(region),
	foreign key(incomegroup) references Incomegroup(incomegroup)
);

create table Unveristy(
	iau_id1 varchar primary key, 
	eng_name varchar not null, 
	orig_name varchar not null, 
	foundedyr integer check(foundedyr>0) not null, 
	yrclosed integer check(yrclosed>0), 
	private01 varchar, 
	latitude float, 
	longitude float, 
	phd_granting boolean not null, 
	divisions integer, 
	specialized boolean not null, 
	year integer,
	countrycode char(3) not null,
	foreign key(countrycode) references Country(countrycode)

);


create table EnrollmentData(
	iau_id1 varchar primary key,
	year integer primary key,
	students5_estimated integer,
	foreign key(iau_id1) references Unveristy(iau_id1)
);

