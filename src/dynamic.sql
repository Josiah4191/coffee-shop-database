USE JKGPDatabase;

CREATE TABLE NewLoginsJS (
	LoginName VARCHAR(128)
);

GO

INSERT INTO NewLoginsJS (LoginName)
VALUES
	('JSFFlake'),
	('JSGGlute'),
	('JSMMrit'),
	('JSPPert');

GO

DECLARE JSCursor CURSOR FOR
SELECT LoginName FROM NewLoginsJS;

DECLARE @LoginName nvarchar(128);
DECLARE @TempPW nvarchar(128);
DECLARE @SQL NVARCHAR(MAX);

OPEN JSCursor;

FETCH NEXT FROM JSCursor INTO @LoginName;

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @TempPW = LEFT(@LoginName, 4) + '33333';

	SET @SQL = 'CREATE LOGIN [' + @LoginName + '] WITH PASSWORD = ''' + @TempPW + ''', DEFAULT_DATABASE = [JKGPDatabase];';
	EXEC sp_executesql @SQL;

	SET @SQL = 'USE JKGPDatabase; CREATE USER [' + @LoginName + '] FOR LOGIN [' + @LoginName + '];';
	EXEC sp_executesql @SQL;

	SET @SQL = 'USE JKGPDatabase; ALTER ROLE ProductManagementMC ADD MEMBER [' + @LoginName + '];';
	EXEC sp_executesql @SQL;

	FETCH NEXT FROM JSCursor INTO @LoginName;
END

CLOSE JSCursor;
DEALLOCATE JSCursor;
