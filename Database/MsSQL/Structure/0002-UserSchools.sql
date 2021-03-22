CREATE VIEW analytics.rls_UserSchools as (

SELECT STA.StaffUniqueId UserKey, SCH.SchoolId, EDO.NameOfInstitution, SEOAA.StaffClassificationDescriptorId, SCD.CodeValue
FROM edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
INNER JOIN edfi.Descriptor SCD on SEOAA.StaffClassificationDescriptorId = SCD.DescriptorId
INNER JOIN edfi.Staff STA on SEOAA.StaffUSI = STA.StaffUSI
INNER JOIN edfi.School SCH on SEOAA.EducationOrganizationId = SCH.LocalEducationAgencyId
INNER JOIN edfi.EducationOrganization EDO on SCH.SchoolId = EDO.EducationOrganizationId
INNER JOIN analytics_config.DescriptorMap DM on SEOAA.StaffClassificationDescriptorId = DM.DescriptorId
INNER JOIN analytics_config.DescriptorConstant DC on DM.DescriptorConstantId = DC.DescriptorConstantId
Where DC.ConstantName in ('AuthorizationScope.District')

UNION

SELECT STA.StaffUniqueId UserKey, SCH.SchoolId, EDO.NameOfInstitution, SEOAA.StaffClassificationDescriptorId, SCD.CodeValue
FROM edfi.StaffEducationOrganizationAssignmentAssociation SEOAA
INNER JOIN edfi.Descriptor SCD on SEOAA.StaffClassificationDescriptorId = SCD.DescriptorId
INNER JOIN edfi.Staff STA on SEOAA.StaffUSI = STA.StaffUSI
INNER JOIN edfi.School SCH on SEOAA.EducationOrganizationId = SCH.SchoolId
INNER JOIN edfi.EducationOrganization EDO on SCH.SchoolId = EDO.EducationOrganizationId
INNER JOIN analytics_config.DescriptorMap DM on SEOAA.StaffClassificationDescriptorId = DM.DescriptorId
INNER JOIN analytics_config.DescriptorConstant DC on DM.DescriptorConstantId = DC.DescriptorConstantId
Where DC.ConstantName in ('AuthorizationScope.School','AuthorizationScope.Section')
)
