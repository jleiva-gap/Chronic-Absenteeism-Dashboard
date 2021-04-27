SELECT *,
       CONCAT(ContactFirstName, ' ', ContactLastName) AS FullName
FROM analytics.ContactPersonDim;