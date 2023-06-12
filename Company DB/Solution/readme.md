# <a name="_lg846yc9hvil"></a>Conceptual Model,
<a name="_kvl9upee4zzt"></a>
**The entities with their unique attributes**
---------------------------------------------

|Entity|Attributes|Unique Attributes|
| :- | :- | :- |
|Employee|<p>1. Employee ID</p><p>2. Name</p><p>3. Salary</p><p>4. Type</p>|Employee Id|
|Developer|<p>1. Position </p><p>2. Skill</p>|Employee Id|
|Development Manager|1. Product Type|Employee Id|
|Team|<p>1. Team Id</p><p>2. Team Name</p><p>3. Team Start Date</p>|Team Id|
|Project|<p>1. Project Id</p><p>2. Project Name</p><p>3. Start Date</p><p>4. End Date</p>|Project Id|
|Hours Worked|1. Number of Hours Worked|<p>Employee Id</p><p>Project Id</p>|












## <a name="_dvw1guq8voz1"></a>**Supertype and Subtype**

In the scenario given, it can be seen that there is a supertype entity  “Employee” which has two subtypes “Developer” and “Development Manager” as the basic information of “Developer” and “Development Manager” is found in the entity “Employee”. 

|Supertype|Subtypes|
| :- | :- |
|Employee|<p>Developer</p><p>Development Manager</p>|



Single Table inheritance is found using the discriminator “Category” of the entity “Employee”. The employee can be either a developer or a development manager.
## <a name="_miimll4ejj0q"></a>**Multi-valued and Composite Attributes**

As it is assumed that the employee will be either the developer or development manager a multivalued attribute could not be found here. 

But assuming that Multiple teams can work on a project the “Team Id” of each working team should be stored in the entity of “Project”. So then “Team id” will be a multivalued attribute for the entity “Project”. 

Now because a developer can work on multiple projects and their hours worked should be classified by the project also to identify how much they have contributed to each project. So to uniquely identify this contribution C Composite attributes are formed using the “Employee Id” of the “Developer” and “Project Id” of “Project” by combining these two a composite attribute is found which is stored inside the “Hours Worked “ entity.











## <a name="_sbg7yj2f40j"></a>**Relationships**

1. Assuming that one Development Manager can contribute to multiple teams. A **one-to-many** relationship can be found between them. On the “Development manager” side the cardinality will be (1,\*) as one “Development manager” can contribute to multiple teams, and on the “Team” side the cardinality will be (1,1)  assuming that one team can have only one development manager.  

1. One “Developer” can work in only one “team” and a “team” can have multiple “Developers”. So they have a **many-to-one** relationship. On the developer side, they have a cardinality (1,1)  as one “Developer” belongs to only one “Team” and on the “Team” side the cardinality is (1,\*) as the “Team” can have multiple “Developer”

1. Each “Developer” can have multiple “Hours Worked” fields. so there exists a **one-to-many** relationship between them. On the “Developer” side the cardinality is (1,\*)  as each “Developer”  might or might not contribute any working hours and each entry of the “Hours Worked” entity belongs to only one “Developer” so cardinality (1,1) is used.

1. Each “Project” can have multiple “Hours Worked “entries by Multiple “Developers” so there belongs to a **many-to-one** relation between “Hours Worked” and “Project”. On the project side, the cardinality is (1,\*) meaning that each “Project” will have at least one entry of “Hours Worked”. In the “Hours Worked” side the cardinality is (1,1) as each data will refer to only one “Project”.

1. As one “Team” can work on multiple “Projects” and one project can have “Multiple Teams” There belongs a **many-to-many** relation between them. On the “Team” side the cardinality will be (1,\*)  as one team can contribute to many projects, and on the other hand on the “Project” side, the cardinality will be (1,\*) as one “Project” can have multiple "teams” involved in it.










## <a name="_7z190lwtw7sh"></a>**Conceptual Model Enhanced Entity-Relationship diagram**


