
# The Monty Hall Problem

A few days ago, I watched the movie ['21' (2008)](https://www.imdb.com/title/tt0478087/). When they discussed probability, I paused and re-watched that part of the video several times. You can watch that part [here](https://www.youtube.com/watch?v=CYyUuIXzGgI&ab_channel=NOWPLAYING).

They talked about Monty Hall problem. The Monty Hall problem illustrates a counterintuitive probability puzzle where, given three doors (one with a prize behind it and two without), after picking one door, one of the non-chosen doors with no prize is revealed. You're then given the choice to stick with your original door or switch to the other unopened door. The puzzle demonstrates that switching doors actually doubles your chances of winning the prize, moving from a 1/3 to a 2/3 probability. Most people still think that even after one door is opened, you still have a 50-50 chance, but actually, you have a 2/3 chance.

This gave me idea for a tiny SQL project. For this project, I used Microsoft SQL Server Management Studio. 

### Code explanation: 
```SELECT TOP 100 ``` Specifies that only 100 rows should be returned.
```
ABS(CHECKSUM(NEWID())) % 3 + 1
```
Generates a random number between 1 and 3. Here's the breakdown:

```NEWID()``` Generates a unique value of type uniqueidentifier.

```CHECKSUM() ``` Computes a checksum value for that unique identifier, producing a different integer value for each row.

```ABS()``` Ensures the result is a non-negative number.

```% 3 ``` Returns the remainder of the division by 3, resulting in a value between 0 and 2. And ```+1``` adjusts the range to be between 1 and 3.

### What if we always pick 1st door? 

You can simply change piece of code on begginig of the query:
```
ABS(CHECKSUM(NEWID())) % 3 + 1 AS Pick
```
To:
```
1 AS Pick
```
