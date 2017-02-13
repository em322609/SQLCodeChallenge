USE [revdb];
GO

CREATE TABLE [Employee](
	[ID] int IDENTITY(1,1) NOT NULL,
	[FIRSTNAME] varchar(100) NOT NULL,
	[LASTNAME] varchar(100) NOT NULL,
	[SALARY] int NOT NULL,
	[STREETADDR] varchar(100) NOT NULL,
	[CITY] varchar(30) NOT NULL,
	[STATE] varchar(25) NOT NULL,
	[ZIP] varchar(10) NOT NULL,
	[DEPARTMENTID] int NOT NULL,
	CONSTRAINT [PK_Employee_ID] PRIMARY KEY CLUSTERED ([ID])
);

CREATE TABLE [Department](
	[DEPARTMENTID] int IDENTITY(1,1) NOT NULL,
	[NAME] varchar(100) NOT NULL
	CONSTRAINT [PK_Department_DEPARTMENTID] PRIMARY KEY CLUSTERED ([DEPARTMENTID])
);

ALTER TABLE [Employee]
ADD CONSTRAINT [FK_Employee_DepartmentID] FOREIGN KEY ([DEPARTMENTID]) REFERENCES [Department] ([DEPARTMENTID])
;

INSERT into Department values ('New Employee');
INSERT into Department values ('Baller');
INSERT into Department values ('President');



INSERT into Employee values ('Erik', 'May', 50000,'2284 Astoria Cr.', 'Herndon', 'VA', '12345',1);
INSERT into Employee values ('Lebron', 'James', 1000000,'123 Address Lane', 'Akron', 'OH', '54321',2);
INSERT into Employee values ('Donald', 'Trump', 100,'17 Pennsylvania Ave', 'New York', 'NY', '56789',3);

SELECT * FROM Employee WHERE DEPARTMENTID = 1;
SELECT SUM(SALARY) FROM Employee WHERE DEPARTMENTID = 1 UNION
SELECT SUM(SALARY) FROM Employee WHERE DEPARTMENTID = 2 UNION
SELECT SUM(SALARY) FROM Employee WHERE DEPARTMENTID = 3;

UPDATE Employee SET SALARY = 500000 WHERE DEPARTMENTID = 1;

ALTER TABLE [Employee]
ADD [DATEHIRED] varchar(100)