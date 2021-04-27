SELECT TOP(100) mst,
IDENTITY(INT,1,1) AS stt
INTO #request
FROM tbmst





DECLARE @Cmd NVARCHAR(MAX)
SET @Cmd = '{"id":"'
SELECT @Cmd = @Cmd+ mst  +';' FROM #request
SET @Cmd = SUBSTRING(@Cmd,0,LEN(@Cmd))
SELECT @Cmd = @Cmd+'"}'
SELECT @Cmd

DELETE FROM tbmst WHERE mst IN(SELECT mst FROM #request)

DROP TABLE #request