![Employee ERD drawio](https://github.com/piru72/Database/assets/63257806/28b2da97-e37b-4408-99a0-c9339c8df598)



##
## <a name="_3z6d3qb6xc4s"></a><a name="_a4oenowbwqsl"></a> 



# <a name="_xe31gsmdsk5e"></a>Logical Model

In the conceptual model there were 6 entities found. Now in the logical model, those will become relations or tables and their attributes will become fields. Also, the unique identifiers of each entity will become the primary key of each relation.

For the entity “Employee” there were 4 attributes and among them “Id” is unique for each employee so it will become the primary key of the new relation(table) and type, name, and salary will become fields as those are not unique. 

Now as the entity “Developer” is a subtype of “Employee” the unique identifier of “Employee”  will be used both as a foreign key and primary key. Through this primary Key, the developer can be identified. Alongside that, it had two other attributes also which were skill and position. Those will be normal fields.

The same goes for the “Development Manager“ Entity, as it is also a subtype of “Employee” so the unique identifier of “Employee”, will be used both as a foreign key and primary key and the attribute product type will become a field.

Now, in the case of the “Team” entity. It will have a unique identifier named “TeamId” which will become the primary key of this relation and alongside it, teamName and teamStartDate will be added as normal fields. But as it is mentioned that the team lead will be a “Developer” and “Team” and “Developer” has many one-to-many relations the primary key of “Developer” will be kept as ForeignKey of  “Team” as TeamLeadId. And same goes for the relation between “Development Manager” and “Team” as they are connected in one-to-many relations the Primary key of “Development Manager” will be stored as the foreign key of “Team” as managerId.


Now in the “Project” entity, the primary key will be “ProjectId” as it is the unique identifier and other general attributes like ProjectName, StartDate, and EndDate will become fields. But here as many-to-many relations exist between “Team” and “Project” as a result there is a multi-valued attribute TeamId in the project. So along with teamId and ProjectId, another relation is needed to be created. 

Let the new relation name be called “TeamProject” where “TeamId” and “ProjectId” come as foreign keys. Together with both of them, they will make a composite primary key.

The “Hours Worked” entity has many-to-one relation with both “Developer” and “Project”. So their primary keys will be kept as a foreign key in the “Hours Worked” relation and together they will also create a composite key to build a connection between the “Developer” and “Project”. Alongside that the normal attribute “number of hours” will be kept as a normal field.
## <a name="_35awwa7e45zi"></a>Data Types

Describing the data type for each field in relation with their respective constraint

**Table 01:  Employee**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Id|Int|Primary Key |
|Name|Varchar(50)|Not Null|
|Salary|Int|Not Null|
|Type|Varchar(40)|Not Null|

**Table 02: Developer**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Id|Int|Primary Key, Foreign Key(Employee)|
|Skill |Varchar(50)|Not Null|
|Position|Varchar(50)|Not Null|




**Table 03: Development Manager**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Id|Int|Primary Key , Foreign Key(Employee)|
|Product Type|Varchar(50)|Not Null|

**Table 04: Hours Worked**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Id|Int|Primary Key , Foreign Key(Employee)|
|Project Id|Int|Primary Key, Foreign Key(Project)|
|Number Of hours|int|Not Null|

**Table 5:  Project**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Project Id|Int|Primary Key |
|Project  Name|Varchar(50)|Not Null|
|Start Date |Date|Not Null|
|End Date|Date|Not Null|

**Table 06: Team**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Team Id|Int|Primary Key |
|TeamName|Varchar(50)|Not Null|
|Start Date|Date|Not Null|
|TeamLeadId|Int|Not Null|
|TeamManagerId|Int|F.K(Development manager)|

**Table 07:  TeamProject**

|**Field**|**Type**|**Constraint**|
| :-: | :-: | :-: |
|Team Id|Int|Primary Key , Foreign Key(Team)|
|Project Id|Int|Primary Key, Foreign Key(Project)|
## <a name="_r0zm82ciit4x"></a>Logical Model diagram
##








![Copy of Employee ERD drawio](https://github.com/piru72/Database/assets/63257806/e969938a-a1f7-4568-8483-00b0d1f119bb)











## <a name="_cl5yt4vh3a3n"></a><a name="_9ogm4jnxsrt4"></a>Query
1. Creating the tables



|Table  Name|Query|
| :- | :- |
|Employee|<p>CREATE TABLE employee (</p><p>`  `Id int(11) UNSIGNED NOT NULL,</p><p>`  `Name varchar(50) NOT NULL,</p><p>`  `Salary int(11) NOT NULL,</p><p>`  `Type varchar(40) NOT NULL,</p><p>`   `PRIMARY KEY( Id)</p><p>);</p>|
|Developer|<p>CREATE TABLE developer (</p><p>`  `Id int(11) UNSIGNED NOT NULL,</p><p>`  `Skill varchar(50) NOT NULL,</p><p>`  `Position varchar(50) NOT NULL,</p><p>`   `PRIMARY KEY( Id),</p><p>`   `FOREIGN KEY (Id) REFERENCES employee(Id)</p><p>);</p>|
|Development Manager|<p>CREATE TABLE `development manager` (</p><p>`  `Id int(11) UNSIGNED NOT NULL,</p><p>`  ``product type` varchar(50) NOT NULL,<br>`   `PRIMARY KEY( Id),</p><p>`   `FOREIGN KEY (Id) REFERENCES employee(Id)</p><p>);</p>|
|Project|<p>CREATE TABLE project (</p><p>`  ``Project Id` int(11) UNSIGNED NOT NULL,</p><p>`  ``Project Name` varchar(50) NOT NULL,</p><p>`  ``Start Date` date NOT NULL,</p><p>`  ``End Date` date NOT NULL,</p><p>`   `PRIMARY KEY(`Project Id`)</p><p>);</p>|
|Hours Worked|<p>CREATE TABLE `hours worked` (</p><p>`  `Id int(11) UNSIGNED NOT NULL,</p><p>`  ``Project Id` int(11) UNSIGNED NOT NULL,</p><p>`  ``Number of hours` int(11) UNSIGNED NOT NULL,</p><p>`   `FOREIGN KEY (Id) REFERENCES employee(Id),</p><p>`   `FOREIGN KEY (`Project Id`) REFERENCES project(`Project Id`)</p><p>);</p><p></p>|
|Team|<p>CREATE TABLE `team` (</p><p>`  ``Team Id` int(11) UNSIGNED NOT NULL,</p><p>`  ``Team name` varchar(50) NOT NULL,</p><p>`  ``Start Date` date NOT NULL,</p><p>`  ``Team Lead Id` int(11) UNSIGNED NOT NULL,</p><p>`  ``Team Manager Id` int(11) UNSIGNED NOT NULL,</p><p>` 	`PRIMARY KEY(`Team Id`),</p><p>`	`FOREIGN KEY (`Team Manager Id`) REFERENCES `development manager`(Id),</p><p>`	`FOREIGN KEY (`Team Lead Id`) REFERENCES developer(Id)</p><p></p><p>) ;</p><p></p><p></p>|
|Team Project|<p>CREATE TABLE `teamproject` (</p><p>`  ``Team Id` int(11) UNSIGNED NOT NULL,</p><p>`  ``Project Id` int(11) UNSIGNED NOT NULL,</p><p>FOREIGN KEY (`Project Id`) REFERENCES project(`Project Id`),</p><p>FOREIGN KEY (`Team Id`) REFERENCES team(`Team Id`)</p><p>);</p><p></p><p></p>|




2\. Populating the tables

|Table  Name|Query|
| :- | :- |
|Employee|<p>INSERT INTO `employee` (`Id`, `Name`, `Salary`, `Type`) VALUES</p><p>(1, 'Lura', 500, 'Developer'),</p><p>(2, 'Nabil', 600, 'Developer'),</p><p>(3, 'Nick', 700, 'Development Manager'),</p><p>(4, 'Bob', 800, 'Development Manager');</p>|
|Developer|<p>INSERT INTO `developer` (`Id`, `Skill`, `Position`) VALUES</p><p>(1, 'Frond-End Developer', 'Junior Software Engineer'),</p><p>(2, 'Back - End', 'Senior Software Developer');</p>|
|Development Manager|<p>INSERT INTO `development manager` (`id`, `product type`) VALUES</p><p>(3, 'LMS'),</p><p>(4, 'Inventory System');</p>|
|Project|<p>INSERT INTO `project` (`Project Id`, `Project Name`, `Start Date`, `End Date`) VALUES</p><p>(1, 'Project A', '2023-05-01', '2023-07-31'),</p><p>(2, 'Project B', '2023-06-01', '2023-08-31'),</p><p>(3, 'Project C', '2023-07-01', '2023-09-30'),</p><p>(4, 'Project D', '2023-08-01', '2023-11-30');</p>|
|Hours Worked|<p>INSERT INTO `hours worked` (`id`, `Project Id`, `Number of hours`) VALUES</p><p>(1, 1, 20),</p><p>(1, 2, 40),</p><p>(2, 2, 50);</p>|
|Team|<p>INSERT INTO `team` (`Team Id`, `Team name`, `Start Date`, `Team Lead Id`, `Team Manager Id`) VALUES</p><p>(1, 'Front End Team', '2022-01-01', 1, 3),</p><p>(2, 'Back end Team', '2022-01-15', 2, 4),</p><p>(3, 'LMS Team', '2022-02-01', 1, 4),</p><p>(4, 'Inventory Team', '2022-02-15', 2, 3);</p>|
|Team Project|<p> 
```sql 
INSERT INTO `teamproject` (`Team Id`, `Project Id`) VALUES</p><p>(1, 1),</p><p>(2, 1),</p><p>(1, 3); 
```
</p>|





3\. Development Environment



phpMyAdmin is used with xamp to run the MySql queries. The scrren shots are down below

All the tables
![image](https://github.com/piru72/Database/assets/63257806/6319b4a1-75a3-4b25-8b25-5497ab5f1370)

![image](https://github.com/piru72/Database/assets/63257806/fd9e99c8-b576-47e1-9b5a-d1fa44c14750)




Individual table

![image](https://github.com/piru72/Database/assets/63257806/6dc105ad-b593-44af-aa57-a7f43473ddda)

![image](https://github.com/piru72/Database/assets/63257806/4f8b795b-a6f3-4d0e-90fd-931fca96aa66)

![image](https://github.com/piru72/Database/assets/63257806/f6cfc832-b5ab-472d-a2c8-f37bce84caa3)

![image](https://github.com/piru72/Database/assets/63257806/2f527ccb-7c59-4d60-b123-e2172445223d)
![image](https://github.com/piru72/Database/assets/63257806/434f6780-f259-49f2-94d1-5aeb04f3f4da)

![image](https://github.com/piru72/Database/assets/63257806/56b14fed-268b-4287-a922-d72b971c73b7)
![image](https://github.com/piru72/Database/assets/63257806/1097e579-67f3-48e8-b09c-c5cb6c29b977)



Thank You
