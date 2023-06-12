 # Introduction 
 Create a database for the scenario below ( Also the pdf file is attached in the folder)

 # Club Database for Archery Score

# Recording

## Background

Target archery is a sport where participants shoot at targets on a level field. The archers stand on a
shooting line. The target is placed at a set distance of 20m, 30m, 40m, 50m, 60m, 70m or 90m (for
reasons unknown, 80m is not used).

The points scored are determined by the ring on the target face that an arrow has hit. There are 2
types of target face, an 80cm one and a 120cm one.

Archers shoot 6 arrows at a time, then move to collect them. 6 arrows are called an ’end’. If an
archer shoots 6 ends at a distance, they can record this as a ’score’ to see how they performed.
Fewer than 6 ends cannot be recorded.

Archers can shoot competitions, where a defined ’round’ is shot. The round can consist of one or
more distances and have ’ranges’ of 5 or 6 ends. For example, a WA (= World Archery) 900 round
has 5 ends at 60m, 5 ends at 50m and 5 ends at 40m. Hence it consists of 3 ranges. A WA
consists of 2 ranges: Both ranges are 6 ends at 70m. Rounds have 2 – 4 ranges, but there are old
rounds that are not limited to four.

There are many rounds, mostly named after Australian cities. Their definitions can be found on line

https://archeryaustralia.app.box.com/s/79h2zc3q0bu8ks172rdbdpzg9kpdo2f

Examples are shown in the following image. 36* means 36 arrows (= 6 ends) using 80cm face. 30+
means 30 arrows (=5 ends) using a 122cm face.


Archers are classified by age and gender:

```
 Female Open
 Male Open
 50+ Female
 50+ Male
 60+ Female
 60+ Male
 70+ Female
 70+ Male
 Under 21 Female
 Under 21 Male
 Under 18 Female
 Under 18 Male
 Under 16 Female
 Under 16 Male
 Under 14 Female
 Under 14 Male
```
There are 5 legal types of equipment, defining the archer’s division:

```
 Recurve
 Compound
 Recurve Barebow
 Compound Barebow
 Longbow
```
The class and division define an archer’s category, e.g. “Male Open Compound”.


Archers compete within their own category. Often, the round they shoot is different from the ‘base
round’ (the round that applies to Male Open). For example, if Male Open shoots WA90/1440,
Female Open shoots WA70/1440:

R = Recurve, C = Compound, B = Recurve/Compound Barebow, L = Longbow

## Use of Scoring Database

An archery club has to record both individual and competition scores. There are two major
stakeholders; archers who wish to see their scores, and the club recorder who has to ensure the
competition scores are entered according to the rules (e.g. the correct round is shot when an
equivalent round exists, or all archers shoot an identical round where there isn’t an equivalent
round).

### Archers

An archer needs to be able to look up their own scores over time. If an archer has been shooting for
a long time, there are many scores. It should be possible to restrict the number of scores by date
range and by the type of round. Score listings have to be able to be sorted by date and score
(generally highest first).

Archers need to be able to enter their scores into a staging table using a hand-held device. For this,
they have to be able to record a date and time, round, equipment (some archers shoot several types
of equipment on different days).

Archers have to be able to look up definitions of rounds, i.e. what ranges (distances and numbers of
ends per distance, target faces, number of ends) make up the round. Archers also need to be able to
find out equivalent rounds.

Archers want to look up club competition results and see how everyone has placed and who shot
what score, i.e. the totals of all arrows of the round shot.

Some club competitions form part of the yearly club championship. Archers want to look up the club
championship results. This means the participating rounds and scores have to be defined so that the
results can be shown and the winners identified.

There also has to be a way of determining an archer’s best score for a round (a PB or personal best).
The club’s best score for a round and the archer who shot it should also be an available lookup.


### Recorder

The recorder has to be able to enter new archers, new rounds and new competitions. They also have
to be able to add new scores that archers have staged on their mobile devices. The scores have to
contain arrow-by arrow scores. Each arrow score has to be able to be identified in terms of which
end it belongs to. Each end has to be identified as to its position in the round score (as in, range 2,
end 4). Within an end, arrows are always recorded highest to lowest arrow score, so there is no need
to keep track of the order in which the arrows were shot in each end.

Some of the scores have to be able to be linked to a competition. Some competitions have to be able
to be identified as part of a club championship.

The database has to have all the information needed to identify the archer’s division (age, gender).
There should be a definition of the default equipment, so that the category can be identified in the
absence of user input.

The equivalent rounds have to be time-dependent, as Archery Australia changes them sometimes.
This would make past competitions invalid, so there needs to be a history.


