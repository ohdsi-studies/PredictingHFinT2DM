library(hfint2dmNoInsulin)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:

# Specify where the temporary files (used by the ff package) will be created:
options(andromedaTempFolder = )

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


# table name where the cohorts will be generated
cohortTable <-'hfint2dmNoInsulin'
outputFolder <- "./results"

#=======================
execute(connectionDetails = connectionDetails,
cdmDatabaseSchema = cdmDatabaseSchema,
        cdmDatabaseName = cdmDatabaseName,
        cohortDatabaseSchema = cohortDatabaseSchema,
        oracleTempSchema = oracleTempSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        createProtocol = F,
        createCohorts = F,
        runAnalyses = F,
        createResultsDoc = F,
        packageResults = F,
        createValidationPackage = T,
        analysesToValidate = NULL,
        minCellCount= 5,
        createShiny = T,
        createJournalDocument = F,
        analysisIdDocument = 1)

# Uncomment and run the next line to see the shiny results:
PatientLevelPrediction::viewMultiplePlp(outputFolder)
