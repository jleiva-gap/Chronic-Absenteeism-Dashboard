;WITH StudentADA
AS (SELECT DISTINCT
           caaf.StudentKey,
           (COUNT(1) OVER (PARTITION BY caaf.StudentKey, caaf.SchoolKey, dd.SchoolYear)
            - SUM(caaf.ReportedAsAbsentFromSchool) OVER (PARTITION BY caaf.StudentKey, caaf.SchoolKey, dd.SchoolYear)
           )
           / CAST(COUNT(1) OVER (PARTITION BY caaf.StudentKey, caaf.SchoolKey, dd.SchoolYear) AS DECIMAL) AS ADA
    FROM analytics.chrab_ChronicAbsenteeismAttendanceFact caaf
        INNER JOIN analytics.DateDim dd
            ON caaf.DateKey = dd.DateKey
        INNER JOIN analytics.SchoolDim sd
            ON caaf.SchoolKey = sd.SchoolKey),
      chrabOnTheVergeStudents
AS (SELECT StudentKey,
           CASE
               WHEN ADA > 0.90
                    AND [ADA] <= 0.95 THEN
                   1
               ELSE
                   0
           END AS IsCHRAB_OnTheVerge
    FROM StudentADA)
SELECT ROUND(SUM(IsCHRAB_OnTheVerge) / CAST(COUNT([StudentKey]) AS DECIMAL) * 100, 2) AS CHRAB_OneTheVergeRate
FROM chrabOnTheVergeStudents;