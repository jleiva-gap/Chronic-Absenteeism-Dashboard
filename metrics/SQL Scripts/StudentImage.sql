SELECT *,
       CONCAT('https://district-website/images/students/', StudentKey, '.png') AS StudentImage
FROM analytics.StudentSchoolDim;