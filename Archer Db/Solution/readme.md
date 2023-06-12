<a name="_mk1zjnstkjf7"></a>Initial ER Diagram 
![image](https://github.com/piru72/Database/assets/63257806/defad127-0199-4c4b-a049-63dc5529732a)


<a name="_w1tndqpyikg6"></a>Reviewed ER Diagram

By normalizing the ERD, we eliminated redundant data and created separate tables for related entities, following the database normalization principles. This structure allows for efficient data storage and supports the Archer and Recorder use cases.
![image](https://github.com/piru72/Database/assets/63257806/c662efd3-4410-4ced-9ff5-fd06b625d860)


<a name="_ej4u61dmcn2o"></a>Physical Database

ClubChampionship:

```sql
CREATE TABLE CLUB_CHAMPIONSHIP (
  CLUB_CHAMPIONSHIP_ID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL
);
```

Competition:

```sql
CREATE TABLE COMPETITION (
  COMPETITIONID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(100) NOT NULL,
  DATE DATE NOT NULL,
  LOCATION VARCHAR(100) NOT NULL,
  CLUBCHAMPIONSHIP_ID INT,
  FOREIGN KEY (CLUBCHAMPIONSHIP_ID) REFERENCES CLUB_CHAMPIONSHIP (CLUB_CHAMPIONSHIP_ID)
);
```

Equipment:

```sql
CREATE TABLE EQUIPMENT (
  EQUIPMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL
);
```

Distance:

```sql
CREATE TABLE DISTANCE (
  DISTANCE_ID INT PRIMARY KEY AUTO_INCREMENT,
  DISTANCE_VALUE INT NOT NULL,
  ENDS INT NOT NULL
);
```

Round:

```sql
CREATE TABLE ROUND(
  ROUND_ID INT PRIMARY KEY AUTO_INCREMENT,
  COMPETITION_ID INT,
  NAME VARCHAR(255) NOT NULL,
  TOTAL_ENDS INT NOT NULL,
  DATE DATE NOT NULL,
  FOREIGN KEY(COMPETITION_ID) REFERENCES COMPETITION(COMPETITIONID)
);
```

Archer:

```sql
CREATE TABLE ARCHER (
  ARCHER_ID INT PRIMARY KEY AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL,
  AGE INT NOT NULL,
  GENDER VARCHAR(10) NOT NULL,
  EQUIPMENT_ID INT DEFAULT 1 NOT NULL,
  CONSTRAINT FK_ARCHER_EQUIPMENT FOREIGN KEY (EQUIPMENT_ID) REFERENCES EQUIPMENT (EQUIPMENT_ID)
);
```

RANGETable:

```sql
CREATE TABLE RANGETable (
  range_id INT PRIMARY KEY AUTO_INCREMENT,
  round_id INT NOT NULL,
  distance_id INT NOT NULL,
  FOREIGN KEY (round_id) REFERENCES ROUND (round_id),
  FOREIGN KEY (distance_id) REFERENCES DISTANCE (distance_id)
);
```

TargetFace:

```sql
CREATE TABLE TARGET_FACE (
  TARGET_FACE_ID INT PRIMARY KEY AUTO_INCREMENT,
  SIZE INT NOT NULL
);
```

Target:

```sql
CREATE TABLE TARGET (
  TARGET_ID INT PRIMARY KEY AUTO_INCREMENT,
  DISTANCE_ID INT,
  TARGET_FACE_ID INT,
  CONSTRAINT FK_TARGET_DISTANCE FOREIGN KEY (DISTANCE_ID) REFERENCES DISTANCE (DISTANCE_ID),
  CONSTRAINT FK_TARGET_TARGET_FACE FOREIGN KEY (TARGET_FACE_ID) REFERENCES TARGET_FACE (TARGET_FACE_ID)
);
```

Equivalent Round:

```sql
CREATE TABLE EQUIVALENT_ROUND (
  equivalent_round_id INT PRIMARY KEY AUTO_INCREMENT,
  round_id INT NOT NULL,
  valid_from DATE NOT NULL,
  valid_to DATE NOT NULL,
  FOREIGN KEY (round_id) REFERENCES ROUND (round_id)
);
```

Score:

```sql
CREATE TABLE SCORE(
  SCORE_ID INT PRIMARY KEY AUTO_INCREMENT,
  ARCHER_ID INT,
  ROUND_ID INT,
  COMPETITION_ID INT,
  EQUIPMENT_ID INT,
  RANGE_ID INT NOT NULL,
  DATE DATE NOT NULL,
  TIME TIME NOT NULL,
  END_NUMBER INT NOT NULL,
  ARROW_SCORE INT NOT NULL,
  CONSTRAINT FK_SCORE_ARCHER FOREIGN KEY(ARCHER_ID) REFERENCES ARCHER(ARCHER_ID),
  CONSTRAINT FK_SCORE_ROUND FOREIGN KEY(ROUND_ID) REFERENCES ROUND(ROUND_ID),
  CONSTRAINT FK_SCORE_EQUIPMENT FOREIGN KEY(EQUIPMENT_ID) REFERENCES EQUIPMENT(EQUIPMENT_ID),
  CONSTRAINT FK_SCORE_RANGE FOREIGN KEY(RANGE_ID) REFERENCES RANGETABLE(RANGE_ID),
  CONSTRAINT FK_SCORE_COMPETITION FOREIGN KEY(COMPETITION_ID) REFERENCES competition(competitionID)
);
```


<a name="_jlywofoygyd2"></a>Data Creation and Null Values


|<h3><a name="_wo21jak5qrp"></a>ClubChampionship</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|Club\_Championship\_Id|Int|Primary Key |
|Name|Varchar(255)|Not Null|


|<h3><a name="_yrj4nmko38au"></a>Competition</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|CompetitionId|Int|Primary Key |
|Name|Date|Not Null|
|Date|Date|Not Null|
|Location|Varchar(255)|Not Null|
|ClubChampionshipId|Int|Foreign Key(ClubChampionship)|



|<h3><a name="_j1q26j730n4t"></a>Equipment</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|Equipment\_Id|Int|Primary Key |
|Name|Varchar(255)|Not Null|


|<h3><a name="_yd5iplgkakp8"></a>Distance</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|DistanceId|Int|Primary Key |
|Distance\_Value|int|Not Null (20,30)|
|End|int|Not Null|







|<h3><a name="_ehywkymnth7s"></a>Round</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|RoundId|Int|Primary Key |
|CompetitionId|Int|Foreign Key(Competition)|
|Name|varchar(255)|Not Null (AUS city)|
|Date|Date|Not Null|
|Total Ends|int|Not Null|



|<h3><a name="_c68iek7c331z"></a>Archer</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|ArcherID|Int|Primary Key |
|Name|Varchar(255)|Not Null|
|Age|Int|Not Null|
|Gender|Varchar(255)|Not Null|
|EquipmentId|int|Foreign Key(Equipment)|


|<h3><a name="_izsubuvjn60g"></a>RangeTable</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|RangeId|Int|Primary Key |
|RoundId|Ind|Foreign Key(Round)|
|DistanceId|Int|Foreign Key(Distance)|


|<h3><a name="_d8cm5f66956"></a>TargetFace</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|TargetFaceId|Int|Primary Key |
|Size|Int|Not Null (80,20)|






|<h3><a name="_vreq9b88pn5a"></a>Target</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|TargetId|Int|Primary Key |
|DistanceId|Int|Foreign Key(Distance)|
|TargetFaceID|Int|Foreign Key(TargetFace)|


|<h3><a name="_o082837om75e"></a>Equivalent Round</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|EquivalentRoundId|Int|Primary Key |
|RoundId|Int|Foreign Key(Round)|
|Valid From |Date|Not Null|
|Valid To |Date|Not null|




|<h3><a name="_7mia3a6en60h"></a>Score</h3>|
| :-: |
|**Field**|**Type**|**Constraint**|
|ScoreId|Int|Primary Key|
|ArcherId|Int|Foreign Key(Archer)|
|RoundId|Int|Foreign Key (Round)|
|CompetitionId|Int|Foreign Key (Competition)|
|EquipmentId|Int|Foreign Key (Equipment Id)|
|RangeID|int|Foreign Key(Range)|
|Date|Date|Not null|
|Time|Time|Not null|
|END\_NUMBER|INT|NOT NULL|
|ArrowScore|int|Not null|

<a name="_hctqv765izgn"></a>Use Cases and SQL Statements

<a name="_7n98yi4oii71"></a>Transactions are an important concept necessary to consider when several people access the database (potentially) at the same time. For each use case that uses DML statements (SELECT, INSERT, UPDATE, DELETE) we have to analyze whether this has to be run as a transaction. 

|Use Case: |Archer Lookup Scores Over Time|
| :- | :- |
|Description:|<p>This use case allows archers to look up their own scores over time, with options to filter scores by date range and round type. The scores can be sorted by date and score.</p><p></p>|
|Actors|<p>Archer</p><p></p>|
|Preconditions:|Archer must be logged in.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to view their scores.</p><p>- Archer provides optional filters for the date range and round type.</p><p>- The system retrieves and displays the archer's scores, sorted by date and score.</p>|
|<p>Postconditions: </p><p></p>|Archers successfully views their scores.|
|SQL|<p>SELECT \*</p><p>FROM SCORE</p><p>WHERE archer\_id = 1</p><p>`  `AND date >= '2023-01-01'</p><p>`  `AND date <= '2023-12-31'</p><p>`  `AND round\_id = 1</p><p>ORDER BY date DESC, arrow\_score DESC;</p>|







|<a name="_oq9ubqds3r43"></a><a name="_hbrdf1tu0v11"></a>Use Case: |Archer Enter Scores using Hand-held Device|
| :- | :- |
|Description:|<p>This transaction allows archers to enter their scores into a staging table using a hand-held device.</p><p></p>|
|Actors|<p>Archer</p><p></p>|
|Preconditions:|Archer must be logged in.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to enter their scores.</p><p>- Archer provides the date, time, round, and equipment information for the scores.</p><p>- Archer initiates the transaction.</p><p>- The system inserts the scores into the STAGING\_SCORE table with the provided information.</p><p>- Archer commits the transaction.</p>|
|<p>Postconditions: </p><p></p>|Archer successfully enters their scores.|
|SQL|<p>START TRANSACTION;</p><p></p><p>INSERT INTO `score` (`SCORE\_ID`, `ARCHER\_ID`, `ROUND\_ID`, `DATE`, `TIME`, `EQUIPMENT\_ID`, `END\_NUMBER`, `ARROW\_SCORE`, `competition\_id`, `Range\_Id`) VALUES</p><p>(6, 1, 1, '2023-05-01', '09:30:00', 1, 1, 8, 1, 1);</p><p></p><p>COMMIT;</p>|
|Transaction|It can be a transaction as they have some write operation and needs consistency from the both Archer and Recorder|










|<a name="_y1vxqgt0f6zd"></a>Use Case: |Look up Round Definitions|
| :- | :- |
|Description:|<p>This use case allows archers to look up definitions of rounds, i.e. what ranges (distances and numbers of </p><p>ends per distance, target faces, number of ends) make up the round. Archers also need to be able to find out equivalent rounds. </p>|
|Actors|Archer|
|Preconditions:|Archer must be logged in.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to look up round definitions and equivalent rounds.</p><p>- The system retrieves and displays a list of available rounds with their corresponding definitions, including ranges, distances, number of ends per distance, target faces, and total ends.</p><p>- Archer can choose a specific round to view its definition in detail.</p><p>- Archer can also request equivalent rounds for a selected round.</p><p>- The system provides a list of equivalent rounds based on similarities in characteristics or difficulty level.</p><p>- Archer can view the details of each equivalent round if desired.</p>|
|<p>Postconditions: </p><p></p>|Archer successfully views round definitions and equivalent rounds.|
|SQL for round definition|<p>SELECT ROUND.NAME, DISTANCE.DISTANCE\_VALUE, DISTANCE.ENDS, TARGET\_FACE.SIZE, ROUND.TOTAL\_ENDS</p><p>FROM ROUND</p><p>JOIN RANGETABLE ON ROUND.ROUND\_ID = rangetable.ROUND\_ID</p><p>JOIN DISTANCE ON RANGETABLE.DISTANCE\_ID = DISTANCE.DISTANCE\_ID</p><p>JOIN TARGET ON RANGETABLE.distance\_id = TARGET.DISTANCE\_ID</p><p>JOIN TARGET\_FACE ON TARGET.TARGET\_FACE\_ID = TARGET\_FACE.TARGET\_FACE\_ID;</p>|
|SQL for finding equivalent round|<p>SELECT R.\*</p><p>FROM Round R</p><p>JOIN RangeTable RT ON R.round\_id = RT.round\_id</p><p>JOIN Distance D ON RT.distance\_id = D.distance\_id</p><p>WHERE D.DISTANCE\_VALUE = (SELECT DISTANCE\_VALUE FROM Distance WHERE distance\_id = 1)</p><p>`  `AND D.ends = (SELECT ends FROM Distance WHERE distance\_id = 1);</p>|



|<a name="_z8wh4q3d4fmh"></a>Use Case: |Look up club competition result|
| :- | :- |
|Description:|This use case allows archers to look up club competition results and see how everyone has placed and who shot what score, i.e. the totals of all arrows of the round shot. |
|Actors|<p>Archer</p><p></p>|
|Preconditions:|Archer must be logged in.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to view club competition results.</p><p>- The system retrieves the list of club competitions.</p><p>- Archer selects a specific club competition.</p><p>- The system retrieves the scores of all archers who participated in the selected club competition.</p><p>- The system calculates the total score for each archer by summing the arrow scores of the round shot.</p><p>- The system presents the competition results to the archer, showing the placement of each archer and their respective scores.</p><p></p>|
|<p>Postconditions: </p><p></p>|Archer successfully views the club competition results.|
|SQL|<p>SELECT A.NAME AS ArcherName, S.ARCHER\_ID, SUM(S.ARROW\_SCORE) AS TotalScore</p><p>FROM SCORE S</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE S.ROUND\_ID IN (</p><p>`    `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1</p><p>)</p><p>GROUP BY S.ARCHER\_ID</p><p>ORDER BY TotalScore DESC;</p><p></p>|






|<a name="_b4pgrkauqycz"></a>Use Case: |Look up the club championship results|
| :- | :- |
|Description:|This use case allows archers to look up the club championship results. This means the participating rounds and scores have to be defined so that the results can be shown and the winners identified.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to view club championship results.</p><p>- The system retrieves the list of club championships.</p><p>- Archer selects a specific club championship.</p><p>- The system retrieves the participating rounds and associated scores for the selected club championship.</p><p>- The system calculates the total score for each archer in each participating round by summing the arrow scores.</p><p>- The system determines the winners of each participating round and the overall club championship based on the highest total scores.</p><p>- The system presents the club championship results to the archer, showing the winners and their respective scores for each participating round.</p>|
|<p>Postconditions: </p><p></p>|Archer successfully views the club championship results.|
|SQL to Retrieve the participating rounds and associated scores for the selected club championship|<p>SELECT R.ROUND\_ID, R.NAME AS RoundName, S.ARCHER\_ID, A.NAME AS ArcherName, S.ARROW\_SCORE</p><p>FROM ROUND R</p><p>JOIN SCORE S ON R.ROUND\_ID = S.ROUND\_ID</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE R.COMPETITION\_ID = 1;</p><p></p>|
|SQL to Calculate the total score for each archer in each participating round:|<p>SELECT ARCHER\_ID, ROUND\_ID, SUM(ARROW\_SCORE) AS TotalScore</p><p>FROM SCORE</p><p>WHERE ROUND\_ID IN (</p><p>`    `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1 )</p><p>GROUP BY ARCHER\_ID, ROUND\_ID;</p>|
|SQL to Determine the winners of each participating round and the overall club championship: |<p>SELECT ROUND\_ID, MAX(TotalScore) AS HighestScore</p><p>FROM (</p><p>`    `SELECT ARCHER\_ID, ROUND\_ID, SUM(ARROW\_SCORE) AS TotalScore</p><p>`    `FROM SCORE</p><p>`    `WHERE ROUND\_ID IN (</p><p>`        `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1</p><p>`    `)</p><p>`    `GROUP BY ARCHER\_ID, ROUND\_ID</p><p>) AS TotalScores</p><p>GROUP BY ROUND\_ID;</p>|



|<a name="_o011vcskbos4"></a>Use Case: |Look up personal best|
| :- | :- |
|Description:|<p>This lookup allows a way of determining an archer’s best score for a round (a PB or personal best). The club’s best score for a round and the archer who shot it should also be available lookup.</p><p></p>|
|Actors|<p>Archer</p><p></p>|
|Preconditions:|Archer must be logged in.|
|<p></p><p>Main Flow:</p>|<p>- Archer selects the option to look up personal best scores.</p><p>- The system retrieves the list of available rounds.</p><p>- Archer selects a specific round to view personal best scores.</p><p>- The system retrieves the archer's best score for the selected round by finding the highest arrow score.</p><p>- The system retrieves the club's best score for the selected round and identifies the archer who achieved it.</p><p>- The system presents the archer's personal best score and the club's best score along with the respective archers who achieved them.</p>|
|<p>Postconditions: </p><p></p>|<p>Archer successfully views their personal best score for the selected round.</p><p>Archer views the club's best score for the selected round and the archer who achieved it</p>|
|SQL to retrieve the archer's personal best score for the selected round|<p>SELECT MAX(ARROW\_SCORE) AS PersonalBestScore</p><p>FROM SCORE</p><p>WHERE ARCHER\_ID = 1</p><p>`  `AND ROUND\_ID = 1;</p>|
|SQL to retrieve the club's best score for the selected round and the archer who achieved it:|<p>SELECT S.ARCHER\_ID, A.NAME AS ArcherName, S.ARROW\_SCORE AS ClubBestScore</p><p>FROM SCORE S</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE S.ROUND\_ID = 1</p><p>`  `AND S.ARROW\_SCORE = (</p><p>`    `SELECT MAX(ARROW\_SCORE)</p><p>`    `FROM SCORE</p><p>`    `WHERE ROUND\_ID = 1</p><p>);</p>|



<a name="_pz4npzli0obd"></a><a name="_w11zei3zirxw"></a><a name="_xoq76ux2dhws"></a><a name="_5rrqfiuq7rbb"></a>Recorder

|Use Case: |Add New Archer|
| :- | :- |
|Description:|<p>This use case allows the recorder to enter a new archer into the system.</p><p></p>|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to add a new archer.</p><p>- The recorder enters the details of the new archer, such as name, age, gender, and division.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system adds the new archer to the database.</p><p></p>|
|<p>Postconditions: </p><p></p>|Successfully adds the Archer to the system|
|SQL |<p>INSERT INTO ARCHER (name, age, gender, equipment\_id)</p><p>VALUES ('John Smith', 25, 'Male', 1);</p>|



|<a name="_fpekh99wnbxv"></a>Use Case: |Add New Round|
| :- | :- |
|Description:|<p>This use case allows the recorder to enter a new round into the system.</p><p></p>|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to add a new round.</p><p>- The recorder enters the details of the new round, such as name, date, and associated competition.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system adds the new round to the database.</p>|
|<p>Postconditions: </p><p></p>|Successfully adds the Round to the system|
|SQL |<p>INSERT INTO ROUND (competition\_id, name, date)</p><p>VALUES (1, 'Round A', '2023-05-01');</p><p></p>|



|<a name="_b7sfa5nzms22"></a>Use Case: |Add New Competition|
| :- | :- |
|Description:|<p>This use case allows the recorder to enter a new round into the system.</p><p></p>|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to add a new competition.</p><p>- The recorder enters the details of the new competition, such as name and date.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system adds the new competition to the database.</p><p></p>|
|<p>Postconditions: </p><p></p>|<p>- The new competition is successfully added to the system.</p><p></p>|
|SQL |<p>INSERT INTO COMPETITION (name, date)</p><p>VALUES ('Competition Heavy', '2023-06-15');</p>|





|Use Case: |Add New Score|
| :- | :- |
|Description:|This use case allows the recorder to add a new score for an archer staged on a mobile device.|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to add a new score.</p><p>- The recorder enters the details of the score, such as archer ID, round ID, date, time, equipment ID, end number, range number, and arrow scores.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system adds the new score to the database.</p>|
|<p>Postconditions: </p><p></p>|<p>The new score is successfully added to the system.</p><p></p>|
|SQL |<p>INSERT INTO SCORE (archer\_id, round\_id, date, time, equipment\_id, end\_number, range\_id, arrow\_score)</p><p>VALUES (1, 1, '2023-05-05', '09:30:00', 1, 4, 2, 9);</p>|



|<a name="_aw8wufnjzdhv"></a>Use Case: |` `Link Score to Competition|
| :- | :- |
|Description:|This use case allows the recorder to link a score to a competition.|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to link a score to a competition.</p><p>- The recorder enters the score ID and the competition ID.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system updates the score's competition ID in the database.</p><p>- Postcondition: The score is successfully linked to the specified competition.</p>|
|<p>Postconditions: </p><p></p>|<p>The score is successfully linked to the specified competition.</p><p></p>|
|SQL |<p>UPDATE SCORE</p><p>SET competition\_id = 1</p><p>WHERE score\_id = 1;</p>|



|<a name="_v1q5sl8nz43"></a>Use Case: |` `Define Equivalent Rounds|
| :- | :- |
|Description:|his use case allows the recorder to define equivalent rounds, which can change over time.|
|Actor|<p>Recorder</p><p></p>|
|Preconditions:|The recorder must have the necessary permissions to add new archers.|
|<p></p><p>Main Flow:</p>|<p>- The recorder selects the option to define equivalent rounds.</p><p>- The recorder enters the details of the equivalent round, such as round ID, distance ID, target face ID, and any other relevant information.</p><p>- The system validates the entered information.</p><p>- If the information is valid, the system adds the equivalent round definition to the database.</p><p></p>|
|<p>Postconditions: </p><p></p>|<p>The equivalent round definition is successfully added to the system.</p><p></p>|
|SQL |<p>INSERT INTO EQUIVALENT\_ROUND (round\_id, valid\_from, valid\_to)</p><p>VALUES</p><p>(1, '2022-01-01', '2022-12-31');</p>|








<a name="_25mgs8q0nypd"></a><a name="_np9qao9zc6gj"></a>Performance 

To determine the potential for using indexes to speed up the execution of each use case, we need to analyze the SQL statements involved and identify the columns used in the WHERE or JOIN conditions. Here are the use cases and their corresponding SQL statements:

There can be some potential indexes

|SQL|<p>SELECT \*</p><p>FROM SCORE</p><p>WHERE archer\_id = 1</p><p>`  `AND date >= '2023-01-01'</p><p>`  `AND date <= '2023-12-31'</p><p>`  `AND round\_id = 1</p><p>ORDER BY date DESC, arrow\_score DESC;</p>|
| :- | :- |
|Index|CREATE INDEX idx\_score\_filter\_sort ON SCORE (archer\_id, round\_id, date, arrow\_score);|
|Status||
|Index Worked?|No|




|Use case SQL |<p>SELECT ROUND.NAME, DISTANCE.DISTANCE\_VALUE, DISTANCE.ENDS, TARGET\_FACE.SIZE, ROUND.TOTAL\_ENDS</p><p>FROM ROUND</p><p>JOIN RANGETABLE ON ROUND.ROUND\_ID = rangetable.ROUND\_ID</p><p>JOIN DISTANCE ON RANGETABLE.DISTANCE\_ID = DISTANCE.DISTANCE\_ID</p><p>JOIN TARGET ON RANGETABLE.distance\_id = TARGET.DISTANCE\_ID</p><p>JOIN TARGET\_FACE ON TARGET.TARGET\_FACE\_ID = TARGET\_FACE.TARGET\_FACE\_ID;</p>|
| :- | :- |
|Index|<p>CREATE INDEX idx\_round\_id ON ROUND (ROUND\_ID);</p><p></p><p>CREATE INDEX idx\_rangetable\_round\_distance ON RANGETABLE (ROUND\_ID, DISTANCE\_ID);</p><p></p><p>CREATE INDEX idx\_distance\_id ON DISTANCE (DISTANCE\_ID);</p><p></p><p>CREATE INDEX idx\_target\_distance\_face ON TARGET (DISTANCE\_ID, TARGET\_FACE\_ID);</p><p></p><p>CREATE INDEX idx\_target\_face\_id ON TARGET\_FACE (TARGET\_FACE\_ID);</p><p></p>|
|Status||
|Index Worked?|Yes|




|Use case SQL |<p>SELECT R.\*</p><p>FROM Round R</p><p>JOIN RangeTable RT ON R.round\_id = RT.round\_id</p><p>JOIN Distance D ON RT.distance\_id = D.distance\_id</p><p>WHERE D.DISTANCE\_VALUE = (SELECT DISTANCE\_VALUE FROM Distance WHERE distance\_id = 1)</p><p>`  `AND D.ends = (SELECT ends FROM Distance WHERE distance\_id = 1);</p><p></p>|
| :- | :- |
|Index|CREATE INDEX idx\_distance\_filter ON Distance (distance\_id, DISTANCE\_VALUE, ends);|
|Status||
|Index Worked?|Yes|



|Use case SQL |<p>SELECT A.NAME AS ArcherName, S.ARCHER\_ID, SUM(S.ARROW\_SCORE) AS TotalScore</p><p>FROM SCORE S</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE S.ROUND\_ID IN (</p><p>`    `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1</p><p>)</p><p>GROUP BY S.ARCHER\_ID</p><p>ORDER BY TotalScore DESC;</p><p></p>|
| :- | :- |
|Index|CREATE INDEX idx\_score\_filter ON SCORE (ROUND\_ID, ARCHER\_ID, ARROW\_SCORE);|
|Status||
|Index Worked?|Yes|




|Use case SQL |<p>SELECT R.ROUND\_ID, R.NAME AS RoundName, S.ARCHER\_ID, A.NAME AS ArcherName, S.ARROW\_SCORE</p><p>FROM ROUND R</p><p>JOIN SCORE S ON R.ROUND\_ID = S.ROUND\_ID</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE R.COMPETITION\_ID = 1;</p>|
| :- | :- |
|Index|CREATE INDEX idx\_round\_competition ON ROUND (COMPETITION\_ID);|
|Status||
|Index Worked?|Yes|






|Use case SQL |<p>SELECT ARCHER\_ID, ROUND\_ID, SUM(ARROW\_SCORE) AS TotalScore</p><p>FROM SCORE</p><p>WHERE ROUND\_ID IN (</p><p>`    `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1</p><p>)</p><p>GROUP BY ARCHER\_ID, ROUND\_ID;</p>|
| :- | :- |
|Index|CREATE INDEX idx\_score\_round\_archer\_arrow ON SCORE (ROUND\_ID, ARCHER\_ID, ARROW\_SCORE);|
|Status||
|Index Worked?|Yes,|




|Use case SQL |<p>SELECT ROUND\_ID, MAX(TotalScore) AS HighestScore</p><p>FROM (</p><p>`    `SELECT ARCHER\_ID, ROUND\_ID, SUM(ARROW\_SCORE) AS TotalScore</p><p>`    `FROM SCORE</p><p>`    `WHERE ROUND\_ID IN (</p><p>`        `SELECT ROUND\_ID FROM ROUND WHERE COMPETITION\_ID = 1</p><p>`    `)</p><p>`    `GROUP BY ARCHER\_ID, ROUND\_ID</p><p>) AS TotalScores</p><p>GROUP BY ROUND\_ID;</p>|
| :- | :- |
|Index|NO newly created index needed|
|Status||
|Index Worked?|Yes,|




|Use case SQL |<p>SELECT MAX(ARROW\_SCORE) AS PersonalBestScore</p><p>FROM SCORE</p><p>WHERE ARCHER\_ID = 1</p><p>`  `AND ROUND\_ID = 1;</p><p>SELECT S.ARCHER\_ID, A.NAME AS ArcherName, S.ARROW\_SCORE AS ClubBestScore</p><p>FROM SCORE S</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE S.ROUND\_ID = 1</p><p>`  `AND S.ARROW\_SCORE = (</p><p>`    `SELECT MAX(ARROW\_SCORE)</p><p>`    `FROM SCORE</p><p>`    `WHERE ROUND\_ID = 1</p><p>);</p>|
| :- | :- |
|Index|CREATE INDEX idx\_score\_archer\_round\_arrow ON SCORE (ARCHER\_ID, ROUND\_ID, ARROW\_SCORE);|
|Status||
|Index Worked?|No|



|Use case SQL |<p>SELECT S.ARCHER\_ID, A.NAME AS ArcherName, S.ARROW\_SCORE AS ClubBestScore</p><p>FROM SCORE S</p><p>JOIN ARCHER A ON S.ARCHER\_ID = A.ARCHER\_ID</p><p>WHERE S.ROUND\_ID = 1</p><p>`  `AND S.ARROW\_SCORE = (</p><p>`    `SELECT MAX(ARROW\_SCORE)</p><p>`    `FROM SCORE</p><p>`    `WHERE ROUND\_ID = 1</p><p>);</p>|
| :- | :- |
|Index|<p>CREATE INDEX idx\_score\_round\_arrow\_archer ON SCORE (ROUND\_ID, ARROW\_SCORE, ARCHER\_ID);</p><p></p><p>CREATE INDEX idx\_archer\_archer\_id ON ARCHER (ARCHER\_ID);</p>|
|Status||
|Index Worked?|Yes|

