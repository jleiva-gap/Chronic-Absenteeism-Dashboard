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
            ON caaf.SchoolKey = sd.SchoolKey)
SELECT StudentKey,
       CASE
           WHEN ADA > 0.90
                AND [ADA] <= 0.95 THEN
               'True'
           ELSE
               'False'
       END AS IsCHRABFilter_OnTheVerge
FROM StudentADA;