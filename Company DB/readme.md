# Database Design and Development


## Database requirements
The ABC Consulting IT company specialises on Mobile Application development for businesses. The company needs a database to store information about projects and employees working on the projects. The task is to design a relational database and create SQL queries to create and populate the tables.
The database requirements contain the following information:
1. Employees working on the projects are divided into two categories: Developers and 
Development Managers.
2. Developers are working in Teams.
3. Each Development Manager manages at least one Team.
4. Each Team works on at least one Project.
5. At least one Team works on a Project.
6. The following general information is stored for each Employee: ID, Name and Salary.
7. The Developer additional attributes are Position and Skill (not multivalued).
8. The Development Manager additional attribute is a Product Type.
9. The Teams attributes are Team ID, team name and team start date.
10. One of the team members (Developers) is also a team leader. This information must also be stored in the database.
11. The Project attributes are Project ID, Project Name, Start Date and End Date
12. HoursWorked is an association between Project and Developer, and it is a number of hours a Developer spent working on a Project.

## Part 1. Conceptual Model
The Conceptual Model, which must include the following 
elements:
1. Entities and their attributes. For each entity you must also specify unique identifier attribute(s)
2. Entity supertypes and subtypes. Describe inheritance types and the corresponding 
discriminators. 
3. Identify multi-valued and composite attributes (if any). In this case, they need to be shown in the ER diagram with the corresponding notations.
4. Describe relationships between entities and their cardinalities. Remember that 
relationships can be one-to-one, one-to-many, many-to-many, and also optional or 
mandatory
5. Draw the Conceptual Model Enhanced Entity-Relationship diagram using 
app.diagrams.net tool, save it as .png or .jpg file and insert it in the Word document

## Part 2. Logical Model
Describe the algorithm of converting the Conceptual Model into the Logical Model. The 
description should include the following elements:
1. Entities in the Conceptual Model become relations (tables) in the Logical Model, and 
unique identifiers become primary keys. 
2. For one-to-one or one-to-many relationship between two entities you will need to 
create a foreign key in one of the relations (tables).
3. If there is a many-to-many relationship between two entities, then you will need to 
create a new relation (table) with a composite primary key
4. For each field (column) in a relation, describe a data type (integer, float, character, 
text etc.)
5. If an entity contains a multi-valued attribute, then you will need to create a new 
relation in the Logical Model corresponding to this attribute.
6. Draw the Logical Model diagram using app.diagrams.net tool, save it as .png or .jpg 
file and insert it in the Word document

## Part 3. Create and populate the database.
The SQL queries below can be written in MySQL, MS Access or SQLite databases.
1. Write SQL queries to create each table. The queries should contain creation of 
primary and foreign (if applicable) keys.
2. Write SQL queries to populate the tables. Each table should contain two or more 
records.
3. Make screenshots of the development environment you worked with and insert the 
images in the assignment file.
4. Copy the SQL queries in the assignment document.