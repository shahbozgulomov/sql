select ascii('A') 

select len('HELLO WORLD') 

select REVERSE('OpenAI')

select space(5)

select LTRIM()

select upper('sql')

select left('Database',3)

select right('Technology',4)

select SUBSTRING('Programming',3,3)

select CONCAT('SQL','SERVER')

SELECT REPLACE ('apple pie','apple','orange')

select charindex('Learn SQL with LearnSQL','learn')

select CHARINDEX( 'Server','er')

SELECT value AS word
FROM STRING_SPLIT(@string, ' ');

select power(2,3)

select sqrt(16)

select GETDATE()

select CURRENT_TIMESTAMP

select day('2025-02-03')

select DATEADD(day,10,'2025-02-03')

select char('65')

select ltrim() - clear spaces from the left while rtrim() from the right

select CHARINDEX('SQL','Learn SQL basics')

select Concat_ws(',','sql','server')

SELECT STUFF('test time', CHARINDEX('test', 'test time'), LEN('test'), 'exam') 

select SQUARE(7)

select SUBSTRING('International',1,5)

select SUBSTRING('Database',7,2)

select Patindex('%n%', 'Learn SQL') --5

select DATEDIFF(day,'2025-01-01','2025-02-03')

select month('2025-02-03' )

select DATEPART(year,'2025-02-03')

SELECT CAST(GETDATE() AS TIME)

select Sysdatetime() -- 2025-02-25 14:39:15.9008493

DECLARE @today DATE = GETDATE();
DECLARE @next_wednesday DATE = DATEADD(DAY, (4 - DATEPART(WEEKDAY, @today) + 7) % 7, @today);
SELECT @next_wednesday AS next_wednesday;

select Getdate() --local time zone
select Getutcdate()--GETUTCDATE(): This function returns the current date and time in Coordinated Universal Time (UTC),

select abs(-15)

select Ceiling(4.57)

select Current_Timestamp

select DateName(weekday,'2025-02-03') 
  
SELECT REPLACE(REVERSE('SQL SERVER'), ' ', '') AS ReversedStringWithoutSpaces;

SELECT STRING_AGG(City, ', ') AS ConcatenatedCities
FROM Customers;

DECLARE @str NVARCHAR(100) = 'SQL Server is a relational database management system';

SELECT 
    CASE 
        WHEN CHARINDEX('SQL', @str) > 0 AND CHARINDEX('Server', @str) > 0 
        THEN 'Both substrings found'
        ELSE 'One or both substrings not found'
    END AS Result;

	select power(5,3)


SELECT value AS Fruit
FROM STRING_SPLIT('apple;orange;banana', ';');

SELECT TRIM(' sql') AS TrimmedString;

DECLARE @StartTime DATETIME = '2025-02-25 12:00:00';
DECLARE @EndTime DATETIME = '2025-02-26 18:00:00';
SELECT DATEDIFF(HOUR, @StartTime, @EndTime) AS HoursDifference;

DECLARE @startDate DATE = '2023-05-01';
DECLARE @endDate DATE = '2025-02-03';

SELECT (DATEPART(YEAR, @endDate) - DATEPART(YEAR, @startDate)) * 12 +
       (DATEPART(MONTH, @endDate) - DATEPART(MONTH, @startDate)) AS MonthsDifference;

DECLARE @str NVARCHAR(100) = 'apple,orange,banana';

SELECT value AS Fruit
FROM STRING_SPLIT(@str, ',');

DECLARE @startDate DATE = '2025-01-01';
DECLARE @currentDate DATE = GETDATE();

SELECT DATEDIFF(DAY, @startDate, @currentDate) AS DaysDifference;

DECLARE @str NVARCHAR(100) = 'Data Science';
SELECT LEFT(@str, 4) AS FirstFourCharacters;

SELECT CEILING(SQRT(225)) AS RoundedSquareRoot;

DECLARE @str1 NVARCHAR(50) = 'Hello';
DECLARE @str2 NVARCHAR(50) = 'World';

SELECT CONCAT_WS('|', @str1, @str2) AS ConcatenatedString;

DECLARE @str NVARCHAR(100) = 'abc123xyz';
SELECT PATINDEX('%[0-9]%', @str) AS FirstDigitPosition;

select charindex('sql','sql server sql',(charindex('sql','sql server sql'))+1)

SELECT DATEPART(YEAR, GETDATE()) AS CurrentYear;


SELECT DATEADD(DAY, -100, GETDATE()) AS DateMinus100Days;

SELECT DATENAME(WEEKDAY, '2025-02-03') AS DayOfWeek;

DECLARE @number INT = 5;

SELECT POWER(@number, 2) AS SquareOfNumber;



















