CREATE VIEW analytics.rls_UserTeachers AS (

SELECT distinct STA.StaffUniqueId UserKey, STAS.StaffUniqueId TeacherKey, CONCAT(STAS.FirstName, ' ' ,STAS.LastSurname) TeacherName
FROM edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
INNER JOIN edfi.Staff STA on SEOAA.StaffUSI = STA.StaffUSI
INNER JOIN edfi.School SCH on SEOAA.EducationOrganizationId = SCH.LocalEducationAgencyId
INNER JOIN edfi.StaffSectionAssociation SSA on SCH.SchoolId = SSA.SchoolId
INNER JOIN edfi.Staff STAS on SSA.StaffUSI = STAS.StaffUSI
INNER JOIN analytics_config.DescriptorMap DM on SEOAA.StaffClassificationDescriptorId = DM.DescriptorId
INNER JOIN analytics_config.DescriptorConstant DC on DM.DescriptorConstantId = DC.DescriptorConstantId
Where DC.ConstantName in ('AuthorizationScope.District')

UNION

SELECT distinct STA.StaffUniqueId UserKey, STAS.StaffUniqueId TeacherKey, CONCAT(STAS.FirstName, ' ' ,STAS.LastSurname) TeacherName
FROM edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
INNER JOIN edfi.Staff STA on SEOAA.StaffUSI = STA.StaffUSI
INNER JOIN edfi.School SCH on SEOAA.EducationOrganizationId = SCH.SchoolId
INNER JOIN edfi.StaffSectionAssociation SSA on SCH.SchoolId = SSA.SchoolId
INNER JOIN edfi.Staff STAS on SSA.StaffUSI = STAS.StaffUSI
INNER JOIN analytics_config.DescriptorMap DM on SEOAA.StaffClassificationDescriptorId = DM.DescriptorId
INNER JOIN analytics_config.DescriptorConstant DC on DM.DescriptorConstantId = DC.DescriptorConstantId
Where DC.ConstantName in ('AuthorizationScope.School')

UNION

SELECT distinct STA.StaffUniqueId UserKey, STA.StaffUniqueId TeacherKey, CONCAT(STA.FirstName, ' ' ,STA.LastSurname) TeacherName
FROM edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
INNER JOIN edfi.Staff STA on SEOAA.StaffUSI = STA.StaffUSI
INNER JOIN analytics_config.DescriptorMap DM on SEOAA.StaffClassificationDescriptorId = DM.DescriptorId
INNER JOIN analytics_config.DescriptorConstant DC on DM.DescriptorConstantId = DC.DescriptorConstantId
Where DC.ConstantName in ('AuthorizationScope.Section')
)
