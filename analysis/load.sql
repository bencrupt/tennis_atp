BULK INSERT ImportPlayer
FROM 'C:\Users\johan\Documents\GitHub\tennis_atp\atp_players.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

insert into Player select Id, FirstName, LastName, Hand, case ISDATE(DateOfBirth) when 1 then DateOfBirth else null end, Nationality from ImportPlayer
GO

BULK INSERT Rank
FROM 'C:\Users\johan\Documents\GitHub\tennis_atp\atp_rankings_current.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

BULK INSERT ImportMatch
FROM 'C:\Users\johan\Documents\GitHub\tennis_atp\atp_matches_2020.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)
GO

