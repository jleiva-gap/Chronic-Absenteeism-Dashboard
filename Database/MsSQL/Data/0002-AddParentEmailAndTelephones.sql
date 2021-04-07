--personal emails 
--------------------------------------------------------------------
INSERT INTO [edfi].[ParentElectronicMail]
           ([ElectronicMailAddress]
           ,[ElectronicMailTypeDescriptorId]
           ,[ParentUSI]
           ,[PrimaryEmailAddressIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT CONCAT(LOWER(p.FirstName),'.',LOWER(p.LastSurname),'@gmail.com') AS [ElectronicMailAddress],
       (SELECT TOP(1)  DescriptorId 
	    FROM edfi.Descriptor 
	    WHERE Namespace = 'uri://ed-fi.org/ElectronicMailTypeDescriptor'
		AND CodeValue = 'Home/Personal') AS [ElectronicMailTypeDescriptorId],
		p.ParentUSI,
		1 AS [PrimaryEmailAddressIndicator],
		NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.ParentElectronicMail pem
				  WHERE p.ParentUSI = pem.ParentUSI)

--work emails 
---------------------------------------------------------
INSERT INTO [edfi].[ParentElectronicMail]
           ([ElectronicMailAddress]
           ,[ElectronicMailTypeDescriptorId]
           ,[ParentUSI]
           ,[PrimaryEmailAddressIndicator]
           ,[DoNotPublishIndicator]
           ,[CreateDate])
SELECT CONCAT(LOWER(p.FirstName),'.',LOWER(p.LastSurname),'.work','@gmail.com') AS [ElectronicMailAddress],
       (SELECT TOP(1)  DescriptorId 
	    FROM edfi.Descriptor 
	    WHERE Namespace = 'uri://ed-fi.org/ElectronicMailTypeDescriptor'
		AND CodeValue = 'Work') AS [ElectronicMailTypeDescriptorId],
		p.ParentUSI,
		0 AS [PrimaryEmailAddressIndicator],
		NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.ParentElectronicMail pem
				  WHERE p.ParentUSI = pem.ParentUSI
				  AND pem.PrimaryEmailAddressIndicator = 0)

--personal telephones
-----------------------------------------------------
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
       (SELECT TOP(1)  DescriptorId 
	    FROM edfi.Descriptor 
	    WHERE Namespace = 'uri://ed-fi.org/TelephoneNumberTypeDescriptor'
		AND CodeValue = 'Mobile') AS [TelephoneNumberTypeDescriptorId],		
		1 AS [OrderOfPriority],
		NULL AS [TextMessageCapabilityIndicator],
        NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.[ParentTelephone] pt
				  WHERE p.ParentUSI = pt.ParentUSI)

--work telephones
-----------------------------------------------------
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
       (SELECT TOP(1)  DescriptorId 
	    FROM edfi.Descriptor 
	    WHERE Namespace = 'uri://ed-fi.org/TelephoneNumberTypeDescriptor'
		AND CodeValue = 'Work') AS [TelephoneNumberTypeDescriptorId],		
		2 AS [OrderOfPriority],
		NULL AS [TextMessageCapabilityIndicator],
        NULL AS [DoNotPublishIndicator],
		GETDATE() AS [CreateDate] 
FROM edfi.Parent p
WHERE NOT EXISTS (SELECT 1 
                  FROM edfi.[ParentTelephone] pt
				  WHERE p.ParentUSI = pt.ParentUSI
				  AND [OrderOfPriority] = 0)


