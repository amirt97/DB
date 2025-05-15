create table members(
	  uid integer primary key,
    name varchar(50) not null,
    occupation varchar(100),
    birthPlace varchar(50),
    gender varchar(6) check (gender='male' or gender='female') not null,
    educatedAt varchar(100),
	  language varchar(50),
	  birthYear integer
);

create table knessets(
	  number integer primary key,
	  startYear integer not null,
	  endYear integer not null
);

create table memberInKnesset(
    uid integer,
    number integer,
    party varchar(100) not null,
    primary key(uid,number, party)
);
