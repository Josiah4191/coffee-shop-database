/* ************************************************************/
/* GPDLOG01MC Login and User Creation Script                  */
/* Coded by: Matthew Culpepper                                */
/* Coded on: 07/25/25                                         */
/* ************************************************************/

USE master;

CREATE LOGIN GPDLOG01MC 
WITH PASSWORD = 'GPDr33333', 
     DEFAULT_DATABASE = JKGPDatabase, 
     CHECK_POLICY = OFF;

USE JKGPDatabase;

CREATE USER GPDLOG01MC FOR LOGIN GPDLOG01MC;

ALTER ROLE ProductManagementMC ADD MEMBER GPDLOG01MC;
