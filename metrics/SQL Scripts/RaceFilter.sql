SELECT DISTINCT
       DemographicLabel AS Race
FROM [analytics].[DemographicDim]
WHERE DemographicParentKey = 'Race';