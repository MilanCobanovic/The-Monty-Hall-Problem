/* This part simply generates random numbers to give us an idea
of what we pick and where the prize is located. Whenever you execute
query you will get new random numbers */
WITH RandomNumbers AS (
	SELECT TOP 100
        ABS(CHECKSUM(NEWID())) % 3 + 1 AS Prize,
        ABS(CHECKSUM(NEWID())) % 3 + 1 AS Pick
    FROM
    sys.objects
),
/* This part reveals which door (without a prize) will be opened and shows
whether we chose the correct door after switching */
Win AS (
	SELECT 
		Prize,
		Pick,
		CASE
			WHEN Pick % 3 = Prize - 1 THEN 6-Prize-Pick
			ELSE Pick % 3 + 1
		END AS OpenedDoor,
		CASE 
			WHEN Prize = Pick THEN 'FALSE'
			ELSE 'TRUE'
		END AS SwitchAndWin	
	FROM RandomNumbers
)
--We can see the number of doors with prize behind them and the total number of doors
SELECT 
    SUM(CASE WHEN SwitchAndWin = 'TRUE' THEN 1 ELSE 0 END) AS DoorWithPrize,
	COUNT(SwitchAndWin) AS DoorNumber
FROM Win