SELECT ssd.StudentKey,
       STRING_AGG(dd.DemographicLabel, ',') AS race
FROM [analytics].[StudentSchoolDim] ssd
    INNER JOIN analytics.SchoolDim sd
        ON ssd.SchoolKey = sd.SchoolKey
    INNER JOIN analytics.StudentLocalEducationAgencyDim slead
        ON ssd.StudentKey = slead.StudentKey
           AND sd.LocalEducationAgencyKey = slead.LocalEducationAgencyKey
    INNER JOIN analytics.StudentLocalEducationAgencyDemographicsBridge aleadb
        ON slead.StudentLocalEducationAgencyKey = aleadb.StudentLocalEducationAgencyKey
    INNER JOIN analytics.DemographicDim dd
        ON aleadb.DemographicKey = dd.DemographicKey
WHERE dd.DemographicParentKey = 'Race'
GROUP BY ssd.StudentKey;