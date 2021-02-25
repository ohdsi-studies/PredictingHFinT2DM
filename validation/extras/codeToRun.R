library(HFinT2DMNoInsulinValidation)

# Specify where the temporary files (used by the ff package) will be created:
options(andromedatempdir = )

# if using oracle please set the location of your temp schema
oracleTempSchema <- NULL

# the location to save the prediction models results to:
outputFolder <- './Validation'

# Details for connecting to the server:
dbms <-
user <-
pw <-
server <-
port <-
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)



# Add the database containing the OMOP CDM data
cdmDatabaseSchema <- dbSchemas
# Add a shareable name for the database containing the OMOP CDM data
cdmDatabaseName <- dbNames
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- 'Scratch.dbo'

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'HFinT2DMNoInsulin'
outputFolder <- dbNames



# Now run the study
HFinT2DMNoInsulinValidation::execute(connectionDetails = connectionDetails,
                                 databaseName = cdmDatabaseName,
                                 cdmDatabaseSchema = cdmDatabaseSchema,
                                 cohortDatabaseSchema = cohortDatabaseSchema,
                                 oracleTempSchema = oracleTempSchema,
                                 cohortTable = cohortTable,
                                 outputFolder = outputFolder,
                                 createCohorts = F,
                                 runValidation = T,
                                 packageResults = F,
                                 minCellCount = 5,
                                 sampleSize = NULL)
# the results will be saved to outputFolder.  If you set this to the
# predictionStudyResults/Validation package then the validation results
# will be accessible to the shiny viewer

# to package the results run (run after the validation results are complete):
# NOTE: the minCellCount = N will remove any result with N patients or less
HFinT2DMNoInsulinValidation::execute(connectionDetails = connectionDetails,
                          databaseName = cdmDatabaseName,
                          cdmDatabaseSchema = cdmDatabaseSchema,
                          cohortDatabaseSchema = cohortDatabaseSchema,
                          oracleTempSchema = oracleTempSchema,
                          cohortTable = cohortTable,
                          outputFolder = outputFolder,
                          createCohorts = F,
                          runValidation = F,
                          packageResults = T,
                          minCellCount = 5,
                          sampleSize = NULL)

