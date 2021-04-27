SELECT StudentKey,
       CASE [GradeLevel]
           WHEN 'First grade' THEN
               '01 - First grade'
           WHEN 'Second grade' THEN
               '02 - Second grade'
           WHEN 'Third grade' THEN
               '03 - Third grade'
           WHEN 'Fourth grade' THEN
               '04 - Fourth grade'
           WHEN 'Fifth grade' THEN
               '05 - Fifth grade'
           WHEN 'Sixth grade' THEN
               '06 - Sixth grade'
           WHEN 'Seventh grade' THEN
               '07 - Seventh grade'
           WHEN 'Eighth grade' THEN
               '08 - Eighth grade'
           WHEN 'Ninth grade' THEN
               '09 - Ninth grade'
           WHEN 'Tenth grade' THEN
               '10 - Tenth grade'
           WHEN 'Eleventh grade' THEN
               '11 - Eleventh grade'
           WHEN 'Twelfth grade' THEN
               '12 - Twelfth grade'
           ELSE
               'Other'
       END AS GradeLevelNumeric
FROM [analytics].[StudentSchoolDim];