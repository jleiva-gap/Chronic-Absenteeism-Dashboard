SELECT StudentKey,
       CONCAT(StudentFirstName, ' ', StudentLastName, ' # ', StudentKey) AS StudentIdentifier
FROM [analytics].[StudentSchoolDim];