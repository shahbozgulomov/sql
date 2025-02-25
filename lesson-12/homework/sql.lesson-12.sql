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



















