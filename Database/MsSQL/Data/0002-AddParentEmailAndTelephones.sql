--personal emails 
--------------------------------------------------------------------
DECLARE @ElectronicMailTypeDescriptorId_Personal INT
SELECT TOP(1) @ElectronicMailTypeDescriptorId_Personal = DescriptorId 
FROM edfi.Descriptor 
WHERE Namespace = 'uri://ed-fi.org/ElectronicMailTypeDescriptor'
AND CodeValue = 'Home/Personal'

INSERT INTO [edfi].[ParentElectronicMail]
           ([ElectronicMailAddress]
           ,[ElectronicMailTypeDescriptorId]
           ,[ParentUSI]
           ,[PrimaryEmailAddressIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT  CONCAT(LOWER(p.FirstName),'.',LOWER(p.LastSurname),'@gmail.com') AS [ElectronicMailAddress],
        @ElectronicMailTypeDescriptorId_Personal AS [ElectronicMailTypeDescriptorId],
		p.ParentUSI,
		1 AS [PrimaryEmailAddressIndicator],
		NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.ParentElectronicMail pem
				  WHERE p.ParentUSI = pem.ParentUSI
				    AND pem.ElectronicMailTypeDescriptorId = @ElectronicMailTypeDescriptorId_Personal)

--work emails 
---------------------------------------------------------
DECLARE @ElectronicMailTypeDescriptorId_Work INT
SELECT TOP(1) @ElectronicMailTypeDescriptorId_Work = DescriptorId 
FROM edfi.Descriptor 
WHERE Namespace = 'uri://ed-fi.org/ElectronicMailTypeDescriptor'
AND CodeValue = 'Work'

INSERT INTO [edfi].[ParentElectronicMail]
           ([ElectronicMailAddress]
           ,[ElectronicMailTypeDescriptorId]
           ,[ParentUSI]
           ,[PrimaryEmailAddressIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT CONCAT(LOWER(p.FirstName),'.',LOWER(p.LastSurname),'.work','@gmail.com') AS [ElectronicMailAddress],
        @ElectronicMailTypeDescriptorId_Work AS [ElectronicMailTypeDescriptorId],
		p.ParentUSI,
		0 AS [PrimaryEmailAddressIndicator],
		NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.ParentElectronicMail pem
				  WHERE p.ParentUSI = pem.ParentUSI
				    AND pem.ElectronicMailTypeDescriptorId = @ElectronicMailTypeDescriptorId_Work)

--personal telephones
-----------------------------------------------------
DECLARE @TelephoneNumberTypeDescriptorId_Mobile INT
SELECT TOP(1) @TelephoneNumberTypeDescriptorId_Mobile = DescriptorId 
FROM edfi.Descriptor 
WHERE Namespace = 'uri://ed-fi.org/TelephoneNumberTypeDescriptor'
AND CodeValue = 'Mobile'
INSERT INTO [edfi].[ParentTelephone] 
           ([ParentUSI]
           ,[TelephoneNumber]
           ,[TelephoneNumberTypeDescriptorId]
           ,[OrderOfPriority]
           ,[TextMessageCapabilityIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT p.ParentUSI,
       '(512) 201 5245' AS [TelephoneNumber],
        @TelephoneNumberTypeDescriptorId_Mobile AS [TelephoneNumberTypeDescriptorId],		
		1 AS [OrderOfPriority],
		NULL AS [TextMessageCapabilityIndicator],
        NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.[ParentTelephone] pt
				  WHERE p.ParentUSI = pt.ParentUSI
				    AND pt.TelephoneNumberTypeDescriptorId = @TelephoneNumberTypeDescriptorId_Mobile)
									
--work telephones
-----------------------------------------------------
DECLARE @TelephoneNumberTypeDescriptorId_Work INT
SELECT TOP(1) @TelephoneNumberTypeDescriptorId_Work = DescriptorId 
FROM edfi.Descriptor 
WHERE Namespace = 'uri://ed-fi.org/TelephoneNumberTypeDescriptor'
AND CodeValue = 'Work'
INSERT INTO [edfi].[ParentTelephone]
           ([ParentUSI]
           ,[TelephoneNumber]
           ,[TelephoneNumberTypeDescriptorId]
           ,[OrderOfPriority]
           ,[TextMessageCapabilityIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT p.ParentUSI,
       '(512) 201 5246' AS [TelephoneNumber],
        @TelephoneNumberTypeDescriptorId_Work AS [TelephoneNumberTypeDescriptorId],		
		2 AS [OrderOfPriority],
		NULL AS [TextMessageCapabilityIndicator],
        NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.[ParentTelephone] pt
				  WHERE p.ParentUSI = pt.ParentUSI
				  AND  pt.TelephoneNumberTypeDescriptorId = @TelephoneNumberTypeDescriptorId_Work)

--work telephones
-----------------------------------------------------
DECLARE @TelephoneNumberTypeDescriptorId_Home INT
SELECT TOP(1) @TelephoneNumberTypeDescriptorId_Home = DescriptorId 
FROM edfi.Descriptor 
WHERE Namespace = 'uri://ed-fi.org/TelephoneNumberTypeDescriptor'
AND CodeValue = 'Home'
INSERT INTO [edfi].[ParentTelephone]
           ([ParentUSI]
           ,[TelephoneNumber]
           ,[TelephoneNumberTypeDescriptorId]
           ,[OrderOfPriority]
           ,[TextMessageCapabilityIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT p.ParentUSI,
       '(512) 201 5247' AS [TelephoneNumber],
        @TelephoneNumberTypeDescriptorId_Home AS [TelephoneNumberTypeDescriptorId],		
		2 AS [OrderOfPriority],
		NULL AS [TextMessageCapabilityIndicator],
        NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.[ParentTelephone] pt
				  WHERE p.ParentUSI = pt.ParentUSI
				  AND  pt.TelephoneNumberTypeDescriptorId = @TelephoneNumberTypeDescriptorId_Home)


