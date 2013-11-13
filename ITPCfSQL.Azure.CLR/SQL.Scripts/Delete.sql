USE master;
GO

ALTER DATABASE DemoAzureCLR SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE DemoAzureCLR;
GO

DROP CREDENTIAL RallyCredential;
GO

DROP LOGIN SampleAzureLogin;
GO

DROP ASYMMETRIC KEY SampleAzureKey;
GO


DELETE FROM msdb.dbo.backupfilegroup
WHERE backup_set_id IN (SELECT backup_set_id FROM msdb.dbo.backupset WHERE database_name = 'DemoAzureCLR');
GO
DELETE FROM msdb.dbo.backupfile
WHERE backup_set_id IN (SELECT backup_set_id FROM msdb.dbo.backupset WHERE database_name = 'DemoAzureCLR');
GO
DELETE FROM msdb.dbo.backupset
WHERE database_name = 'DemoAzureCLR';
GO
