CREATE TABLE Region (
    region VARCHAR(40) PRIMARY KEY
);

CREATE TABLE Incomegroup (
    incomegroup VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Country (
    countrycode CHAR(3) PRIMARY KEY,
    country VARCHAR(100),
    region VARCHAR(40),
    incomegroup VARCHAR(30),
    FOREIGN KEY (region) REFERENCES Region(region),
    FOREIGN KEY (incomegroup) REFERENCES Incomegroup(incomegroup)
);

CREATE TABLE University (
    iau_id1 VARCHAR(20) PRIMARY KEY, 
    eng_name VARCHAR(200) NOT NULL, 
    orig_name VARCHAR(200) NOT NULL, 
    foundedyr INTEGER NOT NULL CHECK (foundedyr > 0), 
    yrclosed INTEGER CHECK (yrclosed > 0), 
    private01 VARCHAR(10), 
    latitude FLOAT, 
    longitude FLOAT, 
    phd_granting BOOLEAN NOT NULL, 
    divisions INTEGER, 
    specialized BOOLEAN NOT NULL, 
    year INTEGER,
    countrycode CHAR(3) NOT NULL,
    FOREIGN KEY (countrycode) REFERENCES Country(countrycode)
);

CREATE TABLE EnrollmentData (
    iau_id1 VARCHAR(20),
    year INTEGER,
    students5_estimated INTEGER,
    PRIMARY KEY (iau_id1, year),
    FOREIGN KEY (iau_id1) REFERENCES University(iau_id1)
);
