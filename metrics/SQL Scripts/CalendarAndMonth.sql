WITH StudentADAByMonth
AS (SELECT DISTINCT
           caaf.StudentKey,
           sd.SchoolKey,
           dd.SchoolYear,
           dd.CalendarYear,
           dd.Month,
           dd.MonthName,
           COUNT(1) OVER (PARTITION BY caaf.StudentKey,
                                       caaf.SchoolKey,
                                       dd.SchoolYear,
                                       dd.Month
                         ) AS TotalDays,
           SUM(caaf.ReportedAsAbsentFromSchool) OVER (PARTITION BY caaf.StudentKey,
                                                                   caaf.SchoolKey,
                                                                   dd.SchoolYear,
                                                                   dd.Month
                                                     ) TotalAbsences,
           (COUNT(1) OVER (PARTITION BY caaf.StudentKey,
                                        caaf.SchoolKey,
                                        dd.SchoolYear,
                                        dd.Month
                          ) - SUM(caaf.ReportedAsAbsentFromSchool) OVER (PARTITION BY caaf.StudentKey,
                                                                                      caaf.SchoolKey,
                                                                                      dd.SchoolYear,
                                                                                      dd.Month
                                                                        )
           ) / CAST(COUNT(1) OVER (PARTITION BY caaf.StudentKey,
                                                caaf.SchoolKey,
                                                dd.SchoolYear,
                                                dd.Month
                                  ) AS DECIMAL) AS ADA
    FROM analytics.chrab_ChronicAbsenteeismAttendanceFact caaf
        INNER JOIN analytics.DateDim dd
            ON caaf.DateKey = dd.DateKey
        INNER JOIN analytics.SchoolDim sd
            ON caaf.SchoolKey = sd.SchoolKey)
SELECT *,
       CONCAT(   StudentADAByMonth.CalendarYear,
                 '-',
                 CASE
                     WHEN StudentADAByMonth.Month < 10 THEN
                         '0'
                     ELSE
                         ''
                 END,
                 StudentADAByMonth.Month
             ) AS CalendarAndMonth
FROM StudentADAByMonth;