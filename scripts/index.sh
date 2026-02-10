#!/bin/bash
# ----------------------------------------------
# Index with documentation and GitHub base URL
# ----------------------------------------------
#FLIGHT_PLAN="dotnet run --project ../../../FlightPlan/FlightPlan/FlightPlan.csproj --"
FLIGHT_PLAN="../../scripts/flightplan"

cd ../docs/shopping-app
$FLIGHT_PLAN index flightplan.compiled.json \
    --rebuild \
    --include-docs . 

cd ../inventory-hub
$FLIGHT_PLAN index flightplan.compiled.json \
    --rebuild \
    --include-docs .
    